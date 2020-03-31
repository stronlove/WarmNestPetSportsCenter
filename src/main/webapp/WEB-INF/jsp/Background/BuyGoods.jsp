<%@ page language="java" import="com.aaa.common.*" pageEncoding="UTF-8"%>
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
	opacity: 0.7 !important;
	position: absolute;
	left: 0px;
	top: 0px;
	height: 1500px;
}

/*关闭框  */
#XDiv {
	font-size: 40px;
	font-weight: 800;
	position: absolute;
	left: 300px;
	cursor: pointer;
}

#XDiv1 {
	font-size: 40px;
	font-weight: 800;
	position: absolute;
	left: 300px;
	cursor: pointer;
}
#imgbottdiv{
	position: absolute;
	top:100px;
	left:20px;
}
#imgbottdiv .foreachdiv{
	width: 320px;
	float: left;
	color: black;
	height: 430px;
}
.foreachdiv img{
	width: 300px;
	height: 240px;
	border-radius:20px;
}
.aa select{
	position:absolute;
	width: 90px;
	height: 130px;
	top:55px;
	left:80px;
}
.option{
	padding-top:30px;
	padding-bottom:30px;
}
#AddReservationInformation {
	position: absolute;
	left: 25%;
	top: 100px;
	width: 700px;
	height: 300px;
	background: white;
	border-radius: 25px;
	height: 500px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
 .my_selected{position:absolute;z-index:1}
.input-group{
	margin-bottom: 20px;
}

#page{
	position: absolute;
	top:900px;
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
  <body style="height:100px;" onload="loadlogin();">
  
  <input type="hidden" value="${q }" id="q">
<div id="mask"></div>
		<center>
		<div>
		<br/>
		<form action="commoditys" method="post">
		  		<input type="text" name="keyword" value="${searchs}" style="width:220px" class="form-control">
		  		<input type="submit" value="搜索" class="btn btn-info" style="position: absolute; font-size:15px;left:680px;top:20px">
  		</form>
  		</div>
		</center>
		
		
    <div id="imgbottdiv">
	<form action="saveDeliverys" method="post" onsubmit="return shopping()">
	<c:forEach items="${pm.rows}" var="l">
		<div class="foreachdiv">
			<img src="<%=Constants.IMG_SERVER %>${l.cpicture }"><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;商品价格：${l.cprice }<br><br>
			<input type="hidden" value="${l.cprice }" name="cprice" />
			功能介绍：${l.cfunction }<br><br>
			<input type="submit" value="立即购买"  class="btn btn-info">
		
		</div>
	</c:forEach>
	</form>
	<div id="page">
	<table>
	<tbody>
	<tr>
               <td colspan="6">
	               <pg:pager url="commoditys"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
</div>

<script type="text/javascript">
/* function BuyOnclick() {
              document.form.submit();
				
			};  */
	$("#dnumber").change(function (){

	var price=$("#money").val();
	var num =$("#dnumber").val();
	$("#allprice").val(num*price);
	});
	




	function ReservationEventaa(allprice,id,cfunction,cinventory) {
			$("#money").val(allprice);
		$("#AddReservationInformation").slideToggle("slow");
		$("#commodityno").val(id);
		$("#mask").css("display", "block");
		$("#mask").css("width", "100%");
		$("#mask").css("height", "1500px");
				$("#commodityno").val(id);
				$("#mask").css("z-index", "2");
				$("#allprice").val(allprice);
				$("#cfunction").val(cfunction);
				$("#cinventory").val(cinventory);
				};


	function shopping() {
			if(confirm("你确定要购买该商品吗？")){
				return true;
			}
			else
			{
				return false;
			}

	}
	
	
	
	
	
	
	$("#XDiv1").hover(function() {
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


	
				function zp1()
				{
					var DateOfReservation=$("#DateOfReservation").val();
					
					var reg=/^([\u4e00-\u9fa5]+|[0-9a-zA-Z]+){5,50}/;
					if(reg.test(DateOfReservation))
						{
						$("#zpmsg1").html("");
						return true;
						}
					else{
						$("#zpmsg1").css("color","red");
						$("#zpmsg1").html("不能输入特殊字符!");
						return false;
					}
					
				}
</script>
  </body>
</html>