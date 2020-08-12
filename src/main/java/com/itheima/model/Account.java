package com.itheima.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

public class Account implements Serializable {

    /**
     * 用户表
     */

    private int id;       // 自增id

    private String name;         // 名字

    private String password;     // 密码

    private String user;        // 用户名

    private String role;         // 口令验证

    private int state;          //  是否登录

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}

