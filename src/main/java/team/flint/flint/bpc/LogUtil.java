package team.flint.flint.bpc;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import team.flint.flint.WorkbenchController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/03/21
 * Description: .
 */

public class LogUtil {

    private static final Logger logger = LoggerFactory.getLogger(WorkbenchController.class);

    private static final String MARKER_NAME = "Flint";
    private static final Marker marker = MarkerFactory.getMarker(MARKER_NAME);

    public static void info(String label0,
                            String label1,
                            String label2,
                            String params,
                            String content) throws JsonProcessingException {

        logger.info(marker, map2json(label0, label1, label2, params, content));
    }

    public static void error(String label0,
                            String label1,
                            String label2,
                            String params,
                            Exception exception) throws JsonProcessingException {

        String content = exception.getMessage();

        logger.error(marker, map2json(label0, label1, label2, params, content));
    }

    public static String map2json(String label0,
                                  String label1,
                                  String label2,
                                  String params,
                                  String content) throws JsonProcessingException {
        Map<String, Object> map = new HashMap<>();
        map.put("label0", label0);
        map.put("label1", label1);
        map.put("label2", label2);
        map.put("params", params);
        map.put("content", content);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(map);
    }
}
