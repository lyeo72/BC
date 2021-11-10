var checkIdResult = false, checkPasswdResult = false;
var passwordRetypeCheckResult = false;
var checkNameResult = false;
var checkPhoneResult = false;

function openWindow(target) {

	if(target == "dupIdCheck") {
		document.open("dupIdCheck.jsp","","width=300,height=100");
	} 
	
	if(document.fr.member_id.value != null){
		var element = document.getElementById('checkIdResult'); 
		element.innerHTML = "";
		element.style = "display: none;";
		checkIdResult = true;
	}
}	

function changeDomain(domain){
	document.joinForm.email2.value = damain.value;
}


function checkRetypePasswd(retypePassword) { 
	var password = document.fr.join_pw.value;

	var element = document.getElementById('checkPasswdResult');
	
	if(password == retypePassword) {
		element.innerHTML = '';
		element.style = "display: none;";
		element.style.color = 'green';
		passwordRetypeCheckResult = true;
	} else {
		element.innerHTML = '입력하신 값이 비밀번호와 다릅니다.';
		element.style = "display: block;";
		element.style.color = 'red';
		passwordRetypeCheckResult = false;
	}
}

function checkPassword(member_pass) {


	var lengthRegex = /^[A-Za-z0-9!@#$%]{10,20}$/;
	var engUpperCaseRegex = /[A-Z]/;
	var engLowerCaseRegex = /[a-z]/; 
	var digitRegex = /[0-9]/;
	var specRegex = /[!@#$%]/;
	
	var element = document.getElementById('checkPasswdResult');
	
	
	if(lengthRegex.exec(member_pass)) {

		var safetyCount = 0; 
		

	
		
		
		if(engUpperCaseRegex.exec(member_pass)) safetyCount++;
		if(engLowerCaseRegex.exec(member_pass)) safetyCount++;
		if(digitRegex.exec(member_pass)) safetyCount++;
		if(specRegex.exec(member_pass)) safetyCount++;
		
		
		
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





function checkName(name) {
	var koreanRegex = /^[가-힣]{3,4}$/g;
	var element = document.getElementById('checkNameResult'); 
	
	if(koreanRegex.exec(name)) {
		element.innerHTML = "";
		element.style = "display: none;";
		checkNameResult = true;
	}
	
}


function checkMiddlePhone(middleNumber) {
	var regex = /^[ㄱ-힣가-힣A-Za-z_]{3,4}$/g;
	if(regex.exec(middleNumber)) { 
		alert('전화번호는 숫자만 가능합니다');
		checkPhoneResult = true;
	} 
}


function checkLastPhone(lastNumber) {
	var regex = /^[ㄱ-힣가-힣A-Za-z_]{3,4}$/g;
	
	if(regex.exec(lastNumber)) { 
		alert('전화번호는 숫자만 가능합니다');
		checkPhoneResult = true;
	} 
	
}



function checkSubmit() {
	if(checkIdResult == false) { 
			alert('아이디를 입력해주세요');
			document.fr.member_id.focus();
			return false;
	} else if(checkPasswdResult == false) { 
			alert('비밀번호는 영문자,숫자,특수문자를 3종류 이상을 조합하여 만들어주세요');
			document.fr.member_pass.focus();
			return false;
	} 
	
	if(!document.fr.add_info[0].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	}
	else if(!document.fr.add_info[1].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	}
	else if(!document.fr.add_info[2].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	
	}
	
	return true;
}



function checkedAll() {
	if(document.fr.checkAll.checked){
		document.fr.add_info[0].checked = true;
		document.fr.add_info[1].checked = true;
		document.fr.add_info[2].checked = true;
		document.fr.member_personalData.checked = true;
		document.fr.personalData1.checked = true;
		document.fr.personalData2.checked = true;
	}else{
		document.fr.add_info[0].checked = false;
		document.fr.add_info[1].checked = false;
		document.fr.add_info[2].checked = false;	
		document.fr.member_personalData.checked = false;
		document.fr.personalData1.checked = false;
		document.fr.personalData2.checked = false;
	}
	
}


function checkPasswdValue() {
	if(document.fr.member_pass.value == ""){
		if(document.fr.member_name.focus){
			var element = document.getElementById('checkPasswdResult'); 
			element.innerHTML = " 비밀번호를 입력해주세요";
			element.style = "display: block;";
			
		}
	}
}

function checkNameValue() {
	if(document.fr.member_name.value == ""){
		if(document.fr.member_phone2.focus){
			var element = document.getElementById('checkNameResult'); 
			element.innerHTML = " 이름을 입력해주세요";
			element.style = "display: block;";
			
		}
	}
}
//====================================================================================================


var checkIdResult = false, checkPasswdResult = false;
var passwordRetypeCheckResult = false;
var checkNameResult = false;
var checkPhoneResult = false;


function openWindow(target) {

	if(target == "dupIdCheck") {
		document.open("member/dupIdCheck.jsp","","width=400,height=200");
	} else if(target == "addrSearch") {
//			document.open("addrSearch.jsp","","width=400,height=300");
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            // => 함수에 전달된 파라미터(data 객체)를 활용하여 각종 주소 정보 활용
	            var roadAddress = data.roadAddress; // 도로명 주소
	            var jibunAddress = data.jibunAddress; // 지번 주소
	            var zonecode = data.zonecode; // 우편번호
	            
//		            alert(zonecode + ", " + roadAddress + ", " + jibunAddress);
				document.fr.address.value = zonecode + ", " + roadAddress;
	        }
	    }).open();
	}
	
	
	
	
	if(document.fr.member_id.value != null){
		var element = document.getElementById('checkIdResult'); 
		element.innerHTML = "";
		element.style = "display: none;";
		checkIdResult = true;
	}
}	

function changeDomain(domain){
	document.joinForm.email2.value = damain.value;
}


function checkRetypePasswd(retypePassword) { 
	var password = document.fr.join_pw.value;

	var element = document.getElementById('checkPasswdResult');
	
	if(password == retypePassword) {
		element.innerHTML = '패스워드가 일치합니다';
		element.style = "display: none;";
		element.style.color = 'green';
		passwordRetypeCheckResult = true;
	} else {
		element.innerHTML = '입력하신 값이 비밀번호와 다릅니다.';
		element.style.color = 'red';
		passwordRetypeCheckResult = false;
	}
}

function checkPassword(member_pass) {

	var lengthRegex = /^[A-Za-z0-9!@#$%]{10,20}$/;
	var engUpperCaseRegex = /[A-Z]/;
	var engLowerCaseRegex = /[a-z]/; 
	var digitRegex = /[0-9]/;
	var specRegex = /[!@#$%]/;
	
	var element = document.getElementById('checkPasswdResult');
	
	
	if(lengthRegex.exec(member_pass)) {
		
		var safetyCount = 0; 
		

		
		if(engUpperCaseRegex.exec(member_pass)) safetyCount++;
		if(engLowerCaseRegex.exec(member_pass)) safetyCount++;
		if(digitRegex.exec(member_pass)) safetyCount++;
		if(specRegex.exec(member_pass)) safetyCount++;
		
		
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





function checkName(name) {
	var koreanRegex = /^[가-힣]{3,4}$/g;
	var element = document.getElementById('checkNameResult'); 
	
	if(koreanRegex.exec(name)) {
		element.innerHTML = "";
		element.style = "display: none;";
		checkNameResult = true;
	}
	
}


function checkMiddlePhone(middleNumber) {
	var regex = /^[ㄱ-힣가-힣A-Za-z_]{3,4}$/g;
	if(regex.exec(middleNumber)) { 
		alert('전화번호는 숫자만 가능합니다');
		checkPhoneResult = true;
	} 
}


function checkLastPhone(lastNumber) {
	var regex = /^[ㄱ-힣가-힣A-Za-z_]{3,4}$/g;
	
	if(regex.exec(lastNumber)) { 
		alert('전화번호는 숫자만 가능합니다');
		checkPhoneResult = true;
	} 
	
}



function checkSubmit() {
	if(checkIdResult == false) { 
			alert('아이디를 입력해주세요');
			document.fr.member_id.focus();
			return false;
	} else if(checkPasswdResult == false) { 
			alert('비밀번호는 영문자,숫자,특수문자를 3종류 이상을 조합하여 만들어주세요');
			document.fr.member_pass.focus();
			return false;
	} 
	
	if(!document.fr.add_info[0].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	}
	else if(!document.fr.add_info[1].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	}
	else if(!document.fr.add_info[2].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	
	}
	
	return true;
}



function checkedAll() {
	if(document.fr.checkAll.checked){
		document.fr.add_info[0].checked = true;
		document.fr.add_info[1].checked = true;
		document.fr.add_info[2].checked = true;
		document.fr.member_personalData.checked = true;
		document.fr.personalData1.checked = true;
		document.fr.personalData2.checked = true;
	}else{
		document.fr.add_info[0].checked = false;
		document.fr.add_info[1].checked = false;
		document.fr.add_info[2].checked = false;	
		document.fr.member_personalData.checked = false;
		document.fr.personalData1.checked = false;
		document.fr.personalData2.checked = false;
	}
	
}

function checkIdValue() {
	if(document.fr.member_id.value == ""){
		if(document.fr.member_pass.focus){
			var element = document.getElementById('checkIdResult'); 
			element.innerHTML = "아이디를 중복확인 해주세요";
			element.style = "display: block;";
			
		}
	}
}

function checkPasswdValue() {
	if(document.fr.member_pass.value == ""){
		if(document.fr.member_name.focus){
			var element = document.getElementById('checkPasswdResult'); 
			element.innerHTML = " 비밀번호를 입력해주세요";
			element.style = "display: block;";
			
		}
	}
}

function checkNameValue() {
	if(document.fr.member_name.value == ""){
		if(document.fr.member_phone2.focus){
			var element = document.getElementById('checkNameResult'); 
			element.innerHTML = " 이름을 입력해주세요";
			element.style = "display: block;";
			
		}
	}
}

//===================================================================================================
//dupIdCheck JS
var idCheckResult = false; passwordCheckResult = false;
// 아이디 입력값 검증(8 ~ 12자리 영문, 숫자만 사용 가능)
function checkId(id){
// 입력받은 아이디가 id 변수에 저장되어 있음
// 1. 6 ~ 12자리 영문, 숫자에 대한 판별(단, 첫글자에 숫자사용불가)
// => 자바스크립트에서 정규표현식을 변수에 할당할 경우
// 기호와 / 기호 사이에 정규표현식 문장을 작성
// => 1) 첫 글자에 영문자만 사용 가능 => 첫 글자 1글자는 영문 대문자, 소문자만 사용
//    2) 두번째 글자부터 영문자와 숫자 혼용 가능(5 ~ 11자리 반복)
//		=> 1번 규칙과 결합하면 총 6  ~ 12자리 
var regex = /^[A-Za-z][A-Za-z0-9]{5,11}$/;

// 정규표현식 판별 결과를 표시할 공간의 요소 id값 가져오기
var element = document.getElementById('checkIdResult');

// 정규표현식 문자열의 exec() 함수를 호출하여 입력받은 아이디를 파라미터로 전달

if(regex.exec(id)){
	element.innerHTML = '사용가능한 아이디입니다.';
	element.style.color = 'green';
	idCheckResult = true;
	
}else{
	element.innerHTML = '4 ~ 20자리 영문자, 숫자 혼합 필수';
	element.style.color = 'red';
	idCheckResult = false;
	}
}

function checkSubmit(){
	// idCheckResult 값이 true이면, true리턴 , 아니면 false 리턴
	if(idCheckResult){
		return true;
	}else{
	alert('4 ~ 20자리 영문자, 숫자 혼합 필수');
	document.checkForm.id.focus();
	return false;
	}
}


function useId(id) {
	//현재 창이 아닌 현재 창을 연 부모 창의 fr폼의 id 요소 위치에
	// 사용하려는 아이디 값을 표시하기
	// => 창을 연 부모를 제어하려면 opener 속성을 사용하여 제어
	opener.document.fr.member_id.value = id;
	//현재 창 닫기
	window.close();
}
