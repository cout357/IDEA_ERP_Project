package com.itheima.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.model.CustomerInfo;
import com.itheima.model.GeneralLedger;
import com.itheima.model.OrdersAndJournal;
import com.itheima.otherClass.QueryInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface GeneralLedgerMapper {
	List<GeneralLedger> completeQuery(QueryInfo queryInfo);
	Integer findScreenCount(QueryInfo queryInfo);
	Integer findCount();
	List<String> findColValues(@Param("colName") String colName);
	Integer adds(@Param("datas") List<GeneralLedger> datas);
	Integer dels(@Param("ids") List<Integer> ids);
	GeneralLedger findById(Integer id);
	Integer edit(GeneralLedger data);
}
