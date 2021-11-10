<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	NoticeBean article = (NoticeBean)request.getAttribute("article");
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
	<!-- 게시판 상세내용 보기 -->

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">공지사항</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="Seller.sc">Dashboard</a></li>
					<li class="breadcrumb-item active">공지사항</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">공지사항 게시판 입니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 글 상세내용
					</div>
										
						<div class="card-body">
							<table class="table table-bordered">
								<tr>
									<th width="70">제 목</th>
									<td colspan="3"><%=article.getNotice_subject()%></td>
								</tr>
								<tr>
									<th width="70">내용</th>
									<td><%=article.getNotice_content()%></td>
								</tr>								
								<tr>
									<th></th>
									<td>
									<%if(grade == 1) {%>
              
									<a class="btn btn-primary text-right" href="NoticeModifyForm.qa?board_num=<%=article.getNotice_num()%>">수정</a> &nbsp;&nbsp;
									<a class="btn btn-primary text-right" href="NoticeDeleteForm.qa?qna_idx=<%=article.getNotice_num()%>">삭제</a> &nbsp;&nbsp;
                                     <%} %>
									
									
									
									<a class="btn btn-primary text-right" href="Notice.ad">목록</a> &nbsp;&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
		</main>
		<%@include file="../inc/dashBoard_bottom.jsp"%>
	</div>
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