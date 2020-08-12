package com.itheima.mapper;

import com.itheima.model.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {

    /**
     * 根据用户找权限
     * @param user
     * @return
     */
    List<Role> Roles(String user);

    /**
     * 更改权限
     * @param role
     */
    void RoseUpdate(Role role);

    /**
     * 添加权限
     * @param role
     */
    void RoseAdd(Role role);

    /**
     * 删除某个权限
     * @param role
     */
    void RoleDelete(Role role);

}
