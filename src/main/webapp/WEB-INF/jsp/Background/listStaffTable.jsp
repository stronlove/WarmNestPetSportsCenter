<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listStaffTable.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
	a:focus{
		
		text-decoration:none
	}
	a:hover{
	color:#f0a986;
	text-decoration:none;
	}
	a:active{
	color:#f0a986;
	text-decoration:none;
	}

/* 注册信息div */
#RegistrationDiv {
	position: absolute;
	left: 100px;
	top: 100px;
}
/* 提示信息框的class */
.alert-danger {
	width: 250px;
	position: absolute;
	left: 270px;
}


/*文本框的class  */
#passwordDiv .input-group {
	opacity: 0.9;
}

/*注册div下的文本框的class  */
#AllDivid .input-group {
	margin-bottom: 35px;

}
/*警示框绿色  */
.alert-success {
	position: absolute;
	left: 270px;
	width: 200px;
}
/*注册信息表里第一个信息提示框 */
.alert1 {
	top: 20px;
}
/*注册信息表里第二个信息提示框 */
.alert2 {
	top: 100px;
}
/*注册信息表里第三个信息提示框 */
.alert3 {
	top: 180px;
}
/*注册信息表里第四个信息提示框 */
.alert4 {
	top: 20px;
}
/*注册信息表里第五个信息提示框 */
.alert5 {
	top: 95px;
}
</style>
  </head>
  
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <body onload="loadlogin('${x}');">
  <input type="hidden" value="${q }" id="q">
	<div id="personalinformationmodificationdiv">
	   <center>
				<h1>个人中心</h1>
			</center>
		<div style="position:absolute;left:55px;top:-10px;width:400px;height:500px;">
			<form action="saveOrUpdate" enctype="multipart/form-data"
			method="post" onsubmit="return RegisterSubmit()">
			
			<!--注册信息div  -->
			<div id="RegistrationDiv">
            <input type="hidden" name="stafftableno" value="${staffTable.stafftableno}">
				<!--注册账号  -->
				<div class="input-group" style="left:-110px;top:20px;" >
					<span class="input-group-addon" >账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span>
					<input type="text" class="form-control" id="UserRegistration"
						name="sname"  value="${staffTable.sname}"  style="width:170px;height:50px;"
						placeholder="请输入注册账号" required />
				
				</div>
				<!--注册 账号提示框  -->
				 <div id="RegisterUserPromptBox" class="alert alert-danger alert1" style="left:160px;">6~10位字符，开头必须为字母</div>
				<!--注册密码  -->
				<div class="input-group" style="left:-110px;top:50px;">
					<span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
					<input type="password" class="form-control" id="PasswordRegistration"
					name="spassword" value="${staffTable.spassword}" style="width:170px;height:50px;"
						placeholder="请输入注册密码" required />
				</div>
				<!--注册 密码提示框  -->
				<div id="PasswordRegistrationPrompt"
					class="alert alert-danger alert2" style="left:160px;">6~10位字符，开头可为数字</div>
				<!--注册重复密码-->
				<div class="input-group" style="left:-110px;top:80px;">
					<span class="input-group-addon">重复密码：</span>
					<input type="password"class="form-control" id="DuplicatePasswordRegistration"
					name="DuplicatePasswordRegistrationreq" style="width:170px;height:50px;"
					placeholder="请重复输入密码" required />
				</div>
				<!--注册 重复密码提示框  -->
				<div id="DuplicatePasswordRegistrationPrompt"
					class="alert alert-danger alert3" style="left:160px;">必须跟密码一样</div>

          <div style="position:absolute;left:480px;top:0px;">
                <!--真实姓名  -->
				<div class="input-group" style="left:-60px;top:20px;">
					<span class="input-group-addon">真实姓名：</span><input type="text"
						class="form-control" id="RealName" style="width:170px;height:50px;"
						name="srealname" value="${staffTable.srealname}" placeholder="请输入真实姓名" required />
				</div>
				<!--注册 真实姓名 提示框  -->
				<div id="RegisteredRealNamePromptBox"
			class="alert alert-danger alert4" style="left:210px;">必须为汉字</div>				
           	<!--注册身份证号  -->
				<div class="input-group" style="left:-59px;top:49px;">
					<span class="input-group-addon" style="margin-top: 7px;">身份证号：</span>
					<input type="text"class="form-control" id="RegisteredIdentityCardNumber"
						name="sid" value="${staffTable.sid}"  style="width:170px;height:50px;"
						placeholder="请输入身份证号" required />
				</div>
				<!--注册 身份证号提示框  -->
				<div id="IdentityCardNumberBox" class="alert alert-danger alert5" style="left:210px;">居民身份证号</div>	
	            <div style="position:absolute;left:480px;top:0px;">
		
					<div class="input-group" style="left:-540;top:180px;">
						<span class="input-group-addon">选择部门：</span>
							<select class="form-control" id="DepartmentTable" name="sdepartments.departmenttableno" style="width:100px;">
								<c:forEach items="${departmentTables }" var="item">
                        <option value="${item.departmenttableno}"
                           <c:if test="${staffTable.sdepartments.departmenttableno==item.departmenttableno }">
                           selected="selected"
                           </c:if>
                        
                        >${item.dname } </option>
                     </c:forEach>
                 </select>
					</div>
					<div class="input-group" style="left:-320px;top:146px;">
							<span class="input-group-addon" >选择角色：</span>
							<select class="form-control"  id="StaffTableoption" name="sroleas.roletableno" style="width:100px;" >
								<c:forEach items="${roleTables}" var="item">
                        <option value="${item.roletableno }"
                         <c:if test="${staffTable.sroleas.roletableno==item.roletableno }">
                           selected="selected"
                           </c:if>
                        >${item.rname } </option>
                     </c:forEach>
                 </select>
                 </div>
					<div
					style="padding-top: 10px;padding-left: -200px;margin-top: 7px;opacity: 0.7;position: absolute; left:-650px;top:305px;">
					<input type="submit" value="提交" style="width: 90px;height:50px;"
						class="btn btn-info"  />
					<a href="StaffTableOperation" >返回上一页</a>
				</div>
				</div>
				</div>
				</div>
			</form>
		</div>
		</div>
	</body>
	<script type="text/javascript">
	$(function(){	
	var name=$("#UserRegistration").val();
	var scard=$("#RegisteredIdentityCardNumber").val();
		if(name.length!=0){
			$("#UserRegistration").attr("disabled","disabled");
		}
		
		if(scard.length!=0){
			$("#RegisteredIdentityCardNumber").attr("disabled","disabled");
			
		}

			
	}); 
	
	/*a标签悬浮事件  */
 $("a").hover(function() {
	$(this).css("color", "black");
	}, function() {
    $(this).css("color", "black");
		});
		
	
		
		/*注册表单验证事件  */
function RegisterSubmit() {
   if(a==0 && b==0 && c==0 && d==0 ){
		return true;
	}
			bootbox.alert("请确认信息！！！");
			return false;
			}
	var a=0;
	var b=0;
	var c=0;
	var d=0;
		
	/*用户名的焦点离开事件  */
 $("#UserRegistration")
	.blur(
		  function() {
		    	var AccountVerification = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){5,9}$/;
				if (!AccountVerification.test($("#UserRegistration").val())
				|| $("#UserRegistration").val() == "") {
				$("#RegisterUserPromptBox").removeClass("alert-success");
				$("#RegisterUserPromptBox").addClass("alert-danger");
				$("#RegisterUserPromptBox").text("6~10位字符，开头必须为字母");
				a=1;
				}else {
				$("#RegisterUserPromptBox").addClass("alert-success");
				$("#RegisterUserPromptBox").removeClass("alert-danger");
				$("#RegisterUserPromptBox").text("输入格式正确");	
				$.ajax({
					url:"findBysname",
				    type:"post",
					data : {
					UserRegistrationval : $("#UserRegistration").val(),},
						success : function(data) {
							if (data > 0) {
									$("#RegisterUserPromptBox").removeClass("alert-success");
									$("#RegisterUserPromptBox").addClass("alert-danger");
									$("#RegisterUserPromptBox").text("已经有这个账号了");
									$("#sname").val("1");
									a=1;
									bootbox.alert("账号已被注册，请重新输入");
									return false;
									}else{ 
									a=0;
									$("#RegisterUserPromptBox").addClass("alert-success");
									$("#RegisterUserPromptBox").removeClass("alert-danger");
									$("#RegisterUserPromptBox").text("输入格式正确");
									$("#sname").val("0");
									 }
								},
						});
					}
			  });
		/*密码的焦点离开事件  */
$("#PasswordRegistration").blur(
		function() {
		var PasswordVerification = /^([a-zA-Z0-9]|[._]){6,10}$/;
		if (!PasswordVerification.test($("#PasswordRegistration").val())
		|| $("#PasswordRegistration").val() == "") {
		   $("#PasswordRegistrationPrompt").removeClass("alert-success");
		   $("#PasswordRegistrationPrompt").addClass("alert-danger");
		   $("#PasswordRegistrationPrompt").text("6~10位字符，开头可为数字");
		   b=1;
		   } else {
		   b=0;
		   $("#PasswordRegistrationPrompt").addClass("alert-success");
		   $("#PasswordRegistrationPrompt").removeClass("alert-danger");
		   $("#PasswordRegistrationPrompt").text("输入格式正确");
			  }
		});
		/*确认密码的焦点离开事件  */
$("#DuplicatePasswordRegistration").blur(
	function() {
		if ($("#PasswordRegistration").val() 
			!= $("#DuplicatePasswordRegistration").val()
		    || $("#DuplicatePasswordRegistration").val() == "") {
			   $("#DuplicatePasswordRegistrationPrompt").removeClass("alert-success");
			   $("#DuplicatePasswordRegistrationPrompt").addClass("alert-danger");
			   $("#DuplicatePasswordRegistrationPrompt").text("必须跟密码一样");
			   b=1;
		       } else {
				$("#DuplicatePasswordRegistrationPrompt").addClass("alert-success");
				$("#DuplicatePasswordRegistrationPrompt").removeClass("alert-danger");
				$("#DuplicatePasswordRegistrationPrompt").text("输入格式正确");
				b=0;
				}
			});
		/*身份证的焦点离开事件  */
$("#RegisteredIdentityCardNumber").blur(
   function() {
	var IDNumber = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
	var area = {
		11 : "北京",
		12 : "天津",
    	13 : "河北",
    	14 : "山西",
    	15 : "内蒙古",
    	21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
    	62 : "甘肃",
		63 : "青海",
    	64 : "宁夏",
		65 : "xinjiang",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
	};
	  if (!IDNumber.test($(
		"#RegisteredIdentityCardNumber").val())
	|| $("#RegisteredIdentityCardNumber").val() == "") {
   	   $("#IdentityCardNumberBox").html("身份证不符合规定");
	   $("#IdentityCardNumberBox").removeClass("alert-success");
	   $("#IdentityCardNumberBox").addClass("alert-danger");
	   $("#IdentityCardNumberBox").html("居民身份证");
	  c=1;
		} else {
		$("#IdentityCardNumberBox").html("身份证格式正确");
		$("#IdentityCardNumberBox").removeClass("alert-danger");
		$("#IdentityCardNumberBox").addClass("alert-success");
	    var ID = $("#RegisteredIdentityCardNumber").val();
		if (ID.substring(17, 18) == "x"
			|| ID.substring(17, 18) == "X") {
			$("#RegisteredSex").val("女");
		}
			if (ID.substring(16, 17) % 2 == 0) {
				$("#RegisteredSex").val("女");
			} else {
				$("#RegisteredSex").val("男");
				}
			  $("#AgeOfRegistrstration").val(
				2017 - ID.substring(6, 10));
			  $("#RegisteredBirthday").val(ID.substring(6, 10) + "-"+ ID.substring(10, 12) + "-"+ ID.substring(12, 14));
			$("#RegisteredBirthplce").val(
			area[ID.substring(0, 2)]);
				};
			$.ajax({
				url : "findBysidcard",
				type : "post",
				data : {RegisteredIdentityCardNumber : $("#RegisteredIdentityCardNumber").val(),
						},
				success : function(data) {
					if (data > 0) {
					$("#sid").val("1");
					$("#IdentityCardNumberBox").removeClass("alert-success");
					$("#IdentityCardNumberBox").addClass("alert-danger");
				    $("#IdentityCardNumberBox").html("身份证已被注册");
					$("#sid").val("1");
						c=1;
						bootbox.alert("身份证已被注册，请重新输入");
						return false;
						} else {
						$("#sid").val("0");
							c=0;
						}
					},
		        });
		});
		/*真实姓名的焦点离开事件  */
$("#RealName").blur(
	function() {
	var NameVerification = /[\u4e00-\u9fa5]/;
	if (!NameVerification.test($("#RealName").val())
	|| $("#RealName").val() == "") {
	$("#RegisteredRealNamePromptBox").removeClass("alert-success");
	$("#RegisteredRealNamePromptBox").addClass("alert-danger");
	$("#RegisteredRealNamePromptBox").text("必须为汉字");
		d=1;
	} else {
	$("#RegisteredRealNamePromptBox").addClass("alert-success");
	$("#RegisteredRealNamePromptBox").removeClass("alert-danger");
    $("#RegisteredRealNamePromptBox").text("输入格式正确");
	d=0;
	}
});
		
	
	</script>
</body>
</html>