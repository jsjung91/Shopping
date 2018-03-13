<%@ page import="com.spring.shop.service.MemberService" %>
<%@ page import="com.spring.shop.vo.MemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 특수 문자 선별
	request.setCharacterEncoding("utf-8");
	
	// Param값 받기
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// MemberVo 포장
	MemberVo vo = new MemberVo();
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	
	// insert 쿼리
	MemberService.getInstance().insert(vo);
	
	// 세션에 값 정보 Binding
	session.setAttribute("name", name);
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
	
	response.sendRedirect("member_form.jsp?result=yes");
%>
