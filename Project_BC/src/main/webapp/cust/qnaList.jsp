<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>1:1상담내역 | theBanchan</title>
	<link rel="shortcut icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
<link rel="icon" href="//www.thebanchan.co.kr/fo/images/common/favicon.ico?v=2" type="image/x-icon">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211010170" type="text/css">   
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/pc-main-common.css?v=20211010170" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/sub.css?v=20211010170" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/asset/css/font.css?v=20211010170" type="text/css">
<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/jquery.plugin.js"></script>

<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/ui.js"></script>

<!--// HEADER -->
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/cst.css" type="text/css">

<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/overpass.mypage.js"></script>
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/overpass.calendar.js"></script>


<script type="text/javascript">
//목록 조회
getList = function(){
	var searchForm = $('#searchForm');	
	//검색조건 필수 체크 및 조건을 form에  append
	if(!_checkValidationAndAppendDataToForm('searchForm')){
		return;
	};
	searchForm.find('[name=page_idx]').val("1");
	searchForm.attr("action","/mypage/initCustCenterCounselList.action").submit();
}

$(document).ready(function(){
	
	//좌측메뉴 하이라이트
	$('#left_03').addClass("on");
	
	// 안내 문구 셋팅
	$("#guide_text").html("기간을 선택하신 후에 조회하기 버튼을 클릭하시면 해당 기간의 1:1상담 내역이 확인됩니다. (최대 1년 이내로 조회하실 수 있습니다.)");
	
	// 죄측 메뉴 하이라이트
	$('#left_08').addClass("on");
	
	//조회 버튼 클릭
	$('#searchBtn').click(function(){
		getList();
	});
	/* $('#searchBtn').on("click", function() {
		console.log("ssss");
		getList();
	}); */
	
	// 삭제버튼
	initDeleteBtn();

	//페이지 이동
	$("#box_page").createAnchor({
		name: "page_idx", // 해당 페이지 앵커의 페이지번호 패러미터명과 일치하여야 함. 디폴트는 page_no
		fn: function(page, parameters) {
			location.href = "/mypage/initCustCenterCounselList.action?page_idx=" + page + "&" + parameters;
		}
	});	
});

//삭제버튼 초기화
var initDeleteBtn = function(){
	$('[name=deleteBtn]').click(function(){
		 
		if ( confirm("문의를 삭제하시겠습니까?" )){
			var counsel_no = $(this).data("counsel_no");
			var v_counsel_stat_cd = $(this).data("counsel_stat_cd");
			$.ajax({
				url: "/mypage/deleteMyCounsel.action",
				data: {counsel_no : counsel_no, v_counsel_stat_cd: v_counsel_stat_cd},
				type: "get",
				dataType: "text",
				success: function(data) {
					if(data == 'S'){
						alert("삭제되었습니다.");
						getList('1');
					}
				}, error : function( e ){
					if ( e.error_message !=null && e.error_message != ""){
						alert(e.error_message);
					}else{
						alert("삭제중 오류가 발생하였습니다.");
					}
				}
			});	
		}
	});	
}

</script>

<form id="searchForm" method="post">
<input type="hidden" name="page_idx"/>
</form>

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
		<div id="mys_content" class="sub_cont">
			<h3 class="tit2">1:1 상담내역</h3>
			
			<!-- DATE SEARCH -->
			
<div class="mys_sch">
	<dl>
		<dt>조회기간</dt>
		<dd class="d_gradeSelect">
			<span class="sel">
				<button id="period_1w" type="button" data-val="1" data-type="week" >1주일</button>
				<button id="period_1m" type="button" data-val="1" data-type="month" >1개월</button>
				<button id="period_3m" type="button" data-val="3" data-type="month" >3개월</button>
				<button id="period_6m" type="button" data-val="6" data-type="month" >6개월</button>
			</span>
		</dd>
		<dd>
			<span class="date">
				<input type="text" class="input_txt input_date" title="기간검색 시작일" id="date_start" name="date_start" value="2021-09-10"/>
				<button type="button" id="cal_start" title="조회기간 선택 달력 레이어 열기">달력에서 선택</button>
			</span>
			<span class="tx">~</span>
			<span class="date">
				<input type="text" class="input_txt input_date" title="기간검색 종료일" id="date_end" name="date_end" value="2021-10-10"/>
				<button type="button" id="cal_end" title="조회기간 선택 달력 레이어 열기">달력에서 선택</button>
			</span>
		</dd>
		<dd><button type="button" class="bt_sch" id="searchBtn">조회</button></dd>
	</dl>
	<div class="txt" id="guide_text"></div>	
	
	<!-- CALENDER LAYER -->
	<div class="show_calendar" id="show_calendar"></div>
	<!--// CALENDER LAYER -->			
</div>
<!-- //DATE SEARCH -->

<script type="text/javascript">
	var _global_param = {
			date_divi :'1', 
			date_divi_tp : 'month', 
			startCalObj : $('#cal_start'), 
			endCalObj : $('#cal_end'),
			startInputObj : $('#date_start'),
			endInputObj : $('#date_end') 
			}
	
	var checkPeriod = 12;
	
	$(document).ready(function(){
		if($("#checkPeriod").length > 0) {
			if($("#login_list").length > 0) {
				checkPeriod = 3;
			}else{
				checkPeriod = 6;
			}
		}
		//검색기간 클릭 이벤트
		$(".d_gradeSelect").each(function(){
			var $this = $(this);
			var $links = $this.find("button");
			$links.on("click",function(e){
				$links.removeClass("on");
	
				$(this).addClass("on");
				
				//기간 버튼 클릭시 달력영역 날짜 세팅
				overpass.mypage.searchFilter.selectPeriodBtn($(this));
			})
		});
		
		//달력 초기화
		overpass.mypage.searchFilter.initCal(_global_param.startCalObj, _global_param.startInputObj, _global_param.endInputObj, checkPeriod);
		overpass.mypage.searchFilter.initCal(_global_param.endCalObj, _global_param.startInputObj, _global_param.endInputObj, checkPeriod);
		
		//검색 버튼 초기화
		//overpass.mypage.searchFilter.initBtn();		
		if(_global_param.date_divi_tp=='week' || _global_param.date_divi_tp=='month'){
			overpass.mypage.searchFilter.initBtn($('.d_gradeSelect > span > button[data-val='+_global_param.date_divi+'][data-type='+_global_param.date_divi_tp+']'));
		}
		
		//검색기간 readonly처리
		$('#date_start').attr("readonly", true);
		$('#date_end').attr("readonly", true);
		
		//크롬에서 float:left 깨짐 버그를 방지하기 위해 한번 더 왼쪽 붙임 작업 수행
		$(".mys_sch > dl dd .sel button").css("float","left");
	});
	
	// 현재 선택된 검색 조건을 form 에 append 한다.
	var _checkValidationAndAppendDataToForm = function(formObj){
		
		//_preventDefault();
		
		var date_divi_tp='';
		var date_divi='';
		var date_start='';
		var date_end='';
		
		$('[id^=period_]').each(function(){
			if($(this).attr("class")=="on"){
				date_divi = $(this).data("val");
				date_divi_tp = $(this).data("type");
			}
		});
		
		if(date_divi_tp == '' && $('#date_start').val()!='' && $('#date_end').val()!=''){
			date_divi_tp='menual';
			date_divi='';
		}
		
		date_start=$('#date_start').val();
		date_end=$('#date_end').val();
		
		if(date_divi_tp==''){
			alert('검색 조건을 설정해 주세요.');	
			return false;
		}
		
		if(!overpass.mypage.searchFilter.checkPeriodCondition(checkPeriod)){
			return false;
		}
		
	    $('#'+formObj).append("<input type='hidden' value='"+date_divi_tp+"' name='date_divi_tp'/>");
		$('#'+formObj).append("<input type='hidden' value='"+date_divi+"' name='date_divi'/>");
		$('#'+formObj).append("<input type='hidden' value='"+date_start+"' name='date_start'/>");
		$('#'+formObj).append("<input type='hidden' value='"+date_end+"' name='date_end'/>");
		
		return true;
	}
</script>
			<!-- //DATE SEARCH -->

			<!-- MY LIST -->	
			




	
						
							
	<!-- LIST NONE -->
	<div class="mys_none">
		<span class="txt">1:1 친절상담 내역이 없습니다.</span>
	</div>
	<!-- //LIST NONE-->

			<!-- //MY LIST -->			
			
		</div>
		<!-- //SUB CONTENT -->
	</div>
	<!-- WRAP -->
</div>
<!-- //CONTENT -->





</body>
</html>