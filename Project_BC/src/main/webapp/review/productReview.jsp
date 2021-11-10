<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int product_num = Integer.parseInt(request.getParameter("product_num").toString());
	double score = (Double)request.getAttribute("score");
	double avgScore = Math.round((Double)request.getAttribute("avgScore")*10)/10.0;
	double avgPercent = (Double)request.getAttribute("avgPercent");
	
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	int starRate = 0;
	
	if(listCount > 0) {
		starRate = (int)avgScore * 10 * 2;
	} else {
		starRate = 0;
	}
	
	
%>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
	$('.on').click(function(){
	    $('.noPhoto').show();
	  });
	  $('.off').click(function(){
	    $('.noPhoto').hide();
	  });

	
	
});

function arrange() {
	var selectValue = document.getElementById('sch_gb').value;
	var product_num = <%=product_num%>
	if(selectValue=="high_score"){
		alert(selectValue);
		location.href='ReviewList.re?arrange='+selectValue+'&product_num='+product_num;
		$("#sch_gb").val("high_score").prop("selected", true);
		
		
	}else if(selectValue=="row_score"){
		alert(selectValue);
		location.href='ReviewList.re?arrange='+selectValue+'&product_num='+product_num;
		
	}else{
		alert(selectValue);
		location.href='ReviewList.re?arrange='+selectValue+'&product_num='+product_num;
		
	}

       
}
</script>
<!-- 파일로 연결할 시 css가 부분부분 깨짐.일단은 링크로 연결해두고 나중에 고쳐보기. -->
<link href="CSS/common.css" rel="stylesheet" type="text/css">
<link href="CSS/pc-main-common.css" rel="stylesheet" type="text/css">
<link href="CSS/sub.css" rel="stylesheet" type="text/css">
<link href="CSS/font.css" rel="stylesheet" type="text/css">
<link href="CSS/font.css" rel="stylesheet" type="text/css">
<link href="CSS/gds.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/gds.css?t=20200406000000" type="text/css">
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/common.css?v=20211010170" type="text/css">   

</head>
<body>
<!-- TAB3 -->
	

			<div class="gds_cont" id="gds_cont3">
			<div class="gd_tabs">
				<ul>
					<li><a href="#gds_cont1">제품정보</a></li>
					<li><a href="#gds_cont2">제품정보고시</a></li>
					<li class="on"><a href="#gds_cont3">고객후기<em class="ir">선택</em></a></li>
					<li><a href="#gds_cont4">주의사항</a></li>
				</ul>
			</div>
			
			<div class="gd_scr">
				<dl>
					<dt>사용자 총 평점<em>(총 <b><%=listCount%></b>개 고객후기 기준)</em></dt>
					<dd>
						<span class="star_rate04"><b class="ir">평점</b><em style='width:<%=starRate%>%'>review_score출력</em></span>
							<%if(listCount > 0) { %>
								<span class="scr"><b><%=avgScore%></b>/5<em>점</em></span>
							<%} else { %>
								<span class="scr"><b>0</b>/5<em>점</em></span>
							<%} %>
					</dd>
				</dl>
			</div>
			<div class="gd_rv" id="goodsEvalDiv">
				<div class="g_sort">
					<h3>고객후기</h3>
				<div class="group">
					<ul>
						<li name="evalTab" data-value=""><a href="javascript:void(0);" id="rtabs0" class="on" onclick="fnTab(3, 'rtabs', 0, '');return false;">전체 <%//count(idx) %></a></li>
						<li name="evalTab" data-value="photo"><a href="javascript:void(0);" id="rtabs1" class="off" onclick="fnTab(3, 'rtabs', 1, '');return false;">포토  <%//count(img) %></a></li>
						
					</ul>
				
				
				</div>
				<div class="sort">
						
						<span class="button">
							<button type="button" title="고객후기작성 열기" onclick="location.href='<%=request.getContextPath() %>/Review.my'">고객후기 작성</button>
						</span>
				</div>
				<input type="hidden" id="eval_goods_no" name="eval_goods_no" value="2106015489">	
				</div>
				<div id="evalListBodydiv">

				<!-- REVIEW LIST -->
				<%
				if(reviewList != null && listCount > 0) {
				%>
				
				<div class="g_rv_lst">
					<h4 class="ir">고객후기 목록</h4>
				
					<ul>
						<%
						for(int i = 0; i < reviewList.size(); i++) {
						%>
						<%if(reviewList.get(i).getReview_img()!=null){ %>
						<li class="photo">
							<dl>
								<dt>
									<span class="pho"><img src="<%if(reviewList.get(i).getReview_img()!=null){ %>//www.thebanchan.co.kr/fo/images/gds/ico_picture.png<% }%>" width="18" height="14" ></span>

									<span class="star_rate05"><b class="ir"><%=reviewList.get(i).getReview_score() %></b><em style="width:<%=reviewList.get(i).getReview_score()/5*100 %>%;"><%=reviewList.get(i).getReview_score() %></em></span>


									<span class="user"><%=reviewList.get(i).getReview_id() %></span>
									<span class="date"><%=reviewList.get(i).getReview_date()%></span>
								</dt>
								<dd class="off">
									<div class="rcmt">
										<%=reviewList.get(i).getReview_content()%>
									</div>

									<div class="rimg">
									
										<img src="<%=request.getContextPath() %>/review/reviewImg/<%=reviewList.get(i).getReview_img() %>">
										
									</div>

								</dd>
							</dl>
						</li>
						<% }else {%>
						<li class="noPhoto">
							<dl>
								<dt>
									<span class="pho"><img src="<%if(reviewList.get(i).getReview_img()!=null){ %>//www.thebanchan.co.kr/fo/images/gds/ico_picture.png<% }%>" width="18" height="14" ></span>

									<span class="star_rate05"><b class="ir"><%=reviewList.get(i).getReview_score() %></b><em style="width:<%=reviewList.get(i).getReview_score()/5*100 %>%;"><%=reviewList.get(i).getReview_score() %></em></span>


									<span class="user"><%=reviewList.get(i).getReview_id() %></span>
									<span class="date"><%=reviewList.get(i).getReview_date()%></span>
								</dt>
								<dd class="off">
									<div class="rcmt">
										<%=reviewList.get(i).getReview_content()%>
									</div>

								

								</dd>
							</dl>
						</li>




						<%} %>
					</ul>
					
					<%}%>
				</div>	

				<!-- PAGING -->
				<div class="paging" id="page_nav">
					<section id="pageList">
						<%if(nowPage > 1) {%>
			      		<a href="ReviewList.re?product_num=<%=product_num %>&page=<%=nowPage -1 %>">Prev</a>&nbsp;
				      		<%
				      	}else{
				      		%>
				      		Prev&nbsp;
				      		<%
				      	}
				      	
				      	for(int i = startPage; i<=endPage; i++){
				      		if(nowPage == i){
				      			%><%=i %>&nbsp;<%
				      		} else{
				      			%>
				      			<a href="ReviewList.re?product_num=<%=product_num %>&page=<%=i %>"><%=i %></a>&nbsp;
				      			<%
							}
						} 
						
				      	if(nowPage < maxPage){ %>
				      		<a href="ReviewList.re?product_num=<%=product_num %>&page=<%=nowPage +1 %>">Next</a>&nbsp;
				      		<%
				      	}else{
				      		 %>Next&nbsp;<%
				      	}
				} else {%>
					<div id="evalListBodydiv">   
			            <!-- REVIEW NONE -->
			            <div class="g_rv_none">등록된 고객후기가 없습니다.</div>
			            <!-- //REVIEW NONE -->
		            </div>
		      <%} %>
					</section>
				</div>
				<!-- //PAGING -->
				<!-- //REVIEW LIST -->
				</div>
					</div>
		</div>
			
</body>
</html>