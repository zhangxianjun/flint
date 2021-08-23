package team.flint.flint.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.flint.flint.core.mapper.ResourceMapper;
import team.flint.flint.core.mapper.StaffMapper;
import team.flint.flint.core.service.SystemService;
import team.flint.flint.model.table.Resource;
import team.flint.flint.model.table.Staff;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/14
 * Description: .
 */

@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    private StaffMapper staffMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public Staff getStaffByPhone(String phone) {
        return staffMapper.selectStaffByPhone(phone);
    }

    @Override
    public List<Staff> getStaffList() {
        return staffMapper.getStaffList();
    }

    public List<Resource> getResourceList(Integer resourceId) {
        return resourceMapper.getResourceList(resourceId);
    }

    @Override
    public Resource getResourceById(Integer resourceId) {
        return resourceMapper.getResourceById(resourceId);
    }
}
