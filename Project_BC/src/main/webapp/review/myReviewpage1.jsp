<%@page import="vo.Productbean"%>
<%@page import="vo.orderProductBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    ArrayList<Productbean> orderList = (ArrayList<Productbean>)request.getAttribute("orderList");
%>

<div id="evalListBodydiv" style="width: 100px; height: 100px;">
	<%
	if(orderList != null) {
	%>
			
		<div class="g_rv_lst">
			<h4 class="ir">결제완료 목록</h4>
		
			<table>
				<tr>
					<th>
						사진
					</th>
					<th>
						상품이름
					</th>
					<th>	
						별점
					</th>
				</tr>
				<%
				for(int i = 0; i < orderList.size(); i++) {
				%>
				<tr onclick="location.href = ReviewForm.re?product_num=<%=orderList.get(i).getProduct_num()%>">
					<td>
						<img alt="" src="">
					</td>
					<td>
						<span class="user"><%=orderList.get(i).getProduct_name() %></span>
					</td>
					<td>	
						<span class="user"><%=orderList.get(i).getProduct_review_score()%>점</span>
					</td>
				</tr>
			<% } %>
			</table>
		</div>	
		      
</div>
	
 <% }else{ %>
	   
			수취 완료 후 30일 이내  작성 가능한 후기가 없습니다.
		
 <% } %>
