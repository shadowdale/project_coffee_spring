<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="container">
		<ul>
			<li><a href="${pageContext.request.contextPath }/users/private/updateform.do">정보수정</a></li>
			<li><a href="${pageContext.request.contextPath }/admin/user-list.do">회원관리</a></li>
		</ul>
	</div>
</body>
</html>