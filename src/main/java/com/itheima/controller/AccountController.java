package com.itheima.controller;

import com.itheima.mapper.AccountMapper;
import com.itheima.mapper.RoleMapper;
import com.itheima.model.Account;
import com.itheima.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AccountController {
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private RoleMapper roleMapper;

    /**
     * 添加用户
     * @param model
     * @param request
     * @param account
     * @return
     */
    @RequestMapping("/AccountAdd")
    public String AccountAdd(Model model, HttpServletRequest request, Account account) {

        //判断账户是否被注册
        if (account.getName()!=null && account.getUser()!=null &&account.getPassword()!=null&& account.getRole()!=null &&account.getName().equals("")
                && !account.getUser().equals("") &&!account.getPassword().equals("") && !account.getRole().equals("")){
            if (accountMapper.AccountFindByEmail(account.getUser())==null){
                String password = account.getPassword();
                account.setPassword(bCryptPasswordEncoder.encode(password));
                accountMapper.AccountAdd(account);
                return "redirect:/AccountController/Succeed";
            }else {
                return "redirect:/AccountController/Failure";
            }
        }else {
            return "redirect:/AccountController/Failure";
        }

    }

    /**
     * 更新密码，口令
     * @param model
     * @param request
     * @param account
     * @return
     */
    @RequestMapping("/AccountUpdate")
    public String AccountUpdate(Model model, HttpServletRequest request, Account account) {

        SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        // 登录名
        String user = securityContextImpl.getAuthentication().getName();
        //   判断bean 中用户是否等于已经登录账户
        if (account.getUser().equals(user)){
            String password = account.getPassword();
            account.setPassword(bCryptPasswordEncoder.encode(password));
            accountMapper.AccountAdd(account);
            return "accounts/Succeed";
        }else {
            model.addAttribute("information", "更新失败");
            return "accounts/Failure";
        }
    }


    @RequestMapping("/ForgetPassword")
    public String ForgetPassword(Model model, HttpServletRequest request, Account account) {

        //  需要user 验证码
        //  database 查询
        Account account1 = accountMapper.AccountFindByEmail(account.getUser());
        if (account1.getRole().equals(account.getRole())){
            accountMapper.AccountUpdate(account);
        }
        return  null;
    }



   //  *****************************************************************************************************


    /**
     * 添加角色
     * @param role  需要belong account， 和角色， 必须不为空，
     * @return
     */
    @RequestMapping("/AccountAddRole")
    @RolesAllowed("ROLE_ROOT")
    public String AccountAddRole(Role role) {
        roleMapper.RoseAdd(role);
        return null;
    }


    /**
     * 删除用户角色
     * @param role
     * @return
     */
    @RequestMapping("/AccountDeleteRole")
    @RolesAllowed("ROLE_ROOT")
    public String AccountDeleteRole(Role role) {
        roleMapper.RoleDelete(role);
        return null;
    }



}
