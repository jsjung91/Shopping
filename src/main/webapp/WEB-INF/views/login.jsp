<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
function send(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	
	if(id==''){
		alert('ID 입력 하세요.');
		f.id.focus();
		return;
	}
	if(pwd==''){
		alert('비밀번호를 입력 하세요.');
		f.pwd.focus();
		return;
	}
	f.method = "POST";
	f.action = "login_form.jsp";
	f.submit();
	
}
function findaddr(){
	
	window.open("member_form.jsp","","width=800,height=580");

}

</script>
</head>
<body>
	<c:if test="${ !empty sessionScope.user }">
		<font color="blue">[${ user.name }]</font> 환영합니다.   
		<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">\
		<select>
			<option value="shoe" location.href="index.jsp">신발</option>
			<option value="shoe" onChange="cloth.jsp">옷</option>
		</select>
	</c:if>

	<c:if test="${ empty sessionScope.user }">
		<form>
			<table class="td" width="270px" height="100px" align="center" border="0">
				<tr align="center">
					<td><br>ID &nbsp; 
					<input type="text" name="id" style="width: 150px" placeholder="ID" ></td>
           		<tr align="center">
           			<td>PW <input type="password" name="pwd" style="width: 150px" placeholder="Password"></td>
          		</tr>
           		<td colspan="2" rowspan="1"><br>
           			<input type="button" name="login" value="LOGIN" class="log" onClick="send(this.form)" style="width: 100px; height: 30px; margin-top:-5%; margin-left:10% "/>
           			<input type="button" class="join" value="JOIN" onclick="findaddr();" style="width: 110px; height: 30px; margin-top:-5%;"/></td>
         	</table>
 		</form>
 	</c:if>
</body>
</html>
