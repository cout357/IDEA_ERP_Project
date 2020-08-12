package com.itheima.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.model.CustomerInfo;
import com.itheima.otherClass.QueryInfo;

public interface CustomerInfoService {
	List<CustomerInfo> findAll();
	List<CustomerInfo> findAllAndSort(List<String> sortTypes);
	List<CustomerInfo> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount);
	List<CustomerInfo> limitQuery(Integer pageIdx, Integer pageDataCount);
	List<String> findColValues(int colIdx);
	CustomerInfo findById(int id);
	Integer findCount();
	Integer findScreenCount(List<String> screenInfo);
	Integer adds(List<CustomerInfo> datas);
	Integer dels(List<Integer> ids);
	Integer edit(CustomerInfo customerInfo);
}
