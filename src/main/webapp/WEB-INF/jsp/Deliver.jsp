<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
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
#page{
	position: absolute;
	top:500px;
	left:550px;
	width: 320px;
	float: left;
	color: white;
	height: 430px;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body style="height:100px;background-color: 99ccff;overflow: hidden;" onload="loadlogin();">
  
  <img src="img/57a9a213ce7e9.jpg" style="width: 100%;height: 800%;">
  <input type="hidden" value="${q }" id="q">
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
            	<li class="active"><a href="listDelivery?userno=${petuser.userno }">查看订单</a></li>
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

<table class="table"
		style="position:absolute;left:50px;top:100px;width:1300px;height:300px;color: black;" >
		<thead>
			<tr>
				<th>订单编号</th>
				<th>送货地址</th>
				<th>商品数量</th>
				<th>商品名称</th>
				<th>购买人</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${pm.rows}" var="l">
					<tr>
						<th>${l.delivery}</th>
						<th>${l.daddress}</th>
						<th>${l.dnumber}</th>
						<th>${l.dcommodity.cfunction}</th>
						<th>${l.dpetuser.urealname}</th>
						<c:if test="${l.dstate==0 }">
							<th>待送货</th>
						</c:if>
						<c:if test="${l.dstate==1 }">
							<th>正在送</th>
						</c:if>
						<c:if test="${l.dstate==2 }">
							<th>已送达</th>
						</c:if>
						
						<c:if test="${l.dstate==0 }">
							<th><a class="btn btn-info" style="background-color: lightgreen;">待接单</a></th>
						</c:if>
						<c:if test="${l.dstate==1 }">
							<th><a class="btn btn-info" onclick="asdasdasd('${petuser.userno }','${l.delivery}')">确认送达</a></th>
						</c:if>
						<c:if test="${l.dstate == 2 }">
							<th><a class="btn btn-info" style="background-color: black;">已送达</a></th>
						</c:if>
					</tr>
				</c:forEach> 
		</tbody>
	</table>
	
	<div id="page">
	<table>
	<tbody>
	<tr>
               <td colspan="6">
	               <pg:pager url="listDelivery"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
					  	<pg:param name="keyword" />
					  	<pg:first>  
							   <a href="${pageUrl}">首页</a>  
							    </pg:first>  
							    <pg:prev>  
							    <a href="${pageUrl }">上一页</a>  
							    </pg:prev>  
							    <pg:pages>  
							        <c:choose>  
							            <c:when test="${currentPageNumber eq pageNumber}">  
							                <strong>${pageNumber }</strong>
							            </c:when>  
							            <c:otherwise>  
							                <a href="${pageUrl }">${pageNumber }</a>  
							            </c:otherwise>  
							        </c:choose>  
							    </pg:pages>  
							    <pg:next>  
							        <a href="${pageUrl }">下一页</a>  
							    </pg:next>  
							    <pg:last>  
							        <a href="${pageUrl }">尾页</a>  
							    </pg:last>  
				
					</pg:pager>
               </td>
           </tr>
 </tbody>
           </table>
           </div>

<script type="text/javascript">
	function loadlogin(){
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
					if(q=="4"){
						bootbox.alert("确认成功!!!");
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
	function asdasdasd(userno,delivery){
		  bootbox.confirm(
	                {
	                    message: "确认收货吗",
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
	                        	window.location.href="Deliveredaaa?userno="+userno+"&delivery="+delivery;
	                        } 
	                    }
	                });
	}
</script>
  </body>
</html>