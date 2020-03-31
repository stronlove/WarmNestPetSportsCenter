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
    
    <title>My JSP 'InsertRegistrationForm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
#PersonalInformationModificationDiv {
	position: absolute;
	left: 300px;
	top: 40px;
	width: 420px;
	height: 500px;
	border-radius: 30px;
	background-color:white;
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
  <body onload="loadlogin('${x}');">
  <input type="hidden" value="${q }" id="q">
	<div id="personalinformationmodificationdiv">
		<div style="position:absolute;left:20px;width:400px;height:500px;">
			<center>
				<h1>挂号</h1>
			</center>
			<form action="submittoRegistrationForm" method="post"
				onsubmit="return PersonalInformationModification()">
				<div style="position:absolute;left:75px;top:100px;">
				<!-- 登录的人的身份证号 -->
					<input type="hidden" name="stat" value="2">
					<input type="hidden" name="userno" id="usernoaaa">
					<div class="input-group">
						<span class="input-group-addon">用户手机号：</span><input type="text"
							class="form-control"  id="utelephone" style="width:170px;"/>
					</div>
					<div class="input-group">
						<span class="input-group-addon">宠物：</span>
							<select class="form-control" name="rpets.petno" id="pet" style="width:170px;">
									<option value="0">----</option>
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
					<div
						style="padding-top: 10px;padding-left: 70px;margin-top: 7px;opacity: 0.7;position: absolute; left:-20px;top:250px;">
						<input type="submit" value="挂号" 
							style="width: 150px;background: black;" class="btn btn-info" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<button class="btn btn-info" style="width:100px;height: 70px;position: absolute;left:450px;top:500px;" onclick="xxx()">打印挂号单</button>
	<script type="text/javascript">
	function xxx(){
		window.location.href="registered";
	}
	function loadlogin(data){
		var q = $("#q").val();
		if(q=="3"){
			bootbox.alert("挂号成功!!!请拿住您的单号："+data+"号");
		}else{
			if(q=="4"){
				bootbox.alert("该用户还有未处理的挂号单号,暂时不能挂号");
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
	$("#utelephone").blur(function(){
		$.ajax({
			url : "utelephoneselectajax",
			type : "post",
			data : {
				 a : $("#utelephone").val(),
			},
			success : function(data) {
				var da="";
				if(data.length<1){
					bootbox.alert("未找到该账户的宠物信息，请注册之后再进行挂号");
				}else{
					for(var i=0;i<data.length;i++){
						da += "<option value="+data[i].petno+">"+data[i].pname+"</option>";
					}
					$("#usernoaaa").val(data[0].pusers.userno);
				}
				$("#pet").html("<option value='0'>---</option>"+da);
			},
		});
	});
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
	function PersonalInformationModification(){
		if($("#StaffTableoption").val() == 0){
			bootbox.alert("请选择医生");
			return false;
		}else{
			return true;
		}
	}
</script>
  </body>
</html>
