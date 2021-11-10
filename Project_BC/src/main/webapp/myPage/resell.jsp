<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반품/반송 조회</title>
<link rel="stylesheet" href="CSS/mys.css?t=20200406000000" type="text/css">
<link rel="stylesheet" href="CSS/common.css?v=20211011000" type="text/css">
<link rel="stylesheet" href="CSS/pc-main-common.css?v=20211011000" type="text/css">
<link rel="stylesheet" href="CSS/font.css?v=20211018180" type="text/css">
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/jquery.plugin.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<%@include file="../inc/top.jsp" %>
<div id="content" class="content" style="padding-top: 269px;">
	<div class="wrap mys">
		<div class="mys_top_pc">
			<div class="mytbc">MY더반찬	</div>
		</div>

	<div id="mys_lnb" class="lnb">
		<ul>
			<li>
				<dl>
					<dt style="text-align:left;margin-bottom: 12px">주문정보</dt>
					<dd><a id="left_01" href="OrderCheck.my" onclick="" >주문/배송 조회</a></dd>
					<dd><a id="left_02" href="Resell.my" onclick="" class="on">취소/반품 내역</a></dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt style="text-align:left;margin-bottom: 12px">활동내역</dt>
					<dd><a id="left_07" href="Review.my" onclick="">고객후기</a></dd>
					<dd><a id="left_08" href="QnA.my" onclick="">1:1 상담내역</a></dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt style="text-align:left;margin-bottom: 12px">회원정보</dt>
					<dd><a id="left_11" href="DeliveryLocation.my" onclick="">배송지 관리</a></dd>
					<!-- <dd><a id="left_12" href="#">주문정보 수신 설정</a></dd> -->
					
						<dd><a id="left_13" href="Mypage.my" onclick="">개인정보 수정</a></dd>
						<dd><a id="left_14" href="Delete.my" onclick="">회원탈퇴</a></dd>
					
				</dl>
			</li>
		</ul>
	
		<dl class="cst">
			<dt><a href="" onclick="">고객센터</a></dt>
			<dd><b>1644-0000</b></dd>
			<dd><div style="color:#5f99f0;">▲ 단체구매문의</div></dd>
			<dd>평일 08:00~20:00<br>(토/일/공휴일은 휴무)</dd>
		</dl>
	</div>


		<div id="mys_content" class="sub_cont">
			<h3 class="tit2">주문배송 조회

			</h3>

<div class="mys_sch">
	<div class="txt" id="guide_text"><ul><li>최대 6개월 이내의 주문/배송 내역이 확인됩니다.</li></ul></div>	
	
	<div class="show_calendar" id="show_calendar"></div>
</div>
			<div class="mys_none">
				<span class="txt">주문 내역이 없습니다.</span>
			</div>
			<div class="mys_step">
				<h4><b>주문/배송 단계</b> 고객님의 주문이 정상적으로 진행 중인지 꼭 확인해주세요.</h4>
				<ul class="col5">
					<li>
						<dl>
							<dt><b>STEP 1</b>입금확인중</dt>
							<dd>입금확인 전 상태입니다.<br> 기한 내 미입금 시 자동<br> 취소됩니다.</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><b>STEP 2</b>결제완료</dt>
							<dd>결제/입금이<br> 확인되었습니다.</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><b>STEP 3</b>제품 준비중</dt>
							<dd>고객님께 발송드릴<br> 제품을 준비 중입니다.</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><b>STEP 4</b>배송중</dt>
							<dd>제품이 고객님께<br> 배송중입니다.</dd>
						</dl>
					</li>
					<li class="end">
						<dl>
							<dt><b>STEP 5</b>배송완료</dt>
							<dd>제품 배송이<br> 완료되었습니다.</dd>
						</dl>
					</li>
				</ul>
			</div>
			<!-- //MY STEP -->

			<!-- MY NOTICE -->
			<div class="mys_notice">
				<h4>주문/배송 <b>TIP</b></h4>
				<ul>
					<li></li>
					<li>주문 제품을 <em>재 주문 하시고자 하시면</em>, 주문 상세내역에서 제품들을 확인 하신 후 일괄 <em>장바구니 담기 기능</em>을 활용해주시기 바랍니다.</li>
					<li>주문을 즉시 취소 하실 경우 <em>즉시 취소 버튼을 클릭하시면</em> 취소 확인 후 <em>해당 주문 건 전체를 삭제하여 취소처리</em> 해 드립니다.</li>
					
					<li><em>즉시 취소는 결제완료 단계까지 가능</em>하며 제품 준비중 단계에서는 제품이 조리되어 취소처리가 불가능하니 이점 양해 부탁 드립니다.</li>
					
					<li><em>배송조회는 더반찬에서 발송되는 택배배송건만</em> 가능합니다. <em>(새벽직배송, 업체신선배송 조회 불가)</em></li>
					<li>자세한 반품 신청 및 내역 조회는 취소/반품 내역 메뉴를 확인해 주시기 바랍니다.</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>