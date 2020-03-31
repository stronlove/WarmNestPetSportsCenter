<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddProduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet"></link>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootbox.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  </head>
  <style>
  	.input-group{
	margin-bottom: 15px;
}
  </style>
  <body onload="load('${q}')">
		<div style="position:absolute;left:320px;width:400px;height:500px;">
			<center>
				<h1>添加商品</h1>
			</center>
			<form action="AddProducta" method="post" enctype="multipart/form-data">
				<div style="position:absolute;left:100px;top:100px;">
					<input type="hidden" name="commodityno"/>  
					<!-- 图片 -->
					<div class="input-group">
						<span class="input-group-addon">上传图片：</span>
						<input type="file" class="form-control" name="merstorephots2" style="width:170px;"/>
 					</div>
					<div class="input-group">
						<span class="input-group-addon">商品价格：</span>
						<input type="text" class="form-control" name="cprice" style="width:170px;"/>
					</div>
					<div class="input-group">
						<span class="input-group-addon">介绍功能：</span>
						<input type="text"class="form-control" name="cfunction" style="width:170px;"/>
					</div>
					<div class="input-group">
							<span class="input-group-addon">操作员工：</span>
							<input type="hidden"class="form-control" name="cimporter.stafftableno" value="${petusers.stafftableno}" id="utelephone" style="width:170px;"/>
							<input type="text"class="form-control"  value="${petusers.sname}" style="width:170px;" readonly/>
					</div>
					<div class="input-group">
						<span class="input-group-addon">选择商品类型：</span>
							<select class="form-control" name="ccommodittypetables.commodittypetableno"id="listAll" style="width:120px;">
								<c:forEach items="${sel}" var="l" >
										<option value="${l.commodittypetableno }">${l.cname}</option>
								</c:forEach>
							</select>
					</div>
					<div 
						style="padding-top: 35px;padding-left: 70px;margin-top: 7px;opacity: 0.7;position: absolute; left:-20px;top:250px;">
						<input type="submit" value="添加" 
							style="width: 150px;background: black;" class="btn btn-info" />
					</div>
				</div>
			</form>
		</div>
  </body>
  <script type="text/javascript">
  	function load(q){
  		if(q=="1"){
  			bootbox.alert("添加成功");
  		}
  	}
  </script>
</html>
