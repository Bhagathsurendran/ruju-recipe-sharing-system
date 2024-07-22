<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@keyframes rotateLoad {
		from {
			transform:rotate(0deg);
		}
		to {
			transform:rotate(360deg);
		}
	
	}
	.loadingImg{
		height: 150px;animation:rotateLoad 5s linear infinite;
	} 
</style>
</head>
<body onload="redirectHome()" style="background-color: black;">
	<div style="display: flex;justify-content: center;align-items: center;height: 95vh;">
		<img alt="" class="loadingImg" src="img/loadingIdli.png">
	</div>
	
	<script type="text/javascript">
		function redirectHome(){
			setTimeout(()=>{
				window.location.href="/main_project/user.jsp"				
			},2000)
		}
	</script>
</body>
</html>