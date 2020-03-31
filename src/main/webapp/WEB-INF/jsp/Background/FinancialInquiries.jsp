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
    
    <title>My JSP 'FinancialInquiries.jsp' starting page</title>
    
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
           	  <td colspan="6">
             	   <form action="FinancialInquiries">
             	 	请输入:<input type="text" name="likewhere" value="${likewhere }"/>
             	   <input class="btn btn-info" type="submit" value="搜索">
             	   </form>
            	 </td>
         	 </tr>
		</thead>
		<thead>
			<tr>
				<th>财务记录编号</th>
				<th>发生时间</th>
				<th>发生金额</th>
				<th>发生事件</th>
				<th>操作员工</th>
				<th>用户</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${pm.rows}" var="l">
					<tr>
						<td>${l.financialrecordsno }</td>
						<td>${l.ftimeofoccurrence.substring(0,16) }</td>
						<td>${l.famountofoccurrence }</td>
						<td>${l.fevent }</td>
						<td>${l.foperatingstaffs.srealname }</td>
						<td>${l.fuser.urealname }</td>
						<td>${l.fremarks }</td>
					</tr>
				</c:forEach>
				   <tr>
				   
               <td colspan="6">
	               <pg:pager url="FinancialInquiries?likewhere=${likewhere }"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
	<span style="position: absolute;left: 600px;top: 500px;font-size: 40px;">
		总盈利：${fservi }元
	</span>
  </body>
</html>
