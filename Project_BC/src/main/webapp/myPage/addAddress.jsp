<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/common.css?v=20211019160" type="text/css">
<link rel="stylesheet" href="../CSS/sub.css?v=20211019160" type="text/css">
<link rel="stylesheet" href="../CSS/pc-main-common.css?v=20211019160" type="text/css">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var roadAddress;
	var zonecode;
function openWindow() {
	new daum.Postcode({
	    oncomplete: function(data) {
        roadAddress = data.roadAddress; // 도로명 주소
        var jibunAddress = data.jibunAddress; // 지번 주소
        zonecode = data.zonecode; // 우편번호
        var element = document.getElementById('addr_area');
		element.innerHTML = "<h1>"+zonecode + ", " + roadAddress+"</h1>";
	    }
	}).open();
	
	if(roadAddress!=null){
		
		var element = document.getElementById('base_addr_info')
		element.innerHTML = "";
		element.style = "display: none;";
	}
	
}	
	

function getAddress() {
	var dtl_addr = document.getElementById("dtl_addr").value;
	var set_default = document.getElementById("set_default").checked;
	location.href = "AddAddress.my?roadAddress="+ roadAddress+"&zonecode="+ zonecode+"&dtl_addr="+ dtl_addr+"&set_default="+ set_default;
	
	window.opener.location.reload(true);
	
	window.close();
}


</script>
</head>
<body>
	<div class="pop_wrap" id="pop_addr_modi">
		<div class="pop_box ">
			<h1>배송주소 추가/수정</h1>
			<div class="cont">
				<div class="cont_wrap">
					<label for="addr">주소 <em>*<span class="ir">필수정보</span></em></label>
					<div class="cont_d addr">
						<button class="zip" id="zipcode_button" title="우편번호 찾기(새창)" onclick="openWindow()"><em>우편번호 찾기</em></button>
						<!--  초기화면  -->
						<span class="txt" id="base_addr_info">
						우편번호 찾기를 통해 주소를 확인하신 후 상세주소를 <br>아래에 입력해주시기 바랍니다.
						</span>
						<!-- 검색결과 -->
						<span class="txt" id="addr_area"></span>
						<input type="text" name="dtl_addr" id="dtl_addr" class="insert_name" title="상세주소 입력" maxlength="50" data-role="input" data-check="text" data-message="상세 주소를 입력해 주세요" data-input="input" data-input-name="dtl_addr">
					</div>
					<span class="caution" data-input="display" data-input-name="dtl_addr" style="display: none;">상세 주소를 입력해 주세요</span>
				</div>
			</div>
			<div class="set_default">
				<input type="checkbox" id="set_default">
				<label for="set_default">기본배송지로 설정</label>
			</div>
			<button class="save" id="save_dlvp_button" onclick="getAddress()"><em>저장</em></button>
		</div>
	</div>
</body>
</html>