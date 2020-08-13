package com.itheima.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.model.CustomerInfo;
import com.itheima.model.GeneralLedger;
import com.itheima.model.GeneralLedgerTotalInfo;
import com.itheima.model.OrdersAndJournal;
import com.itheima.otherClass.QueryInfo;

public interface GeneralLedgerService {
	List<GeneralLedger> limitQuery(Integer pageIdx, Integer pageDataCount);
	List<GeneralLedger> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount);
	Integer findScreenCount(List<String> screenInfo);
	Integer findCount();
	List<String> findColValues(Integer colIdx);
	Integer adds(List<GeneralLedger> datas);
	Integer dels(List<Integer> ids);
	GeneralLedger findById(Integer id);
	boolean edit(GeneralLedger data);
	GeneralLedgerTotalInfo queryTotalInfo();
}
