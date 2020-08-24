package com.itheima.service;

import com.itheima.model.BenchmarkData;
import com.itheima.model.BenchmarkDataTotalInfo;

import java.util.List;

public interface BenchmarkDataService {

    List<BenchmarkData> findAll();
    List<BenchmarkData> findAllAndSort(List<String> sortTypes);
    List<BenchmarkData> completeQuery(List<String> screenInfo, Integer pageIdx, Integer pageDataCount);
    List<BenchmarkData> limitQuery(Integer pageIdx, Integer pageDataCount);
    List<String> findColValues(int colIdx);
    BenchmarkData findById(int id);
    Integer findCount();
    Integer findScreenCount(List<String> screenInfo);
    Integer adds(List<BenchmarkData> datas);
    Integer dels(List<Integer> ids);
    Integer edit(BenchmarkData customerInfo);
	BenchmarkDataTotalInfo queryTotalInfo();
	List<String> queryKMId();
}
