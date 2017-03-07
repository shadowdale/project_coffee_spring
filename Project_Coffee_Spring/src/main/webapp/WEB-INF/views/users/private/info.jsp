<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
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
				<c:choose> 
					<c:when test="${admin }">
						<a href="${pageContext.request.contextPath }/users/private/list.do" style="color:green;">회원목록보기</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:userConfirm()" style="color:red">탈퇴</a>					
					</c:otherwise>
				</c:choose>
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