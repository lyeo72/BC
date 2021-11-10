<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<title>자주하는 질문 | theBanchan</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
   <link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
   <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211010170" type="text/css">   
   <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211010170" type="text/css">
   <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211010170" type="text/css">
   <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211010170" type="text/css">
   <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/jquery-1.12.4.min.js"></script>
   <script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/jquery.plugin.js"></script>

   <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/ui.js"></script>
   <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/slick.min.js"></script>
   <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/TweenMax.min.js"></script>

	<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/overpass.common.js?v=20211010180"></script>
	<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/overpass.fn.js?v=20211010180"></script>

<!--// HEADER -->
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/cst.css" type="text/css">


<script type="text/javascript">
$(document).ready(function(){
	// 죄측 메뉴 하이라이트
	$('#left_01').addClass("on");	
	
	//검색
	var getList = function(){
		
		var searchForm = $('#searchForm');
		
		searchForm.attr("action","/cust/initCustCenterFAQ.action").submit();
	}
	
	$('.cst_faq dt a').click(function() {
		
		var $dl=$(this).parent().parent('dl');

		if($dl.attr('class') != 'on'){
			//counsel_faq_no
			overpass.custcenter.faqHitUpdate($(this));
		}
		$dl.toggleClass('on').siblings('dl').removeClass('on');

	});
	
	$(".tab").click(function() {
		$('.cst_faq').remove();
		$('.page').remove();
		$("#tab", searchForm).val($(this).attr("data-prop_dtl_no"));
		$("#tabName", searchForm).val($(this).text());
		getList();
	});
	
	//페이지 이동
	$(".box_page").createAnchor({
		name: "page_idx", // 해당 페이지 앵커의 페이지번호 패러미터명과 일치하여야 함. 디폴트는 page_no
		fn: function(page, parameters) {
			//location.href = overpass.util.https("/mypage/initSaveMoney.action?page_idx=" + page + "&" + parameters);
			location.href = "/cust/initCustCenterFAQ.action?page_idx=" + page + "&" + parameters;
		}
	});
	

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
		<li><a id="left_01" href="javascript:;" onclick="overpass.custcenter.goFAQList()">자주하는 질문</a></li>
		<li><a id="left_02" href="javascript:;" onclick="overpass.custcenter.goCounsel()">1:1 친절상담</a></li>
		<li><a id="left_03" href="javascript:;" onclick="overpass.custcenter.goCounselList()">1:1 상담내역</a></li>
		<li><a id="left_04" href="javascript:;" onclick="overpass.custcenter.goNoticeList()">공지사항</a></li>
	</ul>
	<dl class="cst">
		<dt><a href="javascript:;" onclick="overpass.custcenter.goMain();">고객센터</a></dt>
		<dd><b>1644-6844</b></dd>
		<dd><div style="color:#5f99f0;">▲ 단체구매문의</div></dd>
		<dd>평일 08:00~20:00<br/>(토/일/공휴일은 휴무)</dd>
	</dl>
</div>
		<!-- //LNB -->

		<!-- SUB CONTENT -->
		<div id="cst_content" class="sub_cont">
			<h3>자주하는 질문</h3>
			<!-- Cst Main Top -->
			<div class="cst_top">
				<dl>
					<dt>
						<label for="sch_faq"><img src="//www.thebanchan.co.kr/fo/images/cst/tit_faq_sub.png" alt="FAQ" /></label>
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
					<li><a href="javascript:;">쿠폰</a></li>
					<li><a href="javascript:;">배송</a></li>
					<li><a href="javascript:;">회원</a></li>
					<li><a href="javascript:;">적립금</a></li>
					<li><a href="javascript:;">이벤트</a></li>
				</ul>
			</div>
			<!-- //Cst Main Top -->
			<form id="searchForm" method="post">
				<input type="hidden" id="tab" name="faq_large_divi_cd" value="9999"/>
				<input type="hidden" id="tabName" name="tabName" value=""/>
			</form>
			
			<div class="tab_menu">
				<ul class="result">
	
					<li class='on'>
						<a href="#tab_con1" class="tab t1" data-prop_dtl_no="9999">실시간 BEST</a>
						<div class="cst_faq" id="tab_con1">
							<h4>실시간 BEST </h4>
			
							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000876"><span class="icon">Q</span>언제배송되나요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000875"><span class="icon">Q</span>배송비는 얼마인가요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000873"><span class="icon">Q</span>새벽배송이 완료되면 문자나 유선(전화) 연락을 주나요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000895"><span class="icon">Q</span>아이스박스는 수거 하시나요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000872"><span class="icon">Q</span>신선식품인데 택배로 받아도 안전한가요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000890"><span class="icon">Q</span>제품이 도착하지 않았어요</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000879"><span class="icon">Q</span>제품용기는 전자레인지 이용이 가능한가요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000896"><span class="icon">Q</span>제주/울릉/도서산간 지역도 배송이 되나요?</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000867"><span class="icon">Q</span>주문을 취소하고 싶어요.</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

							<dl>
								<dt><a href="javascript:;" data-counsel_faq_no="0000000847"><span class="icon">Q</span>회원등급 제도를 알고 싶어요.</a></dt>
								<dd><span class="icon">A</span>DB에서 내용 출력
<br>&nbsp;
<br></dd>
							</dl>

						</div></li>
	
					<li>
						<a href="#tab_con2" class="tab t2" data-prop_dtl_no="13">주문/취소</a>
						<div class="cst_faq" id="tab_con2">
							<h4>주문/취소 <span>검색결과 <em>49</em>건</span></h4>	

						</div></li>
	
					<li>
						<a href="#tab_con3" class="tab t3" data-prop_dtl_no="14">배송</a>
						<div class="cst_faq" id="tab_con3">
							<h4>배송 <span>검색결과 <em>49</em>건</span></h4>	

						</div></li>
	
					<li>
						<a href="#tab_con4" class="tab t4" data-prop_dtl_no="21">쿠폰/기타</a>
						<div class="cst_faq" id="tab_con4">
							<h4>쿠폰/기타 <span>검색결과 <em>49</em>건</span></h4>	

						</div></li>
	
					<li>
						<a href="#tab_con5" class="tab t5" data-prop_dtl_no="31">회원정보</a>
						<div class="cst_faq" id="tab_con5">
							<h4>회원정보 <span>검색결과 <em>49</em>건</span></h4>	

						</div></li>
	
					<li>
						<a href="#tab_con6" class="tab t6" data-prop_dtl_no="80">제품</a>
						<div class="cst_faq" id="tab_con6">
							<h4>제품 <span>검색결과 <em>49</em>건</span></h4>	

						</div></li>
						
				</ul>
			</div>

			<!-- //SUB CONTENT -->
		</div>
		<!-- WRAP -->
	</div>
</div>
<!-- //CONTENT -->













</body>
</html>