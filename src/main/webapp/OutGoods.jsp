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
		<meta name="description" content="仓库信息表">
		<title>入库信息表</title>
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
          <br>
           <br>
<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr> 
		    <td height=25 valign=middle bgcolor="#E4F3FF" align="center">
			<td height=25 valign=middle bgcolor="#E4F3FF" align="center">
				<label for="edit-endTime" class="col-sm-2 control-label">商品名称</label>
				<input type="text" class="form-control " id="name" >
				<input type="button" class="form-control" id="btn"  value="点击查询" readonly>
			</td>
            </td>
		    <td height=25 valign=middle bgcolor="#E4F3FF" align="center">
				<a href="AFirstLog.jsp"  >返回首页</a>
               <b >商品信息库存如下，请选择出库商品点击出库！</b>
            </td>
         </tr>
		</table>
              <br>
  	<table cellpadding="3" cellspacing="1" align="center" class="tableborder3" id="table1">
		<tr>
			<td valign="middle" colspan="2" align="center" height="25" color="#9999FF">
			<font><b></b></font></td>
		</tr>
		<tr>

			</td><td width="10%" class="tablebody1" align="center"><b>商品名称</b>
		</td><td width="10%" class="tablebody1" align="center"><b>商品数量 </b>
		</td><td width="10%" class="tablebody1" align="center"><b>商品单价 </b>
		</td><td width="10%" class="tablebody1" align="center"><b>商品类别</b>
		</td><td width="10%" class="tablebody1" align="center"><b>商品总价</b>
		</td>
			</td><td width="10%" class="tablebody1" align="center"><b>出库</b>
			</td>
		</tr>

		<tbody id="outGoods">

		</tbody>
			</table>

	</div>

		<script type="text/javascript">
			//$(function (){
			//window.location.href="xyl/goods/selectGoods"
			//})

			$("#btn").click(function (){
				$("#outGoods").empty()
				a()
			})
			a()
			function  a(){
				$.ajax({
					url: 'xyl/goods/selectGoods',
					data: {
						"name":$("#name").val(),
					},
					type: "get",
					datatype: "json",
					success: function (data) {
						$.each(data.data.goods,function (i,n){
							var html = ""
							html+='<tr>';
							html+='<th width="10%" class="tablebody1" align="center" id='+n.name+'>'+n.name+'</th>';
							html+='<th width="10%" class="tablebody1" align="center">'+n.num+'</th>';
							html+='<th width="10%" class="tablebody1" align="center">'+n.unitPrice+'</th>';
							html+='<th width="10%" class="tablebody1" align="center">'+n.sort+'</th>';
							html+='<th width="10%" class="tablebody1" align="center">'+n.price+'</th>';
							html+='<th width="10%" class="tablebody1" align="center"><a  style="color: red" href="OutOldStock.jsp?name='+n.name+"&num="+n.num+"&unitPrice="+n.unitPrice+"&sort="+n.sort+"&price="+n.price+'">出库</a> </th>'
							html+='</tr>';
							$("#outGoods").append(html);
						})

					}
				})
			}

		</script>
	</body>
</html>