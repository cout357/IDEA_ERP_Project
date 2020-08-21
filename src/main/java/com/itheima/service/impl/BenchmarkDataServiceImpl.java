package com.itheima.service.impl;

import com.itheima.mapper.BenchmarkDataMapper;
import com.itheima.model.BenchmarkData;
import com.itheima.model.CustomerInfo;
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
        return benchmarkDataMapper.findAllAndSort(new QueryInfo(CustomerInfo.class,sortTypes).getOrderItems());
    }

    @Override
    public List<BenchmarkData> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount) {
        return benchmarkDataMapper.completeQuery(new QueryInfo(CustomerInfo.class,screenInfo,pageIdx*pageDataCount,pageDataCount));
    }

    @Override
    public List<BenchmarkData> limitQuery(Integer pageIdx, Integer pageDataCount) {
        return benchmarkDataMapper.completeQuery(new QueryInfo(pageIdx*pageDataCount,pageDataCount));
    }

    @Override
    public List<String> findColValues(int colIdx) {
        String colName = CustomerInfo.getColName(colIdx);
        System.out.println("colName:"+colName);
        return colName==null?null:benchmarkDataMapper.findColValues(colName);
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
        return benchmarkDataMapper.findScreenCount(new QueryInfo(CustomerInfo.class,screenInfo));
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
    public Integer edit(BenchmarkData customerInfo) {
        return benchmarkDataMapper.edit(customerInfo);
    }
}
