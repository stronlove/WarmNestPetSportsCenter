<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<style>
/*全部  */
* {
	margin: 0px;
	padding: 0px;
	}

/* 注册div */
#AllDivid {
	position: absolute;
	top: 80px;
	left: 150px;
	opacity: 0.9;
	width: 1100px;
	height: 550px;
	background: #FFF5EE;
	border-radius: 50px;
	z-index: 1;
}
/*关闭框  */
#XDiv {
	font-size: 40px;
	font-weight: 800;
	position: absolute;
	left: 900px;
	cursor: pointer;
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
#XDiv {
	font-size: 40px;
	font-weight: 1000;
	position: absolute;
	left: 300px;
	cursor: pointer;
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
	top: -11px;
}
/*注册信息表里第二个信息提示框 */
.alert2 {
	top: 75px;
}
/*注册信息表里第三个信息提示框 */
.alert3 {
	top: 160px;
}
/*注册信息表里第四个信息提示框 */
.alert4 {
	top: 245px;
}
/*注册信息表里第五个信息提示框 */
.alert5 {
	top: -10px;
}
/*注册信息表里第六个信息提示框 */
.alert6 {
	top: 70px;
}
</style>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<body style="height:2000px;overflow: hidden" onload="loada();">
<img src="img/t0142944db06d44cbb4.jpg" style="width:100%;height:700px;">
	<input type="hidden" id="bodyloadflk" value="${flk}" />
	<input type="hidden" id="bodyloadid" value="${id}" />
	<input type="hidden" id="UserAjaxSession" value="${UserAjaxSession}" />
	<input type="hidden" value="${q }" id="q">
	<!--导航栏  -->
	 
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
            	<li><a href="personal">个人中心</a></li>
            	<li><a href="HAAWAD">预约挂号</a></li>
            	<li><a href="listDelivery?userno=${petuser.userno }">查看订单</a></li>
            	<li><a href="RegisteredQuery?userno=${petuser.userno}">我的挂号</a></li>
        	</c:if>
        </ul>
        <ul class="nav navbar-nav navbar-right"> 
        	<c:if test="${petuser.uname == null }">
            	<li class="active"><a href="toadd"> 注册</a></li>
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
	<!--遮罩层  -->
<div id="mask"></div>
	<!--注册div  -->
	<div id="AllDivid">
		<!--注册账号名称  -->
		<div style="font-size:50px;position: absolute;left:450px">注册账号</div>
		<!--关闭注册框  -->
	<div id="XDiv"></div>
		<!--注册form表单事件  -->
		<form action="zhucePetUser" enctype="multipart/form-data"
			method="post" onsubmit="return RegisterSubmit();">
			<input id="utelephone1" value="1" type="hidden">
			<!--注册信息div  -->
			<div id="RegistrationDiv">
				<!--注册账号  -->
				<div class="input-group" style="left:-60px;top:-10px;" >
					<span class="input-group-addon" >账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span>
					<input type="text" class="form-control" id="UserRegistration"
						name="uname" style="width:170px;height:50px;"
						placeholder="请输入注册账号" required />
				
				</div>
				<!--注册 账号提示框  -->
				 <div id="RegisterUserPromptBox" class="alert alert-danger alert1" style="left:220px;">6~10位字符，开头必须为字母</div>
				<!--注册密码  -->
				<div class="input-group" style="left:-60px;top:-10px;">
					<span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
					<input type="password" class="form-control" id="PasswordRegistration"
					name="upassword" style="width:170px;height:50px;"
						placeholder="请输入注册密码" required />
				</div>
				<!--注册 密码提示框  -->
				<div id="PasswordRegistrationPrompt"
					class="alert alert-danger alert2" style="left:220px;">6~10位字符，开头可为数字</div>
				<!--注册重复密码-->
				<div class="input-group" style="left:-60px;top:-10px;">
					<span class="input-group-addon">重复密码：</span>
					<input type="password"class="form-control" id="DuplicatePasswordRegistration"
					name="DuplicatePasswordRegistrationreq" style="width:170px;height:50px;"
					placeholder="请重复输入密码" required />
				</div>
				<!--注册 重复密码提示框  -->
				<div id="DuplicatePasswordRegistrationPrompt"
					class="alert alert-danger alert3" style="left:220px;">必须跟密码一样</div>
						

				<!--真实姓名  -->
				<div class="input-group" style="left:-60px;top:-10px;">
					<span class="input-group-addon">真实姓名：</span><input type="text"
						class="form-control" id="RealName" style="width:170px;height:50px;"
						name="urealname" placeholder="请输入真实姓名" required />
				</div>
				<!--注册 真实姓名 提示框  -->
				<div id="RegisteredRealNamePromptBox"
			class="alert alert-danger alert4" style="left:220px;">必须为汉字</div>
	    <input id="utelephone1" value="1" type="hidden">			
    <div style="position:absolute;left:480px;top:0px;">
	<!--注册身份证号  -->
				<div class="input-group" style="margin-top: 7px;top:-15px;">
					<span class="input-group-addon" style="margin-top: 7px;">身份证号：</span>
					<input type="text"class="form-control" id="RegisteredIdentityCardNumber"
						name="uid" style="width:150px;height:50px;"
						placeholder="请输入身份证号" required />
				</div>
				<!--注册 身份证号提示框  -->
				<div id="IdentityCardNumberBox" class="alert alert-danger alert5" style="left:260px;">居民身份证号</div>	
	<div style="position:absolute;left:480px;top:0px;">
		
				<!--电话  -->
			<div class="input-group"  style="margin-top: 7px;top:70px;left:-480px;">
					<span class="input-group-addon">电话号码：</span>
					<input type="text"class="form-control" id="PhoneNumber" style="width:150px;height:50px;"
						name="utelephone" placeholder="请输入电话号" required />
				</div>
				<!--注册 电话号提示框  -->
				<div id="TelephoneNumberBox" class="alert alert-danger alert6" style="left:-220px;">电话号码</div>
				</div>
				</div>
				<!-- 注册按钮 -->
				<div
					style="padding-top: 10px;padding-left: -200px;margin-top: 7px;opacity: 0.7;position: absolute; left:450px;top:305px;">
					<input type="submit" value="注册" style="width: 80px;height:40px;"
						class="btn btn-info" />
				             </div>
			              </div>
			           </div>
		            </form>
	              </div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">

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
		/*body初始事件  */
function loada() {
	var bodyloadid = document.getElementById("bodyloadid").value;
	var bodyloadflk = document.getElementById("bodyloadflk").value;
	if (bodyloadid != "") {
		bootbox.alert("注册成功");
	} else {
		}
	if (bodyloadflk == "0") {
		bootbox.alert("登录失败,账号密码有误");
		} else {
			if ($("#flkj").val() == "1") {
				bootbox.alert("用户已被禁用，请联系管理员");
				}
			}
		}
		
		/*a标签悬浮事件  */
$("a").hover(function() {
	$(this).css("color", "orange");
	}, function() {
    $(this).css("color", "#777");
		});
		/*用户文本验证聚焦离开事件  */
$("#User").blur(
	function() {
	if ($("#User").val() == ""
		|| $("#User").val() == null) {
		$("#UserTextPrompt").html("没有账号？点击<a onclick='DongTaiA()'>注册</a>马上拥有自己的账号");
	} else {
		$("#UserTextPrompt").html("");
	}
});
		
		
		
		
		/*注册表单验证事件  */
function RegisterSubmit() {
   if(a==0 && b==0 && c==0 && d==0 && e==0){
		return true;
	}
			bootbox.alert("请确认信息！！！");
			return false;
			}
	var a=0;
	var b=0;
	var c=0;
	var d=0;
	var e=0;
		
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
					url:"findByname",
				    type:"post",
					data : {
					UserRegistrationval : $("#UserRegistration").val(),},
						success : function(data) {
							if (data > 0) {
									$("#RegisterUserPromptBox").removeClass("alert-success");
									$("#RegisterUserPromptBox").addClass("alert-danger");
									$("#RegisterUserPromptBox").text("已经有这个账号了");
									$("#uname").val("1");
									a=1;
									bootbox.alert("账号已被注册，请重新输入");
									return false;
									}else{ 
									a=0;
									$("#RegisterUserPromptBox").addClass("alert-success");
									$("#RegisterUserPromptBox").removeClass("alert-danger");
									$("#RegisterUserPromptBox").text("输入格式正确");
									$("#uname").val("0");
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
				url : "findByuid",
				type : "post",
				data : {RegisteredIdentityCardNumber : $("#RegisteredIdentityCardNumber").val(),
						},
				success : function(data) {
					if (data > 0) {
					$("#uid").val("1");
					$("#IdentityCardNumberBox").removeClass("alert-success");
					$("#IdentityCardNumberBox").addClass("alert-danger");
				    $("#IdentityCardNumberBox").html("身份证已被注册");
					$("#uid").val("1");
						c=1;
						bootbox.alert("身份证已被注册，请重新输入");
						return false;
						} else {
						$("#uid").val("0");
							c=0;
						}
					},
		        });
		});
		/*电话号码的焦点离开事件  */
$("#PhoneNumber").blur(
		function() {
		var TelephoneVerification = /^1[3|4|5|8][0-9]\d{4,8}$/;
		if (!TelephoneVerification.test($("#PhoneNumber").val())
		|| $("#PhoneNumber").val() == "") {
		$("#TelephoneNumberBox").removeClass("alert-success");
		$("#TelephoneNumberBox").addClass("alert-danger");
		$("#TelephoneNumberBox").text("电话号码");
				d=1;
			} else {
			$("#TelephoneNumberBox").addClass("alert-success");
		    $("#TelephoneNumberBox").removeClass("alert-danger");
			$("#TelephoneNumberBox").text("输入格式正确");
		};
		$.ajax({
		url : "findByphone",
		type : "post",
		data : {
		PhoneNumber : $("#PhoneNumber").val(),
			},
		success : function(data) {
			if (data > 0) {
		    $("#utelephone").val("1");
		    $("#TelephoneNumberBox").removeClass("alert-success");
			$("#TelephoneNumberBox").addClass("alert-danger");
			$("#TelephoneNumberBox").html("手机号已被注册");
			$("#utelephone").val("1");
			d=1;
			bootbox.alert("手机号已被注册，请重新输入");
			return false;
			} else {
					$("#utelephone").val("0");
					d=0;
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
		e=1;
	} else {
	$("#RegisteredRealNamePromptBox").addClass("alert-success");
	$("#RegisteredRealNamePromptBox").removeClass("alert-danger");
    $("#RegisteredRealNamePromptBox").text("输入格式正确");
	e=0;
	}
});
		
	
	</script>
</body>
</html>