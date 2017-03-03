<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>views/users/board_update.jsp</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
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
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<header style="height:95px;"></header>
	<!-- ------------------------------------------------------- -->
		<div class="container">
			<h3>회원가입 페이지 입니다.</h3>
			<form action="signup.do" method="post">
				<input type="hidden" name="num" value="${dto.num }" />
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id"/>
					<p class="help-block">사용할 수 없는 아이디 입니다.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
				<div class="form-group">
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="text" id="pwd" name="pwd"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email"/>
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
					console.log(data);
					$("#id").parent()
					.removeClass("has-success has-error");
					if(data.canUse){
						$("#id")
						.parent()
						.addClass("has-success")
						.find(".help-block")
						.hide()
						.parent()
						.find(".glyphicon")
						.removeClass("glyphicon-remove")
						.addClass("glyphicon-ok");
					}else{
						$("#id")
						.parent()
						.addClass("has-error")
						.find(".help-block")
						.show()
						.parent()
						.find(".glyphicon")
						.removeClass("glyphicon-ok")
						.addClass("glyphicon-remove");
					}
				}
			});
		});
		
		$("#signup").click(function(){
			alert("회원가입을 축하합니다.");
		});
	</script>
</body>
</html>