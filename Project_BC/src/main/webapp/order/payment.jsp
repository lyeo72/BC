<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int amount = Integer.parseInt(request.getParameter("amount"));

int total_price = Integer.parseInt(request.getParameter("total_price"));
int total_discount = Integer.parseInt(request.getParameter("total_discount"));
int shipping_fee = Integer.parseInt(request.getParameter("shipping_fee"));

String[] qty = request.getParameterValues("qty");
String[] nums = request.getParameterValues("num");

String customer_id = request.getParameter("customer_id");
String buyer_name = request.getParameter("buyer_name");
String buyer_tel = request.getParameter("buyer_tel");
String buyer_email = request.getParameter("buyer_email");
String postcode = request.getParameter("postcode");
String address = request.getParameter("address")+" "+request.getParameter("detailAddress");
String detailAddress = request.getParameter("detailAddress");
String shipping_name = request.getParameter("shipping_name");
String shipping_phone = request.getParameter("shipping_phone");
String shipping_memo = request.getParameter("shipping_memo");
String pay_method = request.getParameter("pay_rdo");
String status ="";
response.setContentType("text/html;charset=utf-8");     
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>결제페이지</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211026000" type="text/css">	
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211026000" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211026000" type="text/css">
	<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211026000" type="text/css">
	
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/odr.css?t=20200406000000" type="text/css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
IMP.init('imp98036049');

IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : '<%=pay_method%>',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 100, //판매 가격
<%--     amount : <%=amount%>, //판매 가격 --%>
    buyer_email : '<%=buyer_email%>',
    buyer_name : '<%=buyer_name%>',
    buyer_tel : '<%=buyer_tel%>',
    buyer_addr : '<%=address%>',
    buyer_postcode : '<%=postcode%>'
}, function(rsp) {
    if ( rsp.success ) {
    	jQuery.ajax({
    		url: "paymentResult.jsp",
    		type : 'POST',
    		dataType : 'json',
    		data : {
    			imp_uid : rsp.imp_uid,
    			amount : rsp.paid_amount,
    			status : rsp.status
    		}
    	}).done(function(data){
    		if(everythings_fine) {
    			 var msg = '결제가 완료되었습니다.';
    		        msg += '고유ID : ' + rsp.imp_uid;
    		        msg += '상점 거래ID : ' + rsp.merchant_uid;
    		        msg += '결제 금액 : ' + rsp.paid_amount;
    		        msg += '카드 승인번호 : ' + rsp.apply_num;
    		        alert(msg);
    		} else {
    			var msg = '아직 제대로 결제가 되지 않았습니다.';
    			msg +=  '결제된 금액이 요청한 금액과 달라 결제를 자동취소 처리하였습니다.'
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
		alert(msg);
    }
    $("#status").attr('value', rsp.status);
    $("#imp_uid").attr('value',rsp.imp_uid);
    $(".imp_uid").text($("#imp_uid").val());
		if ($('#status').val() == "paid") {
			$('.fail').attr("src",'order/payment_success.jpg')
			document.paymentForm.submit();
			
		} else {
			
			$('.fail').attr("src",'order/payment_fail.jpg')
			$('.fail').show();
			document.getElementById("odr_insCrt").style.display = 'block';
		}
	});

</script>
</head>
<body>

<form action="OrderPro.or" method="post" name="paymentForm">
<div class="tbl-order">
	<img alt="" src="" class="fail" onerror="this.style.display='none'">
</div>

<input type="hidden" value="" id="imp_uid" name="imp_uid">
<input type="hidden" value="<%=amount%>" id="paid_amount" name="paid_amount"> 
<input type="hidden" value="<%=pay_method%>" id="pay_method" name="pay_method">
<input type="hidden" value="<%=buyer_name %>" id="buyer_name" name="buyer_name"> 
<input type="hidden" value="<%=buyer_tel %>" id="buyer_tel" name="buyer_tel">
<input type="hidden" value="<%=buyer_email %>" id="buyer_email" name="buyer_email"> 
<input type="hidden" value="<%=postcode %>" id="postcode" name="postcode">
<input type="hidden" value="<%=address %>" id="shipping_addr" name="shipping_addr">
<input type="hidden" value="" id="status" name="status">
<input type="hidden" value="<%=shipping_name %>" id="shipping_name" name="shipping_name">
<input type="hidden" value="<%=shipping_phone %>" id="shipping_phone" name="shipping_phone">
<input type="hidden" value="<%=shipping_memo %>" id="shipping_memo" name="shipping_memo">
<input type="hidden" value="<%=customer_id %>" id="customer_id" name="customer_id">

<!-- 주문정보를 히든으로 넘겨주기 -->
<input type="hidden" value="<%=total_price %>" id="total_price" name="total_price">
<input type="hidden" value="<%=total_discount %>" id="total_discount" name="total_discount">
<input type="hidden" value="<%=shipping_fee %>" id="shipping_fee" name="shipping_fee">

<div class="odr_insCrt" id="odr_insCrt" style="display: none;">
				<a href="Cart.ca" id="go_cart_button"><em>장바구니
						돌아가기</em></a>
			</div>

<%
for(int i = 0 ; i < nums.length ; i ++){
%>
<input type="hidden" value="<%=nums[i]%>" name="num" id="num">
<input type="hidden" value="<%=qty[i]%>" name="qty" id="qty">
<%}	%>
</form>
</body>
</html>

