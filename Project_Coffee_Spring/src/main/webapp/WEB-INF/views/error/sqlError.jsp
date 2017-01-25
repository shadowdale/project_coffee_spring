<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<title>/views/error/sqlError.jsp</title>
</head>
<body>
	<h3>에러 페이지</h3>
	<p>DataAccessException!</p>
	<p>에러정보 : <strong>${exception.message }</strong></p>
</body>
</html>