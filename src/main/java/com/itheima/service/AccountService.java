package com.itheima.service;

import com.itheima.model.Account;
import com.itheima.model.BenchmarkData;

import java.util.List;

public interface AccountService {

    List<Account> findAll();
    List<Account> findAllAndSort(List<String> sortTypes);
    List<Account> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount);
    List<Account> limitQuery(Integer pageIdx, Integer pageDataCount);
    List<String> findColValues(int colIdx);
    Account findById(int id);
    Integer findCount();
    Integer findScreenCount(List<String> screenInfo);
    Integer adds(List<Account> datas);
    Integer dels(List<Integer> ids);
    Integer edit(Account customerInfo);
}
