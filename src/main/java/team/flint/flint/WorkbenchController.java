package team.flint.flint;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WorkbenchController {

    @RequestMapping(value = "/page/workbench")
    public String getWorkbenchPage(@ModelAttribute("model") ModelMap model) {
        return "workbench";
    }

    @RequestMapping(value = "/api/test")
    @ResponseBody
    public String apiTest() {
        return "xxx";
    }
}
