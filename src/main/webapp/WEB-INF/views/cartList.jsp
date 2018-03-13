<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function cart_del(idx) {
	if(confirm('정말 삭제 하시겠습니까?')==false) 
		return;
	
	location.href = "/cart_delete?idx="+idx;
}

</script>
</head>
<jsp:include page="index.jsp"/>
<body>
	<table align="center" width="600" border="1" style="border-collapse:collapse;font-size:8pt"
      bordercolor="navy" cellpadding="4" cellspacing="0">
		<tr>
			<td colspan="6">:: 장바구니 내역  ::</td>
		</tr>
		<tr bgcolor="#dedede">
			<th>제품 번호</th>
			<th width="25%">제품명</th>
			<th>단가</th>
			<th>수량</th>
			<th>금액</th>
			<th></th>
		</tr>
		
<!-- for(CartVo vo : list)  -->
<c:forEach  var="vo" items="${ list }" >
		<tr align="center">
			<td>${ vo.p_num }</td>
			<td>${ vo.p_name }</td>
			<td>
				단가 : <fmt:formatNumber value="${ vo.p_price }" /> 원<br>
				<font color="red">
				할인 가격 : <b><fmt:formatNumber value="${ vo.p_saleprice }" /> 원</b>
				</font>
			</td>
			<td>
				<form action="/cart_update" method="post">
					<input type="hidden" name="idx" value="${ vo.idx }">
					<input name="cnt" size="4" align="center" value="${ vo.cnt }">
					<input type="submit" value="수정">
				</form>
			</td>
			<td><fmt:formatNumber value="${ vo.amount }"/> </td>
			<td>
				<input type="button" value="삭제" style="border:1 solid black; cursor:hand"
 				onclick="location.href='/cart_delete?idx=${vo.idx }'">
			</td>
		</tr>
</c:forEach>

	<c:if test="${ empty list }">
		<tr>
			<td colspan="6" align="center">
				<b>장바구니에 제품이 없습니다.</b>
			</td>
		</tr>
	</c:if>

		<tr>
			<td colspan="5" align="right"> 총 결재 금액 : </td>
			<td>
			   <fmt:formatNumber value="${ total }" /> 원
			</td>
		</tr>
	</table>
</body>
</html>
