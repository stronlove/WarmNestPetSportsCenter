<%@ page language="java" import="com.aaa.common.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'OpenListCommodity.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.input-group{
		margin-bottom: 20px;
	}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  </head>
  <body><!-- 表格 -->
	<div style="position:absolute;left:100px;top:50px;">
	<div class="input-group">
		<span class="input-group-addon">症状：</span>
		<textarea style="width:420px;" class="form-control" rows="4" readonly>${ols123.osymptom }</textarea>
	</div>
	<div class="input-group">
			<span class="input-group-addon">诊疗：</span>
		<textarea style="width:420px;" class="form-control" rows="4" readonly>${ols123.diagnosisandtreatment }</textarea>
	</div>
	<div class="input-group">
		<span class="input-group-addon">医嘱：</span>
		<textarea style="width:420px;" class="form-control" rows="4" readonly>${ols123.ooctorsorder }</textarea>
	</div>
	</div>
<!-- 表格 -->
	<table class="table table-striped"
		style="position:absolute;top:350px;color: black;">
		<thead>
			<tr>
				<th>商品图片</th>
				<th>商品价格</th>
				<th>介绍功能</th>
				<th>库存</th>
				<th>数量</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${clist!=null }">
			<c:forEach items="${clist }" var="l">
				<tr>
					<th><img style="width: 50px;height: 50px;" src="<%=Constants.IMG_SERVER %>${l.tcommoditys.cpicture }"></th>
					<th>${l.tcommoditys.cprice }</th>
					<th>${l.tcommoditys.cfunction }</th>
					<th>${l.tcommoditys.cinventory }</th>
					<th>${l.tnumber }</th>
					<c:if test="${l.tstate==0 }">
						<th>取药中</th>
					</c:if>
					<c:if test="${l.tstate==1 }">
						<th>取药结束</th>
					</c:if>
				</tr>
			</c:forEach>
			</c:if>
		<c:if test="${clist=='[]' }">
			<tr>
			<th colspan="6"><h1>您暂时没有要取的药，请查询医疗服务</h1></th>
			</tr>
		</c:if>
		</tbody>
	</table>

	<c:if test="${clist[0].tstate==0 }">
		<button style="position: absolute;left: 700px;top: 80px;width: 150px;" class="btn btn-info" onclick="Getthemedicine('${clist[0].topenlists.openlistno}')">确认取药</button>
	</c:if>
	<c:if test="${clist[0].tstate==1 }">
		<button style="position: absolute;left: 700px;top: 80px;width: 150px;background: black;" class="btn btn-info">已取</button>
	</c:if>
	<button style="position: absolute;left: 700px;top: 180px;width: 150px;" class="btn btn-info" onclick="returnup('${clist[0].topenlists.openlistno}')">返回上一页</button>
	<script type="text/javascript">
		function Getthemedicine(openlistno){
			window.location.href="Getthemedicineaaaa?openlistno="+openlistno;
		}
		 
		function returnup(openlistno){
			window.location.href="Getthemedicinee";
		}
	</script>
  </body>
</html>
