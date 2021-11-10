<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
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
					<form action="NoticeWritePro.ad" method="post" name="NoticeBoard">			
						<table class="table table-bordered">
							<tr>
								<th class="td_left">제목</th>
								<td class="td_right"><input type="text"	name="board_subject" required="required"></td>
							</tr>
							<tr>
								<th class="td_left">내용</th>
								<td class="td_right">
								<textarea id="board_content" name="board_content" cols="40" rows="15" required="required"></textarea>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>						
								<input class="btn btn-primary" type="submit" value="등록">&nbsp;&nbsp; <input class="btn btn-danger" type="reset" value="다시쓰기">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</main>
	</div>
	<%@include file="../inc/dashBoard_bottom.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/assets/demo/scripts2.js"></script>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script> -->
	<script src="js/assets/demo/datatables-simple-demo.js"></script>
</body>
</html>