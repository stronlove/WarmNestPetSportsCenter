<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel="shortcut icon" type="image/x-icon" href="img/asdzxcqwe.jpg" />
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

</head>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

#VaideoBackground {
	position: absolute;
	z-index: -2;
}

.menu_list {
	width: 235px;
	margin: 0 auto;
	position: absolute;
	left: -2px;
}

.menu_head {
	height: 47px;
	line-height: 47px;
	padding-left: 38px;
	font-size: 14px;
	color: #525252;
	cursor: pointer;
	border-left: 1px solid #e1e1e1;
	border-right: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	border-top: 1px solid #F1F1F1;
	position: relative;
	margin: 0px;
	font-weight: bold;
	background: #f1f1f1;
}

.menu_body {
	line-height: 38px;
	border-left: 1px solid #e1e1e1;
	backguound: #fff;
	border-right: 1px solid #e1e1e1;
}

.menu_body a {
	display: block;
	height: 38px;
	line-height: 38px;
	padding-left: 38px;
	color: #777777;
	background: #fff;
	text-decoration: none;
	border-bottom: 1px solid #e1e1e1;
}

.menu_body a:hover {
	text-decoration: none;
	color: red;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<body style="overflow: hidden;" onload="loadss();">
<input type="hidden" id="LoginFailure" value="${LoginFailure }">
	<div style="position: absolute;left:1000px;top:15px;z-index:3;color:white;">
		<span>欢迎登录：${petusers.sname}(${petusers.sroleas.rname })</span>
	</div>
	<a
		style="font-size:15px;position:absolute;left:1250px;top:15px;z-index:3;color:red;"
		href="acancellation">注销</a>
	<!--遮罩层  -->
	<div
		style="width:100%;height:769px;opacity: 0.4;position:absolute;z-index:-1;background: white;"></div>
	<div style="width:100%;height:100%;position: absolute;">
		<img alt="" src="img/t01c9dff7e40a092011.jpg"
			style="width:100%;height:100%;z-index:-2;position: absolute;" />

		<!--左侧导航栏  -->
		<div style="height:600px;width:235px;position: absolute;top:60px;">
			<div id="firstpane" class="menu_list">
				<c:forEach items="${Department}" var="d">
					<c:if test="${d.plevel=='' }">
						<h3 class="menu_head">${d.pname}</h3>
						<div style="display:none" class="menu_body">
							<c:forEach items="${Department}" var="j">
								<c:if test="${d.permissionstableno==j.plevel}">
									<c:choose>
										<c:when test="${j.purl=='FinancialStatistics'}">
											<a href="${j.purl}?month=0" target="homepage">${j.pname}</a>
										</c:when>
										<c:otherwise>
										<a href="${j.purl}" target="homepage">${j.pname}</a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<c:if test="${Department=='[]'}">
			<div style="font-size:30px;position: absolute;top:100px;left:20px;">
				您暂时没有权限</br>请让人事部员工</br>给您添加权限
			</div>
		</c:if>
		<!--顶部导航栏  -->
		<div style="opacity: 0.6;width:100%;height:61px;background: #000000;">
			<div
				style="height:60px;position:absolute;border-left:1px solid black;left:500px;font-size: 40px;color:white;">&nbsp;&nbsp;暖暖巢宠物康体中心</div>
		</div>
		<iframe
			style="width:1132px;height:600px;position: absolute;left:233px;top:61px;opacity: 0.8;"
			name="homepage" src="/LoginInitializationPage"></iframe>
	</div>
	<script>
		$(document).ready(
				function() {
					$("#firstpane h3.menu_head").click(
							function() {
								$(this).addClass("current").next(
										"div.menu_body").slideToggle(300)
										.siblings("div.menu_body").slideUp(
												"slow");
								$(this).siblings().removeClass("current");
							});
					$("#secondpane .menu_body:eq(0)").show();
					$("#secondpane h3.menu_head").mouseover(
							function() {
								$(this).addClass("current").next(
										"div.menu_body").slideDown(500)
										.siblings("div.menu_body").slideUp(
												"slow");
								$(this).siblings().removeClass("current");
							});
					if($("#LoginFailure").val() == "2"){
						bootbox.alert("登录成功！！！");
					}
				});
	</script>
</body>
</html>
