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
    
    <title>My JSP 'registered.jsp' starting page</title>
    
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
	<table class="table table-striped"
		style="position:absolute;top:50px;color: black;">
		<thead>
         	 <tr>
           	  <td colspan="6">
             	   <form action="FillOutTheForm">
             	 	请输入宠物的姓名:<input type="text" name="likewhere" value="${likewhere }" />
             	 	<br>
             	   <input class="btn btn-info" type="submit" value="搜索">
             	   </form>
            	 </td>
         	 </tr>
			<tr>
				<th>挂单单号</th>
				<th>状态</th>
				<th>挂单时间</th>
				<th>宠物姓名</th>
				<th>员工姓名</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${pm.rows.size()>0 }">
				<c:forEach items="${pm.rows}" var="l">
					<tr>
						<td>${l.hangsinglenumber}</td>
						<c:if test="${l.ostate==1 }">
							<td>排队中</td>
						</c:if>
						<c:if test="${l.ostate==2 }">
							<td>付钱中</td>
						</c:if>
						<c:if test="${l.ostate==3 }">
							<td>取药中</td>
						</c:if>
						<c:if test="${l.ostate==4 }">
							<td>正常结束</td>
						</c:if>
						<c:if test="${l.ostate>=5 }">
							<td>订单结束</td>
						</c:if>
						<td>${l.listtime.substring(0,16)}</td>
						<td>${l.opets.pname}</td>
						<td>${l.ostafftables.srealname}</td>
						<td><button class="btn btn-info" onclick="CKcf('${l.openlistno}')">查看处方详情</button></td>
					</tr>
				</c:forEach>
			</c:if>
           <tr>
               <td colspan="6">
	               <pg:pager url="FillOutTheForm"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
	<button class="btn btn-info" style="width:100px;height: 70px;position: absolute;left:500px;top:500px;" onclick="xxx()">返回上一层</button>
	<script type="text/javascript">
		function CKcf(openlistno){
			window.location.href="FillOutTheForm123?openlistno="+openlistno;
		}
		function xxx(){
			window.location.href="SingleHomePage";
		}
	</script>
  </body>
</html>