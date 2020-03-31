<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SingleHomePage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootbox.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  
  <body onload="bodyLoad('${q }')">
		<button class="btn btn-info" 
		style="width:100px;height: 70px;position: absolute;left:300px;
		top:200px;" onclick="aaa()">开始出单</button>
		
		<button class="btn btn-info"
		style="width:100px;height: 70px;position: absolute;left:600px;
		top:200px;" onclick="bbb()">查询出单</button>
  </body>
  <script type="text/javascript">
	function bodyLoad(q){
		if(q==5){
			bootbox.alert("您暂时没有病人");
		}else{
			
		}
	}
	
  	function aaa(){
  		window.location.href="Starttheorder";
  	}
  	
  	function bbb(){
  		window.location.href="FillOutTheForm";
  	}
  </script>
</html>
