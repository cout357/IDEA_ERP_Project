package com.itheima.service.impl;

import java.lang.reflect.Field;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itheima.mapper.OrdersAndJournalMapper;
import com.itheima.model.CustomerInfo;
import com.itheima.model.OrdersAndJournal;
import com.itheima.model.OrdersAndJournalTotalInfo;
import com.itheima.otherClass.QueryInfo;
import com.itheima.service.OrdersAndJournalService;

@Service
public class OrdersAndJournalServiceImpl implements OrdersAndJournalService{
	@Autowired
	private OrdersAndJournalMapper ordersAndJournalMapper;
	
	@Override
	public List<OrdersAndJournal> limitQuery(Integer pageIdx, Integer pageDataCount) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.completeQuery(new QueryInfo(pageIdx*pageDataCount,pageDataCount));
	}
	@Override
	public List<OrdersAndJournal> completeQuery(List<String> screenInfo) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.completeQuery(new QueryInfo(OrdersAndJournal.class,screenInfo));
	}
	@Override
	public List<OrdersAndJournal> completeQuery(List<String> screenInfo,Integer pageIdx,Integer pageDataCount) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.completeQuery(new QueryInfo(OrdersAndJournal.class,screenInfo,pageIdx*pageDataCount,pageDataCount));
	}

	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.findCount();
	}

	@Override
	public Integer findScreenCount(List<String> screenInfo) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.findScreenCount(new QueryInfo(OrdersAndJournal.class,screenInfo));
	}

	@Override
	public List<String> findColValues(Integer colIdx) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.findColValues(OrdersAndJournal.class.getDeclaredFields()[colIdx].getName());
	}

	@Override
	public Integer adds(List<OrdersAndJournal> datas) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.adds(datas);
	}

	@Override
	public Integer dels(List<Integer> ids) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.dels(ids);
	}

	@Override
	public OrdersAndJournal findById(Integer id) {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.findById(id);
	}

	@Override
	public boolean edit(OrdersAndJournal ordersAndJournal) {
		// TODO Auto-generated method stub
		System.out.println("灏嗚淇敼鐨勬暟鎹�:"+ordersAndJournal);
		return ordersAndJournalMapper.edit(ordersAndJournal)==1;
	}

	@Override
	public OrdersAndJournalTotalInfo queryTotalInfo() {
		// TODO Auto-generated method stub
		return ordersAndJournalMapper.queryTotalInfo();
	}
	
}
