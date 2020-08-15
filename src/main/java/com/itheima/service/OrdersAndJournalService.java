package com.itheima.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.model.CustomerInfo;
import com.itheima.model.OrdersAndJournal;
import com.itheima.model.OrdersAndJournalTotalInfo;
import com.itheima.otherClass.QueryInfo;

public interface OrdersAndJournalService {
	List<OrdersAndJournal> limitQuery(Integer pageIdx, Integer pageDataCount);
	List<OrdersAndJournal> completeQuery(List<String> screenInfo);
	List<OrdersAndJournal> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount);
	Integer findScreenCount(List<String> screenInfo);
	Integer findCount();
	List<String> findColValues(Integer colIdx);
	Integer adds(List<OrdersAndJournal> datas);
	Integer dels(List<Integer> ids);
	OrdersAndJournal findById(Integer id);
	boolean edit(OrdersAndJournal ordersAndJournal);
	OrdersAndJournalTotalInfo queryTotalInfo();
}
