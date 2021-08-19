package team.flint.flint.controller.system;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import team.flint.flint.core.service.SystemService;
import team.flint.flint.model.table.Staff;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/18
 * Description: 项目相关.
 */

@Controller
public class StaffController {

    @Autowired
    private SystemService staffService;

    @RequestMapping(value = "/page/system/staff/list")
    public ModelAndView getProgramListPage(ModelAndView modelAndView) {
        modelAndView.setViewName("/system/staff_list");
        return modelAndView;
    }

    @RequestMapping(value = "/api/system/staff/list")
    @ResponseBody
    public String getProgramListData() throws JsonProcessingException {

        List<Staff> list = staffService.getStaffList();
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "成功");
        map.put("data", list);

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/page/system/staff/add")
    @ResponseBody
    public ModelAndView getAddProgramPage(ModelAndView modelAndView, Integer programId) {

        if (programId == 0) {

        }
        modelAndView.setViewName("/program/program_add");

        return modelAndView;
    }

    @RequestMapping(value = "/api/system/staff/add")
    @ResponseBody
    public String addProgramData(String name,
                                 String code,
                                 String desc,
                                 String prototype,
                                 String source,
                                 String dev_output,
                                 String rc_output,
                                 String pro_output) throws JsonProcessingException {



        ObjectMapper objectMapper = new ObjectMapper();

        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "成功");
//        map.put("data", list);

        return objectMapper.writeValueAsString(map);
    }
}
