<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판</title>
<style type="text/css">
   #registForm {
      width: 500px;
      height: 610px;
      border: 1p solid red;
      margin: auto;
   }
   
   h1 {
      text-align: center;
   }
   
   table {
      margin: auto;
      width: 450px;
   }
   
   .td_left {
      width: 150px;
      background: orange;
   }
   
   .td_right {
      width: 300px;
      background: skyblue;
   }
   
   #commandCell {
      text-align: center;
   }
</style>
</head>
<body>
   
   <!-- 게시판 등록 -->
   <section id="writeForm">
      <h1>게시판 글 등록</h1>
      <form action="QnaWritePro.qa" method="post"  name="boardForm">
      <!-- 파일 업로드 기능을 사용하려면 cos.jar 라이브러리 등록 필수 -->
         <table>
         <tr>
               <td class="td_left"><label for="product_num">제품이름</label></td>
               <td class="td_right"><label name="product_num" ><% %></label></td>
         </tr>
            <tr>
               <td class="td_left"><label for="board_pass">비밀번호</label></td>
               <td class="td_right"><input type="password" name="qna_password" required="required" /></td>
            </tr>
            <tr>
               <td class="td_left"><label for="qna_subject">제목</label></td>
               <td class="td_right"><input type="text" name="qna_subject" required="required" /></td>
            </tr>
            <tr>
               <td class="td_left"><label for="qna_content">내용</label></td>
               <td class="td_right">
                  <textarea id="board_content" name="qna_content" cols="40" rows="15" required="required"></textarea>
               </td>
            </tr>

         </table>
         <section id="commandCell">
            <input type="submit" value="등록">&nbsp;&nbsp;
            <input type="reset" value="다시쓰기">
         </section>
      </form>
   </section>
   
</body>
</html>