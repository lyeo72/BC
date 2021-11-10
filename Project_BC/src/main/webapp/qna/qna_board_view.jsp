<%@page import="vo.QnaBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// page, BoardBean 객체 파라미터 가져오기
String nowPage = (String) request.getAttribute("page");
QnaBoardBean article = (QnaBoardBean) request.getAttribute("article");
%>
<!DOCTYPE html>
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
						<i class="fas fa-table me-1"></i> 글 상세내용
					</div>
										
						<div class="card-body">
							<table class="table table-bordered">
								<tr>
									<th width="70">제 목</th>
									<td colspan="3"><%=article.getQna_subject()%></td>
								</tr>
								<tr>
									<th width="70">작성자</th>
									<td><%=article.getCustomer_id()%></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><%=article.getQna_content() %></td>
								</tr>
								<tr>
									<th></th>
									<td>
									<a class="btn btn-primary text-right" href="QnaReplyForm.qa?board_num=<%=article.getQna_idx()%>">답변</a> &nbsp;&nbsp;
									<a class="btn btn-primary text-right" href="QnaModifyForm.qa?board_num=<%=article.getQna_idx()%>">수정</a> &nbsp;&nbsp;
									<a class="btn btn-primary text-right" href="QnaDeleteForm.qa?qna_idx=<%=article.getQna_idx()%>">삭제</a> &nbsp;&nbsp;
									<a class="btn btn-primary text-right" href="QnaList.qa">목록</a> &nbsp;&nbsp;
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




<!-- </table> -->
<!-- </section> -->
<!-- <section id="articleContentArea"> -->
<%-- 	<%=article.getQna_content()%> --%>
<!-- </section> -->
<!-- </section> -->
<!-- <section id="commandList"> -->
<!-- 	<input type="button" value="답변" -->
<%-- 		onclick="location.href='QnaReplyForm.qa?board_num=<%=article.getQna_idx()%>&page=<%=nowPage%>'"> --%>
<!-- 	<input type="button" value="수정" -->
<%-- 		onclick="location.href='QnaModifyForm.qa?board_num=<%=article.getQna_idx()%>&page=<%=nowPage%>'"> --%>
<!-- 	<input type="button" value="삭제" -->
<%-- 		onclick="location.href='QnaDeleteForm.qa?board_num=<%=article.getQna_idx()%>&page=<%=nowPage%>'"> --%>
<!-- 	<input type="button" value="목록" -->
<%-- 		onclick="location.href='QnaList.qa?page=<%=nowPage%>'"> --%>
<!-- </section> -->
<!-- </body> -->
<!-- </html> -->





