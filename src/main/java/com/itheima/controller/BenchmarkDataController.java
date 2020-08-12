package com.itheima.controller;

import com.itheima.mapper.BenchmarkDataMapper;
import com.itheima.model.BenchmarkData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
public class BenchmarkDataController {

    @Autowired
    private BenchmarkDataMapper benchmarkDataMapper;

    @RequestMapping("BenchmarkDataAll")
    public String BenchmarkDataAll(Model model){

        model.addAttribute("all",benchmarkDataMapper.BenchmarkDataAll());
        return null;
    }

    @RequestMapping("BenchmarkDataUpdate")
    @RolesAllowed("ROLE_ROOT")
    public String BenchmarkDataUpdate(Model model,  BenchmarkData benchmarkData){
        benchmarkDataMapper.BenchmarkDataUpdate(benchmarkData);

        return null;
    }

    @RequestMapping("BenchmarkDataDelete")
    @RolesAllowed("ROLE_ROOT")
    public String BenchmarkDataDelete(Model model, int id){
        benchmarkDataMapper.BenchmarkDataDelete(id);
        return null;
    }

    @RequestMapping("BenchmarkDataInsert")
    @RolesAllowed("ROLE_ROOT")
    public String BenchmarkDataInsert(Model model, BenchmarkData benchmarkData){
        benchmarkDataMapper.BenchmarkDataInsert(benchmarkData);
        return null;
    }

    @RequestMapping("BenchmarkDataOne")
    public String BenchmarkDataOne(Model model, int id){

        benchmarkDataMapper.BenchmarkDataOne(id);
        return null;
    }
}
