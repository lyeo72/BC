<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>주문서</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211024180" type="text/css">	
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211024180" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211024180" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211024180" type="text/css">
</head>
<body>
<!-- ACCESSIBILITY -->
<form action="" method="post" >

<div id="accessibility" class="accessibility">
	<dl>
		<dt class="ir"><strong>바로가기 메뉴</strong></dt>
		<dd><a href="#content">본문 바로가기</a></dd>
		<dd><a href="#header">메인메뉴 바로가기</a></dd>
		<dd><a href="#footer">하단메뉴 바로가기</a></dd>
	</dl>
</div>
<!-- //ACCESSIBILITY -->
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/odr.css?t=20200406000000" type="text/css">
<!-- CONTENT -->
<div id="content" class="content">

	<!-- WRAP -->
	<div class="wrap odr">
		<!-- wrap addClass -->
		<input type='hidden' name='loginId' 	id='loginId' 	value="iamyj95"/>
		<input type='hidden' name='loginNo' 	id='loginNo' 	value="0000184627"/>
		<input type='hidden' name='loginName' 	id='loginName' 	value="유여진"/>

		<h2 class="odr_ins_tit">주문서</h2>
		<div class="odr_top">
			<ol>
				<li><em>01</em> 장바구니</li>
				<li class="on"><em>02</em> 주문서</li>
				<li><em>03</em> 결제완료</li>
			</ol>
		</div>

		<!-- odr_ins_top -->
		<div class="odr_insTop">
			<dl class="ntx">
				<dt>
					더반찬& 고객님<br />확인해 주세요!
				</dt>
				<dd>
					* 제조일로부터 냉장보관 3일인 제품의 경우, 희망배송일 전일 생산하며, 일부 제품(외부 상품, 냉동국/염장류 등)은 고객님의 주문량에 따라 미리 생산하고 있어요.
				</dd>
				<dd>
					* 주문후 희망배송일 전일 ＇제품준비중＇단계로 변경된이후로는 주문 변경 및 취소가 불가능한 점 양해부탁드려요.
				</dd>
				<dd>
					* 품절시 희망배송일 당일 품절된 상품에 한해 부분 취소될 수 있어요.
				</dd>
			</dl>
			
			<table class="odr_insTbl">
				<caption>주문 제품리스트 | 제품정보 , 혜택, 할인금액, 판매금액,수량, 결제금액을 제공하는 표</caption>
				<colgroup>
					<col />
					<col style="width: 260px;" />
					<col style="width: 110px;" />
					<col style="width: 110px;" />
					<col style="width: 80px;" />
					<col style="width: 110px;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제품정보</th>
						<th scope="col">혜택</th>
						<th scope="col">할인금액</th>
						<th scope="col">판매금액</th>
						<th scope="col">수량</th>
						<th scope="col">결제금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					
						<td>
							<span class="tx"> 
								<strong><%//제품명 %>제품명</strong>
									 <em name="save_amt_area"
								data-cart-seq="0" style="display: none;">예정적립금
									: <b name="save_amt_display"
									data-cart-seq="0">할인금액</b>원
							</em> <em class="frz" name="svd_frs_dc_display"
								data-cart-seq="0" style="display: none;"></em>
						</span> <span class="img"><a href="javascript:void(0);">
									<img src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/100/707/211019000027707.jpg" width="80" height="80" alt="더반찬& 양념소불고기 2개 (고추장불고기, 쌈채소증정)" onerror="this.src='/common/images/common/noimg_100.jpg'"/> 
							</a></span></td>
						
						<td><span class="prc"><b
								name="goods_apply_dc_price_display"
								data-cart-seq="0">0</b>원</span></td>
						<td><span class="ori"><b>13,798</b>원</span>
						</td>
						<td><span class="nm">1</span></td>
						<td><span class="ori"><b name="goods_pay_amt_display"
								data-cart-seq="0">0</b>원</span></td>
					</tr>
					
				</tbody>
			</table>
			<div class="odr_insCrt">
				<a href="javascript:void(0);" id="go_cart_button"><em>장바구니
						돌아가기</em></a>
			</div>
		</div>

		<!--// odr_ins_top -->

		<!-- odr_ins_sht -->
		<div class="odr_insWrap">
			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>. 할인 및 혜택
				</h3>
				<table>
					<caption>적립금 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">적립금 사용</th>
							<td>
								<div class="dis">
									<span class="tx">4원
										보유</span> <label for="all_input_51"
										class="ir">적립금 입력</label> <input type="text"
										id="all_input_51" value="0"
										data-usable-amt="4"
										data-pay-seq="1" data-role="ord_pay"
										data-pay-mean-cd="51"
										maxlength="9" /><em>원 사용</em> <span class="dwCk"><input
										type="checkbox"
										id="all_checkbox_51"
										data-pay-mean-cd="51"
										data-pay-seq="1" data-role="whole_apply_checkbox" /><label
										for="all_checkbox_51">전액사용</label></span>
									<span class="prc"><em name="dc_pay_amt_display2"
										data-pay-mean-cd="51">0</em>원</span>
									<span class="rtx" data-role="exceed_point_display"
										data-pay-mean-cd="51"
										style="display: none;">보유하신 적립금을 초과하였습니다.</span>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>. 주문자정보
				</h3>
				
				<table>
					<caption>주문자정보 | 주문자, 휴대전화, 이메일 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>주문자<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="orderer_nm">유여진</div></td>
						</tr>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>휴대전화<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="cell_no">010-2944-1409</div></td>
						</tr>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>이메일<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="email">iamyj95@naver.com</div></td>
						</tr>
						
					</tbody>
				</table>
			</div>

			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>. 배송지정보
				</h3>
				<span class="dlv_tx">
				<input type="radio" name="shippingForm" id="basicAddress" checked="checked"/> 기본배송지 
				&nbsp; &nbsp; &nbsp; &nbsp; 
				<input type="radio" name="shippingForm" id="newAddress" /> 신규배송지
				
				</span>
				<table>
					<caption>배송지정보 | 받으시는 분, 주소, 휴대전화, 배송정보 및 특이사항 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						
						<tr>
							<th>받으시는 분<em class="pt">*</em></th>
							<td><div class="inf">주문자</div></td>
						</tr>
						<tr>
							<th>주소<em class="pt" >*</em></th>
							<td><div class="inf">
									</div></td>
						</tr>
						<tr>
							<th>주소<em class="pt" >*</em></th>
							<td><div class="inf">
									<div class="odr_insCrt">
				<a href="javascript:void(0);" id="go_cart_button"><em>배송지 입력</em></a>
			</div></div></td>
						</tr>
						<tr>
							<th>휴대전화<em class="pt">*</em></th>
							<td>
								<div class="inf">
									<span class="phone">전번출력</span>
									
								</div>
							</td>
						</tr>
						
						<tr>
							<th>배송정보<em class="pt">*</em></th>
							<td>
								<div class="inf">
									<dl>
										<dt>일반택배</dt>
										<dd class="dlv_msg">
											<label for="ord_memo_cont_select">배송 메시지</label> <select
												id="ord_memo_cont_select">
												<option data-role="">배송 메시지를 선택해 주세요.</option>
												<option data-role="msg">부재시 경비(관리)실에 맡겨주세요.</option>
												<option data-role="msg">부재시 문 앞에 놓아주세요.</option>
												<option data-role="msg">배송 전에 연락주세요.</option>
												<option data-role="direct">직접 입력하기</option>
											</select>
										</dd>
									</dl>
								</div>
							</td>
						</tr>
						<tr>
							<th>배송 메시지(50자 이내)</th>
							<td>
								<div class="inf">
									
									<textarea id="ord_memo_cont" cols="30" rows="5" maxlength="50"
										disabled="disabled"></textarea>
								</div>
							</td>
						</tr>
						
						
					</tbody>
				</table>
			</div>

			<div class="odr_sheet" id="van_payment_area">
				<h3>
					<span name="info_idx_area"></span>. 결제수단 선택
				</h3>
				<table>
					<caption>결제수단 선택 | 신용카드, 무통장 입금 등
						결제수단 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>
								<ul class="pay_rdo">	
									
									<li><span class="dwCk"><input type="radio"
											name="pay_rdo" id="pay_rdo_3"
											data-pay-seq="3" data-role="ord_pay"
											data-pay-mean-cd="11"
											data-pay-info-name="card" required="required"/><label
											for="pay_rdo_3">신용카드</label></span></li>
									
									<li><span class="dwCk"><input type="radio"
											name="pay_rdo" id="pay_rdo_5"
											data-pay-seq="5" data-role="ord_pay"
											data-pay-mean-cd="13"
											data-pay-info-name="virt" required="required"/><label
											for="pay_rdo_5">무통장 입금</label></span></li>
									
								    
									
                                </ul>
							</th>
							<td class="pay_bx">
								<dl id="pay_bx_0" class="card" name="pay_info_area"
									data-pay-info-name="card" style="display: none;">
									<dt>신용카드</dt>
									<dd>
										<ul>
											<li>신용카드 결제 신청 시, '중지', '새로고침'을 누르지 마시고 결과 화면이 나타날 때까지 기다려 주세요.<br />
												승인까지 다소 시간이 소요될 수 있습니다.
											</li>
											<li>결제하기 버튼 클릭 후 결제창이 나타나지 않거나 안전결제 모듈이 설치되지 않을 경우,<br />
												더반찬 사이트를 모두 닫으시고 아래 설치파일을 다운 받아 ActiveX를 수동설치하시고 결제를 진행하여 주십시오.
											</li>
										</ul>
										<button type="button" class="mdl"
											onclick="urlOpen('https://www.tosspayments.com/renewal/html/guide_popup/menu_04.htm', 600, 600, 'yes'); return false;">
											수동설치하기</button>
									</dd>
								</dl>
								<dl id="pay_bx_1" name="pay_info_area" data-pay-info-name="bank"
									style="display: none;">
									<dt>실시간 계좌이체</dt>
									<dd>
										<ul>
											<li>실시간 계좌 이체는 별도의 수수료가 부과되지 않습니다.</li>
											<li>결제와 동시에 입금처리가 되며, 10분 이내에 입금확인 가능합니다.</li>
											<li>현금영수증을 신청하시면 세금계산서를 발급 받을 수 없습니다. 결제 시, 현금영수증 신청 여부를 꼭 확인해주세요.</li>
										</ul>
										<!-- button type="button" class="mdl">U+ 결제모듈 수동 설치</button-->
									</dd>
								</dl>
								<dl id="pay_bx_2" name="pay_info_area" data-pay-info-name="virt"
									style="display: none;">
									<dt>무통장 입금</dt>
									<dd>
										<ul>
											<li>입금 금액이 일치해야 정상적으로 입금 확인됩니다.</li>
											<li>입금 기한 내 입금이 확인되지 않으면 주문이 자동 취소됩니다.</li>
											<li>현금영수증을 신청하시면 세금계산서를 발급 받을 수 없습니다. 결제 시, 현금영수증 신청 여부를 꼭 확인해주세요.</li>
										</ul>
										<!-- button type="button" class="mdl">U+ 결제모듈 수동 설치</button-->
									</dd>
								</dl>
								
								
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			

			<!-- odr_ins_fixed -->
			<div class="odr_insFixed">
				<div class="contain">
					<div class="top">

						<div class="dlv">일반택배
							</div>
						<dl class="total">
							<dt>
								<b>최종결제정보</b>
							</dt>
							<dd class="tp">
								<strong>주문 합계 금액</strong><span><b id="total_goods_price">0</b>원</span>
							</dd>
							<dd class="tp">
								<strong>할인 적용 금액</strong><span><b
									name="total_dc_price_display">0</b>원</span>
								<p name="dc_price_list_display"></p>
							</dd>
							<dd class="tp">
								<strong>배송비</strong><span id="total_deli_price_display"><b>0</b>원</span>
								
							</dd>
							<dd>
								<strong>적립금 사용</strong><span><b name="dc_pay_amt_display"
									data-pay-mean-cd="51">0</b>원</span>
							</dd>
							
						</dl>
						<div class="total_prc">
							<span class="prc"><strong>최종 결제금액</strong>
							</span>
						</div>
					</div>
<!-- 					<input type="submit" class="odr_total_ok" id="check_order_button" value="결제하기"> -->
					<button type="submit" class="odr_total_ok" id="check_order_button">
						결제하기
					</button>
				</div>
			</div>
			
			<!--// odr_ins_fixed -->

		</div>
		<!--// odr_ins_sht -->

	</div>
	<!--// WRAP -->
</div>
</form>



</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>주문서</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211024180" type="text/css">	
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211024180" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211024180" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211024180" type="text/css">
</head>
<body>
<!-- ACCESSIBILITY -->
<form action="" method="post" >

<div id="accessibility" class="accessibility">
	<dl>
		<dt class="ir"><strong>바로가기 메뉴</strong></dt>
		<dd><a href="#content">본문 바로가기</a></dd>
		<dd><a href="#header">메인메뉴 바로가기</a></dd>
		<dd><a href="#footer">하단메뉴 바로가기</a></dd>
	</dl>
</div>
<!-- //ACCESSIBILITY -->
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/odr.css?t=20200406000000" type="text/css">
<!-- CONTENT -->
<div id="content" class="content">

	<!-- WRAP -->
	<div class="wrap odr">
		<!-- wrap addClass -->
		<input type='hidden' name='loginId' 	id='loginId' 	value="iamyj95"/>
		<input type='hidden' name='loginNo' 	id='loginNo' 	value="0000184627"/>
		<input type='hidden' name='loginName' 	id='loginName' 	value="유여진"/>

		<h2 class="odr_ins_tit">주문서</h2>
		<div class="odr_top">
			<ol>
				<li><em>01</em> 장바구니</li>
				<li class="on"><em>02</em> 주문서</li>
				<li><em>03</em> 결제완료</li>
			</ol>
		</div>

		<!-- odr_ins_top -->
		<div class="odr_insTop">
			<dl class="ntx">
				<dt>
					더반찬& 고객님<br />확인해 주세요!
				</dt>
				<dd>
					* 제조일로부터 냉장보관 3일인 제품의 경우, 희망배송일 전일 생산하며, 일부 제품(외부 상품, 냉동국/염장류 등)은 고객님의 주문량에 따라 미리 생산하고 있어요.
				</dd>
				<dd>
					* 주문후 희망배송일 전일 ＇제품준비중＇단계로 변경된이후로는 주문 변경 및 취소가 불가능한 점 양해부탁드려요.
				</dd>
				<dd>
					* 품절시 희망배송일 당일 품절된 상품에 한해 부분 취소될 수 있어요.
				</dd>
			</dl>
			
			<table class="odr_insTbl">
				<caption>주문 제품리스트 | 제품정보 , 혜택, 할인금액, 판매금액,수량, 결제금액을 제공하는 표</caption>
				<colgroup>
					<col />
					<col style="width: 260px;" />
					<col style="width: 110px;" />
					<col style="width: 110px;" />
					<col style="width: 80px;" />
					<col style="width: 110px;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제품정보</th>
						<th scope="col">혜택</th>
						<th scope="col">할인금액</th>
						<th scope="col">판매금액</th>
						<th scope="col">수량</th>
						<th scope="col">결제금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					
						<td>
							<span class="tx"> 
								<strong><%//제품명 %>제품명</strong>
									 <em name="save_amt_area"
								data-cart-seq="0" style="display: none;">예정적립금
									: <b name="save_amt_display"
									data-cart-seq="0">할인금액</b>원
							</em> <em class="frz" name="svd_frs_dc_display"
								data-cart-seq="0" style="display: none;"></em>
						</span> <span class="img"><a href="javascript:void(0);">
									<img src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/100/707/211019000027707.jpg" width="80" height="80" alt="더반찬& 양념소불고기 2개 (고추장불고기, 쌈채소증정)" onerror="this.src='/common/images/common/noimg_100.jpg'"/> 
							</a></span></td>
						
						<td><span class="prc"><b
								name="goods_apply_dc_price_display"
								data-cart-seq="0">0</b>원</span></td>
						<td><span class="ori"><b>13,798</b>원</span>
						</td>
						<td><span class="nm">1</span></td>
						<td><span class="ori"><b name="goods_pay_amt_display"
								data-cart-seq="0">0</b>원</span></td>
					</tr>
					
				</tbody>
			</table>
			<div class="odr_insCrt">
				<a href="javascript:void(0);" id="go_cart_button"><em>장바구니
						돌아가기</em></a>
			</div>
		</div>

		<!--// odr_ins_top -->

		<!-- odr_ins_sht -->
		<div class="odr_insWrap">
			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>. 할인 및 혜택
				</h3>
				<table>
					<caption>적립금 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">적립금 사용</th>
							<td>
								<div class="dis">
									<span class="tx">4원
										보유</span> <label for="all_input_51"
										class="ir">적립금 입력</label> <input type="text"
										id="all_input_51" value="0"
										data-usable-amt="4"
										data-pay-seq="1" data-role="ord_pay"
										data-pay-mean-cd="51"
										maxlength="9" /><em>원 사용</em> <span class="dwCk"><input
										type="checkbox"
										id="all_checkbox_51"
										data-pay-mean-cd="51"
										data-pay-seq="1" data-role="whole_apply_checkbox" /><label
										for="all_checkbox_51">전액사용</label></span>
									<span class="prc"><em name="dc_pay_amt_display2"
										data-pay-mean-cd="51">0</em>원</span>
									<span class="rtx" data-role="exceed_point_display"
										data-pay-mean-cd="51"
										style="display: none;">보유하신 적립금을 초과하였습니다.</span>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>. 주문자정보
				</h3>
				
				<table>
					<caption>주문자정보 | 주문자, 휴대전화, 이메일 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>주문자<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="orderer_nm">유여진</div></td>
						</tr>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>휴대전화<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="cell_no">010-2944-1409</div></td>
						</tr>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>이메일<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="email">iamyj95@naver.com</div></td>
						</tr>
						
					</tbody>
				</table>
			</div>

			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>. 배송지정보
				</h3>
				<span class="dlv_tx">
				<input type="radio" name="shippingForm" id="basicAddress" checked="checked"/> 기본배송지 
				&nbsp; &nbsp; &nbsp; &nbsp; 
				<input type="radio" name="shippingForm" id="newAddress" /> 신규배송지
				
				</span>
				<table>
					<caption>배송지정보 | 받으시는 분, 주소, 휴대전화, 배송정보 및 특이사항 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						
						<tr>
							<th>받으시는 분<em class="pt">*</em></th>
							<td><div class="inf">주문자</div></td>
						</tr>
						<tr>
							<th>주소<em class="pt" >*</em></th>
							<td><div class="inf">
									</div></td>
						</tr>
						<tr>
							<th>주소<em class="pt" >*</em></th>
							<td><div class="inf">
									<div class="odr_insCrt">
				<a href="javascript:void(0);" id="go_cart_button"><em>배송지 입력</em></a>
			</div></div></td>
						</tr>
						<tr>
							<th>휴대전화<em class="pt">*</em></th>
							<td>
								<div class="inf">
									<span class="phone">전번출력</span>
									
								</div>
							</td>
						</tr>
						
						<tr>
							<th>배송정보<em class="pt">*</em></th>
							<td>
								<div class="inf">
									<dl>
										<dt>일반택배</dt>
										<dd class="dlv_msg">
											<label for="ord_memo_cont_select">배송 메시지</label> <select
												id="ord_memo_cont_select">
												<option data-role="">배송 메시지를 선택해 주세요.</option>
												<option data-role="msg">부재시 경비(관리)실에 맡겨주세요.</option>
												<option data-role="msg">부재시 문 앞에 놓아주세요.</option>
												<option data-role="msg">배송 전에 연락주세요.</option>
												<option data-role="direct">직접 입력하기</option>
											</select>
										</dd>
									</dl>
								</div>
							</td>
						</tr>
						<tr>
							<th>배송 메시지(50자 이내)</th>
							<td>
								<div class="inf">
									
									<textarea id="ord_memo_cont" cols="30" rows="5" maxlength="50"
										disabled="disabled"></textarea>
								</div>
							</td>
						</tr>
						
						
					</tbody>
				</table>
			</div>

			<div class="odr_sheet" id="van_payment_area">
				<h3>
					<span name="info_idx_area"></span>. 결제수단 선택
				</h3>
				<table>
					<caption>결제수단 선택 | 신용카드, 무통장 입금 등
						결제수단 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>
								<ul class="pay_rdo">	
									
									<li><span class="dwCk"><input type="radio"
											name="pay_rdo" id="pay_rdo_3"
											data-pay-seq="3" data-role="ord_pay"
											data-pay-mean-cd="11"
											data-pay-info-name="card" required="required"/><label
											for="pay_rdo_3">신용카드</label></span></li>
									
									<li><span class="dwCk"><input type="radio"
											name="pay_rdo" id="pay_rdo_5"
											data-pay-seq="5" data-role="ord_pay"
											data-pay-mean-cd="13"
											data-pay-info-name="virt" required="required"/><label
											for="pay_rdo_5">무통장 입금</label></span></li>
									
								    
									
                                </ul>
							</th>
							<td class="pay_bx">
								<dl id="pay_bx_0" class="card" name="pay_info_area"
									data-pay-info-name="card" style="display: none;">
									<dt>신용카드</dt>
									<dd>
										<ul>
											<li>신용카드 결제 신청 시, '중지', '새로고침'을 누르지 마시고 결과 화면이 나타날 때까지 기다려 주세요.<br />
												승인까지 다소 시간이 소요될 수 있습니다.
											</li>
											<li>결제하기 버튼 클릭 후 결제창이 나타나지 않거나 안전결제 모듈이 설치되지 않을 경우,<br />
												더반찬 사이트를 모두 닫으시고 아래 설치파일을 다운 받아 ActiveX를 수동설치하시고 결제를 진행하여 주십시오.
											</li>
										</ul>
										<button type="button" class="mdl"
											onclick="urlOpen('https://www.tosspayments.com/renewal/html/guide_popup/menu_04.htm', 600, 600, 'yes'); return false;">
											수동설치하기</button>
									</dd>
								</dl>
								<dl id="pay_bx_1" name="pay_info_area" data-pay-info-name="bank"
									style="display: none;">
									<dt>실시간 계좌이체</dt>
									<dd>
										<ul>
											<li>실시간 계좌 이체는 별도의 수수료가 부과되지 않습니다.</li>
											<li>결제와 동시에 입금처리가 되며, 10분 이내에 입금확인 가능합니다.</li>
											<li>현금영수증을 신청하시면 세금계산서를 발급 받을 수 없습니다. 결제 시, 현금영수증 신청 여부를 꼭 확인해주세요.</li>
										</ul>
										<!-- button type="button" class="mdl">U+ 결제모듈 수동 설치</button-->
									</dd>
								</dl>
								<dl id="pay_bx_2" name="pay_info_area" data-pay-info-name="virt"
									style="display: none;">
									<dt>무통장 입금</dt>
									<dd>
										<ul>
											<li>입금 금액이 일치해야 정상적으로 입금 확인됩니다.</li>
											<li>입금 기한 내 입금이 확인되지 않으면 주문이 자동 취소됩니다.</li>
											<li>현금영수증을 신청하시면 세금계산서를 발급 받을 수 없습니다. 결제 시, 현금영수증 신청 여부를 꼭 확인해주세요.</li>
										</ul>
										<!-- button type="button" class="mdl">U+ 결제모듈 수동 설치</button-->
									</dd>
								</dl>
								
								
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			

			<!-- odr_ins_fixed -->
			<div class="odr_insFixed">
				<div class="contain">
					<div class="top">

						<div class="dlv">일반택배
							</div>
						<dl class="total">
							<dt>
								<b>최종결제정보</b>
							</dt>
							<dd class="tp">
								<strong>주문 합계 금액</strong><span><b id="total_goods_price">0</b>원</span>
							</dd>
							<dd class="tp">
								<strong>할인 적용 금액</strong><span><b
									name="total_dc_price_display">0</b>원</span>
								<p name="dc_price_list_display"></p>
							</dd>
							<dd class="tp">
								<strong>배송비</strong><span id="total_deli_price_display"><b>0</b>원</span>
								
							</dd>
							<dd>
								<strong>적립금 사용</strong><span><b name="dc_pay_amt_display"
									data-pay-mean-cd="51">0</b>원</span>
							</dd>
							
						</dl>
						<div class="total_prc">
							<span class="prc"><strong>최종 결제금액</strong>
							</span>
						</div>
					</div>
<!-- 					<input type="submit" class="odr_total_ok" id="check_order_button" value="결제하기"> -->
					<button type="submit" class="odr_total_ok" id="check_order_button">
						결제하기
					</button>
				</div>
			</div>
			
			<!--// odr_ins_fixed -->

		</div>
		<!--// odr_ins_sht -->

	</div>
	<!--// WRAP -->
</div>
</form>



</body>
>>>>>>> branch 'master' of https://github.com/ITWILL1TEAM/Banchan.git
</html>