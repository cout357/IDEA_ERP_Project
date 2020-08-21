package com.itheima.service.impl;

import com.itheima.mapper.AccountMapper;
import com.itheima.model.Account;
import com.itheima.model.CustomerInfo;
import com.itheima.otherClass.QueryInfo;
import com.itheima.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;
    @Override
    public List<Account> findAll() {
        return accountMapper.findAll();
    }

    @Override
    public List<Account> findAllAndSort(List<String> sortTypes) {
        return accountMapper.findAllAndSort(new QueryInfo(CustomerInfo.class,sortTypes).getOrderItems());
    }

    @Override
    public List<Account> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount) {
        return accountMapper.completeQuery(new QueryInfo(CustomerInfo.class,screenInfo,pageIdx*pageDataCount,pageDataCount));
    }

    @Override
    public List<Account> limitQuery(Integer pageIdx, Integer pageDataCount) {
        return accountMapper.completeQuery(new QueryInfo(pageIdx*pageDataCount,pageDataCount));
    }


    @Override
    public List<String> findColValues(int colIdx) {
        String colName = CustomerInfo.getColName(colIdx);
        System.out.println("colName:"+colName);
        return colName==null?null:accountMapper.findColValues(colName);
    }

    @Override
    public Account findById(int id) {
        return accountMapper.findById(id);
    }

    @Override
    public Integer findCount() {
        return accountMapper.findCount();
    }

    @Override
    public Integer findScreenCount(List<String> screenInfo) {
        return accountMapper.findScreenCount(new QueryInfo(CustomerInfo.class,screenInfo));
    }

    @Override
    public Integer adds(List<Account> datas) {
        return accountMapper.adds(datas);
    }

    @Override
    public Integer dels(List<Integer> ids) {
        return accountMapper.dels(ids);
    }

    @Override
    public Integer edit(Account customerInfo) {
        return accountMapper.edit(customerInfo);
    }
}
