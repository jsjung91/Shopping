<%@page import="com.spring.shop.service.MemberService" %>
<%@page import="com.spring.shop.vo.MemberVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//login.jsp?id=aaa&pwd=123

	//request Encoding(암호중 특수문자가 포함될 경우)
	request.setCharacterEncoding("utf-8");
	
	//id & pwd param 값 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// DB에 id & pwd 를 갖는 MemberVo를 얻어온다.
	MemberVo user = MemberService.getInstance().selectOne(id, pwd);
	
	if(user==null){
%>

	<script>
		alert("아이디 또는 패스워드가 맞지 않습니다.");
		location.href='list';
	</script>
<%
	return;
	
	}

	//로그인 성공 한 경우 => 세션에 로그인된 멤버 정보를 Binding
	session.setAttribute("user", user);
	
	//메인페이지로 이동
	response.sendRedirect("list");
	
%>