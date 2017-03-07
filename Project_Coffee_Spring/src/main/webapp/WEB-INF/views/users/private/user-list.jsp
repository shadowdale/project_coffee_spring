<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div style="padding-top:100px">
		<h3 style="text-align:center"> &laquo; 회원 정보 &raquo;</h3>
		<br />
		<div class="container" style="width:60%">
			<div style="float:right">
			</div>
			<br />
			<table class="table">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이메일</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.id }</td>
						<td>${tmp.email }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>