<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<!-- ------------------------------------------------------- -->
	<header style="height:95px;"></header>
	<div class="container">
		<div class="row col-xs-6 col-xs-push-3">
			<h3>이벤트 글 작성 페이지</h3>
			<form action="insert.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label pic-label" for="pic">사진</label>
					<input class="form-control" type="file" id="pic" name="file" />
				</div>
				<div class="form-group">
					<label class="control-label" for="title">제목</label>
					<input class="form-control" type="text" id="title" name="title" />
				</div>
				<div class="form-group">
					<label class="control-label" for="url">설명</label>
					<input class="form-control" id="url" name="url"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="eventDate">이벤트 기간</label>
					<input class="form-control" id="eventDate" name="eventDate"/>
				</div>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
	<footer style="height:50px"></footer>
</body>

</html>