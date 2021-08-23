package team.flint.flint.core.service;

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

// TODO 不需要此注释
//@Service
public interface SystemService {

    /**
     * 获取员工信息
     * @param phone
     * @return
     */
    public Staff getStaffByPhone(String phone);

    public List<Staff> getStaffList();

    public List<Resource> getResourceList(Integer resourceId);

    public Resource getResourceById(Integer resourceId);

    public void editResource();
}
