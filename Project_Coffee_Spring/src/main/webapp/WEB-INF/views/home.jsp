<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// /home.do 요청을 하도록 리다일렉트 이동시킨다.
	response.sendRedirect(request.getContextPath()+"/board/list.do");
%>