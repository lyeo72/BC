<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<%
String  fid = (String)session.getAttribute("fId");

%>
<script type="text/javascript">

var checkPasswdResult = false;
var passwordRetypeCheckResult = false;

function retype(retypePassword) { 
	var password = document.form.reset_pw.value;

	var em = document.getElementById('caution2');
	
	if(password == retypePassword) {
		em.innerHTML = '';
		em.style = "display: none;";
		em.style.color = 'green';
		passwordRetypeCheckResult = true;
	} else {
		em.innerHTML = '입력하신 값이 비밀번호와 다릅니다.';
		em.style = "display: block;";
		em.style.color = 'red';
		passwordRetypeCheckResult = false;
	}
}

function checkPassword(new_pw) {


	var lengthRegex = /^[A-Za-z0-9!@#$%]{10,20}$/;
	var engUpperCaseRegex = /[A-Z]/;
	var engLowerCaseRegex = /[a-z]/; 
	var digitRegex = /[0-9]/;
	var specRegex = /[!@#$%]/;
	
	var element = document.getElementById('caution1');
	
	
	if(lengthRegex.exec(new_pw)) {

		var safetyCount = 0; 

		if(engUpperCaseRegex.exec(new_pw)) safetyCount++;
		if(engLowerCaseRegex.exec(new_pw)) safetyCount++;
		if(digitRegex.exec(new_pw)) safetyCount++;
		if(specRegex.exec(new_pw)) safetyCount++;

		switch(safetyCount) {
			case 4 : 
				element.innerHTML = '사용가능한 비밀번호 입니다.';
				element.style = "display: block;";
				element.style.color = 'green';
				checkPasswdResult = true;
				break;
			case 3 : 
				element.innerHTML = '사용가능한 비밀번호 입니다.';
				element.style = "display: block;";
				element.style.color = 'blue';
				checkPasswdResult = true;
				break;
			case 2 : 
				element.innerHTML = '10자리이상 영문자,숫자,특수문자 조합 필수!';
				element.style = "display: block;";
				element.style.color = 'orange';
				checkPasswdResult = false;
				break;
			default :
				element.innerHTML = '10자리이상 영문자,숫자,특수문자 조합 필수!';
			element.style = "display: block;";
				element.style.color = 'red';
				checkPasswdResult= false;
		}
		
	} else {
		element.innerHTML = '10자리이상 영문자,숫자,특수문자 조합 필수!';
		element.style.color = 'red';
		passwordCheckResult = false;
	}
	
}


//======================
	
function checkSubmit() {
	var cPw = document.form.new_pw.value;
	var cRpw = document.form.new_repw.value;
	
	
	if(checkPasswdResult == false) { 
			alert('비밀번호는 영문자,숫자,특수문자를 3종류 이상을 조합하여 만들어주세요');
			document.form.new_pw.focus();
			return false;
	} else if(cPw != cRpw){
			alert('비밀번호가 일치하지 않습니다');
			document.form.new_repw.focus();
			return false;
	
	}
	
	return true;
}



//===========================================================


$(document).ready(function() {
    // 모두 로딩되었을때
var param = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);

var loginID = $('input[name=login_id]').attr('value',param);

$('.target_id').text(param);
}); 



</script>
<link href="CSS/mem.css" rel="stylesheet" type="text/css">
<link href="CSS/common.css" rel="stylesheet" type="text/css">
<link href="CSS/pc-main-common.css" rel="stylesheet" type="text/css">
<link href="CSS/sub.css" rel="stylesheet" type="text/css">
<link href="CSS/font.css" rel="stylesheet" type="text/css">
</head>
<body>
	  <jsp:include page="/inc/top.jsp" />
<div class="content" style="padding-top: 269px;">
	<!-- WRAP -->
	<div class="wrap mem">
		<!-- LOCATION SELECT -->
		<dl class="location_slt">
			<dt><a href="#">Home</a></dt>
			<dd><a href="#">비밀번호 재설정</a></dd>
		</dl>
		<!--// LOCATION SELECT -->
		<!-- 2017.06.21 변경 : 구분 class rst 추가 -->
		<div class="login_box rst">
			<h2 class="small" id="h2title">비밀번호 재설정</h2>
			<div class="reset_info">
					<span id="spanCont" >비밀번호를 재 설정 해주셔야 합니다.<br>새로운 비밀번호를 입력하신 후 다시 한번 입력해주세요.</span>
					<!-- 2017.06.08 변경 : 두줄처리를 위한 마크업 변경  -->
					<em class="target_id"><b class="inner"></b></em>

			</div>
			<div class="login_set">
				
<form name="form" id="form" method="post" action="ChangePwdPro.me" onsubmit="return checkSubmit()">
					<input type="hidden" id="login_id" name="login_id" value="" >
					<input type="hidden" id="mbr_no" name="mbr_no" value="202110030954974">
					<input type="hidden" id="sns_id" name="sns_id" value="null">
										
					<label for="reset_pw" class="ir">새 비밀번호 입력</label>
					<input type="password" id="reset_pw" name="new_pw" class="login_input" maxlength="20" placeholder="새 비밀번호 입력" onkeyup="checkPassword(this.value)">
					
					<span class="bt_info caution" id="caution1">비밀번호를 입력해 주세요.</span>
					<label for="retype_pw" class="ir">새 비밀번호 재입력</label>
					<input type="password" id="retype_pw" class="login_input" maxlength="20" name="new_repw" placeholder="새 비밀번호 재입력" onkeyup="retype(this.value)">
					
					<!-- 입력정보 오류시 노출 -->
					<span class="bt_info" id="caution2"></span>
					<button class="btn_login" type="submit" id="btn_confirm"><em>확인</em></button>
</form>



			</div>
		</div>
	</div>
	<!--// WRAP -->
</div>
	   <jsp:include page="/inc/bottom.jsp" />
</body>
</html>