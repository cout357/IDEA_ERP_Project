package com.itheima.controller;

import com.itheima.mapper.AccountMapper;
import com.itheima.model.Account;
import com.itheima.model.BenchmarkData;
import com.itheima.otherClass.UtilFunc;
import com.itheima.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("AccountCT")
public class AccountController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountMapper accountMapper;

    @RequestMapping("limitQuery")
    @RolesAllowed("ROLE_SUPER")
    public String limitQuery(@RequestParam(defaultValue = "0")Integer pageIdx, @RequestParam(defaultValue = "30")Integer pageDataCount, Model model) {
        List<Account> datas = accountService.limitQuery(pageIdx,pageDataCount);
        model.addAttribute("datas", datas);
        model.addAttribute("pageIdx",pageIdx);
        model.addAttribute("pageDataCount",pageDataCount);
        model.addAttribute("dataCount",accountService.findCount());
        return "Basic-user";
    }
    @RequestMapping("findById")
    @RolesAllowed("ROLE_SUPER")
    @ResponseBody
    public Account findById(Integer id) {
        Account customer = accountService.findById(id);
        return customer;
    }
    @RequestMapping("completeQuery")
    @RolesAllowed("ROLE_SUPER")
    @ResponseBody
    public HashMap customerSort(@RequestBody List<String> screenInfo, @RequestParam Integer pageIdx, @RequestParam Integer pageDataCount){
        System.out.println(" pageIdx:"+pageDataCount+" pageDataCount:"+pageDataCount + "screenInfo:" + screenInfo);
        int count = accountService.findScreenCount(screenInfo);
        //??????????????????????????????????????????????????????????????????????????????????????????
        pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
        List<Account> datas = accountService.completeQuery(screenInfo,pageIdx,pageDataCount);
        HashMap hash = new HashMap();
        hash.put("datas", datas);
        hash.put("pageIdx",pageIdx);
        hash.put("dataCount", count);

        return hash;
    }
    @RequestMapping("dataColValues")
    @RolesAllowed("ROLE_SUPER")
    @ResponseBody
    public List<String> dataColValue(Integer colIdx){
        System.out.println("colIdx:"+colIdx);
        return accountService.findColValues(colIdx);
    }

    @RequestMapping("add")
    @RolesAllowed("ROLE_SUPER")
    @ResponseBody			//?????????Integer????????????????????????
    public Integer add(@RequestBody List<Account> datas) {
        System.out.println("??????????????????:"+datas);
        int count = accountService.adds(datas);
        return count;
    }
    @RequestMapping("del")
    @RolesAllowed("ROLE_SUPER")
    @ResponseBody			//?????????Integer????????????????????????
    public Integer del(@RequestBody List<Integer> ids) {
        System.out.println("??????????????????:"+ids);
        int count = accountService.dels(ids);
        return count;
    }

    @RequestMapping("edit")
    @RolesAllowed("ROLE_SUPER")
    @ResponseBody
    public Integer edit(@RequestBody Account data) {
        return accountService.edit(data);
    }

    @RequestMapping("export")
    @ResponseBody
    public HashMap export(@RequestBody List<String> screenInfo,Integer putDataCount) {
        List<Account> datas = accountService.completeQuery(screenInfo,0,putDataCount);
        String url ="http://" + UtilFunc.getRealIP() + ":5000/OrderCurrentAccount?";

        for (int i=0; i<datas.size();i++){
            if (i==0){
                url=url+ "id="+String.valueOf(datas.get(i).getId());
            }else {
                url = url + "&id=" + String.valueOf(datas.get(i).getId());
            }
        }

        System.out.println("url ==========" +url);
        System.out.println("--------------------------");
        HashMap hash = new HashMap();
        hash.put("url",url);
        return hash;
    }

    @RequestMapping("printing")
    @ResponseBody
    public HashMap printing(@RequestBody List<String> infoPackage,String title,Integer putDataCount,Model model){
        List<String> colNames = new ArrayList<String>();
        List<String> screenInfo;
        infoPackage.remove(0);
        for(int i = 0;i < infoPackage.size();) {
            if("orderItems".equals(infoPackage.get(i)))break;
            colNames.add(infoPackage.get(i));
            infoPackage.remove(i);
        }
        screenInfo = infoPackage;
        List<Account> datas = accountService.completeQuery(screenInfo,0,putDataCount);

        HashMap hash = new HashMap();
        hash.put("title",title);
        hash.put("colNames",colNames);
        hash.put("datas",datas);

        return hash;
    }

    @RequestMapping("/getname")
    public String getname(HttpServletRequest request, HttpSession session) {
        SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        // ?????????
        String user = securityContextImpl.getAuthentication().getName();
        session.setAttribute("username", accountMapper.AccountFindByEmail(user).getName());

        System.out.println("username = "+ session.getAttribute("username"));

         return "redirect:/OrdersAndJournalCT/limitQuery";   //  ???????????????

        //  return  accountMapper.AccountFindByEmail(user);       ??????Account bean
    }







}
