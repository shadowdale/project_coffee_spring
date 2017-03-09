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
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td><a href="${pageContext.request.contextPath }/board/list.do?condition=writer&keyword=${tmp.id }">${tmp.id }</a></td>
						<td>${tmp.email }</td>
						<td>${tmp.regdate }</td>
						<td><input type="checkbox" name="suspended" value="${tmp.id }" <c:if test="${tmp.suspended eq '1' }">checked</c:if>/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script>
	// checkbox에 이벤트 등록
	$("input:checkbox").each(function(){
		// change 이벤트가 발생할 경우
		$(this).on("change", function(){
			var isChecked = $(this)[0].checked;
			var id = $(this).val();
			var ele = $(this);
			$.ajax({
				url: "suspended.do",
				method: "post",
				data: {id:id, isChecked: isChecked},
				success: function(data){

				}
			})
		})
	});
	
	</script>
</body>
</html>