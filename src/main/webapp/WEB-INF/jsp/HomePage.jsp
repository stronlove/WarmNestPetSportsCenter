<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.d1{
	width: 1200px;
	height: 385px;
	position:relative; 
	margin: 10px auto;
	background: #FDF5E6;
	/* border:2px solid red; */
	top:40px;
	}
.loading{
		width: 100%;
		height: 100%;	
		position:absolute;
		opacity: 0;
		transition:2s;
 	}
.d2{
	width:100%;
	height:385px;
	overflow:hidden;
}
.num_list{
	position:absolute;
	width:100%;left:0px;
	bottom:-1px;
	background-color:#000000;
	color:#FFFFFF;
	font-size:12px;
	padding:6px 0px;
	height:20px;
	overflow:hidden;
}
.num_list span{
	display:inline-block;
	height:16px;
	padding-left:6px;
}
img{
	border:0px;
}
#lbul{
	display:none;
	}
.button{
	position:absolute; 
	z-index:1000; 
	right:0px; 
	bottom:2px; 
	font-size:13px; 
	font-weight:bold; 
	font-family:Arial, Helvetica, sans-serif;
}
.b1,.b2{
	background-color:#666666;
	display:block;
	float:left;
	padding:2px 6px;
	margin-right:3px;
	color:#FFFFFF;
	text-decoration:none;
	cursor:pointer;
	}
.b2{
	color:#FFCC33;
	background-color:#FF6633;
	}
#x1{
   position:absolute;
   left:280px;
   top:450px;
}
#x2{
   position:absolute;
   left:600px;
   top:450px;
}
#x3{
   position:absolute;
   left:900px;
   top:450px;
}
.yang img{
width:300px;height:300px;transition:all 0.5s;
}/*图片放大过程的时间*/
.yang img:hover{ 
transform: scale(1.2);/*鼠标经过图片放大的倍数*/
}
	</style>
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<body onload="loadonceshiq()" style="height:2000px;background: url('img/665a.jpg');">
  <input type="hidden" id="ceshiq" value="${ceshiq}">
  
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="list">暖暖巢宠物康体中心</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="list">首页</a></li>
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
<!-- 广告轮播 -->
<div id="fade_focus">
	<div class="loading">Loading...<br />
	<img src="/UploadPic/2009-3/200932411630437.gif" width="500" height="500" />
	</div>
		<ul id="lbul">
			<li><img src="img/lp3.jpg" width="1200" height="385"/></li>
			<li><img src="img/lp2.jpg" width="1200" height="385"/></li>
			<li><img src="img/lp4.jpg" width="1200" height="385"/></li>
			<li><img src="img/lb5.jpg" width="1200" height="385"/></li>
		</ul>
</div>
<!-- 小图片 -->
	<div id="x1"><img src="img/x1.jpg" width="230" height="230"/></div>
	<div id="x2"><img src="img/x2.png" width="230" height="230"/></div>
	<div id="x3"><img src="img/x3.png" width="230" height="230"/></div>
<!-- 悬浮窗 -->	
	<div 
	style="position:fixed;left:20px;top:150px;width:200px;height:450px;
	background:#FAFAD2;border-radius:25px;opacity:0.8; z-index:10;">
		<img src="img/xfc.jpg" style="width:200px;height:200px;border-radius:25px;";/>
		<ul style="position:absolute;left:70px;top:220px;">
			<li><h3>眼科部</h3></li>
			<li><h3>心脏部</h3></li>
			<li><h3>内脏部</h3></li>
			<li><h3>外科部</h3></li>
		</ul>
	</div>
	<!-- 简介 -->
		<div style="position:absolute;left:300px;top:700px;">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暖暖巢宠物康体中心</h1>	
		  		<h3>暖暖巢宠物康体中心连锁机构1999年成立，<br>
				至今已有19年，致力于宠物疾病的研究<br>
				和临床治疗，旗下拥有12个特色专科临<br>
				床中心。权威医疗资源覆盖全国，多位资<br>
				深专家坐镇，配有400余名精英兽医，各<br>
				地区组成高水准的医疗团队，机构全国每<br>
				年的接诊量高达80余万例。暖暖巢宠物<br>
				康体中心以环球视野，聚焦宠物医学领域<br>
				的发展，坚守国际标准的医疗品质，我们<br>
				引进国际服务理念及顶尖的医疗设备，培<br>
				育医学精英。用实际行动践行“值得生命<br>
				信赖“的品牌理念。</h3><br>
		</div>
		<!-- 简介旁的大狗图片 -->
		<div class="yang"style="position:absolute;left:850px;top:720px;">
			<img src="img/dgg.jpg" style="width:400px;height:400px;border-radius:25px";/>
		</div>
		<!-- 四张大图 -->
		<div class="yang"style="position:absolute;left:180px;top:1200px;">
		<img src="img/dt1.jpg" style="width:450px;height:450px;"/>
		</div>
		<div class="yang"style="position:absolute;left:800px;top:1200px;">
		<img src="img/dt4 (2).jpg" style="width:450px;height:450px;"/>
		</div>
		<div class="yang"style="position:absolute;left:180px;top:1700px;">
		<img src="img/dt2.jpg"  style="width:450px;height:450px;"/>
		</div>
		<div class="yang"style="position:absolute;left:800px;top:1700px;">
		<img src="img/dt3.jpg"  style="width:450px;height:450px;"/>
		</div>
		<!-- 关于我们 -->
			<div style="position:absolute;left:0px;top:1800px;height:200px;
			position:relative; margin: 2px auto;background: #E6E6FA;opacity:0.8;">
			<div style="position:absolute;left:300px;top:30px;">
				<h3>了解暖暖巢宠物康体中心</h3>
					<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于我们<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;呵护爱宠<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务项目<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专家团队<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;医疗网络</h4><br>
			</div>
			<div style="position:absolute;left:800px;top:30px;">
				<h3>关于暖暖巢宠物康体中心</h3>
				<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工作机会<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;优惠活动<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;热点新闻<br></h4>
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
	$("#showlogindiv").click(function(){
		$("#logindiv").slideToggle("slow");
		$("#mask").css("display", "block");
		$("#mask").css("width", "100%");
		$("#mask").css("height", "2000px");
	});
	/*关闭注册账号div  */
	$("#XDiv").click(function() {
		$("#User").val("");
		$("#password").val("");
		$("#logindiv").slideToggle("slow");
		$("#mask").css("display", "none");
	});
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
	}
	
	/* 广告轮播 */
	//主函数
var s=function(){
	var q=$("#ceshiq").val();
	if(q == "2"){
		bootbox.alert("登录成功！！！");
	}else{
		if(q == "3"){
			bootbox.alert("注册成功！！！");
		}
	}
		
var interv=2000; //切换间隔时间
var interv2=10; //切换速速
var opac1=80; //文字背景的透明度
var source="fade_focus" //焦点轮换图片容器的id名称
//获取对象
function getTag(tag,obj){if(obj==null){return document.getElementsByTagName(tag)}else{return obj.getElementsByTagName(tag)}}
function getid(id){return document.getElementById(id)};
var opac=0,j=0,t=63,num,scton=0,timer,timer2,timer3;var id=getid(source);id.removeChild(getTag("div",id)[0]);var li=getTag("li",id);var div=document.createElement("div");var title=document.createElement("div");var span=document.createElement("span");var button=document.createElement("div");button.className="button";for(var i=0;i<li.length;i++){var a=document.createElement("a");a.innerHTML=i+1;a.onclick=function(){clearTimeout(timer);clearTimeout(timer2);clearTimeout(timer3);j=parseInt(this.innerHTML)-1;scton=0;t=63;opac=0;fadeon();};a.className="b1";a.onmouseover=function(){this.className="b2"};a.onmouseout=function(){this.className="b1";sc(j)};button.appendChild(a);}
//控制图层透明度
function alpha(obj,n){if(document.all){obj.style.filter="alpha(opacity="+n+")";}else{obj.style.opacity=(n/100);}}
//控制焦点按钮
function sc(n){for(var i=0;i<li.length;i++){button.childNodes[i].className="b1"};button.childNodes[n].className="b2";}
title.className="num_list";title.appendChild(span);alpha(title,opac1);id.className="d1";div.className="d2";id.appendChild(div);id.appendChild(title);id.appendChild(button);
//渐显
var fadeon=function(){opac+=5;div.innerHTML=li[j].innerHTML;span.innerHTML=getTag("img",li[j])[0].alt;alpha(div,opac);if(scton==0){sc(j);num=-2;scrolltxt();scton=1};if(opac<100){timer=setTimeout(fadeon,interv2)}else{timer2=setTimeout(fadeout,interv);};}
//渐隐
var fadeout=function(){opac-=5;div.innerHTML=li[j].innerHTML;alpha(div,opac);if(scton==0){num=2;scrolltxt();scton=1};if(opac>0){timer=setTimeout(fadeout,interv2)}else{if(j<li.length-1){j++}else{j=0};fadeon()};}
//滚动文字
var scrolltxt=function(){t+=num;span.style.marginTop=t+"px";if(num<0 && t>3){timer3=setTimeout(scrolltxt,interv2)}else if(num>0 && t<62){timer3=setTimeout(scrolltxt,interv2)}else{scton=0}};
fadeon();

}
//初始化
window.onload=s;
</script>
  </body>
</html>