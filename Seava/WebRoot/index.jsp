<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style>
<!--
.button
{
	width:80px;
	height:32px;
	line-height:30px;
	text-align:center;
	font-size:16pt;
	
}


body{
background-color:#f0f0f0; /* 设置页面背景颜色 */
margin:0px;
padding:0px;

}


.input01
{
	border: 1px solid #CDC28D; 
	background-color: #F2F9FD; 
	height: 32px; 
	width: 350px; 
	padding-top: 4px; 
	font-family: Arial, Helvetica, sans-serif; 
	font-size: 16px; 
	padding-left: 8px; 
}


-->
</style>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Seava</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<script type="text/javascript" src="dwr/interface/searchService.js"></script>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	
	<script type="text/javascript" language="javascript">
	
	var request;
	var minpage;
	var maxpage;
	var startindex;
	var hasnext;
	
	function doSearch(type)
	{
		var result = document.getElementById("result");
		var pagingdiv = document.getElementById('paging');
		
		result.innerHTML = "";
		pagingdiv.innerHTML = "";
		
		if(type != 'paging')
		{
			var startindexinput = document.getElementById('startindex');
			startindexinput.value = "1";
		}
		
		request = {startindex:1, query:""};
		DWRUtil.getValues(request);
		
		searchService.getSearchResults(request, fillPage);
	}
	
	
	function fillPage(data)
	{
		var list = data.results;
		var resultdiv = document.getElementById('result');
		var pagingdiv = document.getElementById('paging');
		
		resultdiv.innerHTML = "";
		pagingdiv.innerHTML = "";
		
		if(list.length == 0)
		{
			resultdiv.innerHTML = "<span>Sorry, we can't find what you want...</span>";
		
			return;
		}
		
		for(var i = 0; i < list.length; i++)
		{
			var ele = document.createElement('div');
			
			ele.setAttribute('id', 'info' + list[i]);
			ele.innerHTML = "<span>loading...</span>";
			resultdiv.appendChild(ele);
			searchService.getSearchResultById(list[i], fillDetailResult);		
		}
		
		minpage = data.minpage;
		maxpage = data.maxpage;
		startindex = data.startindex;
		hasnext = data.hasnext;
		
		if(minpage != 1)
		{
			var link = document.createElement('a');
			
			link.setAttribute("href", "javascript:paging(' "+ ((minpage - 11) * 10 + 1) + " ')");
			link.innerHTML = "前10页<<";
			pagingdiv.appendChild(link);
		}
		
		for(var j = minpage; j <= maxpage; j++)
		{
			if(((j - 1) * 10 + 1) != startindex)
			{
				var link = document.createElement('a');
				
				link.setAttribute("href", "javascript:paging(' " + ((j - 1) * 10 + 1) + " ')");
				link.innerHTML = "第" + j + "页";
				pagingdiv.appendChild(link);
			}
			else
			{
				pagingdiv.innerHTML += ("第" + j + "页");
			}

		}
		
		if(hasnext == 1)
		{
			var link = document.createElement('a');
			
			link.setAttribute("href", "javascript:paging(' " + (maxpage * 10 + 1) + " ')");
			link.innerHTML = ">>后10页";
			pagingdiv.appendChild(link);
		}
	}
	
	
	function fillDetailResult(record)
	{
		var result = document.getElementById('info' + record.id);
		
		result.innerHTML = "<table border='0' cellpadding='0' cellspacing='0' width=500><tr><td width='120'><img src = 'image/" + record.imageUrl +"' height='50' width='50'/></td><td><a href='detail.jsp?id="+ record.id +"' target='_blank'><font color=#C60A00 size='2'>" + "<font size='2'>名称：</font>" + record.name + "</font><br>" + "<font size='2'>型号：" + record.type + "</font><br><font color=#C60A00 size='2'>" + record.abstractContent + "....." + "</font><br><a href='"+ record.url +"'>" + "<front size=2>" + record.url + "</front>" + "</a></td></tr></table>";
		
	}
	
	
	function paging(newindex)
	{
		document.getElementById('startindex').value = newindex;
		doSearch('paging');
	}
	
	function handlekey()
	{
		if(document.getElementById('query').value == '')
		{
			return;
		}
		
		var intKey = -1;
		
		if(window.event)
		{
			intKey = event.keyCode;
			
			if(intKey == 13)
			{
				doSearch('');
			}
		}
	}
	</script>
	
	
	
	
	
  </head>
  
  <body>
    <input type="hidden" name="startindex" id="startindex" value="1">
    
    <div id="searchbar">
    	<table align="center">
    		<tr align="center">
    			<td><img src="logs/Slog1.jpg" alt="log1" height="100" width="600" /></td>
    		</tr>
    		<tr align="center">
    			<td><input class="input01" size="50" type="text" name="query" id="query" value="" onkeyup="handlekey()">
    				<input class="button" type="button" value="Search" id="search" onclick="doSearch('')">
    			</td>
 
    		</tr>
    	</table>
    </div>
    <hr>
    
    <div id="result">
    </div>
    
   	<hr>
   	
    <div id="paging">
    </div>
    
    <div id="footer">
    	<table align="center">
    		<tr align="center">
    			<td><img src="logs/slog3.png" alt="my picture" height="20" width="300" /></td>
    		</tr>
    	</table>
    </div>
    
  </body>
</html>
