<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
	
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
	<!-- 게시판 글 삭제 -->	
	
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
						<i class="fas fa-table me-1"></i> 글삭제
					</div>

					<form action="QnaDeletePro.qa?qna_idx=<%=qna_idx%>" name="deleteForm" method="post">
			<table>
				<tr>
					<td><label>글 비밀번호 : </label></td>
					<td><input type="password" name="qna_password" required="required"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="btn btn-danger" type="submit" value="삭제">&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="돌아가기" onclick="javascript:history.back()">
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