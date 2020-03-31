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
    
    <title>My JSP 'ConfirmationOfDelivery.jsp' starting page</title>
    
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
#imgbottdiv{
	position: absolute;
	top:50px;
	left:20px;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body style="height:100px;overflow: hidden;" onload="loadlogin('${q}');">
    <div id="imgbottdiv">
    <form action="ConfirmationOfDelivery">
    <span style="position: absolute;left: 55px;top:-40px;font-size: 20px;width:200px;">请输入用户名称:</span>
  	 	<input type="text" name="keyword" class="form-control" style="width:220px;position: absolute;left:275px;top:-40px;" value="${keyword}">
		<input type="submit" value="搜索" class="btn btn-info" style="position: absolute; font-size:15px;left:500px;top:-40px">
	</form>
	</div>
<table class="table" style="position: absolute;top:100px;">
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
							<th>派送中</th>
						</c:if>
						<c:if test="${l.dstate==2 }">
							<th>已送达</th>
						</c:if>
						<c:if test="${l.dstate==0 }">
							<th><a class="btn btn-info" onclick="asdasdasd('${l.dpetuser.userno }','${l.delivery}')">确认发货</a></th>
						</c:if>
						<c:if test="${l.dstate==1 }">
							<th><a class="btn btn-info" style="background-color: black;">派送中</a></th>
						</c:if>
						<c:if test="${l.dstate==2 }">
							<th><a class="btn btn-info" style="background-color: black;">已确认收货</a></th>
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
	               <pg:pager url="ConfirmationOfDelivery"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
function loadlogin(q){
	if(q=="1"){
		bootbox.alert("发货成功!!!");
	}
}
function asdasdasd(userno,delivery){
	  bootbox.confirm(
                {
                    message: "确认已发货吗",
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
                        	window.location.href="ConfirmationOfDeliveryqwe?delivery="+delivery;
                        } 
                    }
                });
}
</script>
</body>
</html>