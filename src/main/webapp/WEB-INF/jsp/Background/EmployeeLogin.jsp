<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="img/timg1_.jpg" />
<base href="<%=basePath%>">
<title>暖暖巢员工登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<style type="text/css">
.input-group {
	margin-bottom: 20px;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<body style="overflow: hidden;" onload="LoginFailureload()">
	<input type="hidden" id="LoginFailuree" value="${LoginFailure}">
	<div
		style="width:100%;height:769px;opacity: 0.4;position:absolute;z-index:-1;background: #777"></div>
	<img alt="" src="img/013b4756ca68cf6ac7252ce6b178f1.jpg@1280w_1l_2o_100sh.jpg"
		style="width:100%;height:100%;z-index:-2;position: absolute;" />

	<form action="employeeloginverification" method="post"
		onsubmit="return ValidateLogon();">
		<div
			style="width:300px;height:240px;position: absolute;left:38%;top:200px;
	border-radius: 25px;background: white;opacity: 0.8;">
			<center style="font-size:30px;">暖暖巢员工登录</center>
			<div
				style="width:300px;height:190px;position: absolute;top:70px;left:20px;">
				<!--登录员工用户名-->
				<div class="input-group" ">
					<span class="input-group-addon">用户名：</span><input type="text"
						class="form-control" id="sname" 
						name="sname" style="width:170px;"
						placeholder="请输入用户名" value="" />
				</div>
				<!--登录员工密码-->
				<div class="input-group" ">
					<span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;密码：</span><input
						type="password" class="form-control" id="spassword"
						name="spassword" style="width:170px;"
						placeholder="请输入密码" value="" />
				</div>
				<!--登录按钮  -->
				<div
					style="padding-top: 10px;padding-left: 80px;margin-top: 7px;">
					<input type="submit" value="登录" style="width: 100px"
						class="btn btn-info" />
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		function LoginFailureload() {
			$("#sname").val("");
			$("#spassword").val("");
			if ($("#LoginFailuree").val() == "0") {
				bootbox.alert("登陆失败");
			} else {
				if ($("#LoginFailuree").val() == "1") {
					bootbox.alert("用户已被禁用，请联系工作人员");
				} else {
				}
			}
		}
		function ValidateLogon() {
			var AccountVerification = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){3,9}$/;
			var PasswordVerification = /^([a-zA-Z0-9]|[._]){6,10}$/;
			if ($("#sname").val() == ""
					|| $("#sname").val() == null
					|| $("#spassword").val() == ""
					|| $("#spassword").val() == null) {
				bootbox.alert("请输入账号密码");
				return false;
			} else {
				if (!AccountVerification.test($("#sname").val())
						|| !PasswordVerification.test($(
								"#spassword").val())) {
					bootbox.alert("账号名密码格式不正确");
					return false;
				} else {
					return true;
				}
			}
		}
	</script>
</body>
</html>
