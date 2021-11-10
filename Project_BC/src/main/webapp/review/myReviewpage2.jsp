<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");
	
%>

<div id="evalListBodydiv">
	<%
	if(reviewList != null) {
	%>
		
		<div class="g_rv_lst">
			<h4 class="ir">작성된 후기 목록</h4>
			
			<ul>
			<% for(int i = 0; i < reviewList.size(); i++) {	%>
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
			<% } %>
			</ul>
			
		</div>	
</div>

	<%}else{%>
	
			작성 한 후기가 없습니다.
	
	<% } %>
