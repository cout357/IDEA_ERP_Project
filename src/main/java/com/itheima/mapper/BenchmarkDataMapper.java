package com.itheima.mapper;

import com.itheima.model.BenchmarkData;
import com.itheima.model.BenchmarkDataTotalInfo;
import com.itheima.model.GeneralLedgerTotalInfo;
import com.itheima.otherClass.QueryInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BenchmarkDataMapper {


    List<BenchmarkData> findAll();
    List<BenchmarkData> findAllAndSort(@Param(value = "orderItems") List<String> orderItems);
    List<BenchmarkData> completeQuery(QueryInfo queryInfoByCustomerInfo);
    List<String> findColValues(@Param("colName") String colName);
    BenchmarkData findById(int id);
    Integer findCount();
    Integer findScreenCount(QueryInfo queryInfoByCustomerInfo);
    Integer adds(@Param("datas") List<BenchmarkData> datas);
    Integer dels(@Param("ids") List<Integer> ids);
    Integer edit(BenchmarkData customerInfo);
	BenchmarkDataTotalInfo queryTotalInfo();


}
