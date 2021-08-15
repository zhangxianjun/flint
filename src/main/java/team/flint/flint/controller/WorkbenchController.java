package team.flint.flint.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WorkbenchController {

    @RequestMapping(value = "/page/workbench")
    public String getWorkbenchPage(@ModelAttribute("model") ModelMap model) {
//        Date date = new Date();
//        Marker marker = MarkerFactory.getMarker("Flint");
//
////        logger.error(marker, "{\"label0\":\"xxxx\"}");
        // 获取一级导航

        // 获取二级导航


        return "workbench";
    }

    @RequestMapping(value = "/api/test")
    @ResponseBody
    public String apiTest() {
        return "xxx";
    }
}
