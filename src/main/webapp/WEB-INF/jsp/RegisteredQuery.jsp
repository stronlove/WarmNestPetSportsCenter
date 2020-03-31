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
    
    <title>My JSP 'RegisteredQuery.jsp' starting page</title>
    
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
  <body style="overflow-y: hidden;">
 <img style="width:100%;height: 110%;" src="img/698.jpg">
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
            	<li class="active"><a href="RegisteredQuery?userno=${petuser.userno}">我的挂号</a></li>
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
    <body>
	<!-- 表格 -->
	<table class="table table-striped"
		style="position:absolute;top:50px;color: black;">
		<thead>
			<tr>
				<th>科室员工排序</th>
				<th>挂号时间</th>
				<th>是否打印</th>
				<th>科室</th>
				<th>挂号人</th>
				<th>操作员工</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${pm.rows.size()>0 }">
				<c:forEach items="${pm.rows}" var="l">
					<tr>
						<td>${l.rstafftables.sdepartments.dname}
						${l.rstafftables.srealname}第&nbsp;
						${l.rreservationnumber}位</td>
						<td>${l.rdate.substring(0,16)}</td>
						<c:if test="${l.rstate==0}">
							<td>未打印</td>
						</c:if>
						<c:if test="${l.rstate==1}">
							<td>已打印</td>
						</c:if>
						<td>${l.rstafftables.sdepartments.dname}</td>
						<td>${l.rpets.pusers.urealname}</td>
						<td>${l.rstafftables.srealname}</td>
					</tr>
				</c:forEach>
				</c:if>
           <tr>
               <td colspan="6">
	               <pg:pager url="RegisteredQuery"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
					  	<pg:param name="keyword"/>
					  	<pg:param name="userno" value="${petuser.userno}"/>
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
  </body>
</html>
