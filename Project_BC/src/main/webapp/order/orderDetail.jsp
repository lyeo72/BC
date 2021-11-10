<%@page import="vo.orderProductBean"%>
<%@page import="vo.orderDetailBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
ArrayList<OrderBean> orderList = (ArrayList<OrderBean>)request.getAttribute("orderList");
ArrayList<orderDetailBean> orderDetailList = (ArrayList<orderDetailBean>)request.getAttribute("orderDetailList");
ArrayList<orderProductBean> orderProductList = (ArrayList<orderProductBean>)request.getAttribute("orderProductList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>상세 주문 내역 | theBanchan</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211026000" type="text/css">	
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211026000" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211026000" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211026000" type="text/css">
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
<!--// HEADER -->
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/mys.css?t=20200406000000" type="text/css">

		<!-- SUB CONTENT -->
		<div id="mys_content" class="sub_cont">
			<h3 class="tit">상세 주문 내역</h3>
			<div class="mys_odr">
				<dl>
					<dt>주문번호 :</dt>
					<dd><em><%=orderList.get(0).getOrder_num() %></em></dd>
					<dt>주문일 :</dt>
					<dd><%=orderList.get(0).getOrder_date() %></dd>
				</dl>
				
				<span class="btn"><button type="button" id="addCartBtn" title="장바구니 담기 알림"><em>장바구니 다시담기</em></button></span>
				
			</div>

			
			<!-- MY LIST -->	
			<div class="mys_tbl">
				<div class="tbl line">
					<table>
						<caption>상세 주문 내역 | 제품정보,수량,합계금액,진행상태,희망배송일,확인의 정보를 제공하는 표</caption>
						<colgroup>
							<col style="width:100px" />
							<col style="width:auto" />
							<col style="width:105px" />
							<col style="width:105px" />
							<col style="width:105px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2">제품명</th>
								<th scope="col">진행상태</th>
								<th scope="col">주문일자</th>
								<th scope="col">확인</th>
							</tr>
						</thead>
						<tbody>
							<%
							for(int i=0; i<orderDetailList.size(); i++){
							%>
							<tr>
								<td class="vert2">
									
									<a href="">
										<span class="img">
										<img src="${pageContext.request.contextPath}/upload/<%=orderDetailList.get(i).getProduct_img()%>.png" width="80" height="80" alt="" onerror="this.src='/common/images/common/noimg_100.jpg'"/>
										</span>
									</a>
									
								</td>
								<td class="none">	
									
									<a href="">
									
										<span class="set"><b>[<%=orderDetailList.get(i).getSname() %>] </b> <%=orderDetailList.get(i).getProduct_name() %></span>
										
									</a>
									
									
										<span class="cnt"><b class="qt"><%=orderProductList.get(i).getProduct_qty() %></b>개 / <b class="pr"><fmt:formatNumber value="<%=orderDetailList.get(i).getProduct_price()-(orderDetailList.get(i).getProduct_price()*orderDetailList.get(i).getProduct_discount()*0.01)%>" pattern="#,###"/></b>원 </span>
									
								</td>
								
								<td rowspan="6">
									
									<span class="tx">
										<%=orderList.get(0).getOrder_status()%>
									</span>
									
								</td>
								<td rowspan="6">
									<span class="date">
										<%=orderList.get(0).getOrder_date() %>
									
									</span>
								</td>
								
								<td rowspan="6">
								
									<span class="btn">
										
										<button type="button" class="qd" id="cnclBtn" onclick="" title="주문 즉시 취소 알림">즉시취소</button>
										
									</span>
								
								</td>
								
								
							</tr>
						</tbody>
							<%} %>
					</table>
				</div>
			</div>
			<!-- //MY LIST -->
			

			<!-- ORDER INFO. -->
			<div class="odr_cplPrc">
				<h3>결제정보</h3>

				
				

				
				<div class="msd" id="msdBank" >
					<table>
						<caption>무통장 결제수단 , 입금하실 금액, 입금계좌/마감일 정보를 제공하는 표</caption>
						<colgroup>
							<col style="width:170px;" />
							<col style="width:auto" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">결제수단</th>
								<td class="pay_method"></td>
							</tr>
							<tr>
								<th scope="row">입금하실 금액</th>
								<td><em><%=orderList.get(0).getOrder_price() %></em></td>
							</tr>
							<tr class="BankAccount" id="BankAccount">
								<th scope="row">입금계좌/마감일</th>
								
								<td><em>농협은행 79018613743185 (예금주 : 동원디어푸드 주식회사)</em> / 2021-11-05일 까지 입금해주시기 바랍니다. </td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
			<!--//ORDER INFO. -->
			
			
			<div class="mys_tbl2">
				<h4>배송 정보</h4>
				<div class="tbl">
					<table>
						<caption>배송 정보 | 희망배송일,배송 받으실 분,휴대전화,주소,공동출입문 비밀번호,주변 장소 정보 혹은 특이 요청사항의 정보를 제공하는 표</caption>
						<colgroup>
							<col style="width:170px"/>
							<col style="width:auto"/>
						</colgroup>
						<tbody>
						    
							
							
							<tr>
								<th scope="row">배송 받으실 분</th>
								<td><span class="tx"><%=orderList.get(0).getShipping_name() %>님</span></td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td><span class="tx">
									
									<%=orderList.get(0).getShipping_phone() %>
									
								</span></td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td><span class="tx"><%=orderList.get(0).getShipping_address() %></span></td>
							</tr>
							
							<tr>
								<th scope="row"> 요청사항 (50자)</th>
								<td><span class="tx"><%if(orderList.get(0).getShipping_memo() =="null"){} %></span></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			
			
			<!--  BUTTON -->
			<div class="mys_btn">
				
				<button type="button" onclick="javascript:history.back();" class="bx">이전페이지로 이동</button>
				
			</div>
			<!-- //BUTTON -->

			<!-- MY NOTICE -->
			<div class="mys_notice">
				<h4>주문/배송 <b>TIP</b></h4>
				<ul>
					<li>제품을 배송 받으신 후 수취확인을 하지 않은 경우에는 배송이 완료된 일로부터 7일 경과 후, 8일째 자동으로 수취확인 됩니다.</li>
					<li>신용카드로 결제하신 경우 카드 전표가 자동 발급되므로 조회 버튼을 클릭하시면 되고 현금 영수증은 국세청 홈페이지에서 확인하실 수 있습니다.</li>
					<li>자진 발급된 현금영수증을 소득공제나 지출증빙용으로 변경하시려면 국세청 현금영수증 사이트에서 변경하시거나 국세청 현금영수증 상담센터(1544-2020)로 문의하시기 바랍니다.</li>
					<li>카드영수증과 현금영수증의 발급시점은 결제완료 시점입니다. 기타 자세한 문의사항은 고객센터 (1644-6844) 로 연락 주시기 바랍니다.</li> 
				</ul>
			</div>
			<!-- //MY NOTICE -->
		</div>
		<!-- //SUB CONTENT -->



</body>
</html>