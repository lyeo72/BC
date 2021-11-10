<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥선생_AdminPage</title>
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
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">공지사항</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">Notice</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">공지사항 게시판 입니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 공지사항
					</div>
					<div class="card-body">
						<table id="datatablesSimple">							
								<thead>
									<%	if (articleList != null) {	%>
									<tr>
										<th >번호</th>
										<th>제목</th>										
										<th >날짜</th>
									</tr>
								</thead>
								<tfoot>

									<tr>
										<th>번호</th>
										<th>제목</th>										
										<th>날짜</th>
									</tr>
								</tfoot>
								<tbody>
									<%for (int i = 0; i < articleList.size(); i++) { %>
									<tr>
										<td><%=articleList.get(i).getNotice_num()%></td>
										<td><a href="NoticeView.ad?notice_num=<%=articleList.get(i).getNotice_num()%>"><%=articleList.get(i).getNotice_subject()%></a></td>										
										<td><%=articleList.get(i).getNotice_date()%></td>
									</tr>
									<%}%>
								</tbody>
							</table>
							<%}%>						
					</div>
					<%if(grade == 1) {%>
				<a href="NoticeWrite.ad" class="btn btn-primary btn-lg" role="button" aria-disabled="true">글쓰기</a>
				<%} %>
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