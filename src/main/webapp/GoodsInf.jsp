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
		<meta name="description" content="仓库信息表">
		<title>库存信息表</title>
		<LINK href="css/main.css" rel=stylesheet>
		<link rel="stylesheet" type="text/css" href="css/test3.css">
		<script type="text/javascript" src="js/jquery-1.11.1-min.js"></script>
		<script language = "JavaScript" src = "js/main.js"></script>


		<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
		<link rel="stylesheet" type="text/css" href="jquery/bs_pagination/jquery.bs_pagination.min.css">
		<script type="text/javascript" src="jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
		<script type="text/javascript" src="jquery/bs_pagination/en.js"></script>
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
				<label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
					<input type="text" class="form-control time" id="update-startDate" readonly>

				<label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
					<input type="text" class="form-control time" id="update-endDate" readonly>
				<label for="edit-endTime" class="col-sm-2 control-label">商品名称</label>
				<input type="text" class="form-control " id="name" >
				<input type="button" class="form-control" id="btn"  value="点击查询" readonly>
            </td>
		    <td height=25 valign=middle bgcolor="#E4F3FF" align="center">
				<a href="AFirstLog.jsp">返回首页</a>
                   <b>商品信息库存如下！</b>
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
		</tr>

		<tbody id="goodsBody">


		</tbody>
			</table>
	</div>

	<script type="text/javascript">

		$(function (){
			//时间控件
			$(".time").datetimepicker({
				minView: "month",
				language:  'zh-CN',
				format: 'yyyy-mm-dd',
				autoclose: true,
				todayBtn: true,
				pickerPosition: "bottom-left"
			});
			$("#btn").click(function (){
				$("#goodsBody").empty()
				a()
			})
			a()
			function a (){
				$.ajax({
					url: 'xyl/goods/selectGoods',
					data: {
						"inGoodsTime":$("#update-startDate").val(),
						"outGoodsTime":$("#update-endDate").val(),
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
							html+='</tr>';
							$("#goodsBody").append(html);
							if (n.num<20){
								$("#"+n.name).html("<p style='color: red'>"+n.name+"</p>")
							}
						})


					}
				})
			}
		})


		//$(function (){
			//window.location.href="xyl/goods/selectGoods"
		//})


	</script>
	</body>
</html>