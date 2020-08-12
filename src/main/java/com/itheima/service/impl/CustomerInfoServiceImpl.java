package com.itheima.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.mapper.CustomerInfoMapper;
import com.itheima.model.CustomerInfo;
import com.itheima.otherClass.QueryInfo;
import com.itheima.service.CustomerInfoService;

@Service
@Transactional
public class CustomerInfoServiceImpl implements CustomerInfoService{
	@Autowired
	private CustomerInfoMapper customerInfoMapper;
	@Override
	public CustomerInfo findById(int id) {
		return customerInfoMapper.findById(id);
	}
	@Override
	public List<CustomerInfo> findAll() {
		// TODO Auto-generated method stub
		return customerInfoMapper.findAll();
	}
	@Override
	public List<CustomerInfo> findAllAndSort(List<String> sortTypes) {
		return customerInfoMapper.findAllAndSort(new QueryInfo(CustomerInfo.class,sortTypes).getOrderItems());
	}
	@Override
	public List<String> findColValues(int colIdx) {
		String colName = CustomerInfo.getColName(colIdx);
		System.out.println("colName:"+colName);
		return colName==null?null:customerInfoMapper.findColValues(colName);
	}
	@Override
	public List<CustomerInfo> completeQuery(List<String> screenInfo,Integer pageIdx,Integer pageDataCount) {
		return customerInfoMapper.completeQuery(new QueryInfo(CustomerInfo.class,screenInfo,pageIdx*pageDataCount,pageDataCount));
	}
	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return customerInfoMapper.findCount();
	}
	@Override
	public Integer findScreenCount(List<String> screenInfo) {
		return customerInfoMapper.findScreenCount(new QueryInfo(CustomerInfo.class,screenInfo));
	}
	@Override
	public List<CustomerInfo> limitQuery(Integer pageIdx,Integer pageDataCount) {
		// TODO Auto-generated method stub
		return customerInfoMapper.completeQuery(new QueryInfo(pageIdx*pageDataCount,pageDataCount));
	}
	@Override
	public Integer adds(List<CustomerInfo> datas) {
		// TODO Auto-generated method stub
		return customerInfoMapper.adds(datas);
	}
	@Override
	public Integer dels(List<Integer> ids) {
		// TODO Auto-generated method stub
		return customerInfoMapper.dels(ids);
	}
	@Override
	public Integer edit(CustomerInfo customerInfo) {
		// TODO Auto-generated method stub
		return customerInfoMapper.edit(customerInfo);
	}
	
}
