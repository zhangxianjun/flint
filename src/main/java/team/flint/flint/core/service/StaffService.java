package team.flint.flint.core.service;

import team.flint.flint.model.table.Staff;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/14
 * Description: .
 */

// TODO 不需要此注释
//@Service
public interface StaffService  {
    public Staff getStaffByPhone(String phone);
}
