package team.flint.flint.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.flint.flint.core.mapper.ResourceMapper;
import team.flint.flint.core.service.ProgramService;
import team.flint.flint.model.table.Resource;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2021/08/15
 * Description: .
 */

@Service
public class ProgramServiceImpl implements ProgramService {

    @Autowired
    public ResourceMapper resourceMapper;

    @Override
    public List<Resource> getResourceList(Integer rootId) {
        return resourceMapper.getResourceList(rootId);
    }
}
