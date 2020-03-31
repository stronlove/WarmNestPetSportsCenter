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
    
    <title>My JSP 'RoleSelection.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	
/*遮罩层  */
#mask {
	background: silver;
	display: none;
	z-index: 1;
	opacity: 0.4 !important;
	position: absolute;
	left: 0px;
	top: 0px;
}
/*关闭框  */
#XDiv {
	font-size: 40px;
	font-weight: 800;
	position: absolute;
	left: 300px;
	cursor: pointer;
}
#logindiv {
	position: absolute;
	left: 300px;
	top: 100px;
	width: 350px;
	height: 300px;
	background: white;
	border-radius: 25px;
	height: 350px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
</style>
  </head>
  
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

  <body onload="loadr('${q}')">
  <button style="position: absolute;left:450px;" onclick="addjuese()" 
  class="btn btn-info">添加角色</button>
  	<table style="position: absolute;top:100px;" class="table table-striped">
  		<tr>
  			<th>角色id</th>
  			<th>角色名称</th>
  			<th>操作</th>
  		</tr>
  		<c:forEach items="${rlist }" var="l">
  			<tr>
  				<th>${l.roletableno }</th>
  				<th>${l.rname }</th>
  				<th><button class="btn btn-info" onclick="buttonclick('${l.roletableno}','${l.rname }')">修改</button></th>
  			</tr>
  		</c:forEach>
  	</table>
  	
<div id="mask"></div>
		<!--登录div -->
		<div id="logindiv">
		<!--关闭注册框  -->
		<div id="XDiv">X</div>
			<!--宠物医院名称div  -->
			<div
				style="position: absolute; top:20px; left:90px; font-size:40px; color:black;">
				创建角色</div>
			<!--form表单 用于登录 -->
			<form action="AddRoleTable" method="post"
				onsubmit="return buttsitem();">
				<div style="position:absolute;top:100px;left: 50px">
					<div class="input-group" style="">
						<span class="input-group-addon">角色名称：</span><input type="text"
							class="form-control" id="rname" name="rname"
							style="width:150px;" placeholder="请输入用户名" value=""/>
					</div>
					<div
						style="padding-top: 10px;padding-left: 70px;margin-top: 7px;opacity: 0.7;">
						<input type="submit" value="创建" style="width: 100px"
							class="btn btn-info" />
					</div>
				</div>
			</form>
		</div>
  	<script type="text/javascript">
  		function buttonclick(roletableno,rname){
  			window.location.href="UpdateRoletableno?roletableno="+roletableno+"&rname="+rname;
  		}
  		function addjuese(){
  			$("#logindiv").slideToggle("slow");
  			$("#mask").css("display", "block");
  			$("#mask").css("width", "100%");
  			$("#mask").css("height", "100%");
  		}
  		function buttsitem(){
  			if($("#rname").val()==""){
  				bootbox.alert("角色名称不能为空！");
  				return false;
  			}else{
  				return true;
  			}
  		}
  		/*注册关闭悬浮时间  */
  		$("#XDiv").hover(function() {
  			$(this).css("color", "red");
  		}, function() {
  			$(this).css("color", "black");
  		});
  		/*关闭注册账号div  */
  		$("#XDiv").click(function() {
  			$("#rname").val("");
  			$("#logindiv").slideToggle("slow");
  			$("#mask").css("display", "none");
  		});
  		function loadr(q){
  			if(q==1){
  				bootbox.alert("添加成功!");
  			}else{
  				if(q==2){
  					bootbox.alert("修改权限成功!");
  				}else{
  					
  				}
  			}
  		}
  	</script>
  </body>
</html>
