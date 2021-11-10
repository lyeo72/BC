<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211010170" type="text/css">   
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211010170" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211010170" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211010170" type="text/css">
<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/jquery.plugin.js"></script>

<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/ui.js"></script>
</head>
<body>


<!--// HEADER -->
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/cst.css" type="text/css">

<script type="text/javascript">
$(document).ready(function(){

	$('.cst_faq dt a').click(function(){
		var $dl=$(this).parent().parent('dl');
		$dl.toggleClass('on').siblings('dl').removeClass('on');
		
		overpass.custcenter.faqHitUpdate($(this));
	});

	 goNotice = function(noti_no){
		location.href='/cust/initCustCenterNotice.action?noti_no='+noti_no;
	}
	 
	fn_btn_top()
	
	$(".fav_word a").click(function () {
		$("#faq", topForm).val($(this).text());
		$('#topForm').attr("action","/cust/initCustCenterFAQ.action").submit();
	});
	
	$("#topSearchBtn").click(function () {
		$("#faq", topForm).val($("#sch_faq").val());
		$('#topForm').attr("action","/cust/initCustCenterFAQ.action").submit();
	});
	
	$('.cst_top').on("keydown", "#sch_faq", function(){
		if (window.event.keyCode == 13) {
			$(this).next("button").click();
		}
	});
	
	loginCheck = function(str){
		if('false' == 'false' && str == 'MBFIND'){
			overpass.link(str);
		}else if('false' == 'false' && str == 'NMBLOGIN'){
			overpass.link(str);
		}else{
			alert('현재 로그인 상태입니다.');
		}
	}
});
</script>



<!-- CONTENT -->
<div id="content" class="content">
	<!-- WRAP -->
	<div class="wrap cst">
		<!-- SKIP NAVI -->
		<div id="skip_nav"><a href="#cst_content">고객센터 본문 바로가기</a></div>
		<!-- //SKIP NAVI -->
		<!-- LOCATION SELECT -->
			
<dl class="location_slt">
	<dt><a href="javascript:overpass.link('MAIN');" >Home</a></dt>
	<dd><a href="javascript:overpass.custcenter.goMain();" >고객센터</a></dd>
</dl>
		<!--// LOCATION SELECT -->
		
		<!-- LNB -->
		
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/overpass.custcenter.js"></script>
<div id="cst_lnb" class="lnb">
	<a href="CustCenterMain.co"><h2>고객센터</h2></a>
	<ul>
		<li><a id="left_01" href="CustCenterFAQ.co" onclick="overpass.custcenter.goFAQList()">자주하는 질문</a></li>
		<li><a id="left_02" href="CustCenterQNA.co" onclick="overpass.custcenter.goCounsel()">1:1 친절상담</a></li>
		<li><a id="left_03" href="CustCenterQNAList.co" onclick="overpass.custcenter.goCounselList()">1:1 상담내역</a></li>
		<li><a id="left_04" href="CustCenterNotice.co" onclick="overpass.custcenter.goNoticeList()">공지사항</a></li>
	</ul>
	<dl class="cst">
		<dt><a href="CustCenterMain.co" onclick="overpass.custcenter.goMain();">고객센터</a></dt>
		<dd><b>1644-6844</b></dd>
		<dd>평일 08:00~20:00<br/>(토/일/공휴일은 휴무)</dd>
	</dl>
</div>
		<!-- //LNB -->

		<!-- Cst Main Top -->
		<div class="cst_top">
			<dl>
				<dt>
					<label for="sch_faq"><img src="//www.thebanchan.co.kr/fo/images/cst/tit_faq.png" alt="FAQ" /></label>
				</dt>
				<dd>
					<input type="text" id="sch_faq" title="검색어 입력" placeholder="궁금하신 사항을 입력해 주세요">
					<button type="button" id="topSearchBtn" class="bt_sch"><em>검색</em></button>
				</dd>
			</dl>
			<form id="topForm" method="post">
				<input type="hidden" id="faq" name="faq" />
			</form>
			<ul class="fav_word">
				<li><a href="">쿠폰</a></li>
				<li><a href="">배송</a></li>
				<li><a href="">회원</a></li>
				<li><a href="">적립금</a></li>
				<li><a href="">이벤트</a></li>
			</ul>
		</div>
		<!-- //Cst Main Top -->

		<!-- SUB CONTENT -->
		<div id="cst_content" class="sub_cont">
			<ul class="cst_quick">
				<li class="q01"><a href="javascript:void(0);" onclick="loginCheck('MBFIND')">아이디/비밀번호 찾기</a></li>
				<li class="q02"><a href="javascript:void(0);" onclick="overpass.link('ORDER')">주문/배송 조회</a></li>
				<li class="q03"><a href="javascript:void(0);" onclick="overpass.mypage.goClaimList()">취소/반품 내역</a></li>
				<li class="q04"><a href="javascript:void(0);" onclick="loginCheck('NMBLOGIN')">비회원 주문조회</a></li>
			</ul>
			<div class="cst_faq">
				<h3 class="thm">자주 하는 질문 <span>TOP5</span></h3>

				<dl>
					<dt><a href="javascript:;" data-counsel_faq_no="0000000876"><span class="icon">Q</span>제목</a></dt>
					<dd><span class="icon">A</span>답변</dd>
				</dl>

				<dl>
					<dt><a href="javascript:;" data-counsel_faq_no="0000000876"><span class="icon">Q</span>제목</a></dt>
					<dd><span class="icon">A</span>답변</dd>
				</dl>


				<dl>
					<dt><a href="javascript:;" data-counsel_faq_no="0000000876"><span class="icon">Q</span>제목</a></dt>
					<dd><span class="icon">A</span>답변</dd>
				</dl>

			</div>
			<div class="cst_noti_main">
				<h3>공지사항</h3>
				<ul class="list">
				
					<li><a href="javascript:goNotice('20211005699');" >공지사항<span class="date thm">공지날짜</span></a></li><!--클릭시 공지사항 페이지의 해당 게시글로 이동 -->
				
					<li><a href="javascript:goNotice('20211005698');" >[공지] 개인정보처리방침 개정 안내 (10월 13일 시행)<span class="date thm">2021-10-06</span></a></li>
				
					<li><a href="javascript:goNotice('20210905678');" >[공지] 10월 4일 개천절 대체공휴일 배송 안내<span class="date thm">2021-09-24</span></a></li>
				
				</ul>
				<a href="javascript:;" onclick="overpass.custcenter.goNoticeList()" class="arrow_btn01">전체보기</a>
			</div>
		</div>
		<!-- //SUB CONTENT -->
	</div>
	<!-- WRAP -->
</div>
<!-- //CONTENT -->







<!-- FOOTER -->


</body>
</html>