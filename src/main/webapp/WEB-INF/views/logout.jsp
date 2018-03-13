<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//세션에 저장된 user 정보 삭제
	session.removeAttribute("user");

	response.sendRedirect("/list");
	
%>