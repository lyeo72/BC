
<%@page import="vo.QnaPageInfo"%>
<%@page import="vo.QnaBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	ArrayList<QnaBoardBean> articleList = (ArrayList<QnaBoardBean>)request.getAttribute("articleList");
	QnaPageInfo pageInfo = (QnaPageInfo)request.getAttribute("pageInfo");
// 	int listCount = pageInfo.getListCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥선생</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="CSS/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<%@include file="../inc/dashBoard_top.jsp"%>
	<!-- 게시판 리스트 -->

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">1:1문의</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="Seller.sc">Dashboard</a></li>
					<li class="breadcrumb-item active">1:1문의</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">1:1문의 게시판 입니다.</div>
				</div>


				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 1:1문의
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<%
                                       if(articleList != null){
                                    %>
								<tr>
									<th>상품 번호</th>
									<th>제목</th>
									<th>작성자</th>
								
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>							
								</tr>
							</tfoot>
							<tbody>
							<%for(int i = 0; i < articleList.size(); i++) { %>
							<tr onclick="location.href='QnaDetail.qa?board_num=<%=articleList.get(i).getQna_idx() %>'">
								<td align="center"><%=articleList.get(i).getQna_idx() %></td>
								<td><%=articleList.get(i).getQna_subject() %></td>
								<td align="center"><%= articleList.get(i).getQna_subject() %></td>

							</tr>
							<%}%>							
							</tbody>
						</table>						
						<%} %>
					</div>
<!-- 					<a href="QnaWriteForm.qa" class="btn btn-primary btn-lg" -->
<!-- 						tabindex="-1" role="button" aria-disabled="true">글쓰기</a> -->
				</div>
			</div>
		</main>
		<%@include file="../inc/dashBoard_bottom.jsp"%>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/assets/demo/scripts2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/assets/demo/datatables-simple-demo.js"></script>
</body>
</html>

