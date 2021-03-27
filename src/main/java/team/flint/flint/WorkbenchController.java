package team.flint.flint;

import com.zaxxer.hikari.pool.HikariPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.slf4j.helpers.BasicMarker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
public class WorkbenchController {



    @RequestMapping(value = "/page/workbench")
    public String getWorkbenchPage(@ModelAttribute("model") ModelMap model) {
        Date date = new Date();
        Marker marker = MarkerFactory.getMarker("Flint");

        logger.error(marker, "{\"label0\":\"xxxx\"}");

        return "workbench";
    }

    @RequestMapping(value = "/api/test")
    @ResponseBody
    public String apiTest() {
        return "xxx";
    }
}
