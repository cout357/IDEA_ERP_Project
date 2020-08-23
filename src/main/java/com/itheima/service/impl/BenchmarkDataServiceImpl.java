package com.itheima.service.impl;

import com.itheima.mapper.BenchmarkDataMapper;
import com.itheima.model.Account;
import com.itheima.model.BenchmarkData;
import com.itheima.model.BenchmarkDataTotalInfo;
import com.itheima.model.BenchmarkData;
import com.itheima.otherClass.QueryInfo;
import com.itheima.service.BenchmarkDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class BenchmarkDataServiceImpl  implements BenchmarkDataService {

    @Autowired
    private BenchmarkDataMapper benchmarkDataMapper;


    @Override
    public List<BenchmarkData> findAll() {
        return benchmarkDataMapper.findAll();
    }

    @Override
    public List<BenchmarkData> findAllAndSort(List<String> sortTypes) {
        return benchmarkDataMapper.findAllAndSort(new QueryInfo(BenchmarkData.class,sortTypes).getOrderItems());
    }

    @Override
    public List<BenchmarkData> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount) {
        return benchmarkDataMapper.completeQuery(new QueryInfo(BenchmarkData.class,screenInfo,pageIdx*pageDataCount,pageDataCount));
    }

    @Override
    public List<BenchmarkData> limitQuery(Integer pageIdx, Integer pageDataCount) {
        return benchmarkDataMapper.completeQuery(new QueryInfo(pageIdx*pageDataCount,pageDataCount));
    }

    @Override
    public List<String> findColValues(int colIdx) {
        return benchmarkDataMapper.findColValues(BenchmarkData.class.getDeclaredFields()[colIdx].getName());
    }

    @Override
    public BenchmarkData findById(int id) {
        return benchmarkDataMapper.findById(id);
    }

    @Override
    public Integer findCount() {
        return benchmarkDataMapper.findCount();
    }

    @Override
    public Integer findScreenCount(List<String> screenInfo) {
        return benchmarkDataMapper.findScreenCount(new QueryInfo(BenchmarkData.class,screenInfo));
    }

    @Override
    public Integer adds(List<BenchmarkData> datas) {
        return benchmarkDataMapper.adds(datas);
    }

    @Override
    public Integer dels(List<Integer> ids) {
        return benchmarkDataMapper.dels(ids);
    }

    @Override
    public Integer edit(BenchmarkData benchmarkData) {
        return benchmarkDataMapper.edit(benchmarkData);
    }

	@Override
	public BenchmarkDataTotalInfo queryTotalInfo() {
		// TODO Auto-generated method stub
		return benchmarkDataMapper.queryTotalInfo();
	}
}
