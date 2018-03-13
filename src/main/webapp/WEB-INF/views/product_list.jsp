<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index.jsp"/>
<div align="center">
   <input type="button" value="상품 등록" onclick="location.href='/insert_form'">
   <input type="button" value="장바구니 보기" onclick="location.href='/cart_list'">
</div>
<br>
<table align="center" width="600" border="1"
 style="border-collapse:collapse;font-size:8pt"
 bordercolor="navy" cellpadding="4" cellspacing="0">
	<tr bgcolor="#dedede">
		<th width="10%">제품번호</th>
		<th width="10%">이미지</th>
		<th width="35%">제품명</th>
		<th width="20%">제품가격</th>
		<th width="25%">정식가격</th>
	</tr>

    <c:if test="${ empty list }">
	    <tr>
	    	<td colspan="5" align="center">
	    	   현재 등록된 상품이 없습니다.
	    	</td>
	    </tr>
    </c:if>

	<c:forEach var="vo" items="${ list }">
		<tr align="center">
			<td>${ vo.p_num }</td>
			<td> <a href="/view/${ vo.idx }">
			<img src="${ pageContext.request.contextPath }/images/${ vo.p_image_s }" 
				width="100" height="90"></a></td>
			<td>
			  <a href="/view/${ vo.idx }">${ vo.p_name }</a>
			</td>
			<td>
				할인가 :<fmt:formatNumber value="${ vo.p_saleprice }"/>원<br>
				<font color="red">
					(DC ${ vo.dc_rate }%)
				</font>
			</td>
			<td>
				단가 :<fmt:formatNumber value="${ vo.p_price }"/>원
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>