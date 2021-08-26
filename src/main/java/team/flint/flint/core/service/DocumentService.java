package team.flint.flint.core.service;

import team.flint.flint.model.table.Document;
import team.flint.flint.model.table.Program;
import team.flint.flint.model.table.Resource;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/14
 * Description: .
 */
public interface DocumentService {

    List<Document> getDocumentList();

    Document getDocument(Integer documentId);

    void editDocument();
}
