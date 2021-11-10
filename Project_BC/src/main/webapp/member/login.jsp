<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
String cookie_login_id = "";

Cookie[] cookie = request.getCookies();

if(cookie != null){
	for(Cookie tempCookie : cookie){
		if(tempCookie.getName().equals("login_cookie")){
			cookie_login_id = tempCookie.getValue();
		}
	}
}
%>
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		if($("#cookie_login_id").val() != ""){
			$("#loginLayerForm").submit();
		}	
	});
	
</script>
</head>
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211005130" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211005130" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211005130" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211005130" type="text/css">
<body>
<div id="cont">   <div class="login_box">
   <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/overpass.sms.js"></script>

   <h2 id="tit">로그인</h2>
   <div class="login_set">
   
      <form action="MemberLoginPro.me" name="fr" id="loginLayerForm" method="post">
         <input type="hidden" name="scheme" id="scheme" value="">
         <input type="hidden" name="ret_domain" id="ret_domain" value="">
         <input type="hidden" name="loginType" id="loginType" value="">
         <input type="hidden" name="snsDiviCd" id="snsDiviCd" value="">
         <input type="hidden" name="cookie_login_id" id="cookie_login_id" value=<%=cookie_login_id %>>
                     
         <label for="login_id_lyr" class="ir">아이디</label>
         <input type="text" id="login_id_lyr" name="login_id" maxlength="50" class="login_input" placeholder="아이디"  required="required" value="">
         
         <label for="pwd_lyr" class="ir">비밀번호</label>
         <input type="password" id="pwd_lyr" name="login_pass" maxlength="20" class="login_input" required="required" placeholder="비밀번호">
         
         <!-- 아이디 비번 오류시 노출 -->
        	<span class="caution" id="insertID" style="display: block;">아이디를 입력하세요 </span>

         
         <div class="func_set">
            <input type="checkbox" class="rem_set" id="cookie_login_yn" name="cookie_login_yn" value="Y" onclick="chValues()">
            <label for="cookie_login_id" class="rem_set">자동 로그인</label>
         <!--             <a href="" class="buy_nomem" id="nomember_btn" style="display:none;">비회원구매</a> -->
         </div>
         <button type="submit" class="btn_login" id="btn_login_lyr" onclick="checkId(this.value)"><em>로그인</em></button>
      </form>               
               
   </div>

   <div class="bt_set">
	<a href="FindIdForm.me" class="find_mem">아이디/비밀번호 찾기</a>
     <a href="#" class="no_mem">신규 회원가입</a>
   </div>
  

</div></div>

</body>
</html>