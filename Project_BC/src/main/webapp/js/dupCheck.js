

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

function useId(id) {
	//현재 창이 아닌 현재 창을 연 부모 창의 fr폼의 id 요소 위치에
	// 사용하려는 아이디 값을 표시하기
	// => 창을 연 부모를 제어하려면 opener 속성을 사용하여 제어
	opener.document.fr.member_id.value = id;
	//현재 창 닫기
	window.close();
}




