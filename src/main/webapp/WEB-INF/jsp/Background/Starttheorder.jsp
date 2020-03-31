<%@ page language="java" import="com.aaa.common.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Starttheorder.jsp' starting page</title>
    
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
	z-index: 5;
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
	width: 350px;
	height: 500px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:10;
	display: none;
}
#PersonalInformationModificationDiv {
	position: absolute;
	left: -20px;
	width: 420px;
	height: 500px;
	border-radius: 30px;
	background-color:white;
}
#PersonalInformationModificationDiv .input-group{
	width: 300px;
}
.input-group{
	margin-bottom: 10px;
}
#countzonghe{
	position:absolute;
	left:745px;
	top:10px;
	width:200px;
	font-size: 20px;
}
#tableOpenList{
	position:absolute;
	left:745px; 
	width:350px;
	height:500px; 
	border-radius: 30px;
	}
#lginaa{
	position: absolute;
	left: 150px;
	top: 50px;
	width: 750px;
	height: 500px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:15;
	display: none;
}
#lginbb{
	position: absolute;
	left: 250px;
	top: 50px;
	width: 600px;
	height: 500px;
	background: white;
	border-radius: 25px;
	opacity: 0.8;
	z-index:20;
	display: none;
}
#XDiv1{
	font-size: 40px;
	font-weight: 800;
	position: absolute;
	left: 700px;
	cursor: pointer;
}
#XDiv2{
	font-size: 40px;
	font-weight: 800;
	position: absolute;
	left: 520px;
	cursor: pointer;
}
</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  
  <body>
  <input type="text" id="wherelike" class="form-control"style="width: 150px;position: absolute;left: 500px;top: 30px;z-index:2;"/>
  <button class="btn btn-info" style="position: absolute;left: 655px;top: 30px;z-index:2;" onclick="onclickwherelike('${o.openlistno }')">查询药品</button>
	<div id="personalinformationmodificationdiv">
		<div style="position:absolute;left:20px;width:900px;height:500px;">
			<center>
				<h1>处方</h1>
			</center>
			<form action="submitOpenList" method="post"
				onsubmit="return submitOpenListverification()">
				<div style="position:absolute;left:10px;top:80px;">
					<div class="input-group">
						<span class="input-group-addon">用户单号：</span>
						<input class="form-control" type="text" value="${o.hangsinglenumber }" readonly>
						<input type="hidden" value="${o.openlistno }" name="openlistno">
					</div>
					<div class="input-group">
						<span class="input-group-addon">用户姓名：</span>
						<input class="form-control" type="text" value="${o.opets.pusers.urealname }"readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon">宠物姓名：</span>
						<input class="form-control" type="text" value="${o.opets.pname }"readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon">症状：</span>
						<textarea class="form-control" rows="4" id="osymptom" name="osymptom"></textarea>
					</div>
					<div class="input-group">
						<span class="input-group-addon">诊疗：</span>
						<textarea class="form-control" rows="4" id="diagnosisandtreatment" name="diagnosisandtreatment"></textarea>
					</div>
					<div class="input-group">
						<span class="input-group-addon">医嘱：</span>
						<textarea class="form-control" rows="4" id="ooctorsorder" name="ooctorsorder"></textarea>
					</div>
					<div
						style="position: absolute; left:300px;top:450px;">
						<input type="submit" value="出单" 
							style="width: 150px;" class="btn btn-info" />
					</div>
					<div
						style="position: absolute; left:470px;top:450px;">
					</div>
				</div>
			</form>
				<div style="position:absolute;left:320px; width:420px;height:450px; overflow :auto">
					<table class="table table-striped" id="tablestripedwhere">
						<c:forEach items="${olist }" var="l">
							<tr>
								<th><img src="<%=Constants.IMG_SERVER %>${l.cpicture }" style="width:50px;height:30px;"></th>
								<th>${l.cprice }</th>
								<th >${l.cfunction }</th>
								<th><button class="btn btn-info"
								onclick="AddForm('${l.commodityno}','${o.openlistno }')">加入表单</button></th>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="countzonghe">总和：${countaa }</div>
				<div id="tableOpenList">
					<table id="tableOpenListtable" class="table table-striped">
						<c:forEach items="${olstt }" var="l">
							<tr>
								<th><img src="<%=Constants.IMG_SERVER %>${l.tcommoditys.cpicture}" style="width:50px;height:30px;"></th>
								<th>${l.tcommoditys.cfunction}</th>
								<th>价格：${l.tcommoditys.cprice}</th>
								<th>数量：${l.tnumber}</th>
								<th><button class="btn btn-info" onclick="reduceaa('${o.openlistno }','${l.terapeuticdrugsno }')">－</button></th>
							</tr>
						</c:forEach>
					</table>
				</div>
			<button class="btn btn-info" onclick="NextClick('${o.openlistno}')"
			style="width: 150px;position: absolute;left:480px;top:530px;">下一个</button>
		</div>
	</div>
	
<button class="btn btn-info" onclick="aasdasd()" style="position: absolute;
left: 257px;top: 167px;z-index:4;">查看</button>
<div id="mask"></div>
		<div id="logindiv" style="overflow :auto;">
		<!--关闭注册框  -->
		<div id="XDiv">X</div>
			<!--宠物医院名称div  -->
			<div
				style="position: absolute; top:20px; left:90px; font-size:40px; color:black;">
				详细信息</div>
				<div style="position:absolute;top:100px;left: 50px">
					<div class="input-group">
						<span class="input-group-addon">姓名：</span><input type="text"
							class="form-control" style="width:150px;" value="${o.opets.pname }"readonly/>
					</div>
					<div class="input-group">
						<span class="input-group-addon">年龄：</span><input type="text"
							class="form-control" style="width:150px;" value="${o.opets.page }"readonly/>
					</div>
					<div class="input-group">
						<span class="input-group-addon">体重：</span><input type="text"
							class="form-control" style="width:150px;" value="${o.opets.pweight }"readonly/>
					</div>
					<div class="input-group">
						<c:if test="${o.opets.psterilizationState==1 }">
							<span class="input-group-addon">绝育状态：</span><input type="text"
								class="form-control" style="width:150px;" value="已绝育"readonly/>
						</c:if>
						<c:if test="${o.opets.psterilizationState==0 }">
							<span class="input-group-addon">绝育状态：</span><input type="text"
								class="form-control" style="width:150px;" value="未绝育"readonly/>
						</c:if>
					</div>
					<div class="input-group">
						<c:if test="${o.opets.pcatanddog==1 }">
							<span class="input-group-addon">种类：</span><input type="text"
								class="form-control" style="width:150px;" value="狗"readonly/>
						</c:if>
						<c:if test="${o.opets.pcatanddog==0 }">
							<span class="input-group-addon">种类：</span><input type="text"
								class="form-control" style="width:150px;" value="猫"readonly/>
						</c:if>
					</div>
				</div>
		</div>
		<c:if test="${counbb>0 }">
		<button onclick="chakanyiwang('${o.opets.petno }')" style="width: 100px;
		height: 50px;position: absolute;left: 200px;top: 20px;" 
		class="btn btn-info">查看以往病例</button>
		
		
		
		</c:if>
		<div id="lginaa" style="overflow :auto;">
		<div id="XDiv1">X</div>
			<!--宠物医院名称div  -->
			<div
				style="position: absolute; top:20px; left:300px; font-size:40px; color:black;">
				以往病例</div>
				<div style="position:absolute;top:100px;left: 50px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<td>开单编号</td>
								<td>挂单单号</td>
								<td>挂单时间</td>
								<td>员工名称</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody id="lginaaTable">
							
						</tbody>
					</table>
				</div>
		</div>
		
		
		
		<div id="lginbb" style="overflow :auto;">
		<div id="XDiv2">X</div>
			<div
				style="position: absolute; top:20px; left:200px; font-size:40px; color:black;">
				处方详情
				</div>
				<div style="position:absolute;top:100px;left: 50px;">
					<div class="input-group">
						<span class="input-group-addon">症状：</span>
						<textarea style="width:420px;" class="form-control" rows="4" id="osymptom123" readonly></textarea>
					</div>
					<div class="input-group">
						<span class="input-group-addon">诊疗：</span>
						<textarea style="width:420px;" class="form-control" rows="4" id="diagnosisandtreatment123" readonly></textarea>
					</div>
					<div class="input-group">
						<span class="input-group-addon">医嘱：</span>
						<textarea style="width:420px;" class="form-control" rows="4" id="ooctorsorder123" readonly></textarea>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>图片</th>
								<th>价格(单个)</th>
								<th>介绍功能</th>
								<th>类型</th>
								<th>数量</th>
							</tr>
						</thead>
						<tbody id="lginaaTable2">
							
						</tbody>
					</table>
				</div>
		</div>
	<script type="text/javascript">
	
		function kaidanxingqing(openlistno){
			$.ajax({
				url : "kaidanxingqing",
				type : "post",
				data : {
					openlistno : openlistno
				},
				success : function(data) {
					var da="";
					if(data.length>0){
						for (var i = 0; i < data.length; i++) {
							da+="<tr>";
							da+="<th><img src='http://localhost:8081/img/"
								+data[i].tcommoditys.cpicture+"' style='width:50px;height:30px;'></th></th>";
							da+="<th>"+data[i].tcommoditys.cprice+"</th>";
							da+="<th>"+data[i].tcommoditys.cfunction+"</th>";
							da+="<th>"+data[i].tcommoditys.ccommodittypetables.cname+"</th>";
							da+="<th>"+data[i].tnumber+"</th>";
							da+="</tr>";
						}
					}else{
						da+="<h1>没开药</h1>";
					}
					$("#lginaaTable2").html(da);
				}
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
			$("#lginbb").slideToggle("slow");
			$("#mask").css("z-index", "16");
		}
		
		function chakanyiwang(petno){
			$.ajax({
				url : "chakanyiwangtable",
				type : "post",
				data : {
					petno : petno
				},
				success : function(data) {
					var da="";
					for (var i = 0; i < data.length; i++) {
						da+="<tr>";
						da+="<th>"+data[i].openlistno+"</th>";
						da+="<th>"+data[i].hangsinglenumber+"</th>";
						da+="<th>"+data[i].listtime.substring(0,16)+"</th>";
						da+="<th>"+data[i].ostafftables.srealname+"</th>";
						da+="<th><button onclick='kaidanxingqing("+data[i].openlistno+")' class='btn btn-info'>查看处方详情</button></th>";
						da+="</tr>";
					}
					if(data.length>1){
						
					}else{
						da += "<h1>暂无病历</h1>";
					}
					$("#lginaaTable").html(da);
				}
			});
			
			
			
			
			$("#lginaa").slideToggle("slow");
			$("#mask").css("display", "block");
			$("#mask").css("width", "100%");
			$("#mask").css("height", "100%");
		}
		function aasdasd(){
			$("#logindiv").slideToggle("slow");
			$("#mask").css("display", "block");
			$("#mask").css("width", "100%");
			$("#mask").css("height", "100%");
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
		/*注册关闭悬浮时间  */
		$("#XDiv1").hover(function() {
			$(this).css("color", "red");
		}, function() {
			$(this).css("color", "black");
		});
		/*关闭注册账号div  */
		$("#XDiv1").click(function() {
			$("#lginaa").slideToggle("slow");
			$("#mask").css("display", "none");
		});
		/*注册关闭悬浮时间  */
		$("#XDiv2").hover(function() {
			$(this).css("color", "red");
		}, function() {
			$(this).css("color", "black");
		});
		/*关闭注册账号div  */
		$("#XDiv2").click(function() {
			$("#lginbb").slideToggle("slow");
			$("#mask").css("z-index", "5");
		});
		function AddForm(commodityno,hangsinglenumber){
			$.ajax({
				url : "AddFormaaa",
				type : "post",
				data : {
					 a : commodityno,
					 b : hangsinglenumber
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
						"</th><th><button class='btn btn-info' onclick='reduceaa("+hangsinglenumber+","+data[i].terapeuticdrugsno+")'>－</button></th></tr>";
						
						ta += data[i].tcommoditys.cprice * data[i].tnumber;
					}
					$("#countzonghe").html("总和:"+ta);
					$("#tableOpenListtable").html(da);
				}
			});
		}
		function NextClick(openlistno){
			  bootbox.confirm(
		                {
		                    message: "确定要进行下一个吗？该订单将作废!!!",
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
		                			window.location.href="NextClickaa?openlistno="+openlistno;
		                        } 
		                    }
		                });
		}
		function submitOpenListverification(){
			if($("#osymptom").val()=="" || 
					$("#diagnosisandtreatment").val()=="" ||
					$("#ooctorsorder").val()==""){
				bootbox.alert("请填写症状，诊疗，和医嘱！");
				return false;
			}else{
			    return true;
			}
		}
		function reduceaa(openlistno,commodityno){
			$.ajax({
				url : "reduce",
				type : "post",
				data : {
					openlistno : openlistno,
					commodityno : commodityno
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
						"</th><th><button class='btn btn-info' onclick='reduceaa("+openlistno+","+data[i].terapeuticdrugsno+")'>－</button></th></tr>";
						
						ta += data[i].tcommoditys.cprice * data[i].tnumber;
					}
					$("#countzonghe").html("总和:"+ta);
					$("#tableOpenListtable").html(da);
				}
			});
		}
		function onclickwherelike(openlist){
			$.ajax({
				url : "selectopenlistwherelike",
				type : "post",
				data : {
					wherelike : $("#wherelike").val(),
					openlist : openlist
				},
				success : function(data) {
					var da="";
					for(var i=0;i<data.length;i++){
						da += "<tr><th><img src='http://localhost:8081/img/"
						+data[i].cpicture+"' style='width:50px;height:30px;'></th><th>"
						+data[i].cprice+"</th><th>"
						+data[i].cfunction+"</th><th><button class='btn btn-info' onclick='AddForm("+data[i].commodityno+","+openlist+")'>加入表单</button></th></tr>";
					}
					$("#tablestripedwhere").html(da);
				}
			});
		}
	</script>
  </body>
</html>