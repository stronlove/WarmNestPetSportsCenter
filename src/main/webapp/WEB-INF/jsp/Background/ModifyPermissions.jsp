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
    
    <title>My JSP 'ModifyPermissions.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

#VaideoBackground {
	position: absolute;
	z-index: -2;
}
.menu_head{
	background-color: #F4A460;
	height:40px;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  </head>
  
  <body>
 <h1>您当前修改的角色：${rname }</h1>
<div id="firstpane" class="menu_list">
<form action="Modifypermissionsa" method="post">
<input type="hidden" name="roletableno" value="${roletableno }">
	<c:forEach items="${rlist}" var="d">
			<c:if test="${d.plevel=='' }">
			<h3 class="menu_head">
				<input type="checkbox" id="plevel${d.permissionstableno}"  name="permissionstableno"
				onclick="firstlevela('${d.permissionstableno}');" 
				<c:forEach items="${slist }" var="s">
					<c:if test="${s.pname==d.pname }">
						checked="checked"
					</c:if>
				</c:forEach>
				value="${d.permissionstableno}">${d.pname}
			</h3>
				<div style="display:none" class="menu_body">
					<c:forEach items="${rlist}" var="j">
						<c:if test="${d.permissionstableno==j.plevel}">
							&nbsp;&nbsp;&nbsp;
							<input type="checkbox" class="plevela${d.permissionstableno}" name="permissionstableno"
							onclick="twostagea('${d.permissionstableno}');"
							<c:forEach items="${slist }" var="b">
								<c:if test="${b.pname==j.pname }">
									checked="checked"
								</c:if>
							</c:forEach>
							value="${j.permissionstableno}">${j.pname}
						</c:if>
					</c:forEach>
				</div>
				</c:if>
	</c:forEach>
	<input type="submit" value="提交更改" class="btn btn-info">
	</form>
</div>
			<a href="RoleSelection" class="btn btn-info" style="position: absolute;left:500px;top:500px;">返回上一页</a>
	<script type="text/javascript">
	function firstlevela(a){
		if($("#plevel"+a).is(":checked")){
			$(".plevela"+a).prop("checked",true);
		}else{
			$(".plevela"+a).removeAttr("checked");
		}
	}
	function twostagea(a){
		for (var int = 0; int < 5; int++) {
			if($(".plevela"+a).is(":checked")){
				$("#plevel"+a).prop("checked","checked");
			}else{
				$("#plevel"+a).removeAttr("checked");
			}
		}
	}
	
	
	
		$(document).ready(
				function() {
					$("#firstpane .menu_body:eq(0)").show();
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
				});
	</script>
  </body>
</html>
