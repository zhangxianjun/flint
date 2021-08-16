package team.flint.flint.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import team.flint.flint.core.service.ProgramService;
import team.flint.flint.model.table.Resource;

import java.util.List;

@Controller
public class WorkbenchController {

    @Autowired
    private ProgramService programService;

    @RequestMapping(value = "/page/workbench")
    public ModelAndView getWorkbenchPage(ModelAndView modelAndView) {
//        Date date = new Date();
//        Marker marker = MarkerFactory.getMarker("Flint");
//
////        logger.error(marker, "{\"label0\":\"xxxx\"}");
        // 获取一级导航
        List<Resource> topList = programService.getResourceList(0);
        modelAndView.addObject("topList", topList);
        // 获取二级导航
        List<Resource> leftList = programService.getResourceList(1);
        modelAndView.addObject("leftList", leftList);
        // 获取首页
        modelAndView.addObject("firstPage", leftList.get(0));

        modelAndView.setViewName("workbench");
        return modelAndView;
    }

    @RequestMapping(value = "/api/test")
    @ResponseBody
    public String apiTest() {
        return "xxx";
    }
}
