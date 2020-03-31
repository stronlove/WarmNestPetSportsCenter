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
    
    <title>My JSP 'MedicalServices.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body>
	<!-- 表格 -->
	<button onclick="asd()" class="btn btn-info" style="width:100px;height: 30px;position: absolute;left: 500px;top: 50px;z-index:10;" >返回上一页</button>
	<table class="table table-striped"
		style="position:absolute;top:50px;color: black;">
		<thead>
         	 <tr>
           	  <td colspan="6">
             	   <form action="MedicalServicea">
             	 	请输入用户的姓名:<input type="text" name="likewhere" value="${likewhere }" />
             	 	<br>
             	   <input class="btn btn-info" type="submit" value="搜索">
             	   </form>
            	 </td>
         	 </tr>
         	 
			<tr>
				<th>订单表号</th>
				<th>状态</th>
				<th>挂单单号</th>
				<th>挂单时间</th>
				<th>宠物姓名</th>
				<th>主人姓名</th>
				<th>员工姓名</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${pm.rows.size()>0 }">
				<c:forEach items="${pm.rows}" var="l">
					<tr>
						<td>${l.openlistno }</td>
						<c:if test="${l.ostate==3 }">
							<td>准备治疗中..</td>
						</c:if>
						<c:if test="${l.ostate==4 }">
							<td>已治疗</td>
						</c:if>
						<c:if test="${l.ostate==7 }">
							<td>订单结束</td>
						</c:if>
						<td>${l.hangsinglenumber }</td>
						<td>${l.listtime.substring(0,16) }</td>
						<td>${l.opets.pname }</td>
						<td>${l.opets.pusers.urealname }</td>
						<td>${l.ostafftables.srealname }</td>
						<td><a href="MedicalServicesa?openlistno=${l.openlistno }" class="btn btn-info">查看详情</a></td>
					</tr>
				</c:forEach>
			</c:if>
           <tr>
               <td colspan="6">
	               <pg:pager url="MedicalServicea"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
	<script type="text/javascript">
	function asd(){
  			window.location.href="MedicalServices";
  		}
	</script>
  </body>
</html>
