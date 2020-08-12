package com.itheima.mapper;

import com.itheima.model.BenchmarkData;

import java.util.List;

public interface BenchmarkDataMapper {

    /**
     * 查找全部信息
     * @return
     */
    List<BenchmarkData> BenchmarkDataAll();


    /**
     * 更新信息
     * @param benchmarkData
     */
    void BenchmarkDataUpdate(BenchmarkData benchmarkData);

    /**
     * 根据id删除信息
     * @param id
     */
    void BenchmarkDataDelete(int id);


    /**
     * 插入
     * @param benchmarkData
     */
    void  BenchmarkDataInsert(BenchmarkData benchmarkData);


    /**
     * 按照id查询
     * @param id
     * @return
     */
    BenchmarkData BenchmarkDataOne(int id);


}
