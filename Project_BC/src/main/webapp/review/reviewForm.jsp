<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int product_num = Integer.parseInt(request.getParameter("product_num"));
	int order_num = Integer.parseInt(request.getParameter("order_num"));


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>리뷰작성</title>
<style type="text/css">
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>

<script type="text/javascript">


$(document).ready(function() {
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	  
	});
	
	
});

function setStar(point) {
	document.submitForm.review_score.value = point;
	
}


</script>
<link href="../CSS/common.css" rel="stylesheet" type="text/css">
<link href="../CSS/pc-main-common.css" rel="stylesheet" type="text/css">
<link href="../CSS/sub.css" rel="stylesheet" type="text/css">
<link href="../CSS/font.css" rel="stylesheet" type="text/css">
<link href="../CSS/font.css" rel="stylesheet" type="text/css">
<link href="../CSS/gds.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/gds.css?t=20200406000000" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211010170" type="text/css">   


<link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/common/layout.css?v=20211019" />
<link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/common/common_layout.css?v=20211019" />
<link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/common/common_unit.css?v=20211019" />  
<link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/scom.css?v=20211019" />
<link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/popup.css?v=20211019" />


<link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/com_component.css?v=20211019" />
        <link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/m_ssg/css/ssg_component.css?v=20211019" />
        <link rel="stylesheet" type="text/css" href="//ui.ssgcdn.com/ui/ssg/css/ssgday_2021.css?v=20211019" />
    <script type="text/javascript" src="//ui.ssgcdn.com/ui/ssg/js/lib/jquery-1.9.1.min.js"></script>


</head>

<body>
<!-- 아이디 받아오기(session) -->
<%
	String customer_id = (String)session.getAttribute("sId");  
	if(customer_id==null){
	%>
	<script type="text/javascript">
				alert('로그인 필수'); 
				window.open('MemberLoginForm.me','_blank','height=500,width=500, status=yes,toolbar=no,menubar=no,location=no');
		</script> 	
	<%
	
	
}else{



%>


<div id="pop_wrap" style="width:750px">
	<div id="pop_header">
		<h1>리뷰 쓰기</h1></div>
	<hr>

	<form action="<%=request.getContextPath() %>/ReviewWritePro.re" method="post" enctype="multipart/form-data" name="submitForm">
	
	<input type="hidden" name="review_id" value="<%=customer_id%>"/>

	<input type="hidden" name="order_num" id="order_num" value="<%=order_num%>"/>
	<input type="hidden" name="product_num" value="<%=product_num%>"/>
	<input type="hidden" name="review_score" value=""/>
	

	<div id="pop_container" class="pop_review_write">
		<button class="button_close" type="button" onclick="self.close();"><span class="blind">팝업닫기</span><span class="ir"></span></button>
		<div class="selected_info v2">
			<div class="selected_img">
				<img src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/510/764/200721000025764.jpg" width="110" height="110" alt="음식 설명" onerror="this.onerror=null;this.src='//img.ssgcdn.com/trans.ssg?src=/ui/ssg/img/common/img_ready_500x500.jpg&w=110&h=110&t=269231888f4d2e45b39cf84c3551eb7dd68372a7'">
			</div>
			<div class="item_info">
				
				<p class="item">양장피</p>
				<span class="desc">
					</span>
				</div>

		</div>

		<div class="my_grp_wrap">
			<!-- 상품평 작성 -->
			<div id="_grp_review" class="grp_review v2">
				<h4 class="wr_tit wr_tit1">별점을 선택해 주세요.</h4>
				<div class="review_star v2">
					<span class="blind">평점 5점 중 </span>
					<div class="starRev">
					  <span class="starR " onclick="setStar(1)">별1</span>
					  <span class="starR " onclick="setStar(2)">별2</span>
					  <span class="starR " onclick="setStar(3)">별3</span>
					  <span class="starR " onclick="setStar(4)">별4</span>
					  <span class="starR " onclick="setStar(5)">별5</span>
					  
					</div>
					
				</div>
			</div>
			<div class="grp_review v2 input_review">
				<h4 class="wr_tit wr_tit3">
					고객님의 리뷰가 다른 고객들에게 도움이 될 수 있어요!
					
				</h4>
				<div class="pop_review_texta v2">
					<div class="pop_textarea v2">
						<textarea id="review_content" name="review_content" cols="70" rows="10" placeholder="· 리뷰 내용은 최소 10자 이상 입력해 주세요.&#10;· 상품과 무관하거나 스팸, 음란, 불법적인 내용의 리뷰는 통보 없이 삭제됩니다.&#10;· 이메일, 휴대폰번호, 주민등록번호와 같은 개인정보 입력 시 등록이 제한됩니다.&#10;"></textarea>

						<div class="review_texta_cnt">
							<label for="reviewTextarea">
								<span class="desc"><em><strong id="cnttBytes">0</strong>자</em> / 1000자</span>
							</label>
						</div>
					</div>
				</div>

				
				<!-- 첨부파일 썸네일 -->
				<div class="review_attach_thmb">
					<ul class="attach_thmb" >
					</ul>
				</div>

				<div class="pre_conts">
					
						<!-- 사진/동영상 업로드  -->
					<div class="review_attach_upload">
						<ul>
							
							<li class="btn_picture_up">
							<input type="file" name="review_img" id="review_img" style="display:none"/>
							<button type="button" title="사진 업로드" class="btn btn-secondary" onclick="onclick=document.all.review_img.click()">사진</button></li>
						</ul>
					</div>
				</div>
				
			</div>

		<div class="pop_btn_area v2">
					<button type="button" class="color3" id="cancelBtn" onclick=""><em class="txt_btn">취소</em></button> <!-- 취소시 창닫기 -->
					<button type="submit" class="color2" id="submitBtn"><em class="txt_btn">등록</em></button></div>
			
	</div>
	</div>
	</form>
</div>
<%
}
%>
</body>
</html>