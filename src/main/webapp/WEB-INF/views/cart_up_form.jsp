<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function checkdata(f)
{
   category = f.category.value;
   p_idx = f.p_idx.value;
   p_name = f.p_name.value;
   p_company = f.p_company.value;
   p_price = f.p_price.value;
   p_saleprice = f.p_saleprice.value;
   p_content = f.p_content.value;
     
   if(category=="" || p_idx=="" || p_name=="" ||
	  p_company=="" || p_price=="" || p_saleprice=="" ||
	  p_content=="")
   {
	   alert('수정!');
	   return;
   }
   
   f.submit();
  
   
}
</script>
</head>
<body>

<!-- title -->
<jsp:include page="index.jsp"/>
<form name="f" method="post" action="/cart_update"> 
<table align="center" width="600" border="1" 
    style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
    cellpadding="2" cellspacing="0">
    <tr>
        <td>제품 종류</td>
        <td><select name="category">
        		<option value="">카테고리 선택</option>
        		<option value="sho001">Jordan 1</option>
        		<option value="sho003">Jordan 3</option>
        		<option value="sho004">Jordan 4</option>
        		<option value="sho006">Jordan 6</option>
        		<option value="sho008">Jordan 8</option>
        		<option value="sho011">Jordan 11</option>
        		<option value="up001">업템포 시리즈</option>
        </select></td>
    </tr>
    <tr>
        <td>제품 번호</td>
        <td><input name="p_idx" type="text" value="${vo.p_idx }"></td>
    </tr>
    <tr>
        <td>제품 명</td>
        <td><input name="p_name" type="text" value="${vo.p_name }"></td>
    </tr>
    <tr>
        <td>제조사</td>
        <td><input name="p_company" type="text" value="${vo.p_company }"></td>
    </tr>
    <tr>
        <td>가격</td>
        <td><input name="p_price" type="text" value="${vo.p_price }"></td>
    </tr>
    <tr>
        <td>할인 가격</td>
        <td><input name="p_saleprice" type="text" value="${vo.p_saleprice }"></td>
    </tr>    
    <tr>
        <td>제품 설명</td>
        <td><TEXTAREA name="p_content" rows="5" cols="50" >${vo.p_content }</TEXTAREA></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="button" value="수정하기" 
            onclick="javascript:checkdata(this.form);" >
            <input type="reset" value="Clear" >
        </td>
    </tr>    
</table>
</form>
</body>
</html>