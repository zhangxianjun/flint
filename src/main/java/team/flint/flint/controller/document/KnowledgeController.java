package team.flint.flint.controller.document;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import team.flint.flint.core.service.DocumentService;
import team.flint.flint.core.service.ProgramService;
import team.flint.flint.model.table.Document;
import team.flint.flint.model.table.Program;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/18
 * Description: 团队知识.
 */

@Controller
public class KnowledgeController {

    @Autowired
    private DocumentService documentService;

    @RequestMapping(value = "/page/document/knowledge/list")
    public ModelAndView getProgramListPage(ModelAndView modelAndView) {
        modelAndView.setViewName("/document/knowledge_list");
        return modelAndView;
    }

    @RequestMapping(value = "/api/document/knowledge/list")
    @ResponseBody
    public String getProgramListData() throws JsonProcessingException {

        List<Document> list = documentService.getDocumentList();

        ObjectMapper objectMapper = new ObjectMapper();

        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "成功");
        map.put("data", list);

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/page/document/knowledge/add")
    @ResponseBody
    public ModelAndView getAddDocumentPage(ModelAndView modelAndView, Integer documentId) {

        Document document = new Document();
        if (documentId != 0) {
            document = documentService.getDocument(documentId);
        }
        modelAndView.addObject("document", document);
        modelAndView.addObject("documentId", documentId);
        modelAndView.setViewName("/document/knowledge_add");

        return modelAndView;
    }

    @RequestMapping(value = "/api/document/knowledge/add")
    @ResponseBody
    public String addProgramData(Integer documentId, String title, String category, String content) throws JsonProcessingException {

        documentService.editDocument(documentId, title, category, content, 1, "zxj");

        ObjectMapper objectMapper = new ObjectMapper();

        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "成功");

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/page/document/show")
    @ResponseBody
    public ModelAndView getShowDocumentPage(ModelAndView modelAndView, Integer documentId) {

        Document document =  documentService.getDocument(documentId);
        modelAndView.addObject("document", document);
        modelAndView.setViewName("/document/show");

        return modelAndView;
    }
}
