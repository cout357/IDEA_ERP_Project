package com.itheima.mapper;


import com.itheima.model.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper {

    /**
     * 查找所有用户
     * @return
     */
    List<Account> AccountAll();

    /**
     * 增加用户
     * @param account
     */
    void AccountAdd(Account account);

    /**
     * 更新用户
     * @param account
     */
    void AccountUpdate(Account account);

    /**
     * 删除用户
     * @param account
     */
    void AccountDelete(Account account);


    /**
     * 查找用户
     * @param conditions
     * @return
     */
    Account AccountFindByEmail(String conditions);


}
