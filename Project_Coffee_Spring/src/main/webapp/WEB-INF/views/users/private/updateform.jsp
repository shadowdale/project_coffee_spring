<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/private/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div style="padding-top:100px">
	<h3 style="text-align:center">&laquo; 회원정보 수정 &raquo; </h3>
	<br /><br />
	<div class="container" style="width:60%">
		<form class="form-horizontal" action="update.do" method="post" id="updateForm">
			<div class="form-group">
				<input type="hidden" name="id" value="${dto.id }"/>
				<label for="id" class="col-sm-4 control-label">아이디</label>
				<div class="col-sm-8">
					<input type="text" id="id" value="${dto.id }" disabled="disabled" style="display:inline-block; width:100%"/>
				</div>
			</div>
			<div class="form-group">
				<label for="pwd" class="col-sm-4 control-label">비밀번호</label>
				<div class="col-sm-8">
				<input type="password" name="pwd" id="pwd" value="${dto.pwd }" style="display:inline-block; width:100%"/>
				</div>
				<br/>
			</div>
			<div class="form-group">
				<label for="pwd2" class="col-sm-4 control-label">비밀번호 확인</label>
				<div class="col-sm-8">
				<input type="password" id="pwd2" value="${dto.pwd }" style="display:inline-block; width:100%"/>
				</div>
				<br/>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-4 control-label">이메일 주소</label>
				<div class="col-sm-8">
				<input type="text" name="email" id="email" value="${dto.email }" style="display:inline-block; width:100%"/>
				</div>
				<br/>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-10 col-sm-2">
			    	<br/>
			      <button type="submit" class="btn" style="background-color:#3DB7CC; width:100%; color:white" id="update">저장</button>
			    </div>
			  </div>
		</form>
	</div>
</div>
<script>
	document.querySelector("#updateForm")
	.addEventListener("submit", function(event){
		var inputPwd=document.querySelector("#pwd").value;
		var inputPwd2=document.querySelector("#pwd2").value;
		if(inputPwd != inputPwd2){
			alert("비밀번호를 확인 하세요");
			event.preventDefault();//폼전송 막기 
		}
	});

	$("#update").click(function(){
		alert("회원정보가 수정되었습니다.");
	});
</script>
</body>
</html>