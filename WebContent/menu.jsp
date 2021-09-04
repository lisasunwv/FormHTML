<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu page</title>
</head>
<body>
	<button id ='CreateNew'>Create New </button>
	
	<script type="text/javascript">
		document.getElementById("CreateNew").onclick=function()
		{
			location.href="Hello.jsp";
		}
	</script>
	
	<button id ='Update'>Update </button>
	
	<script type="text/javascript">
		document.getElementById("Update").onclick=function()
		{
			location.href="update.jsp";
		}
	</script>
</body>
</html>

						
						
						