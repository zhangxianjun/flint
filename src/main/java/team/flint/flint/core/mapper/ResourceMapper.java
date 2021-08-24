package team.flint.flint.core.mapper;

import team.flint.flint.model.table.Resource;

import java.util.Date;
import java.util.List;

public interface ResourceMapper {

    int insertResource(Integer resource_id, Integer root_id, String name,
                       String path, Integer show_order);

    int insertSelective(Resource record);

    Resource selectByPrimaryKey(Integer resourceId);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);

    List<Resource> getResourceList(Integer rootId);

    /**
     * 获取同一个父级资源
     * @param rootId
     * @return
     */
    List<Resource> getResourceListByRootId(Integer rootId);

    /**
     * 获取某一个资源详情
     * @param resourceId
     * @return
     */
    Resource getResourceById(Integer resourceId);

    /**
     * 更新资源
     */
    void updateResource(Integer rootId, String name, String path, Integer showOrder, Date updateTime, Integer resourceId);
}