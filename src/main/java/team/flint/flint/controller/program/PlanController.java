package team.flint.flint.controller.program;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import team.flint.flint.core.service.ProgramService;
import team.flint.flint.core.service.SystemService;
import team.flint.flint.model.table.Resource;

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
public class PlanController {

    @Autowired
    private SystemService systemService;

    @Autowired
    private ProgramService programService;

    @RequestMapping(value = "/page/program/plan/list")
    public ModelAndView getProgramListPage(ModelAndView modelAndView) {
//        modelAndView.addObject("list", programService.getProgramList());
        modelAndView.setViewName("/program/plan_list");
        return modelAndView;
    }

    @RequestMapping(value = "/api/system/navigation/list")
    @ResponseBody
    public String getNavigationListData(Integer resourceId) throws JsonProcessingException {

        List<Resource> list = systemService.getResourceList(resourceId);

        ObjectMapper objectMapper = new ObjectMapper();

        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "成功");
        map.put("data", list);

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value = "/page/system/navigation/add")
    @ResponseBody
    public ModelAndView getAddProgramPage(ModelAndView modelAndView, Integer resourceId) {
        modelAndView.addObject("resourceId", resourceId);
        // 父级ID
        List<Resource> rootList = programService.getResourceListByRootId(1);
        rootList.add(systemService.getResourceById(1));
        modelAndView.addObject("rootList", rootList);

        Resource resource = new Resource();

        if (resourceId > 0) {
            resource = systemService.getResourceById(resourceId);
        }

        modelAndView.addObject("resource", resource);
        modelAndView.setViewName("/system/navigation_add");

        return modelAndView;
    }

    @RequestMapping(value = "/api/system/navigation/add")
    @ResponseBody
    public String addProgramData(Integer resourceId,
                                 Integer rootId,
                                 String name,
                                 String path,
                                 Integer showOrder) throws JsonProcessingException {


        if (resourceId == 0) {
            // 新增
        } else {
            // 修改
            systemService.editResource(rootId, name, path, showOrder, resourceId);
        }


        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "成功");

        return objectMapper.writeValueAsString(map);
    }
}
