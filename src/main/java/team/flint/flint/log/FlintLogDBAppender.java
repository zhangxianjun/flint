package team.flint.flint.log;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.db.DBAppenderBase;
import cn.hutool.core.date.DateUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/03/21
 * Description: .
 */

public class FlintLogDBAppender extends DBAppenderBase<ILoggingEvent> {

    protected String insertSQL;
    protected static final Method GET_GENERATED_KEYS_METHOD;

    static {
        // PreparedStatement.getGeneratedKeys() method was added in JDK 1.4
        Method getGeneratedKeysMethod;
        try {
            // the
            getGeneratedKeysMethod = PreparedStatement.class.getMethod("getGeneratedKeys", (Class[]) null);
        } catch (Exception ex) {
            getGeneratedKeysMethod = null;
        }
        GET_GENERATED_KEYS_METHOD = getGeneratedKeysMethod;
    }

    @Override
    public void start() {
        insertSQL = "INSERT INTO `flint_log`(`level`,`label0`,`label1`,`label2`,`params`,`content`,`create_df_num`,`create_df`)" +
                "VALUES (?,?,?,?,?,?,?,?)";
        super.start();
    }

    @Override
    protected void subAppend(ILoggingEvent event, Connection connection, PreparedStatement insertStatement) throws Throwable {

        String markerName = event.getMarker().getName();
        String message = event.getFormattedMessage();

        // 不是业务日志不输出到数据库
        if (!markerName.equals("Flint")) {
            return;
        }

        Level level = event.getLevel();
        if (Level.ERROR.equals(level)) {
            insertStatement.setInt(1, 5);
        } else if (Level.WARN.equals(level)) {
            insertStatement.setInt(1, 4);
        } else if (Level.INFO.equals(level)) {
            insertStatement.setInt(1, 3);
        } else if (Level.DEBUG.equals(level)) {
            insertStatement.setInt(1, 2);
        } else if (Level.TRACE.equals(level)) {
            insertStatement.setInt(1, 1);
        } else {
            insertStatement.setInt(1, 0);
        }

        if (!message.equals("")) {

            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> jsonMap = objectMapper.readValue(message,
                    new TypeReference<Map<String,Object>>(){});

            insertStatement.setObject(2, jsonMap.getOrDefault("label0", ""));
            insertStatement.setObject(3, jsonMap.getOrDefault("label1", ""));
            insertStatement.setObject(4, jsonMap.getOrDefault("label2", ""));
            insertStatement.setObject(5, jsonMap.getOrDefault("params", ""));
            insertStatement.setObject(6, jsonMap.getOrDefault("content", "") );

            Date now = new Date();
            String date = DateUtil.format(now, "yyyy-MM-dd");

            insertStatement.setString(7, date);
            insertStatement.setDate(8, new java.sql.Date(DateUtil.millisecond(now)));
        }

        int updateCount = insertStatement.executeUpdate();

        if (updateCount != 1) {
            System.out.println("log insert database fail!");
        }
    }

    @Override
    protected void secondarySubAppend(ILoggingEvent event, Connection connection, long eventId) throws Throwable {

    }


    @Override
    protected Method getGeneratedKeysMethod() {
        return GET_GENERATED_KEYS_METHOD;
    }

    @Override
    protected String getInsertSQL() {
        return insertSQL;
    }
}
