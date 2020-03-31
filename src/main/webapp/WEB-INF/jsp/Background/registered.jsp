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
  <body onload="loadbody1('${h}')">
	<!-- 表格 -->
	<table class="table table-striped"
		style="position:absolute;top:50px;color: black;">
		<thead>
         	 <tr>
           	  <td colspan="6">
             	   <form action="registered">
             	 	请输入挂号人的姓名:<input type="text" name="likewhere" value="${likewhere }" />
             	 	<br>
             	 	<c:if test="${rstate==0 }">
             	 		未打印：<input type="radio" name="rstate" value="0" checked="checked">
             	 		已打印：<input type="radio" name="rstate" value="1">
             	 		所有：<input type="radio" name="rstate" value="2">
             	 	</c:if>
             	 	<c:if test="${rstate==1 }">
             	 		未打印：<input type="radio" name="rstate" value="0">
             	 		已打印：<input type="radio" name="rstate" value="1" checked="checked">
             	 		所有：<input type="radio" name="rstate" value="2">
             	 	</c:if>
             	 	<c:if test="${rstate==2 }">
             	 		未打印：<input type="radio" name="rstate" value="0">
             	 		已打印：<input type="radio" name="rstate" value="1">
             	 		所有：<input type="radio" name="rstate" value="2" checked="checked">
             	 	</c:if>
             	   <input class="btn btn-info" type="submit" value="搜索">
             	   </form>
            	 </td>
         	 </tr>
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
						<td>${l.rdate}</td>
						<c:if test="${l.rstate==0}">
							<td><button class="btn btn-info"
									onclick="ttt('${l.registrationformno}','${l.rpets.petno }','${l.rreservationnumber }','${l.rstafftables.stafftableno }')">未打印</button></td>
						</c:if>
						<c:if test="${l.rstate==1}">
							<td><button class="btn btn-info disabled"style="background: red;">已打印</button></td>
						</c:if>
						<td>${l.rstafftables.sdepartments.dname}</td>
						<td>${l.rpets.pusers.urealname}</td>
						<td>${l.rstafftables.srealname}</td>
					</tr>
				</c:forEach>
				</c:if>
           <tr>
               <td colspan="6">
	               <pg:pager url="registered"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
	<button class="btn btn-info" style="width:100px;height: 70px;position: absolute;left:500px;top:500px;" onclick="xxx()">返回上一页</button>
	<script type="text/javascript">
		function loadbody1(h){
			if(h != null && h != ""){
				bootbox.alert("打印成功，请记住您的单号："+h);
			}
		}
		function ttt(registrationformno,petno,rreservationnumber,stafftableno){
			window.location.href="onclickJH?opets.petno="+petno+"&registrationformno="+registrationformno+"&hangsinglenumber="+rreservationnumber+"&ostafftables.stafftableno="+stafftableno;
		}
		function xxx(){
			window.location.href="InsertRegistrationForm";
		}
	</script>
  </body>
</html>