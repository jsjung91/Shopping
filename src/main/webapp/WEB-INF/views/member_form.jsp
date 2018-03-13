<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
</style>
<script type="text/javascript">
	function send(f) {

		var name = f.name.value;
		var id = f.id.value;
		var pwd = f.pwd.value;

		if (name == '') {
			alert('이름을 입력하세요.');
			f.name.focus();
			return;
		}

		if (id == '') {
			alert('아이디를 입력하세요.');
			f.id.focus();
			return;
		}

		if (pwd == '') {
			alert('비밀번호를 입력하세요.');
			f.pwd.focus();
			return;
		}

		f.submit();

	}
	/* 아이디 중복 체크 */
	function check_id(){
		var ch_id = $('#id').val();
		
		$.ajax({
			type: "POST",
			data : "ch_id = " + ch_id,
			dataType: "text",
			url: "check_id.jsp",
			success: function(data) {
				if($.trim(data) == "YES"){
					alert("사용 가능 합니다.");
				}else{
					alert("이미 사용하고 있는 ID 입니다.");
				}
			}
		});
	}
	
	function findaddr() {

		window.open("../findaddr/find_address.jsp", "", "width=500,height=400");

	}

	window.onload = function() {
		if ('${ param.result}' == 'yes') {
			self.close();
		}
	};
</script>

</head>
<body>

	<form method="post" action="member_register.jsp">
		<table width="400px" height="400px" align="center" style="background-color: #F6F6F6">
			<tr>
				<td>
					<table width="400px" align="center" border="0"
						style="color: black; font-size: 38px; margin-top: 5%">
						<tr>
							<td>
								<table width="550px" align="center" border="0"
									style="color: black; font-size: 20px;">
									<tr>
										<td>
											<table width="750px" align="center" border=0;
												style="background-color: white">
												<tr>
													<td>&nbsp;회원가입 </td> 
													<td><div id="sub-title">| 정확한 정보를 입력해주세요.</td>
													<td width="300px"></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<table align="center" style="margin-top: -2%;">
									<tr>
										<td>
											<table align="center" border=0
												style="background-color: none; border-color: black; font-size: 15px; border-style: solid"
												width="450" height="350">
												<tr style="border: 1">
													<br>
													<br>
													<td style="text-align: center; border: 1">ID</td>
													<td style="color: red; font-size: 11px;"><input
														id="id" name="id" placeholder="ID를 입력하세요.">*
														<input type="button" value="중복체크" onclick="check_id();">
														<div id="info">최소 3자이상 영문, 숫자만 입력하세요.</div> <input
														type="hidden" name="checkid" value="0"></td>
												</tr>
												<tr>

													<td style="text-align: center;">이름</td>
													<td><input name="name">*</td>
												</tr>

												<tr>

													<td style="text-align: center;">비밀번호</td>
													<td><input type="password" name="pwd">*</td>
												</tr>
												<tr>
													<td style="text-align: center;">전화번호</td>
													<td><input type="tel" /></td>
												<tr>
													<td style="text-align: center;">성별</td>
													<td><input type="radio" name="sex" value="1">
														여자<input type="radio" name="sex" value="2">남자</td>
												</tr>

												<tr>
													<td style="text-align: center;">우편번호</td>
													<td><input id="zipcode" name="zipcode"> <input
														type="button" value="검색 " onclick="findaddr();"></td>
												<tr>
													<td style="text-align: center;">주소</td>
													<td><input id="addr" name="addr"> <input
														id="addr" name="addr" placeholder="주소를 입력하세요."></td>
												</tr>


												<tr>
													<td style="text-align: center;">이메일</td>
													<td><input type="email" /></td>
												</tr>

												<tr>
													<td style="text-align: center;">생년월일</td>
													<td><input type="date" /></td>
												</tr>


												<tr>
													<td style="text-align: center;"></td>
													<td><input id="bt_register" type="button"
														value="가입하기"
														disabled="disabled" onclick="send(this.form);"> 
														<input type="button" value="취소하기"
														onclick="location.href='login.jsp'"></td>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
			<td><br>
		</table>
	</form>
</body>
</html>