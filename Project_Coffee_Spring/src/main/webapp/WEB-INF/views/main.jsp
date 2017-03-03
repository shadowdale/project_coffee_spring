<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Project_Header.html</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<style>
		html,body{
			height: 100%;
		}
		.help-block{
			display: none;
		}
		.container{
			position: fixed;
			top: 13%;
			left:30%;
		}
		.form-group{
			width:58%;
		}
		.picture{
			height:300px;
			border:1px solid black;
			background-color:rgba(150,50,0,0.1);
		}
		.pic-label{
			width:100%;
		}
		@media (max-width: 1100px){
			.enterance_box{
				margin-left: 30%;
			}
			.enterance_box1{
				width: 100%;
			}
			.enterance_box2{
				width: 100%;
			}
			.container{
				left:20%;
			}
		}
		@media (max-width: 769px){
			.form-group{
				width:100%;
			}
		}
		.enterance_container{
			width: 100%;
			height: 100%;
			background-image: url("${pageContext.request.contextPath }/resources/images/back1.jpg");
			background-size: 100% 100%;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="enterance_container"></div>
	<script>
	var k=2;
		setInterval(function(){
			$(".enterance_container").css("background-image","url(${pageContext.request.contextPath }/resources/images/back"+k+".jpg)").css("transition","background-image 3s");
			k++;
			console.log("Sdf");
			if(k==6){
				k=1;
			}
		},7000);
	</script>
</body>
</html>