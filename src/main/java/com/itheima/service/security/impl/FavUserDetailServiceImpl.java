package com.itheima.service.security.impl;


import com.itheima.mapper.AccountMapper;
import com.itheima.model.Account;
import com.itheima.service.security.FavUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class FavUserDetailServiceImpl implements FavUserDetailService {


    @Autowired
    private AccountMapper accountMapper;



    /**
     * 数据库State>0返回真
     * @param string
     * @return
     * @throws UsernameNotFoundException
     */

    @Override
    public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {

        Account account = accountMapper.AccountFindByEmail(string);
        boolean flag;
        if (account.getState() > 0)
            flag = true;
        else
            flag = false;

        return  new User(account.getUser(),"{noop}"+ account.getPassword(),true,true,true,flag,getAuthorities(account.getRole()));
    }



    /**  * 获取用户的角色权限,为了降低实验的难度，这里去掉了根据用户名获取角色的步骤     * @param    * @return   */
    private Collection<GrantedAuthority> getAuthorities(String role){
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        if (role.equals("ROOT")){
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "SALES"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ADMIN"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ROOT"));
        }else if (role.equals("SALES"))
        {
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "SALES"));
        }else if (role.equals("ADMIN")){
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ADMIN"));
        }
        else if (role.equals("SUPER")){
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "SUPER"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "SALES"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ADMIN"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ROOT"));
        }
        return authList;
    }

}
