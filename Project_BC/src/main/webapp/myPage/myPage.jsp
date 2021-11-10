<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="stylesheet" href="CSS/mys.css?t=20200406000000" type="text/css">
<link rel="stylesheet" href="CSS/common.css?v=20211011000" type="text/css">
<link rel="stylesheet" href="CSS/pc-main-common.css?v=20211011000" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="CSS/font.css?v=20211018180" type="text/css">
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
					<dd><a id="left_02" href="Resell.my" onclick="" >취소/반품  내역</a></dd>
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
					<dt style="text-align:left;margin-bottom: 12px"> 회원정보</dt>
					<dd><a id="left_11" href="DeliveryLocation.my" onclick="">배송지 관리</a></dd>
					<!-- <dd><a id="left_12" href="#">주문정보 수신 설정</a></dd> -->
					
						<dd><a id="left_13" href="Mypage.my" onclick="" class="on">개인정보 수정</a></dd>
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
			<h3 class="tit">개인정보수정></h3>
			
			  <form id="confirmForm" action="<%=request.getContextPath() %>//Mypage2.my" method="get">
				<div class="mys_cfm">
					<h3>본인 확인</h3>
					<div class="txt">개인정보 수정을 위해서는 본인 확인이 필요합니다<br>비밀번호를 다시 한번 입력해 주세요.</div>
					<dl>
						<dt class="ir"><label for="m_pw">비밀번호</label></dt>
						<dd>
							<span class="inp"><input type="password" id="m_pw" class="input" name="password" placeholder="비밀번호"></span>
							<div id="faildiv">
							</div>
						</dd>
					</dl>
					<div class="btn"><button id="saveBtn" type="button" onclick=""><em>확인</em></button></div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>