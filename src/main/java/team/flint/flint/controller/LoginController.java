package team.flint.flint.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.flint.flint.core.service.SystemService;
import team.flint.flint.model.table.Staff;

@Controller
public class LoginController {

    @Autowired
    public SystemService staffService;

    @RequestMapping(value = "/api/login")
    @ResponseBody
    public Staff getWorkbenchPage(@ModelAttribute("model") ModelMap model) {
//        Date date = new Date();
//        Marker marker = MarkerFactory.getMarker("Flint");
//
////        logger.error(marker, "{\"label0\":\"xxxx\"}");
        return staffService.getStaffByPhone("18698581176");
    }
}
