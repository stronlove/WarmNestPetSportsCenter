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

<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
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
/*登录功能div  */
#logindiv {
	position: absolute;
	left: 35%;
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
#PersonalInformationModificationDiv {
	position: absolute;
	left: 470px;
	top: 60px;
	width: 420px;
	height: 500px;
	border-radius: 30px;
	background-color:white;
	opactiy:0.8;
	z-index: 0;
}
.input-group{
	margin-bottom: 10px;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body style="height:560px;background-color: 99ccff;overflow-y:hidden;" onload="loadlogin('${x}');">
  <input type="hidden" id="q" value="${q }">
  <img src="img/240494-14112FR23058.jpg" style="width: 100%;height: 120%;">
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
            	<li class="active"><a href="HAAWAD">预约挂号</a></li>
            	<li><a href="listDelivery?userno=${petuser.userno }">查看订单</a></li>
            	<li><a href="RegisteredQuery?userno=${petuser.userno}">我的挂号</a></li>
        	</c:if>
        </ul>
        <ul class="nav navbar-nav navbar-right"> 
        	<c:if test="${petuser.uname == null }">
            	<li><a href="toadd"> 注册</a></li>
            	<li><a id="showlogindiv"> 登录</a></li>
        	</c:if> 
        	<c:if test="${petuser.uname != null }">
            	<li><a style="color: red;">欢迎登陆:${petuser.uname }</a></li>
            	<li><a href="userlogout">注销</a></li>
        	</c:if>
        </ul>
    </div>
    </div>
</nav>
<div id="mask"></div>
		<!--登录div -->
		<div id="logindiv">
		<!--关闭注册框  -->
		<div id="XDiv">X</div>
			<!--宠物医院名称div  -->
			<div
				style="position: absolute; top:20px; left:120px; font-size:40px; color:black;">
				登录</div>
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
						<a href="#">注册账号</a>
					</div>
				</div>
			</form>
		</div>
	
	
	<!--个人信息div  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	
	
	
	<div id="personalinformationmodificationdiv">
		<div style="position:absolute;left:20px;width:400px;height:500px;">
			<center>
				<h1>预约挂号</h1>
			</center>
			<form action="submittoRegistrationForm" method="post"
				onsubmit="return PersonalInformationModification('${petuser.ubalance}')">
				<div style="position:absolute;left:75px;top:100px;">
				<input type="hidden" name="userno" value="${petuser.userno }">
				<input type="hidden" name="stat" value="1">
				<!-- 登录的人的身份证号 -->
					<div class="input-group">
						<span class="input-group-addon">身份证：</span><input type="text"
							class="form-control" value="${petuser.uid}" name="uid" style="width:170px;" readonly />
					</div>
					<div class="input-group">
						<span class="input-group-addon">宠物：</span>
							<select class="form-control" name="rpets.petno" id="pet" style="width:170px;" >
									<option value="0">----</option>
								<c:forEach items="${petlist }" var="l">
									<option value="${l.petno }">${l.pname }</option>
								</c:forEach>
								<c:if test="${petlist=='[]' }">
									<option value="0">您还没有宠物</option>
								</c:if>
							</select>
					</div>
					<div class="input-group">
						<span class="input-group-addon">选择科室：</span>
							<select class="form-control" id="DepartmentTable" style="width:100px;">
								<c:forEach items="${DepartmentTablelist }" var="l">
									<c:if test="${l.dstate==1 }">
										<option value="${l.departmenttableno }">${l.dname }</option>
									</c:if>
								</c:forEach>
							</select>
					</div>
					<div class="input-group">
							<span class="input-group-addon">选择医生：</span>
							<select class="form-control" id="StaffTableoption" name="rstafftables.stafftableno" style="width:100px;" >
								<option value="0">----</option>
							</select>
					</div>
					<div class="input-group">
							<span class="input-group-addon" style="width:170px;" id="jiwei" name="rreservationnumber">当前排队在第--位</span>
					</div>
					<div class="input-group">
							<span class="input-group-addon" style="width:170px;">本次预约需要五元,请确保余额大于五元</span>
					</div>
					<div
						style="padding-top: 10px;padding-left: 70px;margin-top: 7px;opacity: 0.7;position: absolute; left:-20px;top:250px;">
						<input type="submit" value="预约"
							style="width: 150px;background: black;" class="btn btn-info" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function loadlogin(data){
			var q = $("#q").val();
			if(q=="0"){
				bootbox.alert("登录失败，账号密码有误！");
			}else{
				if(q=="1"){
					bootbox.alert("登录失败，该账户已被禁用!");
				}else{
					if(q=="2"){
						bootbox.alert("登录成功!!!");
					}else{
						if(q=="3"){
							bootbox.alert("挂号成功!!!请记住您的单号到医院进行排队："+data+"号");
						}else{
							if(q=="4"){
								bootbox.alert("该用户还有未处理的挂号单号,暂时不能挂号");
							}else{
								
							}
						}
					}
				}
			}
		}
		/*注册关闭悬浮时间  */
		$("#XDiv").hover(function() {
			$(this).css("color", "red");
		}, function() {
			$(this).css("color", "black");
		});
		/*a标签悬浮事件  */
		$("a").hover(function() {
			$(this).css("color", "orange");
		}, function() {
			$(this).css("color", "#777");
		});
		$("#showlogindiv").click(function(){
			$("#logindiv").slideToggle("slow");
			$("#mask").css("display", "block");
			$("#mask").css("width", "100%");
			$("#mask").css("height", "2000px");
		});
		/*关闭注册账号div  */
		$("#XDiv").click(function() {
			$("#User").val("");
			$("#password").val("");
			$("#logindiv").slideToggle("slow");
			$("#mask").css("display", "none");
		});
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
		$("#DepartmentTable").change(function(){
			$.ajax({
				url : "AjaxHAAWAD",
				type : "post",
				data : {
					 a : $("#DepartmentTable").val(),
				},
				success : function(data) {
					var da="";
						for(var i=0;i<data.length;i++){
							da += "<option value="+data[i].stafftableno+">"+data[i].srealname+"</option>";
						}
					$("#StaffTableoption").html("<option value='0'>---</option>"+da);
				},
			});
			$.ajax({
				url : "AjaxHAAWADTO",
				type : "post",
				data : {
					 a : $("#StaffTableoption").val(),
				},
				success : function(data) {
					$("#jiwei").html("当前排队在第"+data+"位");
				},
			});
		});
		$("#StaffTableoption").change(function(){
			$.ajax({
				url : "AjaxHAAWADTO",
				type : "post",
				data : {
					 a : $("#StaffTableoption").val(),
				},
				success : function(data) {
					$("#jiwei").html("当前排队在第"+data+"位");
				},
			});
		});
		function PersonalInformationModification(data){
			if(data<5){
				bootbox.alert("您的余额不够，请充值，您的余额："+data);
				return false;
			}else{
				if($("#pet").val() == 0){
					bootbox.alert("请选择宠物");
					return false;
				}else{
					if($("#uid").val() == ""){
						bootbox.alert("身份已过期，请重新登录");
						return false;
					}else{
						if($("#StaffTableoption").val() == 0){
							bootbox.alert("请选择医生");
							return false;
						}else{
							return true;
						}
					}
				}
			}
		}
</script>
</body>
</html>