package com.itheima.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.model.CustomerInfo;
import com.itheima.otherClass.QueryInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerInfoMapper {
	List<CustomerInfo> findAll();
	List<CustomerInfo> findAllAndSort(@Param(value = "orderItems") List<String> orderItems);
	List<CustomerInfo> completeQuery(QueryInfo queryInfoByCustomerInfo);
	List<String> findColValues(@Param("colName") String colName);
	CustomerInfo findById(int id);
	Integer findCount();
	Integer findScreenCount(QueryInfo queryInfoByCustomerInfo);
	Integer adds(@Param("datas") List<CustomerInfo> datas);
	Integer dels(@Param("ids") List<Integer> ids);
	Integer edit(CustomerInfo customerInfo);
}
