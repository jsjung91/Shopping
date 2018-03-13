<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" 
  		content="text/html; charset=UTF-8">
    <title></title>
<style>
  a:link{text-decoration:none; color:navy}
  a:visited{text-decoration:none; color:navy}
  a:hover{text-decoration:none; color:red}
#main{
	cursor:pointer;
	font:inherit;
	color:black;
	padding:11px;
	font-size:28px;
	font-weight: bold;
}

#main:hover{
	color: red;
}
        
</style>
  </head>
  <body>
<table align="center" width="600" border="1"
 style="border-collapse:collapse;font-size:8pt"
 bordercolor="navy" cellpadding="4" cellspacing="0">
  <hr width="600" border="1" noshade color="navy">
  <center>
      <font size="4" color="maroon">
          <b><a href="main.jsp" id="main">Jordan By Cell</a></b>
      </font>
      <hr width="600" border="1" noshade color="navy">
      <jsp:include page="login.jsp"/>
  </center>
  <hr width="600" border="1" noshade color="navy">
  <center>
      <a href="list?category=sho001">Jordan 1</a> || 
      <a href="list?category=sho003">Jordan 3</a> || 
      <a href="list?category=com001">Jordan 4</a> || 
      <a href="list?category=ole004">Jordan 6</a> || 
      <a href="list?category=ele002">Jordan 8</a> || 
      <a href="list?category=sp003">Jordan 11</a> ||
      <a href="list?category=up001">UPTEMPO</a> 
  </center>
  <hr width="600" border="1" noshade color="navy"><hr>
  </table>
  </body>
</html>
