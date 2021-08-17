package team.flint.flint.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import team.flint.flint.core.service.ProgramService;
import team.flint.flint.model.table.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WorkbenchController {

    @Autowired
    private ProgramService programService;

    @RequestMapping(value = "/page/workbench")
    public ModelAndView getWorkbenchPage(ModelAndView modelAndView) throws JsonProcessingException {

//        Date date = new Date();
//        Marker marker = MarkerFactory.getMarker("Flint");
//
////        logger.error(marker, "{\"label0\":\"xxxx\"}");
        // 获取一级导航
        List<Resource> topList = programService.getResourceList(0);
        Integer topIndex = topList.get(0).getResourceId();
        modelAndView.addObject("topList", topList);
        modelAndView.addObject("topIndex", topIndex);

        // 获取二级导航
        Map<String, List<Resource>> leftMap = new HashMap<>();
        for (int i = 0; i < topList.size(); i++) {
            Resource r = topList.get(i);
            List<Resource> leftList = programService.getResourceList(r.getResourceId());
            leftMap.put(r.getResourceId() + "", leftList);
        }

        ObjectMapper objectMapper = new ObjectMapper();

        modelAndView.addObject("leftMap", objectMapper.writeValueAsString(leftMap));
        // 获取首页
        List<Resource> leftList = leftMap.get(topIndex+"");
        modelAndView.addObject("leftList", leftList);

        Resource firstPageModel = leftList.size() > 0 ? leftList.get(0) : null;
        modelAndView.addObject("firstPageModel", firstPageModel);

        modelAndView.setViewName("workbench");

        return modelAndView;
    }

    @RequestMapping(value = "/api/left/menu")
    @ResponseBody
    public String getLeftMenu(Integer resourceId) throws JsonProcessingException {

        List<Resource> leftList = programService.getResourceList(resourceId);

        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(leftList);
    }
}
