package team.flint.flint.core.service.impl;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import team.flint.flint.core.mapper.AuthorityMapper;
import team.flint.flint.core.mapper.StaffMapper;
import team.flint.flint.core.service.StaffService;
import team.flint.flint.model.table.Staff;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/14
 * Description: .
 */

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffMapper staffMapper;

    @Override
    public Staff getStaffByPhone(String phone) {
        return staffMapper.selectStaffByPhone(phone);
    }
}
