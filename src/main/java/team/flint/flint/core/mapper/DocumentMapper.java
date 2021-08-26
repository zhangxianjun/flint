package team.flint.flint.core.mapper;

import team.flint.flint.model.table.Document;
import team.flint.flint.model.table.Resource;

import java.util.Date;
import java.util.List;

public interface DocumentMapper {

    /**
     * 获取文档列表
     * @return
     */
    List<Document> getDocumentList();

    /**
     * 获取文档
     * @return
     */
    Document getDocument(Integer documentId);

    /**
     * 插入文档
     * @return
     */
    int insertDocument(String key, String category, String title, Integer staffId, String staffName,
                       String content, Integer top, Integer total, Date createTime, Date updateTime);


}