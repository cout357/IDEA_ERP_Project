package com.itheima.controller;

import com.itheima.mapper.AccountMapper;
import com.itheima.model.Account;
import com.itheima.model.BenchmarkData;
import com.itheima.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class AccountController {
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private AccountService accountService;



    @RequestMapping("allQuery")
    public String findAll(Model model) {
        List<Account> customerInfos = accountService.findAll();
        model.addAttribute("customerInfos", customerInfos);
        model.addAttribute("pageIdx",0);
        model.addAttribute("dataCount",accountService.findCount());
        return "basic-customer";
    }
    @RequestMapping("limitQuery")
    public String limitQuery(@RequestParam(defaultValue = "0")Integer pageIdx, @RequestParam(defaultValue = "30")Integer pageDataCount, Model model) {
        List<Account> customerInfos = accountService.limitQuery(pageIdx,pageDataCount);
        model.addAttribute("customerInfos", customerInfos);
        model.addAttribute("pageIdx",pageIdx);
        model.addAttribute("pageDataCount",pageDataCount);
        model.addAttribute("dataCount",accountService.findCount());
        return "Basic-customer";
    }
    @RequestMapping("findById")
    @ResponseBody
    public Account findById(Integer id) {
        Account customer = accountService.findById(id);
        return customer;
    }
    @RequestMapping("completeQuery")
    @ResponseBody
    public HashMap customerSort(@RequestBody List<String> screenInfo, @RequestParam Integer pageIdx, @RequestParam Integer pageDataCount){
        System.out.println(" pageIdx:"+pageDataCount+" pageDataCount:"+pageDataCount + "screenInfo:" + screenInfo);
        int count = accountService.findScreenCount(screenInfo);
        //如果筛选后当前页大于筛选条件下的最大页，就把当前页改为最大页
        pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
        List<Account> customerInfos = accountService.completeQuery(screenInfo,pageIdx,pageDataCount);
        HashMap hash = new HashMap();
        hash.put("customerInfos", customerInfos);
        hash.put("pageIdx",pageIdx);
        hash.put("dataCount", count);
        System.out.println("--------排序后---------");
        System.out.println(customerInfos);

        return hash;
    }
    @RequestMapping("dataColValues")
    @ResponseBody
    public List<String> dataColValue(Integer colIdx){
        System.out.println("colIdx:"+colIdx);
        return accountService.findColValues(colIdx);
    }

    @RequestMapping("add")
    @ResponseBody			//要返回Integer就需要加这个注解
    public Integer add(@RequestBody List<Account> datas) {
        System.out.println("要添加的数据:"+datas);
        int count = accountService.adds(datas);
        return count;
    }
    @RequestMapping("del")
    @ResponseBody			//要返回Integer就需要加这个注解
    public Integer del(@RequestBody List<Integer> ids) {
        System.out.println("要删除的数据:"+ids);
        int count = accountService.dels(ids);
        return count;
    }

    @RequestMapping("edit")
    @ResponseBody
    public Integer edit(@RequestBody Account data) {
        return accountService.edit(data);
    }







}
