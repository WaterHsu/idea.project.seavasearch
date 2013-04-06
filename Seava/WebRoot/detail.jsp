<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style>

<!--

body{
background-color:#f0f0f0; /* 设置页面背景颜色 */
margin:0px;
padding:0px;

}


-->

</style>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Product details</title>
    
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
	<%String id = request.getParameter("id"); %>
	<input id="id" value=<%=id %> type=hidden />
	<script type="text/javascript">
	
		var _id = document.getElementById('id').value;
		
		searchService.getSearchResultById(_id, fillDetailResult);
	

		
		
		function fillDetailResult(record)
		{
			var image = document.getElementById('image');
			
			image.innerHTML += "<table><tr><td><img src ='image/"+ record.imageUrl +"' height='240' width='240'/></td>" + "<td>" + "<table><tr><td>" + record.name +"</td></tr> <tr><td>" + record.type + "</td></tr></table>" + "</td></tr></table>";
			
			var contentdiv = document.getElementById("detail");
			var table;
			var content = record.content;
			var lines = content.split("\r\n");
			
			if(lines.length > 0)
			{
				table = document.createElement('table');
				
				table.setAttribute("border", "1");
				contentdiv.appendChild(table);
			}
			else
			{
				return;
			}
	
			
			for(var i = 0; i < lines.length; i++)
			{
				var tr = document.createElement('tr');
				tr.setAttribute('bgcolor', '#eeeeee');
				
				var td1;
				var td2;
				var line = lines[i];

					var data1 = line.substring(0, line.indexOf(":"));
					var data2 = line.substring(line.indexOf(":") + 1);
			
				

					if(data1 != "")
					{
						td1 = document.createElement('td');
						td1.innerHTML = "<td><font size=3px>" + data1 + "</font>";
						
					
					}
				
					if(data2 != "")
					{
						td2 = document.createElement('td');
						td2.innerHTML = "<td><font size=3px>" + data2 + "</font>";

						tr.appendChild(td1);
						tr.appendChild(td2);
					
						table.appendChild(tr);
					}
							

			}
			
			contentdiv.innerHTML = contentdiv.innerHTML;
			
			var original = document.getElementById("original");
			
			original.innerHTML = "<a href='" + record.url + "' target='_blank'>" + record.url + "</a>";
		}
		
	</script>

  </head>
  
  <body>
    
	<div id="image">
	</div>
	
	<div id="detail">
	
	</div>
	
	<div id="original">
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
