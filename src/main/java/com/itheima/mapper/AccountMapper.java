package com.itheima.mapper;


import com.itheima.model.Account;
import com.itheima.model.BenchmarkData;
import com.itheima.otherClass.QueryInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper {


    List<Account> findAll();
    List<Account> findAllAndSort(@Param(value = "orderItems") List<String> orderItems);
    List<Account> completeQuery(QueryInfo queryInfoByCustomerInfo);
    List<String> findColValues(@Param("colName") String colName);
    Account findById(int id);
    Integer findCount();
    Integer findScreenCount(QueryInfo queryInfoByCustomerInfo);
    Integer adds(@Param("datas") List<Account> datas);
    Integer dels(@Param("ids") List<Integer> ids);
    Integer edit(Account customerInfo);




    Account AccountFindByEmail(String user);


}
