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
    <base href="<%=basePath%>">
    
    <title>My JSP 'DisableStartUser.jsp' starting page</title>
    
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
  <body>
	<!-- 表格 -->
	<table class="table table-striped"
		style="position:absolute;top:50px;color: black;">
		<thead>
			<tr>
				<th>用户编号</th>
				<th>登录账号</th>
				<th>登录密码</th>
				<th>真实姓名</th>
				<th>身份证</th>
				<th>宠物数量</th>
				<th>是否禁用</th>
				<th>用户电话</th>
				<th>余额</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${pu.rows}" var="l">
					<tr>
						<td>${l.userno }</td>
						<td>${l.uname }</td>
						<td>${l.upassword }</td>
						<td>${l.urealname }</td>
						<td>${l.uid }</td>
						<td>${l.unumberOfPets }</td>
						<td>
						<c:if test="${l.urole==0 }">
	             	 		<button class="btn btn-info" style="background: red;" onclick="aa('${l.userno }',1)">禁用</button>
             	 		</c:if>
             	 		<c:if test="${l.urole==1 }">
	             	 		<button class="btn btn-info" onclick="aa('${l.userno }',0)">启用</button>
             	 		</c:if>
             	 		</td>
						<td>${l.utelephone }</td>
						<td>${l.ubalance }</td>
					</tr>
				</c:forEach>
           <tr>
               <td colspan="6">
	               <pg:pager url="DisableStartUser"  items="${pu.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pu.pagesize}" >
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
	<div>
	</div>
  </body>
  <script type="text/javascript">
  	function aa(userno,urole)
  	{
  		window.location.href="updateuser?userno="+userno+"&urole="+urole;
  	}
  </script>
</html>

