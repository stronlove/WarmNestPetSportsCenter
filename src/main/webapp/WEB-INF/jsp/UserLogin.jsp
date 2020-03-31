<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="shortcut icon" type="image/x-icon" href="img/timg1_.jpg" />
<base href="<%=basePath%>">
<title>暖暖巢宠物康体中心</title>
    
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
<style type="text/css">
#logindiv {
	position: absolute;
	left: 500px;
	top: 150px;
	width: 350px;
	height: 300px;
	background: white;
	border-radius: 25px;
	height: 350px;
	opacity: 0.8;
	z-index:10;
}
</style>
  </head>
  
  <body onload="aa()">
  <input type="hidden" value="${ceshiq}" id="ceshiq">
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="list">暖暖巢宠物康体中心</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="list">首页</a></li>
            <li><a href="commodity">服务项目</a></li>
        	<c:if test="${petuser.uname != null }">
            	<li><a href="personal">个人中心</a></li>
            	<li><a href="HAAWAD">预约挂号</a></li>
            	<li><a href="listDelivery?userno=${petuser.userno }">查看订单</a></li>
            	<li><a href="RegisteredQuery?userno=${petuser.userno}">我的挂号</a></li>
        	</c:if>
        </ul>
        <ul class="nav navbar-nav navbar-right"> 
        	<c:if test="${petuser.uname == null }">
            	<li><a href="toadd"> 注册</a></li>
            	<li class="active"><a href="UserLogin"> 登录</a></li>
        	</c:if> 
        	<c:if test="${petuser.uname != null }">
            	<li><a style="color: red;">欢迎登陆:${petuser.uname }</a></li>
            	<li><a href="userlogout">注销</a></li>
        	</c:if>
        </ul>
    </div>
    </div>
</nav>
  	<img src="img/t01a5b33d31d77cef51.jpg" style="width: 100%;height: 100%;">
  	
		<!--登录div -->
		<div id="logindiv">
		<!--关闭注册框  -->
			<!--宠物医院名称div  -->
			<div
				style="position: absolute; top:20px; left:90px; font-size:40px; color:black;">
				用户登录</div>
			<!--form表单 用于登录 -->
			<form action="loginUser" method="post"
				onsubmit=" return LoginFormValidation();">
				<div style="position:absolute;top:100px;left: 50px">
					<!--登录用户名  -->
					<div class="input-group" style="">
						<span class="input-group-addon">用户名：</span><input type="text"
							class="form-control" id="User" name="uname"
							style="width:150px;" placeholder="请输入用户名" value=""/>
					</div>
					<!-- 登录密码 -->
					<div class="input-group" style="margin-top: 7px;">
						<span class="input-group-addon">&nbsp;&nbsp;&nbsp;密码：</span><input
							type="password" id="password" name="upassword"
							class="form-control" style="width:150px" placeholder="请输入密码" value=""/>
					</div>
					<!--登录按钮  -->
					<div
						style="padding-top: 10px;padding-left: 70px;margin-top: 7px;opacity: 0.7;">
						<input type="submit" value="登录" style="width: 100px"
							class="btn btn-info" />
					</div>
					<!--账号注册 忘记密码  -->
					<div style="position: absolute; top:170px;width:500px">
						还没有账号？请点击<a id="toaddZC">注册</a>账号
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
function aa(){
	var q = $("#ceshiq").val();
	if(q=="0"){
		bootbox.alert("登录失败，账号密码有误！");
	}else{
		if(q=="1"){
			bootbox.alert("登录失败，该账户已被禁用!");
		}else{
			
		}
	}
}
		/*登录表单验证事件  */
		function LoginFormValidation() {
			var AccountVerification = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){5,9}$/;
			var PasswordVerification = /^([a-zA-Z0-9]|[._]){6,10}$/;
			if ($("#User").val() == "" || $("#User").val() == null
					|| $("#password").val() == ""
					|| $("#password").val() == null) {
				bootbox.alert("请输入账号密码");
				return false;
			} else {
				if (!AccountVerification.test($("#User").val())
						|| !PasswordVerification.test($("#password").val())) {
					bootbox.alert("账号名密码格式不正确");
					return false;
				} else {
					return true;
				}
			}
		}
		$("#toaddZC").click(function(){
			  bootbox.confirm(
		                {
		                    message: "即将跳入注册页面",
		                    buttons: {
		                    	 confirm: {
			                            label: '确认'
			                        },
		                        cancel: {
		                            label: '取消'
		                        }
		                       
		                    },
		                    callback: function (result) {
		                        if (result) {
		                        	window.location.href="toadd";
		                           
		                        } 
		                    }
		                });
		});
		</script>
  </body>
</html>
