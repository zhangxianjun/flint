package team.flint.flint.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.flint.flint.core.mapper.DocumentMapper;
import team.flint.flint.core.mapper.ProgramMapper;
import team.flint.flint.core.mapper.ResourceMapper;
import team.flint.flint.core.service.DocumentService;
import team.flint.flint.model.table.Document;

import javax.security.auth.login.CredentialNotFoundException;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/15
 * Description: .
 */

@Service
public class DocumentServiceImpl implements DocumentService {


    @Autowired
    public DocumentMapper documentMapper;

    @Override
    public List<Document> getDocumentList() {
        return documentMapper.getDocumentList();
    }

    @Override
    public Document getDocument(Integer documentId) {
        return documentMapper.getDocument(documentId);
    }

    @Override
    public void editDocument() {

    }
}
