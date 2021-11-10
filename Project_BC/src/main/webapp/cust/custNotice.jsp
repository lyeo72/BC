<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<title>공지사항</title>
<head>
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
	//좌측메뉴 하이라이트
	$('#left_04').addClass("on");

	// 공지사항 상세 클릭
	openCont = function(obj){
	
		if($(obj).parent().parent().find('+tr td.cont').css('display') == 'none'){
			overpass.custcenter.notiHitUpdate($(obj));
		}
		$(obj).parent().parent().siblings('tr').find('td.cont').hide();
		$(obj).parent().parent().find('+tr td.cont').show();
		$("html,body").animate({scrollTop: $(obj).parent().parent('tr').offset().top}, 250);
	}
	closeCont = function(obj){
		$(obj).parent().parent().find('td.cont').hide();
	}
	//페이지 이동
	$("#box_page").createAnchor({
		name: "page_idx", // 해당 페이지 앵커의 페이지번호 패러미터명과 일치하여야 함. 디폴트는 page_no
		fn: function(page, parameters) {
			//location.href = overpass.util.https("/mypage/initSaveMoney.action?page_idx=" + page + "&" + parameters);
			location.href = "/cust/initCustCenterNotice.action?page_idx=" + page ;
		}
	});
	openCont1();

});
openCont1 = function(){

	if('' != ''){
		$('.page a').each(function(){
				$(this).attr("class","num");
		});
		
		$('.page a').eq('0').attr("class","select_num");
		$('td.cont').each(function(){
			
			if('' == $(this).attr('data-notice_no')){
				overpass.custcenter.notiHitUpdate($(this));
				$(this).show();
				$("html,body").animate({scrollTop: $(this).parent('tr').offset().top + 30}, 250);
			}
		});
	}
}
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
			<h3>공지사항</h3>
			<table class="noti_tbl">
				<caption>번호, 제목, 날짜, 조회수로 이루어진 공지사항 테이블</caption>
				<col style="width:120px;" />
				<col />
				<col style="width:146px;" />
				<col style="width:121px;" />
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">날짜</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
	
				<tr class="noti_top">

					<td class="num">글번호 출력</td>
					<th id="tit1000114"><a href="javascript:;" onclick="openCont(this);" data-notice_no="20210805638">제목 출력</a></th>
					<td>날짜 출력</td>
					<td>조회수 출력</td>
				</tr>
				<tr>
					<td class="cont" headers="tit1000114" colspan="4" data-notice_no="20210805638">
						<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
	<!-- 열었을때 내용 -->
		<tr>
			<td style="text-align: left; color: rgb(38, 37, 37); padding-top: 30px; padding-right: 20px; padding-left: 20px; font-family: noto sans kr; font-size: 12px; font-weight: bold; background-color: rgb(255, 255, 255);"><u><strong>NOTICE </strong></u></td>
		</tr>
		<tr>
			<td style="padding: 30px 20px; text-align: left; color: rgb(38, 37, 37); line-height: 40px; font-family: noto sans kr; font-size: 26px; font-weight: bold; background-color: rgb(255, 255, 255);"><strong>제목 출력</strong></td>
		</tr>
		<tr>
			<td style="padding: 30px 20px; text-align: left; line-height: 25px; font-family: noto sans kr; font-size: 16px; background-color: rgb(255, 255, 255);">
			
			내용출력
			
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

						<button class="arrow_btn02" onclick="closeCont(this);"><em>닫기</em></button>
					</td>
				</tr>

				
				</tbody>
			</table>
			<!-- PAGING -->
			<div id="box_page" class="paging">
				<span class="page">
				<a href="javascript:void(0);" class="select_num" data-current="true" data-value="1" data-parameters="">1<span class="ir">현재페이지</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="2" data-parameters="">2<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="3" data-parameters="">3<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="4" data-parameters="">4<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="5" data-parameters="">5<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="6" data-parameters="">6<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="7" data-parameters="">7<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="8" data-parameters="">8<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="9" data-parameters="">9<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="num" data-current="false" data-value="10" data-parameters="">10<span class="ir">페이지로 이동</span></a><a href="javascript:void(0);" class="next" data-current="" data-value="11" data-parameters=""><span class="ir">다음 목록으로 이동</span></a><a href="javascript:void(0);" class="end" data-current="" data-value="28" data-parameters=""><span class="ir">끝 목록으로 이동</span></a>
				</span>
			</div>
			<!-- //PAGING -->
		</div>
		<!-- //SUB CONTENT -->
	</div>
	<!-- WRAP -->
</div>
<!-- //CONTENT -->










</body>
</html>