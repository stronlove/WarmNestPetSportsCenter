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
    
    <title>My JSP 'PetUserManage.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/checkIdCard.js"></script>
	
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
/*遮罩层  */
#mask {
	background: silver;
	display: none;
	z-index: 10;
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
	z-index:13 ;
}


/* 修改用户 */
#XUpdUserDiv {
	font-size: 30px;
	font-weight: 400px;
	position: absolute;
	left: 540px;
	cursor: pointer;
	z-index: 13;
}
/*遮罩层  */
#masks {
	background: silver;
	display: none;
	z-index: 10;
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
	left: 430px;
	cursor: pointer;
	z-index: 13;
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
	z-index:13;
	overflow:auto;
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
	z-index:13;
	display: none;
}
/* 添加宠物 */
#addpetdiv{
	position: fixed;
	left: 30%;
	top: 30px;
	width: 470px;
	height: 490px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:13;
	overflow:auto;
	display: none;
}
/*个人中心*/

#personaldiv{
	overflow:auto;
	position: fixed;
	width:1330px;
	height:590px;
	background-color: white;
	left:10px;
	top:55px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:13;
}

/* 修改用户 */

#masksss {
	background: silver;
	display: none;
	z-index: 10;
	opacity: 0.4 !important;
	position: absolute;
	left: 0px;
	top: 0px;
}

#updpetuserdiv{
overflow:auto;
	position: fixed;
	left: 25%;
	top: 10px;
	width: 630px;
	height: 550px;
	background: white;
	overflow:auto;
	border-radius: 25px;
	opacity: 0.8;
	z-index:13;
	display: none;
}



/* 所有宠物 */
#maskss {
	background: silver;
	display: none;
	z-index: 10;
	opacity: 0.4 !important;
	position: absolute;
	left: 0px;
	top: 0px;
}




#allpetuserdiv{
	position: fixed;
	left: 25%;
	top: 10px;
	width: 570px;
	height: 500px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:13;
	overflow:auto;
	display: none;
}




#XAllUserDiv {
	font-size: 30px;
	font-weight: 400px;
	position: absolute;
	left: 530px;
	cursor: pointer;
	z-index: 13;
}


#addpetuserdiv{
	position: fixed;
	left: 25%;
	top: 10px;
	width: 640px;
	height: 560px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:13;
	display: none;
	overflow:auto;
}



/* 添加用户 */

#maska {
	background: silver;
	display: none;
	z-index: 10;
	opacity: 0.4 !important;
	position: absolute;
	left: 0px;
	top: 0px;
}

/* 关闭添加用户div */
#Xaddpetuserdiv {
	font-size: 30px;
	font-weight: 400px;
	position: absolute;
	left: 590px;
	cursor: pointer;
	z-index: 13;
}


</style>
  </head>
  	
  	
  	<link href="css/bootstrap.min.css" rel="stylesheet"></link>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootbox.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	
	
  <body>
	  <!-- 查询用户 -->
	  <br/>
	  <center>
	  	<form action="findbyname.action" method="post">
	  		
		  		<input type="text" name="search" value="${search}" style="width:220px" class="form-control">
		  		<input type="submit" value="搜索" class="btn btn-info" style="position: absolute; font-size:15px;left:700px;top:20px">
	  		
	  		
  		</form>
	<a id="addpetuser" style="font-size:20px">添加用户</a>
	</center>
	  	<!-- 所有用户 -->
	<table class="table table-striped"
		style="position:absolute;top:120px;color: black;">
		<thead>
			<br><br>
			<tr>
				<th>用户编号</th>
				<th>登录账号</th>
				<th>登录密码</th>
				<th>真实姓名</th>
				<th>身份证</th>
				<th>宠物数量</th>
				<th>用户电话</th>
				<th>余额</th>
				<th>操作</th>
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
						<td>${l.utelephone }</td>
						<td>${l.ubalance }</td>
						<td>
							<a onclick="updpetuser('${l.userno }','${l.uname }','${l.upassword }','${l.urealname }','${l.uid }','${l.unumberOfPets }','${l.urole }','${l.utelephone }','${l.ubalance }')">修改</a>
							<a onclick="showallpetuserdivs('${l.userno }')">添加宠物</a>
							<a onclick="showallpetuserdiv('${l.userno }')">我的宠物</a>
						</td>
					</tr>
				</c:forEach>
           <tr>
               <td colspan="6">
	               <pg:pager url="PetUserManage"  items="${pu.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pu.pagesize}" >
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
	
	
	
	
	<!-- 用户修改 -->
	<div id="masksss"></div>
	  	<div id="updpetuserdiv">
	<div id="XUpdUserDiv">X</div>
		<center>
		<h3>修改用户信息</h3>
		<form action="updpetuser.action" onsubmit="return updpetusercheck();" method="post">
		<table style="font-size:20">
			<tr>
				<td>用户名称：</td>
				<td>
					
					<input type="text" name="uname" id="uname" disabled class="form-control" /><br/>
				</td>
				<br/>
			</tr>

			<tr>
				<td>用户密码：</td>
				<td>
					<input type="text"  name="upassword" id="upassword" class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>真实姓名：</td>
				<td>
					<input type="text" name="urealname" readonly id="urealname" class="form-control" /><br/>
				</td>
			</tr>
			
			<tr>
				<td>身份证号：</td><br/>
				<td>
					<input type="text" name="uid" id="uid" readonly class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>联系方式</td>
				<td><div>
					<input type="text" name="utelephone" readonly id="utelephone" class="form-control" /><br/>
				</div>
				</td>
			</tr>
			<tr>
				<td>余额</td>
				<td>
					<input type="text" name="ubalance" id="ubalance" readonly class="form-control" /><br/>
				</td>
			<tr>
			<tr>
				<td><!-- 宠物主人 --></td>
				<td>
					<input type="hidden" name="userno" id="userno" class="form-control" readonly/>
				</td>
			<tr>
				<th>
					
				</th>
				<th><input type="submit" value="修改" class="btn btn-info" /><span id="upd"></span></th>
			</tr>
		</table>
		</form>
		</center>
	</div>
	  
	
	
	
	
	
	<!-- 查询我的宠物 -->
	<div id="maskss"></div>
	<div id="allpetuserdiv">
	<div id="XAllUserDiv">X</div>
		<center>
		<table class="table" id="ajaxq">
			<!-- ajax拼接页面 -->
		</table>
		</center>
		</div>
	
	
	<!-- 添加用户 -->
	<div id="maska"></div>
	<div id="addpetuserdiv">
	<div id="Xaddpetuserdiv">X</div>
		<center>
		<form action="savepetuser.action" method="post"  onsubmit="return check();" enctype="multipart/form-data" >
		<table style="font-size:20">
			<h3>添加用户</h3>
			<tr>
				<td>用户名称：</td>
				<td>
					<input type="hidden" name="userno"  />
					<input type="text" id="unames" onblur="c1()" name="uname" class="form-control" /><br/>
					<span id="msgname" style="font-size:15px">只能输入英文，数字或，2-30个中文</span>
					 <span id="msgname1" style="font-size:15px"></span>
				</td>
			</tr>
			<tr>
				<td>用户密码：</td>
				<td>
					<input type="text" id="pwd" name="upassword" value="s123456" onblur="c2()" class="form-control" /><br/>
					<span style="font-size:15px" id="msgpass" style="font-size:12">只能输入6-16位数字或英文字母</span>
				</td>
			</tr>
			<tr>
				<td>真实姓名：</td>
				<td>
					<input type="text" id="urealnames"  name="urealname" onblur="c3()" class="form-control" /><br/>
					<span id="urealnames1" style="font-size:15px">只能输入2-30个中文或英文</span>
				</td>
			</tr>
			<tr>
				<td>身份证号：</td>
				<td>
					<input type="text" name="uid" id="uids" onblur="c4()" class="form-control" /><br/>
					<span id="msguid" style="font-size:15px"></span>
					 <span id="msguid1" style="font-size:15px"></span>
				</td>
			</tr>
			<tr>
				<td><!-- 用户状态： --></td>
				<td>
					<input type="hidden" name="urole" value="0" class="form-control" /><br/>
				</td>
			</tr>
			<br/>
			<tr>
				<td>联系方式：</td>
				<td>
					<div>
						<input type="text" name="utelephone" id="utelephones" onblur="c5()" class="form-control" /><br/>
						<span id="msgutelephone" style="font-size:15px"></span>
					 	<span id="msgutelephone1" style="font-size:15px"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td><!-- 余额 --></td>
				<td>
					<input type="hidden" name="ubalance" value="0" class="form-control"/>
				</td>
			</tr>
			<tr>
				<th>
					
				</th>
				<th><input type="submit" value="添加" class="btn btn-info" /><span id="zhuce"></span></th>
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
		<form action="savepets.action" method="post" onsubmit="return addpetcheck()" enctype="multipart/form-data" >
		<table style="font-size:20">
			<h3>添加新的宠物</h3>
			<tr>
				<td>宠物名称：</td>
				<td>
					<input type="hidden" name="petno"  />
					<input type="text"  name="pname" id="pnames" class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>宠物年龄：</td>
				<td>
					<input  type="number" min="0" max="20" value="0"name="page" id="pages" class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>宠物体重：</td>
				<td>
					<input  type="number" min="0" max="40" value="0"name="pweight" id="pweights"  class="form-control" /><br/>
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
					<input type="hidden" id="usernos" name="pusers.userno" class="form-control"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					
				</th>
				<th><input type="submit" class="btn btn-info" value="添加" /></th>
			</tr>
		</table>
		</form>
		</center>
	</div>
	  
	  
	  
	  
	  
	  
	  
	  
	  
    	
  <%-- <div id="masks"></div>
	<div id="addpetdiv">
	<div id="XAddDiv">X</div>
		<center>
		<form action="savepets.action" method="post" enctype="multipart/form-data" >
		<table style="font-size:20">
			<h3>添加新的宠物</h3>
			<tr>
				<td>宠物名称：</td>
				<td>
					<input type="hidden" name="petno"  />
					<input type="text"  name="pname" class="form-control" value="${pets[0].pname }"/><br/>
				</td>
			</tr>
			<tr>
				<td>宠物年龄：</td>
				<td>
					<input type="text" name="page" class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>宠物身高：</td>
				<td>
					<input type="text" name="pweight" class="form-control" /><br/>
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
     				<input name="pstate" type="radio" value="2">死亡
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
				<th>
					
				</th>
				<th><input type="submit" value="添加" /></th>
			</tr>
		</table>
		</form>
		</center>
	</div> --%>
    <!-- 修改 -->
	<!-- <div id="personaldiv"> -->
	<div id="petalldiv">
	<div id="XDiv">X</div>
		<center>
		<h3>修改宠物信息</h3>
		<form action="updpets.action" method="post">
		<table style="font-size:20">
			<tr>
				<td>宠物名称：</td>
				<td>
					<input type="hidden" name="petno" id="petno" />
					<input type="text" name="pname" id="pname" class="form-control" /><br/>
				</td>
				<br/>
			</tr>
			<tr>
				<td>宠物年龄：</td>
				<td>
					<input  type="number" min="0" max="20" value="0" class="form-control" /><br/>
				</td>
			</tr>
			<tr>
				<td>宠物身高：</td>
				<td>
					<input  type="number" min="0" max="40" value="0" class="form-control" /><br/>
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
					<input type="file" name="pimgs"
						style="width:183px;height:25px;" id="pimg" /><br/>
				</div>
				</td>
				</td>
			</tr>
				<th>
				</th>
				<th><input type="submit" value="修改" class="btn btn-info" /></th>
			</tr>
		</table>
		</form>
		</center>
	</div>
    	
    	
   <script type="text/javascript">	
   
   function showallpetuserdiv(userno){
	    $("#allpetuserdiv").slideToggle("slow");
		$("#maskss").css("display", "block");
		$("#maskss").css("width", "100%");
		$("#maskss").css("height", "2000px");
	    
	    $.ajax({
	    url:"findbypuser.action",
	    type:"post",
	    data:{userno : userno},
	    /* data:{puser:$("#userno").val()}, */
	    
	    success:function(data){
	    	var a="<tr><th></th></tr>";
	    	a += "<tr><th>宠物编号</th><th>宠物姓名</th><th>宠物年龄</th><th>宠物体重</th><th>绝育状态</th><th>宠物种类</th><th>宠物状态</th><th>宠物图片</th></tr>";
	    	//声明绝育那一列
	    	var psterilizationState="";
	    	//声明宠物种类
	    	var pcatanddog="";
	    	//声明宠物状态
	    	var pstate="";
	    	for (var i = 0; i < data.length; i++) {
	    	a+="<tr>";
	    		a+="<th>"+data[i].petno+"</th>";
	    		a+="<th>"+data[i].pname+"</th>";
	    		a+="<th>"+data[i].page+"</th>";
	    		a+="<th>"+data[i].pweight+"</th>";
	    		//判断绝育状态
				if (data[i].psterilizationState == 0) {
					a+="<th>已绝育</th>";
				}else{
					a+="<th>未绝育</th>";
				}
				//判断宠物种类
				if (data[i].pcatanddog == 0) {
					a+="<th>猫</th>";
				}else{
					a+="<th>狗</th>";
				}
				
				if (data[i].pstate == 0) {
					a+="<th>正常</th>";
				}else if (data[i].pstate == 1){
					a+="<th>生病</th>";
				}else{
					a+="<th>死亡</th>";
				}
				a+="<th><img src='http://localhost:8081/img/"+data[i].pimg+"' style='width:70px;'></th>";
				
				
				a+="</tr>";
				/* a += "<tr><th>"+data[i].petno+"</th><th>"+data[i].pname+"</th><th>"+data[i].page+"</th><th>"+data[i].pweight+"</th><th>"+data[i].psterilizationState+"</th><th>"+data[i].pcatanddog+"</th><th>"+data[i].pstate+"</th><th>"+data[i].pimg+"</th></tr>"; */
			}
	    	$("#ajaxq").html(a);
	    },
	    errror:function(){
	    }
	    });
	    
	}
   
   
	/*a标签悬浮事件  */
	$("a").hover(function() {
		$(this).css("color", "orange");
	}, function() {
		$(this).css("color", "#777");
	});
	/*关闭注册账号div  */
	$("#XAllUserDiv").click(function() {
		$("#allpetuserdiv").slideToggle("slow");
		$("#maskss").css("display", "none");
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
	
	
	
	
	/*关闭修改用户div  */
	$("#XUpdUserDiv").click(function() {
		$("#updpetuserdiv").slideToggle("slow");
		$("#masksss").css("display", "none");
	});
	
	/* 用户修改传值 */
	function updpetuser(userno,uname,upassword,urealname,uid,unumberOfPets,urole,utelephone,ubalance){
		$("#updpetuserdiv").slideToggle("slow");
		$("#masksss").css("display", "block");
		$("#masksss").css("width", "100%");
		$("#masksss").css("height", "2000px");
		

		$("#userno").val(userno);
		$("#uname").val(uname);
		$("#upassword").val(upassword);
		$("#urealname").val(urealname);
		$("#uid").val(uid);
		$("#unumberOfPets").val(unumberOfPets);
		$("#urole").val(urole);
		
		$("#utelephone").val(utelephone);
		$("#ubalance").val(ubalance);
		
		
	}
	
	
	
	/*宠物修改传值*/
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
	
	
	/*添加宠物传值*/
	
	function showallpetuserdivs(userno){
	
		$("#addpetdiv").slideToggle("slow");
		$("#masks").css("display", "block");
		$("#masks").css("width", "100%");
		$("#masks").css("height", "2000px");
		$("#usernos").val(userno);
	}
	
	
	
	
	/*添加用户*/
	
	$("#addpetuser").click(function(){
		$("#addpetuserdiv").slideToggle("slow");
		$("#maska").css("display", "block");
		$("#maska").css("width", "100%");
		$("#maska").css("height", "2000px");
	});
   
   
	/*a标签悬浮事件  */
	$("a").hover(function() {
		$(this).css("color", "orange");
	}, function() {
		$(this).css("color", "#777");
	});
	/*关闭注册账号div  */
	$("#Xaddpetuserdiv").click(function() {
		$("#addpetuserdiv").slideToggle("slow");
		$("#maska").css("display", "none");
	});
	
	
	
	
	
	
	
	//添加用户验证
	//验证用户名
		var flg=true;
  		 var aaa=true;
		  function c1(){
		     var num=$("#unames").val();
		     var reg=/^([\u4e00-\u9fa5]+|[0-9a-zA-Z]+){2,30}$/;
			    if(reg.test(num))
				{
					 $("#msgname").empty();
		      $.ajax({
			       url:"findbyunamesname.action",
			       type:"post",
			       data:{unamesname:$("#unames").val()},
			       success:function(data){
			       if(data==1)
			       {
			       flg=false;
			       $("#msgname1").html("");
			       $("#msgname1").css("color","red");
			       $("#msgname1").html("用户名已存在");
			       }
			       else{
			       $("#msgname1").html("");
			       $("#msgname1").css("color","black");
			        $("#msgname1").html("用户名可用");
			        flg=true;
			       }
			       }
		      });
			      aaa= true;
				}else{
				 $("#msgname").html("");
			  $("#msgname").css("color","red");
			  $("#msgname1").html("");
			  $("#msgname").html("姓名格式有误");
			  
			   aaa= false;
				}
				return(flg&&aaa);
		 }
	
	
	
	
	 function c2()
		
		{	
			//验证密码
			var passwords = document.getElementById('pwd').value;
			var reg=/^[0-9a-zA-Z]{6,16}$/;
			if(reg.test(passwords))
			{
					$("#msgpass").html("");
					return true;
				}	
			else
			{
				$("#msgpass").css("color","red");
				$("#msgpass").html("密码格式输入错误，请重新输入");
				return false;
			}
		}  
		
		
		//真实姓名验证
		function c3(){
			var num1=$("#urealnames").val();
      		var reg1=/^[a-zA-Z\u4e00-\u9fa5]{2,30}$/;
			if(reg1.test(num1))
			{
					$("#urealnames1").html("");
					return true;
				}	
			else
			{
				$("#urealnames1").css("color","red");
				$("#urealnames1").html("姓名格式输入错误，请重新输入");
				return false;
			}
 		}
 			//身份证验证
	var fle=true;
	var bbb=true;
	function c4(){
	var icard=$("#uids").val();
			if(isIdCardNo(icard))
			{
			
			  $.ajax({
		       url:"findByUid.action",
		       type:"post",
		       data:{uid:$("#uids").val()},
		       success:function(data){
		       if(data==1)
		       {
		       fle=false;
		       $("#msguid").html("");
		       $("#msguid1").css("color","red");
		       $("#msguid1").html("身份证已存在");
		       }
		       else{
		       $("#msguid").html("");
		        $("#msguid1").css("color","black");
		        $("#msguid1").html("身份证可用");
		        fle= true;
		       }
		       }
	      });
			   bbb= true;
			}else{
				$("#msguid1").html("");
			 $("#msguid").css("color","red");
		  $("#msguid").html("身份证是假的");
		  bbb= false;
			}
			return(fle&&bbb);
	}
		function check(){
			 if(c1()&&c2()&&c3()&&c4()&&c5()){
			    $("#zhuce").html("");
			    return true;
			 }else{
			    $("#zhuce").css("color","red");
			    $("#zhuce").html("信息有误，提交失败");
			    return false;
				}
			}
 //电话号码验证
			var fla=true;
			var ccc=true;
			function c5(){
			 var phone=$("#utelephones").val();
			/*  var reg2=/^^1[34578]\d{9}^1\d{10}$/; */
		    if((/^1[34578]\d{9}$/.test(phone)) && (/^1\d{10}$/)){
		  	$("#msgutelephone").html("");
		  
		  
		  $.ajax({
			       url:"findByPhone.action",
			       type:"post",
			       data:{utelephone:$("#utelephones").val()},
			       success:function(data){
			       if(data==1)
			       {
			       fla=false;
			       $("#msgutelephone").html("");
			       $("#msgutelephone1").css("color","red");
			       $("#msgutelephone1").html("手机号已存在");
			       }
			       else{
			       $("#msgutelephone").html("");
			        $("#msgutelephone1").css("color","black");
			        $("#msgutelephone1").html("手机号可用");
			        fla= true;
			       }
			       }
		 });
				   ccc= true;
		 } else{
		 		$("#msgutelephone1").html("");
				$("#msgutelephone").css("color","red");
				$("#msgutelephone").html("联系方式格式错误");
				return false;
		}
		   return(fla&&ccc);
		}
		//修改用户验证
		
		function updpetusercheck(){
			 var upassword = $("#upassword").val();
			 if( upassword == ""|| upassword == null){
			    
			    bootbox.alert("所有框不允许有空值");
			    return false;
			 }else{
			    $("#upd").html("");
			    return true;
				}
			}
			//添加宠物非空验证
		function addpetcheck(){
			 var pnames = $("#pnames").val();
			 if(pnames == "" || pnames == null || pages=="" || pages== null || pweights == "" || pweights == null){
			    
			    bootbox.alert("所有框不允许有空值");
			    return false;
			 }else{
			    return true;
				}
			}
		
	</script>
  </body>
</html>
