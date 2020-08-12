package com.itheima.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itheima.mapper.GeneralLedgerMapper;
import com.itheima.mapper.OrdersAndJournalMapper;
import com.itheima.model.CustomerInfo;
import com.itheima.model.GeneralLedger;
import com.itheima.model.GeneralLedger;
import com.itheima.otherClass.QueryInfo;
import com.itheima.service.GeneralLedgerService;
import com.itheima.service.OrdersAndJournalService;

@Service
public class GeneralLedgerServiceImpl implements GeneralLedgerService{
	@Autowired
	private GeneralLedgerMapper generalLedgerMapper;
	
	@Override
	public List<GeneralLedger> limitQuery(Integer pageIdx, Integer pageDataCount) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.completeQuery(new QueryInfo(pageIdx*pageDataCount,pageDataCount));
	}

	@Override
	public List<GeneralLedger> completeQuery(List<String> screenInfo,Integer pageIdx,Integer pageDataCount) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.completeQuery(new QueryInfo(GeneralLedger.class,screenInfo,pageIdx*pageDataCount,pageDataCount));
	}

	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return generalLedgerMapper.findCount();
	}

	@Override
	public Integer findScreenCount(List<String> screenInfo) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.findScreenCount(new QueryInfo(GeneralLedger.class,screenInfo));
	}

	@Override
	public List<String> findColValues(Integer colIdx) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.findColValues(GeneralLedger.class.getDeclaredFields()[colIdx].getName());
	}

	@Override
	public Integer adds(List<GeneralLedger> datas) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.adds(datas);
	}

	@Override
	public Integer dels(List<Integer> ids) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.dels(ids);
	}

	@Override
	public GeneralLedger findById(Integer id) {
		// TODO Auto-generated method stub
		return generalLedgerMapper.findById(id);
	}

	@Override
	public boolean edit(GeneralLedger data) {
		// TODO Auto-generated method stub
		System.out.println("将要修改的数据:"+data);
		return generalLedgerMapper.edit(data)==1;
	}
	
}
