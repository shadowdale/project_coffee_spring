<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath }/resources/css/headers.css" rel="stylesheet">

	<div class="enterance_header">
		<div class="enterance_col col col-xs-9">
			<div class="enterance_box enterance_box1 row">
				<div class="enterance_title" id="title2" style="width:13.7%">
					<a class="enterance_title_text" href="${pageContext.request.contextPath }/menu.do">MENU</a>
				</div>
				<div class="enterance_title" id="title3" style="width:15.5%">
					<a class="enterance_title_text" href="${pageContext.request.contextPath }/recipe.do">RECIPE</a>
				</div>
				<div class="enterance_title" id="title1" style="width:20.6%">
					<a class="enterance_title_text" href="${pageContext.request.contextPath }/main.do">COFFEE BOX</a>
				</div>
				<div class="enterance_title" id="title4" style="width:15.4%">
					<a class="enterance_title_text" href="${pageContext.request.contextPath }/board/list.do">BOARD</a>
				</div>
				<div class="enterance_title" id="title4" style="width:5%">
					<a class="enterance_title_text" href="${pageContext.request.contextPath }/event.do">EVENT</a>
				</div>
			</div>
			<span class="line line-1"></span><span class="line line-2"></span><span class="line line-3"></span><span class="line line-4"></span>
			<div class="enterance_box enterance_box2 row">
				<div class="enterance_box_text col col-xs-4">A simple, stunning, powerful Object</div>
			</div>
		</div>
		<div class="enterance_col col col-xs-3">
			<div class="enterance_idClick" data-hide="0">
				<div class="enterance_escape col col-xs-2">
					<img src="${pageContext.request.contextPath }/resources/images/loginIcon.png">
				</div>
				<div class="enterance_idClick_right col col-xs-9">
					<form action="${pageContext.request.contextPath }users/signin.do" method="post" id="signinForm">
						<input type="text" name ="id" class="enterance_idClick_contents idInput col col-xs-7" placeholder="Identification">
						<button class="enterance_idClick_contents submit" id="" type="submit">SUBMIT</button>
						<input type="password" name="pwd" class="enterance_idClick_contents passInput col col-xs-7" placeholder="Password">
					</form>
					<form action="${pageContext.request.contextPath }/users/signupform.do" method="post">
						<button class="enterance_idClick_contents join" id="signinForm2"> JOINUS </button>
					</form>
					<div id="info">
						<p class="pop-text"><a href="${pageContext.request.contextPath }/users/private/info.do"><strong id="user"></strong></a> 님 로그인 중</p>
						<a href="${pageContext.request.contextPath }/users/signout.do" id="signoutLink">Log-Out</a>
					</div>
				</div>
			</div>
			<div class="enterance_idClick2">
				<div class="enterance_idClick2_contents">
					Welcome!<br> You are well logined our system!
				</div>
			</div>
			
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script>
	<c:choose>
		<c:when test="${empty id }">
			$("#info").hide();
		</c:when>
		<c:otherwise>
			$("#user").text("${id }");
			$("#signinForm").hide();
			$("#signinForm2").hide();
		</c:otherwise>
	</c:choose>
		
		// 로그인 처리
		$("#signinForm").submit(function() {
			var id = $("input[name=id]").val();
			var pwd = $("input[name=pwd]").val();
			$.ajax({
				url:"${pageContext.request.contextPath }/users/signin.do",
				method:"post",
				data:{id:id, pwd:pwd},
				success:function(data){
					if(data.isValid && !data.isSuspended){
						alert(id+"님 로그인 되었습니다.");
						$("#signinForm").hide();
						$("#signinForm2").hide();
						$("#info").show();
						$("#user").text(id);
						$("#newContentForm").attr("data-stat","1")
					} else if(data.isValid && data.isSuspended){
						alert("계정이 정지 되었습니다.");
						
					} else {
						alert("로그인에 실패 하셨습니다");
						
					}
				}
			});
			return false;
		})
		
		// 로그아웃 처리
		$("#signoutLink").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath }/users/signout.do",
				method : "get",
				success : function(data){
					alert("로그아웃 되었습니다.");
					$("#signinForm").show();
					$("#signinForm2").show();
					$("#info").hide();
					$("input[name=id]").val("");
					$("input[name=pwd]").val("");
					$("#newContentForm").attr("data-stat","0");
					$(".upDeleteBtn").hide();
				}
			});
			return false;
		});
		
	
	
		var clickNumCount=0;
		$(".enterance_escape").click(function(){
			if($("div[data-hide]").attr("data-hide")==0){
				$(".enterance_idClick")
				.css("background-color","rgba(250,100,100,0.1)")
				.css("transition","all 0.4s")
				.css("-webkit-transform","translateX(-250px)");
				$(".enterance_idClick_contents")
				.css("opacity",0.7)
				.css("transition","all 0.6s");
				$(this)
				.css("background-color","rgba(250,100,100,0.2)");
				$("div[data-hide]").attr("data-hide",1)

			}else if($("div[data-hide]").attr("data-hide")==1){
				$(".enterance_idClick")
				.css("background-color","rgba(250,100,100,0.2)")
				.css("transition","all 0.4s")
				.css("-webkit-transform","translateX(0)");
				$(".enterance_idClick_contents")
				.css("opacity",0)
				.css("transition","all 0.4s");
				$(this)
				.css("background-color","rgba(250,100,100,0.2)");
				$("div[data-hide]").attr("data-hide",0)
			}
			clickNumCount++;
		}).mouseover(function(){
			$(this).find("img").css("opacity",0.6);
		}).mouseout(function(){
			$(this).find("img").css("opacity",0.4);
		});
		
	</script>