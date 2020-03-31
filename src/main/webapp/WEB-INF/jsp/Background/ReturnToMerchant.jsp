<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付成功</title>
    
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
  </head>
  
  <body onload="onloadbody()">
  	<div style="width: 100%;height: 100px;background-color: #FF6347;">
  		<img src="img/22998165_113703631000_2.jpg"style="width: 50px;height: 50px;position: absolute;left:100px;top:20px;">
  		<span style="font-size: 30px;font-weight: 900;position: absolute;left: 160px;top: 27px;">支付成功!</span>
  	<span style="font-size: 20px;font-weight: 600;position: absolute;left: 310px;top: 32px;" id="anan">5秒后即将关闭此页面：5</span>
  	</div>
  	<script type="text/javascript">
  		function onloadbody(){
  			ss();
			setTimeout(function(){
				window.close();
			},5000);
  		}
  		var i=5;
  		function ss(){
			setTimeout(function(){
				$("#anan").html("5秒后即将关闭此页面："+i);
				i--;
				ss();
			},1000);
  		}
  	</script>
  </body>
</html>