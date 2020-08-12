<%--
  Created by IntelliJ IDEA.
  User: 26310
  Date: 2020/8/7
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="css/util.css" />
</head>
<body>
<div class="title">科尔智造信息科技有限公司ERP系统2.0</div>
<div class="loginBox">
    <div class="login-content">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="userInfo-box" id="username-box"><div class="icon iconfont">&#xe602;</div><input type="text" class="userInfo" name="username" id="username" value="888@qq.com"/></div>
            <div class="userInfo-box" id="password-box"><div class="icon iconfont">&#xe626;</div><input type="password" class="userInfo" name="password" id="password" value="123"/></div>
            <div class="verCode-box"><input type="text" class="verCode" name="verCode" /><a href="#" class="verCode-Img"></a></div>
            <div class="submit-box"><input type="submit" id="submit" value="登录" /></div>
        </form>

    </div>
</div>
</body>
</html>