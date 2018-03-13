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
   p_num = f.p_num.value;
   p_name = f.p_name.value;
   p_company = f.p_company.value;
   p_price = f.p_price.value;
   p_saleprice = f.p_saleprice.value;
   p_content = f.p_content.value;
   photo_s = f.photo_s.value;
   photo_l = f.photo_l.value;
   
   if(category=="" || p_num=="" || p_name=="" ||
	  p_company=="" || p_price=="" || p_saleprice=="" ||
	  p_content=="" || photo_s=="" || photo_l==""
   )
   {
	   alert('등록!');
	   return;
   }
   
   f.submit();
   
}
</script>
</head>
<body>
<jsp:include page="index.jsp"/>
<form name="f" method="post" action="/insert" 
      enctype="multipart/form-data"> 
<table align="center" width="600" border="1" 
    style="border-collapse:collapse;font-size:8pt" bordercolor="navy"
    cellpadding="2" cellspacing="0">
    <tr>
        <td>제품 종류</td>
        <td><select name="category">
        		<option value="">Jordan 1</option>
        		<option value="com001">Jordan 4</option>
        		<option value="ole004">Jordan 6</option>
        		<option value="ele002">Jordan 8</option>
        		<option value="sp003">Jordan 11</option>
        </select></td>
    </tr>
    <tr>
        <td>제품번호</td>
        <td><input name="p_num" type="text" ></td>
    </tr>
    <tr>
        <td>제품명</td>
        <td><input name="p_name" type="text" ></td>
    </tr>
    <tr>
        <td>제조사</td>
        <td><input name="p_company" type="text" ></td>
    </tr>
    <tr>
        <td>가격</td>
        <td><input name="p_price" type="text" ></td>
    </tr>
    <tr>
        <td>할인가격</td>
        <td><input name="p_saleprice" type="text" ></td>
    </tr>    
    <tr>
        <td>제품설명</td>
        <td><TEXTAREA name="p_content" rows="5" cols="50"></TEXTAREA></td>
    </tr>
    <tr>
        <td>제품사진(작은사진)</td>
        <td><input type="file" name="photo_s">
    </tr>
    <tr>
        <td>제품사진(큰사진)</td>
        <td><input type="file" name="photo_l">
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="button" value="등록" 
            onclick="javascript:checkdata(this.form);" >
            <input type="reset" value="Clear" >
        </td>
    </tr>    
</table>
</form>
</body>
</html>