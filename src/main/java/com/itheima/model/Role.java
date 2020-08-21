package com.itheima.model;

import java.io.Serializable;

public class Role implements Serializable {

    /**
     * 关联数据库信息， 主要获取角色
     */
    private int roleId;

    private String roleUser;

    private String strRole;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleUser() {
        return roleUser;
    }

    public void setRoleUser(String roleUser) {
        this.roleUser = roleUser;
    }

    public String getStrRole() {
        return strRole;
    }

    public void setStrRole(String strRole) {
        this.strRole = strRole;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleId=" + roleId +
                ", roleUser='" + roleUser + '\'' +
                ", strRole='" + strRole + '\'' +
                '}';
    }
}
