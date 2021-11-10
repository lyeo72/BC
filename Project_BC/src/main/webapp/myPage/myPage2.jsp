<%@page import="vo.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
CustomerBean customerInfo = (CustomerBean)request.getAttribute("customerInfo");

String phone = customerInfo.getPhone();

%>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="stylesheet" href="CSS/mys.css?t=20200406000000" type="text/css">
<link rel="stylesheet" href="CSS/common.css?v=20211011000" type="text/css">
<link rel="stylesheet" href="CSS/pc-main-common.css?v=20211011000" type="text/css">
<link rel="stylesheet" href="CSS/font.css?v=20211018180" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">


</script>
</head>
<body>
<%@include file="../inc/top.jsp" %>
<div id="content" class="content" style="padding-top: 269px;">
	<div class="wrap mys">
		<div class="mys_top_pc">
			<div class="mytbc">MY더반찬</div>
		</div>

	<div id="mys_lnb" class="lnb">
		<ul>
			<li>
				<dl>
					<dt style="text-align:left;margin-bottom: 12px">주문정보</dt>
					<dd><a id="left_01" href="OrderCheck.my" onclick="" >주문/배송 조회</a></dd>
					<dd><a id="left_02" href="Resell.my" onclick="" >취소/반품 내역</a></dd>
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
			<h3 class="tit">개인정보 수정</h3>
			
			<!-- MY SUMMARY -->
			<div class="mys_summ">
				<div class="tx">소중한 고객정보 제공에 대해 감사 드립니다.</div>
			</div>
			<!-- //MY SUMMARY -->
			
			
			<!-- MY TABLE -->
			<form id="memberFrom" method="post" action="./Mypage3.my">
				<div class="mys_mod">
					<div class="tbl">
						<table>
							<caption>개인정보 | 아이디,이름 및 성별,비밀번호,휴대전화,이메일,주소,SNS연동,생년월일의 정보를 제공하는 표</caption>
							<colgroup>
								<col style="width:220px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">아이디<em class="es">필수입력</em></th>
									<td><span class="tx"><%=customerInfo.getCustomer_id() %></span></td>
								</tr>
								<tr>
									<th scope="row"><label for="m_name" >이름 </label><em class="es">필수입력</em></th>
									<td>  
										
										<span class="tx"><input type="text" id="m_name" name="mbr_nm" class="input" validate="empty" value="<%=customerInfo.getName()%>"></span>
										<span class="sm" name="mbr_msg" style="display:none;">이름은 한글, 영문만 가능합니다.</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="m_pw">비밀번호</label><em class="es">필수입력</em></th>
									<td>
										<span class="tx"><input type="password" id="m_pw" name="pwd" class="input" placeholder="새로운 비밀번호를 입력해 주세요." maxlength="20"></span>
										<span class="sm" name="pwd" style="display:none;">비밀번호는 영문, 숫자 혹은 영문, 숫자, 기호를 조합한 10자 이상으로 만들어 주세요.</span>									
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="m_pw_re">비밀번호 재입력</label><em class="es">필수입력</em></th>
									<td>
										<span class="tx"><input type="password" id="m_pw_re" class="input" placeholder="비밀번호를 재 입력해 주세요." maxlength="20"></span>
										<span class="sm" name="pwd_re" style="display:none;">비밀번호를 재 입력해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="cell_no1" >휴대전화</label><em class="es">필수입력</em></th>
									
									
									<td>
										<input type="hidden" id="phone_chk" name="phone_chk" value="N">
										<span class="ph">
																			
									
											<input type="text" class="input" id="cell_no1" name="cell_no1" data-class="phone_chk" validate="empty" title="휴대폰  입력" value="<%=phone%>" maxlength="11" style="width:216px">
						
									</span>
									</td>
									
										<td><span class="sms">"-"은 빼고 입력해 주세요.</span></td>
								
								</tr>
								<tr>
									<th scope="row"><label for="email">이메일</label><em class="es">필수입력</em></th>
									<td>
										<span class="tx"><input type="text" id="email" name="email" class="input" validate="empty" value="<%=customerInfo.getEmail()%>"></span>
										<span class="sm" name="email" style="display:none;"></span>
										<span class="sms">주문관련 정보에 대한 이메일과 SMS는 자동으로 전송됩니다.</span>
										<span class="sms"><input type="checkbox" id="recv_chk" onclick=""><label for="recv_chk"><ins>마케팅용 SMS 및 이메일 수신 동의</ins></label>
									(
										<input type="checkbox" id="sms_recv_chk"><label for="sms_recv_chk">SMS</label>
										<input type="checkbox" id="mail_recv_chk"><label for="mail_recv_chk">Email</label>
									)
										</span>
										<input type="hidden" name="recv_yn" id="recv_yn">
										<input type="hidden" name="sms_recv_yn" id="sms_recv_yn" value="N">
										<input type="hidden" name="mail_recv_yn" id="mail_recv_yn" value="N">
										<span class="sms"><input type="checkbox" id="forever_chk"><label for="forever_chk">개인정보 평생 보관동의(탈퇴시 삭제)</label></span>
										<input type="hidden" name="forever_member_yn" id="forever_member_yn">
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
					<div class="btn">
						<button type="submit" id="saveBtn" class="sq">저장하기</button>
					</div>
				</div>
			</form>
			<!-- //MY TABLE -->

			<!-- MY TEXT -->
			<div class="mys_text">
				<h4 class="ir">개인정보 안내</h4>
				<ul>
					<li>입력하시는 정보 중 <em class="es">필수입력</em>항목은 필수정보이며, <em class="es">필수입력</em>가 없는 선택 입력 정보는 필수 입력사항이 아닙니다.</li>
					<li>제공해주신 정보는  더욱 편리하고 만족스러운 서비스를 위해 사용되고 있으며 본 서비스 이외에서 사용될 수 없습니다.</li> 
					<li>저희 더반찬몰은 정보보안 규정 준수를 통해 제공해주신 소중한 정보의 유출을 막기 위해 최선을 다하고 있습니다.</li> 
				</ul>
			</div>
			<!-- //MY TEXT -->
		</div>
	</div>
</div>
</body>
</html>