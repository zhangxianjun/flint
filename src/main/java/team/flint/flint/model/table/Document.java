package team.flint.flint.model.table;

import lombok.Data;

import java.util.Date;

@Data
public class Document {

    /**
     *   文档ID
     */
    private Long documentId;

    /**
     *   聚类标签
     */
    private String category;

    /**
     *   标题
     */
    private String title;

    /**
     *   员工ID
     */
    private Integer staffId;

    /**
     *   0启用 1禁用
     */
    private String content;

    /**
     *   创建时间
     */
    private Date createTime;

    /**
     *   更新时间
     */
    private Date updateTime;
}
