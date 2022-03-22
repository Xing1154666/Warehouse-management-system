<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
			request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="description" content="仓库管理管理员注册">
		<title>仓库管理管理员注册页面</title>
		<LINK href="css/main.css" rel=stylesheet>
		<script language = "JavaScript" src = "js/main.js"></script>
		<script language = "JavaScript" src = "js/main.js"></script>
		<script type="text/javascript" src="js/jquery-1.11.1-min.js"></script>
	</head>
	<body onLoad="MM_preloadImages('images/index_on.gif','images/reg_on.gif','images/order_on.gif','../images/top/topxmas/jp_on.gif','../images/top/topxmas/download_on.gif','../images/top/topxmas/bbs_on.gif','../images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		      <table width="100" border="0" cellspacing="0" cellpadding="0" align="center">
		         </table>
		    </td>
		  </tr>
		</table>
		<table cellspacing="1" cellpadding="3" align="center" border="0" width="98%">
		</table>
<!--文件体开始-->
<table width="80%" cellspacing=1 cellpadding=3 align=center class=tableBorder4>
		<tr>
		<td height=25 valign=middle bgcolor="#E4F3FF" align="center">
                <a href="AFirstLog.jsp">返回首页</a>        
        </td><td height=25 valign=middle bgcolor="#E4F3FF" align="center">
                                     欢迎访问 <b>管理员信息页面</b>
        </td> </tr>
		</table>
		<br>
              
<form method="post" name="regAInf" action="xyl/admin/updateUser">

	<table   cellpadding="3" cellspacing="1" align="center" class="tableborder3" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" color="#9999FF">
			<font color="#ffffff"><b>管理员信息</b></font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>用户名</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			<input  size="32" name="userid"   id="userid" value="${sessionScope.admin.account}" style="font-family: Tahoma,Verdana,宋体;   font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>密码(至多15位)</b>：<br>
			<br>
			
			</td>
			<td width="60%" class="tablebody1">
			<input   size="32" name="password"  id="password" value="${sessionScope.admin.password}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		
		<tr>
			<td width="40%" class="tablebody1"><b>姓名</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			<input  size="32" name="name" id="name" value="${sessionScope.admin.name}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>性别</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			<input size="32" name="sex" id="sex" value="${sessionScope.admin.sex}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1"><b>年龄</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			<input  size="32" name="age"  id="age" value="${sessionScope.admin.age}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			<font color="#FF0000">*</font></td>
		</tr>
		<tr>
			<td class="tablebody1"><b>联系方式</b>：</td>
			<td class="tablebody1">
			<input type="text" size="32" maxlength="16" name="phone" id="phone" value="${sessionScope.admin.phone}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td class="tablebody1"><b>Email地址</b>：<br>
			请输入有效的邮件地址</td>
			<td class="tablebody1">
			<input maxLength="50" size="32" maxlength="32" name="email" id="email" value="${sessionScope.admin.address}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"></td>
		</tr>
		
		<tr>
			<td class="tablebody1"><b>联系地址</b>：</td>
			<td class="tablebody1">
			<input type="text" size="64" maxlength="32" name="address" id="address" value="${sessionScope.admin.email}" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		
		<tr>
			<td class="tablebody2" valign="middle" colspan="2" align="center">
			<input type="submit" value="修 改" onclick="javascript:checkAInfReg()">&nbsp;&nbsp;&nbsp;<input type="button" id="reset" value="清 除"></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$("#reset").click(function (){
		$("#userid").val("")
		$("#password").val("")
		$("#name").val("")
		$("#sex").val("")
		$("#age").val("")
		$("#phone").val("")
		$("#email").val("")
		$("#address").val("")
	})
</script>
	</body>
</html>