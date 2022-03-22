<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓库管理员登录</title>
<link rel="stylesheet" type="text/css" href="css/test3.css">
<script language = "JavaScript" src = "js/main.js"></script>
</head>

<body >
   <div class="di" >
   <form method="get" name="Alogin" action="xyl/admin/login">
   <table>
   <tr>
    <div class="d0">
      <p align="center">管理员登录</p></div>
      
   <div class="d1">
        <input name="in_be" placeholder="请输入管理员帐号" >
   </div>
    <div class="d2">
           <input name="pass" placeholder="请输入管理员密码">
    </div>
    
     <div class="d4"  >
        <button class="but" type="submit" onclick="javascript:checkMe()">登录</button>  
      
      </div>
      <div class="d5">
                  <span class="hui"></span>
                       <a href="Aregister.jsp">立即注册 </a>  
      </div>
     </table>
       </form>
   </div>
   
</body>
</html>