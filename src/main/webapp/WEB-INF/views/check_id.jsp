<%@page import="com.spring.shop.service.MemberService"%>
<%@page import="com.spring.shop.vo.MemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	MemberVo vo = MemberService.getInstance().selectOne(id);
	
	String result = "NO";
	
	// 검색된 ID가 없는 경우 ( 사용가능 )
	if(vo==null)	
		result = "YES";
	
	// JSON 형태로 포장 
	String data = String.format("[{\"result\":\"%s\"}]", result);
	
	out.print(data);
	
%>