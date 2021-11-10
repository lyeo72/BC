<%@page import="vo.QnaBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String nowPage = request.getParameter("page");
QnaBoardBean article = (QnaBoardBean) request.getAttribute("article");
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
	<!-- 게시판 수정하기 -->
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
						<i class="fas fa-table me-1"></i> 글수정
					</div>

					<form action="QnaModifyPro.qa" method="post" name="modifyForm">
						<input type="hidden" name="board_num" value="<%=article.getQna_idx()%>" />						
						<table class="table table-bordered">
							<tr>
								<td class="td_left"><label for="board_name">글쓴이</label></td>
								<td class="td_right"><input type="text" name="board_name"
									required="required" value=<%=article.getCustomer_id()%> /></td>
							</tr>
							<tr>
								<td class="td_left"><label for="board_subject">제목</label></td>
								<td class="td_right"><input type="text"
									name="board_subject" required="required"
									value=<%=article.getQna_subject()%> /></td>
							</tr>
							<tr>
								<td class="td_left"><label for="board_content">내용</label></td>
								<td class="td_right"><textarea id="board_content"
										name="board_content" cols="40" rows="15" required="required"><%=article.getQna_content()%></textarea>
								</td>
								
							</tr>
							<tr>
								<th></th>
								<td><input class="btn btn-primary" type="submit" value="수정하기">&nbsp;&nbsp;<input class="btn btn-primary" type="reset" value="다시쓰기">&nbsp;&nbsp;<input class="btn btn-primary" onclick="history.back()" value="뒤로가기">
								</td>
							</tr>
						</table>
						</form>
				</div>
			</div>
	</main>
	</div>
	<%@include file="../inc/dashBoard_bottom.jsp"%>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/assets/demo/scripts2.js"></script>
	<!-- 	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script> -->
	<script src="js/assets/demo/datatables-simple-demo.js"></script>
</body>
</html>















