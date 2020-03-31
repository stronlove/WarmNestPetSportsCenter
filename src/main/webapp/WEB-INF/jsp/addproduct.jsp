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
	height: 1000px;
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
/*登录功能div  */
#logindiv {
	position: absolute;
	left: 35%;
	top: 100px;
	width: 350px;
	background:white;
	border-radius: 25px;
	height: 350px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
#imgbottdiv{
	position: absolute;
	top:100px;
	left:20px;
}
#imgbottdiv .foreachdiv{
	width: 320px;
	float: left;
	color: white;
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
	height: 50px;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body style="background:url('img/240494-14112FR23058a.jpg');" onload="loadlogin();">
  
  <input type="hidden" value="${q }" id="q">
  
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="list">暖暖巢宠物康体中心</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="list">首页</a></li>
            <li class="active"><a href="commodity">服务项目</a></li>
        	<c:if test="${petuser.uname != null }">
            	<li><a href="personal">个人中心</a></li>
            	<li><a href="HAAWAD">预约挂号</a></li>
            	<li><a href="listDelivery?userno=${petuser.userno }">查看订单</a></li>
            	<li><a href="RegisteredQuery?userno=${petuser.userno}">我的挂号</a></li>
        	</c:if>
        </ul>
        <ul class="nav navbar-nav navbar-right"> 
        	<c:if test="${petuser.uname == null }">
            	<li><a href="toadd"> 注册</a></li>
            	<li><a id="UserLoginDL"> 登录</a></li>
        	</c:if> 
        	<c:if test="${petuser.uname != null }">
            	<li><a style="color: red;">欢迎登陆:${petuser.uname }</a></li>
            	<li><a href="userlogout">注销</a></li>
        	</c:if>
        </ul>
    </div>
    </div>
</nav>
<div id="mask"></div>
    <div id="imgbottdiv">
    <form action="findBycf">
    <span style="position: absolute;left: 55px;top:-45px;font-size: 30px;">请输入商品名称:</span>
  	 	<input type="text" name="search" class="form-control" style="width:220px;position: absolute;left:275px;top:-40px;" value="${search}">
		<input type="submit" value="搜索" class="btn btn-info" style="position: absolute; font-size:15px;left:500px;top:-40px">
	</form>
    
	<c:forEach items="${pm.rows}" var="l">
		<div class="foreachdiv">
			<img src="<%=Constants.IMG_SERVER %>${l.cpicture }"><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;商品价格：${l.cprice }<br><br>
			<input type="hidden" id="pp" value="${l.cprice}" />
			功能介绍：${l.cfunction }<br><br>
				<c:if test="${petuser!=null}">
					<input type="button" value="立即购买" class="btn btn-info"
						onclick="ReservationEventaa('${l.cprice }','${l.commodityno }','${l.cfunction }','${l.cinventory }')">
				</c:if>
				<c:if test="${petuser==null}">
					<input type="button" value="立即购买" class="btn btn-info"
						onclick="NotLoggedInOnclick()">
				</c:if>
		</div>
	</c:forEach>
	<div id="page">
	<table>
	<tbody>
	<tr>
               <td colspan="6">
	               <pg:pager url="commodity"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
</div>    
		
		<div id="AddReservationInformation" style="display: none">
			<center>
				<h1>购买商品</h1>
			</center>
			<div
				style="position: absolute; top:20px; left:120px; font-size:40px; color:black;"></div>
				<div id="XDiv1" style="left:650px;top:10px;">X</div>
				<form action="saveDelivery" name="form" method="post"
					onsubmit="return addroominformationsubmit()">
					<input type="hidden" id="commodityno" name="commodityno" value="${l.commodityno}">
					<input type="hidden"  name="userno" value="${petuser.userno}">
					<input type="hidden"  name="dstate"  value="0">
					<input type="hidden" name="dstafftableno.stafftableno" value="1">
						<div style="position:absolute;top:100px;left: 50px" priceOne>
					
					<div class="input-group" style="margin-top: 7px;">

						<span class="input-group-addon">&nbsp;&nbsp;&nbsp;姓名：</span><input type="text"
							class="form-control" id="UserRegistration"  name="dpetuser.urealname"
							style="width:150px;" value="${petuser.urealname}" readonly/>
					</div>
					
					<div class="input-group" style="margin-top: 7px;">
						<span class="input-group-addon">&nbsp;&nbsp;&nbsp;用户电话：</span><input
							type="text" id="utelephone" name="utelephone" 
							class="form-control" style="width:150px" value="${petuser.utelephone}" readonly/>
					</div>
					
					<div class="input-group" style="margin-top: 7px;">
						<span class="input-group-addon">&nbsp;&nbsp;&nbsp;送货地址：</span><input type="text"
							class="form-control" id="DateOfReservation" onblur="zp1()" name="daddress" 
							style="width:150px;" />
							
					</div>
					<span id="zpmsg1"></span>
					<div class="input-group" style="margin-top: 7px;">
							<span class="input-group-addon">&nbsp;&nbsp;&nbsp;商品：</span><textarea rows="3" cols="23" class="form-control" id="cfunction" value="${l.cfunction }" 
								name="cfunction" style="width:150px;" readonly></textarea>
					</div>					
					<div
				style="position: absolute; top:0px; left:320px; font-size:40px; color:black;">
					<div class="input-group" style="margin-top: 7px;">
							<span class="input-group-addon">&nbsp;&nbsp;&nbsp;余额：</span><input type="text"
								class="form-control" id="DaysToStay" value="${petuser.ubalance}" 
								name="dpetuser.ubalance" style="width:150px;" readonly/>
					</div>
					<div class="input-group" style="margin-top: 7px;">
							<span class="input-group-addon"><div class="num">&nbsp;&nbsp;&nbsp;数量：</div></span><input type="number"
								class="form-control" required id="dnumber" min="1" max="100"
								name="dnumber" style="width:150px;" value="1"  />
					</div>
					<div class="input-group" style="margin-top: 7px;">
							<span class="input-group-addon"><div class="allnum">&nbsp;&nbsp;&nbsp;价格：</div></span>
							<input type="text" name="cprice" class="form-control" id="allprice" value="${l.cprice}"  style="width:150px;" readonly/>
								<input id="money" type="hidden" >
					</div>
					<div class="input-group" style="margin-top: 7px;">
								
					</div>
					</div>
						<div
							style="padding-top: 10px;padding-left: 300px;margin-top: 7px;opacity: 0.7;">
							<input type="submit" class="btn btn-info" value="购买"
								style="width: 100px;background: black;"  onclick="BuyOnclick()" />
								
						</div>
						</div>
				</form>
			</div> 

<script type="text/javascript">
/* function BuyOnclick() {
              document.form.submit();
				
			};  */

/*关闭注册账号div  */
	$("#XDiv1").click(function() {
		$("#User").val("");
		$("#password").val("");
		$("#AddReservationInformation").slideToggle("slow");
		$("#mask").css("display", "none");
	});

 $("#XDiv").click(function() {
		$("#User").val("");
		$("#password").val("");
		$("#logindiv").slideToggle("slow");
		$("#mask").css("display", "none");
	});
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
		$("#mask").css("height", "1000px");
				$("#commodityno").val(id);
				$("#mask").css("z-index", "2");
				$("#allprice").val(allprice);
				$("#cfunction").val(cfunction);
				$("#cinventory").val(cinventory);
				};
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
				}
			}
		}
	};

	/*注册关闭悬浮时间  */
	$("#XDiv").hover(function() {
		$(this).css("color", "red");
	}, function() {
		$(this).css("color", "black");
	});
	
	
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
			
	$("#showlogindiv").click(function(){
		$("#logindiv").slideToggle("slow");
		$("#mask").css("display", "block");
		$("#mask").css("width", "100%");
		$("#mask").css("height", "1000px");
	});
	/*关闭注册账号div  */
	
	
	
	
	
	
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
	};
	
	
	
				
				$("#UserLoginDL").click(function(){
		  bootbox.confirm(
	                {
	                    message: "即将跳入登录页面",
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
	                        	window.location.href="UserLogin";
	                           
	                        } 
	                    }
	                });
				});
				function zp1()
				{
					var DateOfReservation=$("#DateOfReservation").val();
					
					var reg=/^([\u4e00-\u9fa5]+|[0-9a-zA-Z]+){3,50}/;
					if(reg.test(DateOfReservation))
					{
						$("#zpmsg1").html("");
						return true;
					}else{
						$("#zpmsg1").css("color","red");
						$("#zpmsg1").html("不能少于三个字符,且不能输入特殊字符!!!");
						return false;
					}
					
					
				}
				function addroominformationsubmit(form) {
					var DaysToStay=1.5;
					var allprice=0.0;
					DaysToStay = $("#DaysToStay").val();
					allprice = $("#allprice").val();
					var DaysToStay1 = parseFloat(DaysToStay);
					var allprice1 = parseFloat(allprice);
					
					if(document.getElementById('dnumber').value=='') {
						bootbox.alert("不能为空！");
						form.dnumber.focus();
						return false;
					}else{
						if(DaysToStay1 < allprice1){
							bootbox.alert("余额不足，请充值之后再进行购买！！！");
							return false;
						}else{
							if(zp1()){
								return true;
							}else{
								return false;
							}
						}
					}
				}
				function NotLoggedInOnclick(){
		  bootbox.confirm(
	                {
	                    message: "点击确认进入登录页面",
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
	                        	window.location.href="UserLogin";
	                        } 
	                    }
	                });
				}
</script>
  </body>
</html>