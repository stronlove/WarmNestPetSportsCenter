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
    
    <title>My JSP  starting page</title>
    
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
				<th>员工编号</th>
				<th>登录账号</th>
				<th>登录密码</th>
				<th>真实姓名</th>
				<th>身份证</th>
				<th>员工状态</th>
				<th>部门名称</th>
				<th>角色名称</th>
				<th>操作</th>

			</tr>
		</thead>
		<tbody>
				<c:forEach items="${pm.rows}" var="l">
					<tr>
						<td>${l.stafftableno }</td>
						<td>${l.sname }</td>
						<td>${l.spassword }</td>
						<td>${l.srealname }</td>
						<td>${l.sid }</td>
						<c:if test="${l.srole==0}">
						<td>已启用</td>
						</c:if>
						<c:if test="${l.srole==1}">
						<td>已禁用</td>
						</c:if>
					   <td>${l.sdepartments.dname}</td>
						<td>${l.sroleas.rname}</td>
						   <td>
				   <a href="listStaffTable" class="btn btn-info">添加</a>
                   <a href="listStaffTable?stafftableno=${l.stafftableno }" class="btn btn-info">修改</a>
                   <c:if test="${l.srole==0 }">
                   <a target="homepage" href="findStaffSrole?srole=1&stafftableno=${l.stafftableno }" class="btn btn-danger">禁用</a>
                   </c:if>
                   <c:if test="${l.srole==1 }">
                   <a target="homepage" href="findStaffSrole?srole=0&stafftableno=${l.stafftableno }" class="btn btn-success">启用</a>
                   </c:if>
               </td>
					</tr>
				</c:forEach>
				   <tr>
				   
               <td colspan="6">
	               <pg:pager url="StaffTableOperation"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
  </body>
</html>

