<%--
  Created by IntelliJ IDEA.
  User: 26310
  Date: 2020/8/23
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <style>
        .cont{
            display: block;
            margin: 0 auto;
            text-align: center;
        }
        a{
            text-decoration: none;
            color:#007bff;
        }
    </style>
</head>
<body>
<center><h2>404</h2></center>
<span class="cont">
			未找到或无法打开该资源。
    <br/><span id="timer">3</span>秒后自动<a href="javascript:history.go(-1);">返回</a></span>
</span>
</body>
<script charset="utf-8">
    var i = 3;
    intervalid = setInterval("fun()", 1000);
    function fun(){
        i--;
        if(i==0){
            history.go(-1);
            clearInterval(intervalid);
            return;
        }
        document.getElementById("timer").innerText = i;
    }
</script>
</html>
