<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>/views/users/private/info.jsp</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div style="padding-top:100px">
		<h3 style="text-align:center"> &laquo; 회원 정보 &raquo;</h3>
		<br />
		<div class="container" style="width:60%">
			<div style="float:right">
				<a href="updateform.do" style="color:green;">정보수정</a>
				/
				<a href="javascript:userConfirm()" style="color:red">탈퇴</a>
			</div>
			<br />
			<table class="table">
				<thead>
					<tr>
						<th>항목</th>
						<th>정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${dto.id }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${dto.email }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${dto.regdate }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		function userConfirm(){
			var isDelete=confirm("탈퇴 하시겠습니까?");
			if(isDelete){
				location.href="delete.do";
			}
			alert("탈퇴 처리 되었습니다.");
		}
	</script>
</body>
</html>