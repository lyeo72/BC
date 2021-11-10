<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[집밥 선생] 회원가입</title>
<link rel="stylesheet" href="//s.wemep.co.kr/ui/v2.8.328/dist/pc/css/common/common.css">
<link rel="stylesheet" href="//s.wemep.co.kr/ui/v2.8.328/dist/pc/css/pages/member.css">
</head>
<body>

<jsp:include page="/inc/top.jsp" />
<br><br><br><br><br><br><br><br><br>
<div class="member_wrap">
   <div class="member_gate">
   <strong class="tit"></strong>
   <h1 class="join" align="center"></h1>
   <strong class="tit"></strong>
      <a href="CustomerJoinForm.me">
        <img src="img/person.ico">
        <div class="member_gate_join">
          <p class="title">개인 구매회원</p>
          <p class="text_small">만 14세 이상 가능</p>
          <span class="btns_sys red_big_d"><span>회원가입</span></span>
        </div>
      </a>
      
      <a href="SellerJoinForm.me">
        <img src="img/company.ico">
        <div class="member_gate_join">
          <p class="title">사업자 판매회원</p>
          <p class="text_small">사업자등록증을 보유한 판매회원</p>
          <span class="btns_sys red_big_d"><span>회원가입</span></span>
        </div>
      </a>
    </div>
    </div>
    <br><br><br>
  <jsp:include page="/inc/bottom.jsp" />
</body>
</html>