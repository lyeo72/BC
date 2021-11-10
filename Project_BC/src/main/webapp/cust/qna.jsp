<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>1:1친절상담 | theBanchan</title>
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
<body>

<%
				//세션 아이디가 존재하지 않으면 로그인 페이지로 이동
				//자바스크립트로 로그인필수를 출력 후 이동처리
				String id =(String)session.getAttribute("id");
				if(id==null){
					%>
					<script type="text/javascript">
	 						alert('로그인 필수'); 
 					</script> 	
					<%
					response.sendRedirect("MemberLoginForm.me");//로그인 폼 페이지로 이동 로그인팀 후에 하기ㅡㅡ
					
				}
				
%>


<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/cst.css" type="text/css">
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/overpass.mypage.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	var tel_no1 = $("#tel_no1").val();
	var tel_no2 = $("#tel_no2").val();
	var tel_no3 = $("#tel_no3").val();
	var quest_title = $("#quest_title").val();
	var quest_cont = $("#quest_cont").val();
	
	//좌측메뉴 하이라이트
	$('#left_02').addClass("on");
	
	//삭제버튼 이벤트
	$("#selectedGoodsBoxDiv").on("click", "#deleteBtn", function(){
		$(this).parents('tr').remove();
		var selectedGoodsLength = $('#selectedGoodsBox>tr').length;
		if(selectedGoodsLength==0){
			$('#selectedGoodsBoxDiv').hide();
			$('.goodsDiv').hide();
			$('button[name=orderlist]').removeClass();
		}
	});
	
	//취소
	$("#cancelBtn").click(function () {
		
		if(tel_no1 != $("#tel_no1").val()
		 ||tel_no2 != $("#tel_no2").val()
		 ||tel_no3 != $("#tel_no3").val()
		 ||quest_title != $("#quest_title").val()
		 ||quest_cont != $("#quest_cont").val()
		 ||$("#c_sel").val() != ""
		 ||$(".goodsDiv").css("display") != "none")
			if (!confirm('작성중인 문의 내용을 등록하지 않으시겠습니까?')) {
				return;
			}
		
		overpass.custcenter.goMain();
	});
	
	//확인
	save = function(gb){
		
		if(''==$('#c_sel').val()/*  || ''==$('#c_sel_s').val() */){
			alert('상담유형을 선택해 주세요.');
			return;
		}else if ( $("[name=tel_no1]").val() == "" || $("[name=tel_no2]").val() == "" || $("[name=tel_no3]").val() == "" ){
			alert("휴대폰 번호를 입력해 주세요.")
			return;
		}else if('' == $.trim($('[name=quest_title]').val())){
			alert('상담 제목을 입력해 주세요.');
			return;
		}else if('' == $.trim($('[name=quest_cont]').val())){
			alert('상담 내용을 입력해 주세요.');
			return;
		}
		

		var img_seq = 0;

	    $("[id^=file]").change(function(){    
	      	
			var fileValue = $(this).val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			var ext = $(this).val().split('.').pop().toLowerCase();
	 
		    if($(this).val() != "" && $.inArray(ext, ['gif','png','jpg']) == -1) {
				alert('gif,png,jpg 파일만 업로드 할 수 있습니다.');
		    	$(this).val('');
				return false;
			}
		    
	    	if($(this).val() != "" && $(this).parent().find("[name=pre_file_nm]").val() == ""){
	    		var dd = "<dd data-seq=\""+img_seq+"\">"
				+ "<input type=\"hidden\" name=\"file_type_cd\" value=\"10\"/>"
				+ "<input type=\"hidden\" name=\"ori_file_nm\" value=\""+fileName+"\"/>" 
				+ "<input type=\"hidden\" name=\"ext\" value=\""+ext+"\"/>"
				+ fileName
				+ "<button type=\"button\" name=\"deleteImgBtn\" title=\"더반찬 구매제품\">첨부파일삭제</button></dd>";
				
				//파일삭제버튼 seq 추가
	    		$(this).parent().find("[name=deleteImgBtn]").attr("data-seq",img_seq);
				
	    		//이전값 저장 change시 중복 추가 막기 위해
	    		$(this).parent().find("[name=pre_file_nm]").val(fileName);
	    		$(this).parent().find("[name=pre_file_nm]").attr("data-seq",img_seq);
				
				//리스트 추가
	    		img_seq++;    
	    	}
	    });
	    
	    $(".file_inp").on("click","[name=deleteImgBtn]",function(){
			var index = $(".file_inp [name=deleteImgBtn]").index(this);
			var file = $(this).parent().find("#file"+index);
			var del_seq = $(this).attr("data-seq");
	    	console.log(del_seq);

			//파일 비우기
			$('.couns_tbl td .file_inp input[name=file]').each(function() {
		    		file.val('');
			});
		
	    });
	   
		/* if ( $('[name=email1]').val() == "" || $('[name=email2]').val() == "" ){
			alert("이메일을 입력해 주세요.")
			return;
		} */
		

		
		//이메일 합치기
		/* $('[name=email]').val($('[name=email1]').val()+"@"+$('[name=email2]').val()); */
		
		//선택한 제품 hidden필드에 담기
		var goodsNoArry = [];
		var virVendNoArry = [];
		var ordNoArry = [];
		var ordDtlNoArry = [];
		var ord_no ;
		var i = 0;
		$('#selectedGoodsBox').children("tr").each(function(){
			var goods_no = $(this).attr("goods_no");
			var vir_vend_no = $(this).attr("vir_vend_no");
			goodsNoArry[i]= goods_no;
			virVendNoArry[i]= vir_vend_no;
			
			ord_no = $(this).attr("ord_no");
			
			var ord_dtl_no = $(this).attr("ord_dtl_no");
			if($.type(ord_no)!='undefined' ){
				ordNoArry[i]= ord_no;
				ordDtlNoArry[i]= ord_dtl_no;
			}
			
			i++;
		});
		$('[name=goods_nos]').val(goodsNoArry.join(","));
		$('[name=vir_vend_nos]').val(virVendNoArry.join(","));
		
		
		//주문일경우
		$('[name=ord_no]').val(ord_no);
		$('[name=ord_dtl_nos]').val(ordDtlNoArry.join(","));
		
		var url = "/cust/initCustCounselComplete.action";
		if ( gb == "U"){
			//url = "/cust/updateMyCounsel.action"
		}
		if(!confirm("상담내용을 등록하시겠습니까?")){
			return;
		}
		$("#form1").attr("action", url).submit();
	}
	
	fnInit = function() {
		$("#cell_no1").addClass("select");
		$("#cell_no1").addClass("celluar");
		$(".celluar").attr("maxlength", 4);

	};
	
	fnInit();
	
	$('.celluar').keyup(function(){
		var str = $(this);
		str.val(str.val().replace(/[^0-9]/gi,''));
	});
	$('.celluar').blur(function(){
		var str = $(this);
		str.val(str.val().replace(/[^0-9]/gi,''));
	});
	
	$('#quest_title').bind('input paste', function() {
		  $(this).trigger('keyup');
	});
	$('#quest_cont').bind('input paste', function() {
		  $(this).trigger('keyup');
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
			<h3 class="thm">1:1 친절상담</h3>
			
			<form name="csCounselForm" id="form1" enctype="multipart/form-data" method="post">
			<input type="hidden" id="ord_no" name="ord_no"/>
			<input type="hidden" id="ord_dtl_nos" name="ord_dtl_nos"/>
			
				<!-- COUNSEL SELECT -->
				<div class="cst_slt">
					<div class="info_txt"><em class="req">*<span class="ir">필수입력정보</span></em>표시정보는 필수 입력 사항입니다.</div>
					<dl>
						<dt>
							<label for="c_sel">상담유형<em class="req">*<span class="ir">필수입력정보</span></em></label>
						</dt>
						<dd>
							<select id="c_sel" name="counsel_clss_no" title="상담유형 대분류 선택">
								<option value="">상담 유형을 선택해 주세요.</option>
				
								<option value="01322">입금상담</option>
				
								<option value="01332">새벽배송상담</option>
				
								<option value="01342">제조VOC</option>
				
								<option value="01352">단순상담</option>
				
								<option value="01366">제품상담</option>
				
								<option value="01372">이벤트상담</option>
				
								<option value="01383">회원혜택상담</option>
				
								<option value="01392">기타상담</option>
				
								<option value="01402">서비스 칭찬</option>
				
								<option value="01405">서비스 불편/제안</option>
				
								<option value="01542">제조VOC</option>
				
								<option value="01481">환불상담</option>
				
								<option value="01484">택배배송상담</option>
				
								<option value="01489">배송VOC</option>
				
								<option value="01502">변경상담</option>
				
								<option value="01513">외부몰상담</option>
				
								<option value="01543">배송VOC</option>
				
								<option value="01498">기타VOC</option>
				
								<option value="01508">취소상담</option>
				
								<option value="01544">기타VOC</option>
				
								<option value="01581">상품VOC</option>
				
								<option value="01587">상품VOC</option>

							</select>
							<!-- <select id="c_sel_s" name="counsel_clss_no" title="상담유형 소분류 선택" disabled="disabled">
								<option value="">선택</option>
							</select> -->
						</dd>
					</dl>
					<dl>
						<dt>상담 제품 선택</dt>
						<dd class="slt_btns">
							<!-- 레이어에서 제품 선택 된 후 case (class .on)  -->
							<button type="button" name="orderlist" onclick="overpass.custcenter.OrderGoodsListLayer();return false;"><em>주문내역</em></button>
						</dd>
					</dl>
				</div>
				<!-- //COUNSEL SELECT -->
				<!-- SELECTED PRODUCT -->
				<div class="sltd_tbl">
					<dl class="order_num goodsDiv" style="display:none;">
						<dt>주문번호 : </dt>
						<dd></dd>
					</dl>
					<div id="selectedGoodsBoxDiv" class="tbl goodsDiv">
						<table>
							<caption>제품명, 주문/삭제로 이루어진 선택된 제품 표</caption>
							<colgroup>
								<col style="width:120px" />
								<col style="width:auto" />
								<col style="width:120px;" />
							</colgroup>
							<thead class="ir">
								<tr>
									<th scope="col" colspan="2">제품명</th>
									<th scope="col">주문/삭제</th>
								</tr>
							</thead>
							<tbody id="selectedGoodsBox">
							
							</tbody>
						</table>
					</div>
				</div>
				<!-- //SELECTED PRODUCT -->
				<!-- //COUNSEL WRITE -->
				<table class="couns_tbl">
					<caption>고객명, 아이디, 휴대폰 번호, 이메일 주소, 답변알림, 제목 내용으로 구성된 1:1친절 상담 작성 테이블입니다.</caption>
					<col style="width:170px">
					<col>
					<tbody>
						<tr>
							<th scope="row">고객명</th>
							<td>유여진</td>
						</tr>
						<tr>
							<th scope="row">아이디</th>
							<td>iamyj95</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="tel_no1">휴대폰 번호<em class="req">*<span class="ir">필수입력정보</span></em></label>
							</th>
							<td>
																
								<select id="tel_no1" name="tel_no1" message="전화번호를 숫자로 입력하세요." ><option value="">선택</option><option value="010" selected="selected">010</option><option value="011" >011</option><option value="016" >016</option><option value="017" >017</option><option value="018" >018</option><option value="019" >019</option><option value="0502" >0502</option><option value="0503" >0503</option><option value="0504" >0504</option><option value="0505" >0505</option><option value="0506" >0506</option><option value="0507" >0507</option><option value="0508" >0508</option><option value="02" >02</option><option value="031" >031</option><option value="032" >032</option><option value="033" >033</option><option value="041" >041</option><option value="042" >042</option><option value="043" >043</option><option value="051" >051</option><option value="052" >052</option><option value="053" >053</option><option value="054" >054</option><option value="055" >055</option><option value="061" >061</option><option value="062" >062</option><option value="063" >063</option><option value="064" >064</option><option value="070" >070</option><option value="080" >080</option></select>
								<span class="dash">-</span>
								<input type="text" class="celluar" id="tel_no2" name="tel_no2" title="휴대폰번호 가운데 자리 입력" value="2944">
								<span class="dash">-</span>
								<input type="text" class="celluar" id="tel_no3" name="tel_no3" title="휴대폰번호 마지막 자리 입력" value="1409">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="quest_title">제목<em class="req">*<span class="ir">필수입력정보</span></em></label>
							</th>
							<td>
								<input type="text" class="w_tit" id="quest_title" name="quest_title" title="제목 입력" placeholder="제목을 입력해 주세요." onkeyup="fnLimitText('quest_title','50')"/>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="quest_cont">내용<em class="req">*<span class="ir">필수입력정보</span></em></label>
							</th>
							<td>
								<textarea id="quest_cont" name="quest_cont" cols="50" rows="10" class="textarea wide" placeholder="취소, 교환, 반품 신청은 주문배송 조회에서 ‘결제완료’ 상태인 경우에 즉시취소 가능합니다.&#10;주문에 대한 문의일 경우, 상품을 선택하여 문의 주시면 보다 빠른 상담이 가능합니다." title="내용" onkeyup="fnLimitText('quest_cont','1000')"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">사진 등록</th>
			 					<td>
									<dl class="file_inp">
										<dt class="ir">첨부 사진 파일찾기</dt>										
										<dd>
											<input type="file" name="file" id="file0" title="제품 사진 업로드" />
											<button type="button" class="del" name="deleteImgBtn" title="상품 사진 업로드 항목 삭제">삭제</button>
											<input type="hidden" name="pre_file_nm" value="" />
										</dd>
									</dl>
									<div class="r_noti">
										<ul>
											<li><em>*</em> 사진의 크기는 20MB 이하의 jpg, png, gif 파일로 첨부 가능합니다.</li>
										</ul>
									</div>
								</td>
							</tr>
							
					</tbody>
				</table>
				<br>
				<p>※ 고객센터 운영시간(평일 08:00~20:00) 이후 문의는 고객센터 운영시간 내에 순차적으로 답변드립니다.</p>
			</form>
			
			<div class="conf_btns">
				<button class="confirm" onclick="save();"><em>확인</em></button>
				<button class="cancel" id="cancelBtn"><em>취소</em></button>
			</div>
			<!-- //COUNSEL WRITE -->
			<div class="info_box01">
				<strong class="box_tit">상담 TIP</strong>
				<ul class="list_01">
					<li>1:1상담은 추가로 궁금하신 내용을 상담하는 공간입니다.</li>
					<li>배송상담, 취소/반품 상담은 해당 주문을 선택 하신 후 상담 사항을 작성해 주세요.</li>
					<li>주문 취소/반품 신청은 MY더반찬 메뉴에서 신청하시면 더욱 빠르게 처리됩니다.</li>
				</ul>
			</div>
		</div>
		<!-- //SUB CONTENT -->
	</div>
	<!-- WRAP -->
</div>
<!-- //CONTENT -->









			
</body>
</html>