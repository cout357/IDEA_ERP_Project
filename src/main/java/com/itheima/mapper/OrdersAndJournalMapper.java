package com.itheima.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.model.CustomerInfo;
import com.itheima.model.OrdersAndJournal;
import com.itheima.otherClass.QueryInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdersAndJournalMapper {
	List<OrdersAndJournal> completeQuery(QueryInfo queryInfo);
	Integer findScreenCount(QueryInfo queryInfo);
	Integer findCount();
	List<String> findColValues(@Param("colName") String colName);
	Integer adds(@Param("datas") List<OrdersAndJournal> datas);
	Integer dels(@Param("ids") List<Integer> ids);
	OrdersAndJournal findById(Integer id);
	Integer edit(OrdersAndJournal ordersAndJournal);
}
