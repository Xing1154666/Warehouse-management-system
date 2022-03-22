<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="description" content="入库表单">
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
			<a href="AddGoods.jsp">返回上一页</a>
                                      <b>请输入所要添加商品信息！</b></td>
                </tr>
		</table>
              <br>
	<table cellpadding="3" cellspacing="1" align="center" class="tableborder11" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" color="#9999FF">
			<font color="#ffffff"><b>新增商品</b></font></td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品名称】</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			<input maxLength="8" size="32" id="name" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>
		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品数量】</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
				<input maxLength="8" size="32" name="num" id="num" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>

		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品单价】</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
				<input maxLength="8" size="32" id="unitPrice" id="unitPrice" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>

		<tr>
			<td width="40%" class="tablebody1" align="center"><b>【商品类别】</b>：<br>
			</td>
			<td width="60%" class="tablebody1">
			<input maxLength="8" size="32" id="sort" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
			</td>
		</tr>

		<tr>
			<td class="tablebody2" valign="middle" colspan="2" align="center">
			<input type="button" value="入库" id="btn">&nbsp;&nbsp;&nbsp;<input type="reset" id="reset" value="清 除"></td>
		</tr>
	</table>
	</div>


	<script type="text/javascript">
		$(function (){
			$("#reset").click(function (){
				$("#name").val("")
				$("#num").val("")
				$("#unitPrice").val("")
				$("#sort").val("")
			})

			//添加库存
			$("#btn").click(function (){
				$.ajax({
					url: 'xyl/goods/insertGood',
					data: {
						"name":$("#name").val(),
						"num":$("#num").val(),
						"unitPrice":$("#unitPrice").val(),
						"sort":$("#sort").val()
					},
					type: "get",
					datatype: "json",
					success: function (data) {
						window.location.href="AddGoods.jsp"
					}
				})
			})
		})

	</script>
	</body>
</html>