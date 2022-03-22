<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
			request.getServerPort() + request.getContextPath() + "/";
%>
<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="description" content="出库表单">
		<title>入库表单</title>
		<LINK href="css/main.css" rel=stylesheet>
		<link rel="stylesheet" type="text/css" href="css/test3.css">
		<script language = "JavaScript" src = "js/main.js"></script>
		<script type="text/javascript" src="js/jquery-1.11.1-min.js"></script>
	</head>
	<body onLoad="MM_preloadImages('images/index_on.gif','images/reg_on.gif','images/order_on.gif','../images/top/topxmas/jp_on.gif','../images/top/topxmas/download_on.gif','../images/top/topxmas/bbs_on.gif','../images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
		<div class="">
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
<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle bgcolor="#E4F3FF" align="center">
			<a href="OutGoods.jsp">返回上一页</a>
                                      <b>请输入出库商品数量！</b></td>
                </tr>
		</table>
              <br>

	<table cellpadding="3" cellspacing="1" align="center" class="tableborder11" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" color="#9999FF">
			<font color="#ffffff"><b>待出库信息表</b></font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center" ><b>【商品名称】</b>：<br>
			</td>
			<td width="60%" class="tablebody1" align="center" id="td1">
			</td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品数量】</b>：<br>
			</td>
			<td width="60%" class="tablebody1" align="center" id="td5">
			</td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品单价】</b>：<br>
			</td>
			<td width="60%" class="tablebody1" align="center" id="td2">
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品总价】</b>：<br>
			</td>
			<td width="60%" class="tablebody1" align="center" id="td3">
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品类别】</b>：<br>
			</td>
			<td width="60%" class="tablebody1" align="center" id="td4">
			</td>
		</tr>

		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【出库数量】</b>：<br>
			</td>
			<td width="60%" class="tablebody1" align="center">
			<input maxLength="8" size="32" id="Innum" style="font-family: Tahoma,Verdana,宋体;  font-size: 12px; width:50%; line-height: 15px; color: #000000">
			</td>
		</tr>
        <tr>
			<td class="tablebody2" valign="middle" colspan="2" align="center">
			<input type="button" value="出库" id="btn">&nbsp;&nbsp;&nbsp;
				<input type="reset" id="reset" value="清 除"></td>
		</tr>
	</table>
	</div>

	<script type="text/javascript">

		$(function (){
			selectGoodsById()
			function selectGoodsById(){
						$("#td1").html("<%=request.getParameter("name")%>")
						$("#td2").html("<%=request.getParameter("unitPrice")%>")
						$("#td3").html("<%=request.getParameter("price")%>")
						$("#td4").html("<%=request.getParameter("sort")%>")
						$("#td5").html("<%=request.getParameter("num")%>")
			}

			$("#reset").click(function (){
				$("#Innum").val("")
			})
			//根据商品名称出库
			$("#btn").click(function (){
				$.ajax({
					url: 'xyl/goods/OutGoods',
					data: {
						"name":"<%=request.getParameter("name")%>",
						"num":$("#Innum").val(),
						"unitPrice":"<%=request.getParameter("unitPrice")%>",
						"sort":"<%=request.getParameter("sort")%>"
					},
					type: "get",
					datatype: "json",
					success: function (data) {
						window.location.href="OutGoods.jsp"
					}
				})
			})

		})
	</script>

	</body>
</html>