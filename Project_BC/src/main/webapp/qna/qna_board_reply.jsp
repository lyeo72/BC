<%@page import="vo.QnaBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	QnaBoardBean article = (QnaBoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>집밥선생</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../inc/dashBoard_top.jsp" %>
	<!-- 게시판 답변하기 -->
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
						<i class="fas fa-table me-1"></i> 답변하기.
					</div>
					
				<div class="card-body">	
		<form action="QnaReplyPro.qa" method="post" name="replyForm">
			<!-- 답변 글 작성에 필요한 게시물 정보 중 입력받지 않는 정보도 함께 전달 -->
			<input type="hidden" name="page" value="<%=nowPage %>" />
			<input type="hidden" name="qna_idx" value="<%=article.getQna_idx() %>" />
		
			<table class="table table-bordered">
				<tr>
					<td class="td_left"><label for="seller_id">글쓴이</label></td>
					<td class="td_right"><input type="text" name="seller_id" value="<%=article.getSeller_id() %>" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_pass">비밀번호</label></td>
					<td class="td_right"><input type="password" name="board_pass" required="required"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qna_subject">제목</label></td>
					<td class="td_right"><input type="text" name="board_subject" value="<%=article.getQna_subject() %>" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="qna_content">내용</label></td>
					<td class="td_right">
						<textarea id="board_content" name="qna_content" cols="80" rows="20" required="required"><%=article.getQna_content() %> 
			------------- 원본 글 내용 -------------
							
						</textarea>
					</td>
				</tr>
				<tr>
					<th></th>
					<th><input class="btn btn-primary" type="submit" value="답변글등록">&nbsp;&nbsp;<input class="btn btn-primary" type="reset" value="다시쓰기"></th>
					
				</tr>			
			</table>
			</form>
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
<!-- 	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script> -->
	<script src="js/assets/demo/datatables-simple-demo.js"></script>
</body>
</html>
		

