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
	
	
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script src="../bootstrap/js/bootstrap.min.js"></script>
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
	font-size: 30px;
	font-weight: 400px;
	position: absolute;
	left: 540px;
	cursor: pointer;
	z-index: ;
}

/*遮罩层  */
#masks {
	background: silver;
	display: none;
	z-index: 1;
	opacity: 0.4 !important;
	position: absolute;
	left: 0px;
	top: 0px;
}

/*关闭框  */
#XAddDiv {
	font-size: 30px;
	font-weight: 400px;
	position: absolute;
	left: 370px;
	cursor: pointer;
	z-index: ;
}
/*登录功能div  */
#selectpetall {
	position: absolute;
	left: 35%;
	top: 100px;
	width: 350px;
	height: 300px;
	background: red;
	border-radius: 25px;
	height: 350px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
#petalldiv{
	position: fixed;
	left: 30%;
	top: 100px;
	width: 570px;
	height: 500px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:10;
	display: none;
}

#addpetdiv{
	position: fixed;
	left: 38%;
	top: 100px;
	width: 420px;
	height: 480px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
/*个人中心*/

#personaldiv{
	/* position: absolute;
	width:700px;
	height:500px;
	background-color: #C0C0C0;
	left:430px;
	top:51px; */
	
	position: fixed;
	width:1330px;
	height:590px;
	background-color: #C0C0C0;
	left:10px;
	top:55px;
	overflow:auto;
	background: #FFF0F5;
	border-radius: 25px;
	opacity: 0.8;
	z-index:0;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

  
  
<body style="height:2000px;background:url('img/2011042522315265450.JPG');" onload="tdananLoad();">
<input type="hidden" value="${petuser.userno}" id="tdananId">
  <input type="text" value="${q }" id="q">
  
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
            	<li class="active"><a href="personal">个人中心</a></li>
            	<li><a href="HAAWAD">预约挂号</a></li>
            	<li><a href="listDelivery?userno=${petuser.userno }">查看订单</a></li>
            	<li><a href="RegisteredQuery?userno=${petuser.userno}">我的挂号</a></li>
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
	<div id="mask"></div>
	<div id="personaldiv">
	<br/>
		<center>账户余额：<th>
		<input type="text" id="tdanan" class="form-control"  style="width: 100px;" readonly
		value="${petuser.ubalance }元"/></th><br/>
		用户id:<th>${petuser.userno}</th><br/>
			<a href="BalanceRecharge?userno=${petuser.userno}" class="btn btn-info">余额充值</a>
		</center>
		<br/>
		<center>
		<table class="table">
			<center><h3>我的宠物</h3></center>
			<a id="showaddpetdiv" class="btn btn-info">添加宠物</a>
			<tr>
				<th style="width:80px">宠物编号</th>
				<th style="width:80px">宠物名称</th>
				<th style="width:80px">宠物年龄</th>
				<th style="width:80px">宠物身高</th>
				<th style="width:80px">绝育状态</th>
				<th style="width:80px">宠物类别</th>
				<th style="width:80px">宠物状态</th>
				<th style="width:80px">宠物图片</th>
				<th style="width:80px">操作</th>
			</tr>
			<tbody>
			<c:forEach items="${petzz.rows }" var="p">
    			<tr>
    				<th>${p.petno }</th>
    				<th>${p.pname }</th>
    				<th>${p.page }</th>
    				<th>${p.pweight }</th>
    				<th>
    					<c:if test="${p.psterilizationState==0}">
							未绝育
						</c:if>
						<c:if test="${p.psterilizationState==1}">
							已绝育
						</c:if>
    				</th>
    				<th>
    					<c:if test="${p.pcatanddog==0}">
							猫
						</c:if>
						<c:if test="${p.pcatanddog==1}">
							狗
						</c:if>
    				</th>
    				<th>
    					<c:if test="${p.pstate==0}">
							正常
						</c:if>
						<c:if test="${p.pstate==1}">
							生病
						</c:if>
						<c:if test="${p.pstate==2}">
							死亡
						</c:if>
    				</th>
    				<th>
    					<img src="<%=Constants.IMG_SERVER %>${p.pimg}" style="width:50px;"/>
    				</th>
    				<th><a onclick="clickpet('${p.petno }','${p.pname }','${p.page }','${p.pweight }','${p.psterilizationState }','${p.pcatanddog }','${p.pstate }','${p.pimg }')" class="btn btn-info">修改</a></th>	
    			</tr>
    		</c:forEach>
    		<tr>
               <td colspan="6">
	               <pg:pager url="personal"  items="${petzz.total}"  export="currentPageNumber=pageNumber" maxPageItems="${petzz.pagesize}" >
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
		</center>
		
	</div>
	<!-- 修改 -->
	<!-- <div id="personaldiv"> -->
	<div id="petalldiv">
	<div id="XDiv">X</div>
		<center>
		<h3>修改宠物信息</h3>
		<form action="updpet.action" onsubmit="return updpetcheck()" method="post">
		<table style="font-size:20">
			<tr>
				<td>宠物名称：</td>
				<td>
					<input type="hidden" name="petno" id="petno" />
					<input type="text" name="pname" id="pname" class="form-control" required/><br/>
				</td>
				<br/>
			</tr>
			<tr>
				<td>宠物年龄：</td>
				<td>
					<input type="number" min="0" max="20" name="page" id="page"onblur="updpet1" class="form-control pagess" required /><br/>
					<span id="pagess1" style="font-size:15px"></span>
				</td>
			</tr>
			<tr>
				<td>宠物体重：</td>
				<td>
					<input type="number" min="0" max="40" name="pweight" required id="pweight"  onblur="updpet2" class="form-control pweightss"  /><br/>
					<span id="pweightss1" style="font-size:15px"></span>
				</td>
			</tr>
			<tr>
				<td>绝育状态：</td><br/>
				<td>
						<input name="psterilizationState" id="sterilization" type="radio" value="0"/>未绝育&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="psterilizationState" id="unneutered" type="radio" value="1" />已绝育<br/>
						
				</td>
			</tr>
			<tr>
				<td>宠物类别：</td><br/>
				<td>
						<input name="pcatanddog" id="cat" type="radio" value="0" />猫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     				<input name="pcatanddog" id="dog" type="radio" value="1" />狗<br/>
				</td>
			</tr>
			<tr>
				<td>宠物状态：</td><br/>
				<td>
						<input name="pstate" id="regular" type="radio" value="0" />正常&nbsp;&nbsp;
     					<input name="pstate" id="disease" type="radio" value="1" />生病&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>宠物图片
				<td><div>
					<input type="file" name="pimg"
						style="width:183px;height:25px;" id="pimg" /><br/>
				</div>
				</td>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="hidden" name="petuser.userno" value="${petuser.userno }"/>
				</td>
			<tr>
				<th>
					
				</th>
				<th><input type="submit" value="修改" class="btn btn-info" /></th>
			</tr>
		</table>
		</form>
		</center>
	</div>
	<!-- 添加宠物 -->
	<div id="masks"></div>
	<div id="addpetdiv">
	<div id="XAddDiv">X</div>
		<center>
		<form action="savepet.action" method="post" onsubmit="return addpetcheck()" enctype="multipart/form-data" >
		<table style="font-size:20">
			<h3>添加新的宠物</h3>
			<tr>
				<td>宠物名称：</td>
				<td>
					<input type="hidden" name="petno"  />
					<input type="text" name="pname" required class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>宠物年龄：</td>
				<td>
					<input type="number" min="0" max="20" value="0" id="pages" name="page" required onblur="addpet1" class="form-control"  /><br/>
					<span id="pages1" style="font-size:15px"></span>
				</td>
			</tr>
			<tr>
				<td>宠物体重：</td>
				<td> 
					<input type="number" min="0" max="40" value="0" id="pweights" name="pweight" required onblur="addpet2" class="form-control"  /><br/>
					<span id="pweights1" style="font-size:15px"></span>
				</td>
			</tr>
			<tr>
				<td>绝育状态：</td>
				<td>
					<input name="psterilizationState" type="radio" value="0" checked="0">未绝育&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     				<input name="psterilizationState" type="radio" value="1">已绝育
				</td>
			</tr>
			<tr>
				<td>宠物类别：</td>
				<td>
					<input name="pcatanddog" type="radio" value="0" checked="0">猫&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     				<input name="pcatanddog" type="radio" value="1">狗<br/>
				</td>
			</tr>
			<tr>
				<td>宠物状态：</td>
				<td>
					<input name="pstate" type="radio" value="0" checked="0">正常&nbsp;&nbsp;
     				<input name="pstate" type="radio" value="1">生病&nbsp;&nbsp;
				</td>
			</tr>
			<br/>
			<tr>
				<td>宠物图片：</td>
				<td>
					<div>
						<input type="file" name="pimgs" style="width:183px;height:25px;" /><br/>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="hidden" name="pusers.userno" value="${petuser.userno }"/>
			</tr>
			<tr>
				<th>
					
				</th>
				<th>
					<input type="submit" value="添加" class="btn btn-info"/>
					<span id="addpets1"></span>
				</th>
			</tr>
		</table>
		</form>
		</center>
	</div>



<script type="text/javascript">

	/*注册关闭悬浮时间  */
	$("#XDiv").hover(function() {
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
	/*关闭注册账号div  */
	$("#XDiv").click(function() {
		$("#petalldiv").slideToggle("slow");
		$("#mask").css("display", "none");
	});
	
	
	
	
	
	/*注册关闭悬浮事件  */
	$("#XAddDiv").hover(function() {
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
	
	$("#showaddpetdiv").click(function(){
		$("#addpetdiv").slideToggle("slow");
		$("#masks").css("display", "block");
		$("#masks").css("width", "100%");
		$("#masks").css("height", "2000px");
	});
	/*关闭注册账号div  */
	$("#XAddDiv").click(function() {
		$("#addpetdiv").slideToggle("slow");
		$("#masks").css("display", "none");
	});
	function clickpet(petno,pname,page,pweight,psterilizationState,pcatanddog,pstate,pimg){
	
		$("#petalldiv").slideToggle("slow");
		$("#mask").css("display", "block");
		$("#mask").css("width", "100%");
		$("#mask").css("height", "2000px");
		$("#petno").val(petno);
		$("#pname").val(pname);
		$("#page").val(page);
		$("#pweight").val(pweight);
		if (psterilizationState == 0) {
			$("#sterilization").attr("checked","checked");
		}else{
			$("#unneutered").attr("checked","checked");
		}
		
		
		if (pcatanddog == 1) {
			$("#dog").attr("checked","checked");
		}else{
			$("#cat").attr("checked","checked");
		}
		
		if (pstate == 0) {
			$("#regular").attr("checked","checked");
		}else if(pstate == 1){
			$("#disease").attr("checked","checked");
		}else{
			$("#die").attr("checked","checked");
		}
		
		$("#pstate").val(pstate);
		$("#pimg").val(pimg);
	}
	
	
	
	function addpet1(){
			var pages = $("#pages").val();
      		var regs1=/^\d{1,3}$/;
			if(regs1.test(pages))
			{
					$("#pages1").html("");
					return true;
				}	
			else
			{
				$("#pages1").css("color","red");
				$("#pages1").html("只能输入数字");
				return false;
			}
 		}
 		
 		function addpet2(){
			var pweights = $("#pweights").val();
      		var regs2=/^\d{1,3}$/;
			if(regs2.test(pweights))
			{
					$("#pweights1").html("");
					return true;
				}	
			else
			{
				$("#pweights1").css("color","red");
				$("#pweights1").html("只能输入数字");
				return false;
			}
 		}
			
			
		function addpetcheck(){
			 if(addpet1()&&addpet2()){
			    $("#addpets1").html("");
			    return true;
			 }else{
			    $("#addpets1").css("color","red");
			    $("#addpets1").html("信息有误，提交失败");
			    return false;
				}
		}
		
		
		
		
		
		
		function updpet1(){
			var pages = $(".pagess").val();
      		var regss1=/^\d{1,3}$/;
			if(regss1.test(pages))
			{
					$("#pagess1").html("");
					return true;
				}	
			else
			{
				$("#pagess1").css("color","red");
				$("#pagess1").html("只能输入数字");
				return false;
			}
 		}
 		
 		function updpet2(){
			var pweightss = $(".pweightss").val();
      		var regss2=/^\d{1,3}$/;
			if(regss2.test(pweightss))
			{
					$("#pweightss1").html("");
					return true;
				}	
			else
			{
				$("#pweightss1").css("color","red");
				$("#pweightss1").html("只能输入数字");
				return false;
			}
 		}
			
			
		function updpetcheck(){
			 if(updpet1()&&updpet2()){
			    $("#updpets1").html("");
			    return true;
			 }else{
			    $("#updpets1").css("color","red");
			    $("#updpets1").html("信息有误，提交失败");
			    return false;
				}
		}
	function tdananLoad(){
		var tdananId = $("#tdananId").val();
		setTimeout(function(){
				$.ajax({
					url : "tdananLoad",
					type : "post",
					data : {
						userno : tdananId,
					},
					success : function(data) {
						$("#tdanan").val(data+"元");
					},
				});
			tdananLoad();
		},5000);
	}
</script>
  </body>
</html>