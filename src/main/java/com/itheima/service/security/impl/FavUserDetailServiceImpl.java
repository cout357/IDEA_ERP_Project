package com.itheima.service.security.impl;


import com.itheima.mapper.AccountMapper;
import com.itheima.mapper.RoleMapper;
import com.itheima.model.Role;
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
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private RoleMapper roleMapper;



    @Override
    public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {

        return  new User(accountMapper.AccountFindByEmail(string).getUser(),"{noop}"+ accountMapper.AccountFindByEmail(string).getPassword(),true,true,true,true,getAuthorities(string));
    }



    /**  * 获取用户的角色权限,为了降低实验的难度，这里去掉了根据用户名获取角色的步骤     * @param    * @return   */
    private Collection<GrantedAuthority> getAuthorities(String user){
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        if (accountMapper.AccountFindByEmail(user).getRole().equals("ROOT")){
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "SALES"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ADMIN"));
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ROOT"));
        }else if (accountMapper.AccountFindByEmail(user).getRole().equals("SALES"))
        {
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "SALES"));
        }else if (accountMapper.AccountFindByEmail(user).getRole().equals("ADMIN")){
            authList.add(new SimpleGrantedAuthority("ROLE_"+ "ADMIN"));
        }
        return authList;
    }

}
