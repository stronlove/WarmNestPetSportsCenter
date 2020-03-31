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
    
    <title>My JSP 'UserPays.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
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
#logindiv {
	position: absolute;
	left: 300px;
	top: 50px;
	width: 400px;
	height: 500px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body onload="loadnoq('${q}')">
	<!-- 表格 -->
	<button class="btn btn-info" style="width:100px;height: 30px;position: absolute;left: 500px;top: 50px;z-index:10;" onclick="asd()">
							返回上一页						
	</button>
	<table class="table table-striped"
		style="position:absolute;top:50px;color: black;">
		<thead>
         	 <tr>
           	  <td colspan="6">
             	   <form action="UserPaya">
             	 	请输入用户的姓名:<input type="text" name="likewhere" value="${likewhere }" />
             	 	<br>
             	   <input class="btn btn-info" type="submit" value="搜索">
             	   </form>
            	 </td>
         	 </tr>
         	 
			<tr>
				<th>订单表号</th>
				<th>挂单单号</th>
				<th>挂单状态</th>
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
						<td>${l.hangsinglenumber }</td>
						<c:if test="${l.ostate == 2 }">
							<td>正在付钱..</td>
						</c:if>
						<c:if test="${l.ostate == 3 }">
							<td>付钱结束</td>
						</c:if>
						<c:if test="${l.ostate == 4 }">
							<td>付钱结束</td>
						</c:if>
						<c:if test="${l.ostate == 6 }">
							<td>订单结束</td>
						</c:if>
						<td>${l.listtime.substring(0,16) }</td>
						<td>${l.opets.pname }</td>
						<td>${l.opets.pusers.urealname }</td>
						<td>${l.ostafftables.srealname }</td>
						<c:if test="${l.ostate == 2 }">
							<td><button class="btn btn-info" onclick="fuqian('${l.openlistno }','${l.opets.pusers.userno }')">付钱</button></td>
						</c:if>
						<c:if test="${l.ostate != 2 }">
							<td><button class="btn btn-info" style="background-color: black;">已付钱</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
           <tr>
               <td colspan="6">
	               <pg:pager url="UserPaya"  items="${pm.total}"  export="currentPageNumber=pageNumber"   maxPageItems="${pm.pagesize}" >
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
	
<div id="mask"></div>
		<!--登录div -->
		<div id="logindiv" style="overflow :auto;">
		<!--关闭注册框  -->
		<div id="XDiv">X</div>
			<!--宠物医院名称div  -->
			<div
				style="position: absolute; top:20px; left:90px; font-size:40px; color:black;">
				开始付钱</div>
			<!--form表单 用于登录 -->
			<form action="JumpPayPage" method="post">
				<div style="position:absolute;top:100px;left: 50px">
					<div class="input-group">
						<span class="input-group-addon">症状：</span>
						<textarea style="width:220px;" class="form-control" rows="4" id="osymptom123" readonly></textarea>
					</div>
					<div class="input-group">
						<span class="input-group-addon">诊疗：</span>
						<textarea style="width:220px;" class="form-control" rows="4" id="diagnosisandtreatment123" readonly></textarea>
					</div>
					<div class="input-group">
						<span class="input-group-addon">医嘱：</span>
						<textarea style="width:220px;" class="form-control" rows="4" id="ooctorsorder123" readonly></textarea>
					</div>
					<table id="tableaaa" class="table table-striped" style="position: relative;left: -20px">
						
					</table>
					<input type="hidden" id="openlistno" name="openlistno">
					<input type="hidden" id="usernoa" name="usernoa">
					<div class="input-group">
						<span class="input-group-addon">一共需要：</span><input type="text"
							class="form-control" id="HowMuchIsIt" name="howmuchisit"
							style="width:150px;" value=""/>
					</div>
					<div
						style="position: absolute;left:170px;top:-35px;">
						<input type="submit" value="跳转付钱页面" style="width: 100px"
							class="btn btn-info" />
					</div>
				</div>
			</form>
			<button class="btn btn-info" style="width: 100px;position: absolute;left:50px;top:65px;" onclick="yuefuqian()">余额付钱</button>
		</div>
	<script type="text/javascript">
		function loadnoq(q){
			if(q==7){
				bootbox.alert("付钱失败,余额不足");
			}else{
				if(q==8){
					bootbox.alert("付钱成功");
				}else{
					
				}
			}
		}
		function fuqian(openlistno,usernoa){
			$("#openlistno").val(openlistno);
			$("#usernoa").val(usernoa);
			$.ajax({
				url : "HowMuchIsIt",
				type : "post",
				data : {
					 a : openlistno,
				},
				success : function(data) {
					var da="";
					var ta=0.00;
					for(var i=0;i<data.length;i++){
						da += "<tr><th><img src='http://localhost:8081/img/"
						+data[i].tcommoditys.cpicture+"' style='width:50px;height:30px;'></th><th>"
						+data[i].tcommoditys.cfunction+"</th><th>价格："
						+data[i].tcommoditys.cprice+"</th><th>数量："
						+data[i].tnumber+
						"</th></tr>";
						ta += data[i].tcommoditys.cprice * data[i].tnumber;
					}
					$("#tableaaa").html(da);
					$("#HowMuchIsIt").val(ta);
				},
			});
			$.ajax({
				url : "kaidanxingqing123",
				type : "post",
				data : {
					openlistno : openlistno
				},
				success : function(data) {
					$("#osymptom123").val(data.osymptom);
					$("#diagnosisandtreatment123").val(data.diagnosisandtreatment);
					$("#ooctorsorder123").val(data.ooctorsorder);
				}
			});
  			$("#logindiv").slideToggle("slow");
  			$("#mask").css("display", "block");
  			$("#mask").css("width", "100%");
  			$("#mask").css("height", "100%");
		}
  		function buttonclick(roletableno,rname){
  			window.location.href="UpdateRoletableno?roletableno="+roletableno+"&rname="+rname;
  		}
  		/*注册关闭悬浮时间  */
  		$("#XDiv").hover(function() {
  			$(this).css("color", "red");
  		}, function() {
  			$(this).css("color", "black");
  		});
  		/*关闭注册账号div  */
  		$("#XDiv").click(function() {
  			$("#rname").val("");
  			$("#logindiv").slideToggle("slow");
  			$("#mask").css("display", "none");
  		});
  		function yuefuqian(){
  			window.location.href="yuefuqian?userno="+$("#usernoa").val()+"&HowMuchIsIt="
  					+$("#HowMuchIsIt").val()+"&openlistno="+$("#openlistno").val();
  		}
  		function asd(){
  			window.location.href="UserPays";
  		}
	</script>
  </body>
</html>