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
    
    <title>My JSP 'FinancialStatistics.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <!-- 引入 ECharts 文件 -->
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <style type="text/css">
    	#main{
	    	position:absolute;
		   left:250px;
		   top:120px;
    	}
    	#sel{
	    	position:absolute;
		   left:500px;
		   top:45px;
    	}
    </style>
    <link href="css/bootstrap.min.css" rel="stylesheet"></link>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootbox.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  </head>
 
  <body>
     <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 700px;height:400px;">
    	<center>
				<h1>财务统计</h1>
			</center>
    </div>
    <div id="sel" class="input-group">
    	<select id="month" class="form-control" name="ftimeofoccurrence " style="width:100px;">
    		<option value="0">请选择 </option>
    		<option value="01">一月 </option>
    		<option value="02">二月</option>
    		<option value="03">三月 </option>
    		<option value="04">四月 </option>
    		<option value="05">五月 </option>
    		<option value="06">六月 </option>
    		<option value="07">七月 </option>
    		<option value="08">八月 </option>
    		<option value="09">九月</option>
    		<option value="10">十月</option>
    		<option value="11">十一月</option>
    		<option value="12">十二月</option>
  
    	</select>
    </div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var data=[];
        var data1=[];
        var aaa=${sel};
        for(var i=0;i<aaa.length;i++)
        	{
        		data.push(aaa[i].counts);
        		data1.push(aaa[i].dateweek);
        	}
        
         var myChart = echarts.init(document.getElementById('main'));
          var option = {
        		    title: {
        		        text: '财务统计图',
        		        subtext: '好开心'
        		    },
        		    tooltip: {
        		        trigger: 'axis',
        		        axisPointer: {
        		            type: 'cross'
        		        }
        		    },
        		    toolbox: {
        		        show: true,
        		        feature: {
        		            saveAsImage: {}
        		        }
        		    },
        		    xAxis:  {
        		        type: 'category',
        		        boundaryGap: false,
        		        data: data1,
        		    },
        		    yAxis: {
        		        type: 'value',
        		        axisLabel: {
        		            formatter: '{value} k'
        		        },
        		        axisPointer: {
        		            snap: true
        		        }
        		    },
        		    visualMap: {
        		        show: false,
        		        dimension: 0,
        		        pieces: [{
        		            lte: 6,
        		            color: 'green'
        		        }, {
        		            gt: 6,
        		            lte: 8,
        		            color: 'green'
        		        }, {
        		            gt: 8,
        		            lte: 14,
        		            color: 'green'
        		        }, {
        		            gt: 14,
        		            lte: 17,
        		            color: 'green'
        		        }, {
        		            gt: 17,
        		            color: 'green'
        		        }]
        		    },
        		    series: [
        		        {
        		            name:'所收金额',
        		            type:'line',
        		            smooth: true,
        		            data: data,
        		        }
        		    ]
        		};

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        
        $("#month").change(function(){
        	var l = $("#month").val();
        	window.location.href="FinancialStatistics?month="+l;
        });
    </script>
  </body>
</html>
      