<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="action.memberAction.GoogleAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="action.memberAction.SendAuthMailAction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Random"%>
<%@page import="svc.memberSvc.MemberLoginProService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/customerJoin.js"></script> 
<script src="js/sendEmail.js"></script>
<link href="CSS/mem.css" rel="stylesheet" type="text/css">
<link href="CSS/common.css" rel="stylesheet" type="text/css">
<link href="CSS/pc-main-common.css" rel="stylesheet" type="text/css">
<link href="CSS/sub.css" rel="stylesheet" type="text/css">
<link href="CSS/font.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="#">
<script type="text/javascript">

</script>
</head>
<body>
  <jsp:include page="/inc/top.jsp" />
<div class="content" style="padding-top: 269px;">
		<!-- WRAP -->
		<div class="wrap mem">
			<!-- LOCATION SELECT -->
			<dl class="location_slt">
				<dt><a href="#">Home</a></dt>
				<dd><a href="#">신규 회원가입</a></dd>
			</dl>
	<form action="CustomerJoinPro.me" name="fr" id="joinForm" method="post" autocomplete="off" onsubmit="return checkSubmit()">			
		<input type="hidden" name="grade" value="3">
			<!--// LOCATION SELECT -->
			<div class="join_box" id="join_box">
				<h2><em>더반찬&amp;</em> 신규 회원가입</h2>
				<!-- 2017.05.03 삭제 <strong class="sub_tit">필수입력</strong> -->
				<div class="join_set">

			   <div class="auth_set">
	                  <label for="join_id" class="ir">아이디</label>
	                  <div class="input_w auth_div">
	                     <input type="text" id="join_id" name="member_id" maxlength="20" class="login_input"
	                      placeholder="아이디" onkeyup="checkId(this)" >
	                  </div>
	                  <span class="limit" id="_certTime"></span>
	                  <button class="submit" type="button"  class="dup" id="btn" onclick="openWindow('dupIdCheck')">중복확인</button>
	           </div>
               
					<!-- 아이디  오류시 노출 -->
					<span class="caution" id="checkIdResult" style="display: block;">아이디를 중복확인 해주세요 </span>

					<label for="join_pw" class="ir">비밀번호</label>
					<input type="password" id="join_pw" name="member_pass" class="login_input" maxlength="20" placeholder="비밀번호" onkeyup="checkPassword(this.value)">
					<label for="join_pw_re" class="ir">비밀번호 재입력</label>
					<input type="password" id="join_pw_re" class="login_input" name="member_repass" placeholder="비밀번호 재입력" onkeyup="checkRetypePasswd(this.value)">
					
					<!-- 비번 오류시 노출 -->
					<span class="caution" id="checkPasswdResult" style="display: none;"><!-- - --></span>
					
					<label for="join_name" class="ir">이름</label>
					<input type="text" id="join_name" name="member_name" class="login_input" maxlength="20" placeholder="이름" required="required" onkeyup="checkName(this.value)"
					onclick="checkPasswdValue()">

					<!-- 이름/성별 오류시 노출 -->
					<span class="caution" id="checkNameResult" style="display: none;"></span>
					<br><br>
					<!-- 인증 이전 -->
					<div class="addr_form">
						<span class="dw_txt">
					<div class="auth_set">
	                  <label for="join_id" class="ir">이메일</label>
	                  <div class="input_w auth_div">
	                     <input type="text" id="email_Text" name="email" class="login_input" placeholder="이메일" required="required">
	                  	 <input type="hidden" value="9"  id="randCode" name="randCode">
	             	 	<input type="hidden" value="0"  id="codeChecked" name="codeChecked">
	             
	                  </div>
	                </div>
							<span class="inp"><input type="text" id="dtl_addr" name="dtl_addr" class="input" style="margin-top:9px;" data-class="addr_chk" placeholder="인증번호" onkeyup="checkCode()" required="required"></span>
							<span class="caution" id="caution12" style="">※ 주문관련 정보에 대한 이메일과 SMS는 자동으로 전송됩니다.</span>
						</span>
				
			
						<button type="button" class="co_auth" id="fnSearchPostNo" onclick="sendEmail()" >
							<em>본인인증 발송</em>
						</button>						
				
					</div>

					<input type="text" id="recomm_remark" name="member_phone" maxlength="40" placeholder="휴대폰 번호">
					<div class="info_txt">※전화번호는 - 을 빼고 입력해주세요</div>

					<span class="caution ir" id="caution5"></span>
					<!-- 2017.06.08 추가 : 추천인 기입란 -->
					<label for="recomm_remark"></label>
					<input type="text" id="recomm_remark" name="member_recommendID" maxlength="40" placeholder="추천인 아이디(선택)">
					<div class="info_txt">※ 더반찬을 추천해준 회원이 있으시면 추천 아이디를 입력해 주세요</div>
				</div>
			</div>

			<!-- 2017.05.03 변경 .wrap.mem 안으로 이동 및 li 순서 변경 -->
			<div class="agree_box">
				<div class="join_box" id="join_box" style="min-height: 250px;">
					<ul class="agree_list" style="margin-top: 41px;padding: 8px 0 0px 0px;">
						<li>
							<input type="checkbox" id="all_agree" name="checkAll" value="N" onclick="checkedAll()">
							<label for="all_agree" style="color: #555;"><b>전체 동의</b>
							<span class="join_agreement_msg">전체 동의시 <em class="join_point_msg">적립금 1,000원</em> 증정! 더 많은 혜택을 받을 수 있어요.</span>
							</label>
							<ul class="agree_list">
								<li class="agree_point_txt">필수 항목</li>
										<li>
											<input type="checkbox" id="2109000103" name="add_info1" class="agreeChk validChk" value="2109000103" >
											<label for="2109000103">서비스 이용약관</label><a href="javascript:overpass.popup.agreeLayer({gbn:'2109000103'})" class="detail arrow_btn01">내용 보기</a>
										</li>
										<li>
											<input type="checkbox" id="2104000099"   name="add_info2" class="agreeChk validChk" value="01">
											<label for="2104000099">개인정보 이용 및 수집 (필수)</label><a href="javascript:overpass.popup.agreeLayer({gbn:'2104000099'})" class="detail arrow_btn01">내용 보기</a>
										</li>
										<li>
											<input type="checkbox" id="age_agree" class="agreeChk" name="add_info3" value="N">
											<label for="age_agree">본인은 <strong>만 14세</strong> 이상입니다.</label>
										</li>
								<li class="agree_point_txt">선택 항목</li>
									<li><input type="checkbox" id="2101000093" class="agreeChk recomm" name="personal_Data1" value="2101000093"><label for="2101000093">개인정보 이용 및 수집 (선택)</label><a href="javascript:overpass.popup.agreeLayer({gbn:2101000093})" class="detail arrow_btn01">내용 보기</a></li>
										<li style="height: 30px;">
											<input type="checkbox" id="forever_agree"  class="agreeChk" name="personal_Data2">
											<input type="hidden" id="forever_member_yn" name="forever_member_yn">
											<label for="forever_agree">개인정보 평생 보관동의(탈퇴시 삭제)</label><a href="javascript:overpass.popup.foreverAgreeLayer();" class="detail arrow_btn01">내용 보기</a>
											<br><br>
										</li>
										<li>
											<input type="checkbox" id="recieve_agree" class="agreeChk" name="personal_Data3">
											<input type="hidden" id="sms_recv_yn" name="sms_recv_yn">
											<input type="hidden" id="mail_recv_yn" name="mail_recv_yn">
											<label for="recieve_agree">쇼핑 혜택 SMS 및 이메일 수신</label>
										</li>
										<li class="marketing_agreemnet_txt">이벤트, 행사등의 다양한 쇼핑정보 및 혜택관련 이메일 및 문자 수신에 동의합니다.</li>
					</ul>
				</li></ul></div>
					<button class="join_up" type="submit" id="btn_join_up"><em>가입하기</em></button>
				<div class="recieve_agree_notice">
					<p>※ 선택 약관에 동의하지 않아도 회원가입이 가능합니다.</p>
					<p>※ 선택 약관 동의 철회는 가입 완료 후 MY더반찬 &gt; 개인정보 수정에서 가능합니다.</p>
				</div>

			</div>
			<!-- //2017.05.03 변경 .wrap.mem 안으로 이동 및 li 순서 변경 -->
</form>


		</div>
	   <jsp:include page="/inc/bottom.jsp" />
	</div>
</body>
</html>