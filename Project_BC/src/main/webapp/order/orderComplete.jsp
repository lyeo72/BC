<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

ArrayList<OrderBean> orderList = (ArrayList<OrderBean>)request.getAttribute("orderList");

int total_price = Integer.parseInt(request.getAttribute("total_price").toString());
int total_discount = Integer.parseInt(request.getAttribute("total_discount").toString());
int shipping_fee = Integer.parseInt(request.getAttribute("shipping_fee").toString());

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title>주문완료 | theBanchan</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211026000" type="text/css">	
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211026000" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211026000" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211026000" type="text/css">
	
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/odr.css?t=20200406000000" type="text/css">
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() {
		
		if(<%=orderList.get(0).getPay_method().equals("card")%>){
			$('.pay_method').text("카드결제");
		}else{
			$('.pay_method').text("무통장입금");
		}
		
		
		if($('.pay_method').text() =="카드결제"){
			document.getElementById("BankAccount").style.display = 'none';
		};
		
		});
	
	
	
	
	
</script>

<!-- CONTENT -->
<div id="content" class="content">

	<!-- WRAP -->
	<div class="wrap odr"><!-- wrap addClass -->

		<h2 class="odr_cpl_tit">주문완료</h2>
		<div class="odr_top">
			<ol>
				<li><em>01</em> 장바구니</li>
				<li><em>02</em> 주문서</li>
				<li class="on"><em>03</em> 결제완료</li>
			</ol>
		</div>

		오더넘 : <%=orderList.get(0).getOrder_num() %>
		<!-- odr_cpl_info -->
		<div class="odr_cplPrc">
			<h3>결제정보</h3><div class="total">
				<table>
					<caption>결제정보 금액 | 주문 합계 금액 , 쿠폰/할인 금액, 배송비, 최종 결제금액을 제공하는 표</caption>
					<colgroup>
						<col style="width:25%;">
						<col style="width:25%;">
						<col style="width:25%;">
						<col style="width:25%;">
					</colgroup>
					<thead>
						<tr>
							<th>
								<strong>주문 합계 금액</strong>
								<span><b><fmt:formatNumber value="<%=total_price %>" pattern="#,###"/></b>원</span>
								<span class="mis"><em class="ir">-(빼기)</em></span>
							</th>
							<th>
								<strong>쿠폰/할인 금액</strong>
								<span><b><fmt:formatNumber value="<%=total_discount %>" pattern="#,###"/></b>원</span>
								<span class="pls"><em class="ir">+(더하기)</em></span>
							</th>
							<th>
								<strong>배송비</strong>
								<span>
								<%if(shipping_fee ==0){
								%>
								무료
								<%}else{%>
								<fmt:formatNumber value="<%=shipping_fee %>" pattern="#,###"/>
								<%} %>
								</span>
								<span class="eql"><em class="ir">=(합계)</em></span>
							</th>
							<th>
								<strong>최종 결제금액</strong>
								<span class="prc" id="real_prc"><b><fmt:formatNumber value="<%=orderList.get(0).getOrder_price() %>" pattern="#,###"/></b>원</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td><span class="pls"><em class="ir">+(더하기)</em></span></td>
							<td>
								<em>30,000원 이상 구매 시 무료</em>
							</td>
							<td>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 무통장 -->
			<div class="msd" id="msdBank" >
				<table>
					<caption>무통장 결제수단 , 입금하실 금액, 계좌, 환불수단 정보를 제공하는 표</caption>
					<colgroup>
						<col style="width:170px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>결제수단</th>
							<td class="pay_method">
							
							</td>
						</tr>
						<tr>
							<th>입금하실 금액</th>
							<td><fmt:formatNumber value="<%=orderList.get(0).getOrder_price() %>" pattern="#,###"/></td>
						</tr>
						<tr  class="BankAccount" id="BankAccount">
							<th>입금계좌</th>
							<td>우리은행 1002450792019 (예금주 : 유여진 주식회사)
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		<!--세금 계산서 발행 여부 추가 -->
		

			<div class="btn">
				<span>
					<a href="OrderDetail.or?order_num=<%=orderList.get(0).getOrder_num() %>"  >주문/배송 내역보기</a>
					<a href="<%=request.getContextPath() %>/">계속 쇼핑하기</a>
				</span>
			</div>

		</div>
		<!--// odr_cpl_info -->

		<!-- odr_cpl_banner -->
		<div class="odr_cplBn">
		</div>
		<!--// odr_cpl_banner -->

	</div> 
	<!--// WRAP -->

</div>
<!-- //CONTENT -->



</body>
</html>

