<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>회원가입</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<style>
		html,body{
			height: 100%;
		}
		header{
			height: 75px;
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
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<header></header>
	<!-- ------------------------------------------------------- -->
	<div class="container">
		<h3>회원가입 페이지 입니다.</h3>
		<form action="signup.do" method="post">
			<input type="hidden" name="num" value="${dto.num }" />
			<div class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" id="id" name="id"/>
				<span class="glyphicon form-control-feedback"></span>
				<p class="help-block">사용할 수 없는 아이디 입니다.</p>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="text" id="pwd" name="pwd"/>
				<span class="glyphicon form-control-feedback"></span>
				<p class="help-block">비밀번호는 8자 이상입력해 주세요.</p>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="text" id="pwd2" />
				<span class="glyphicon form-control-feedback"></span>
				<p class="help-block">비밀번호를 확인해 주세요.</p>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="text" id="email" name="email"/>
				<p class="help-block">이메일 형식을 맞춰주세요.</p>
				<span class="glyphicon form-control-feedback"></span>
			</div>
			<button type="submit" id="signup">가입</button>
		</form>
	</div>

	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script>
		//아이디 입력란에 keyup 이벤트가 발생했을때 실행할 함수 등록 
		$("#id").on("keyup", function(){
			//입력한 아이디 읽어오기
			var inputId=$("#id").val();
			//ajax 요청을 이용해서 서버에 전송	
			$.ajax({
				url:"checkid.do",
				method:"get",
				data:{inputId:inputId},
				success:function(data){
					if(data.canUse && inputId.length != 0){
						pwdSuccess("id");
					}else{
						pwdError("id");
					}
				}
			});
		});
		
		// 비밀번호 입력란에 keyup 이벤트가 발생할때 실행할 함수
		$("#pwd").on("keyup", function(){
			var inputPwd = $("#pwd").val();
			var inputPwd2 = $("#pwd2").val();
			if(inputPwd.length >= 8){ // 
				pwdWarning("pwd");
				if(inputPwd == inputPwd2) {
					pwdSuccess("pwd");
					pwdSuccess("pwd2");
				}
			} else {
				pwdError("pwd");
				if(inputPwd2.length != 0){
					pwdError("pwd2");
				}
			}
			
		});
		
		// 비밀번호 확인 입력란에 keyup 이벤트가 발생할때 실행할 함수
		$("#pwd2").on("keyup", function(){
			var inputPwd = $("#pwd").val();
			var inputPwd2 = $("#pwd2").val();
			if(inputPwd == inputPwd2){
				pwdSuccess("pwd");
				pwdSuccess("pwd2");
			} else {
				pwdWarning("pwd")
				pwdError("pwd2");
			}
			
		});
		
		// 이메일 입력란에 keyup이벤트가 발생할때 실행할 함수
		$("#email").on("keyup", function(){
			var email = $("#email").val();
			var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
			if(regex.test(email) === false) {  // 이메일이 형식에 맞지 않는다면
				pwdError("email")
			} else {
				pwdSuccess("email")
			}
		});
		
		
		
		function pwdSuccess(e){
			$("#"+e)
			.parent()
			.removeClass("has-success has-error has-warning")
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-warning-sign glyphicon-remove")
			.addClass("glyphicon-ok");
		}
		
		function pwdWarning(e){
			$("#"+e)
			.parent()
			.removeClass("has-success has-error has-warning")
			.addClass("has-warning")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-ok glyphicon-remove")
			.addClass("glyphicon-warning-sign");
		}
		
		function pwdError(e){
			$("#"+e)
			.parent()
			.removeClass("has-success has-error has-warning")
			.addClass("has-error")
			.find(".help-block")
			.show()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-ok glyphicon-warning-sign")
			.addClass("glyphicon-remove");
		}
	</script>
</body>
</html>