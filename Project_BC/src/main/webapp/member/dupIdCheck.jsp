<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dupCheckID</title>
</head>
<link href="../CSS/mem.css" rel="stylesheet" type="text/css">
<link href="../CSS/common.css" rel="stylesheet" type="text/css">
<link href="../CSS/pc-main-common.css" rel="stylesheet" type="text/css">
<link href="../CSS/sub.css" rel="stylesheet" type="text/css">
<link href="../CSS/font.css" rel="stylesheet" type="text/css">
<script src="../js/dupCheck.js"></script> 
<link href="CSS/mem.css" rel="stylesheet" type="text/css">
<link href="CSS/common.css" rel="stylesheet" type="text/css">
<link href="CSS/pc-main-common.css" rel="stylesheet" type="text/css">
<link href="CSS/sub.css" rel="stylesheet" type="text/css">
<link href="CSS/font.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function DupChecked(){
	var element = document.getElementById('checkIdResult');

	// idCheckResult 값이 true이면, true리턴 , 아니면 false 리턴
	if(idCheckResult){
		return true;
	}else{
	element.innerHTML = '아이디를 4 ~ 20자리 영문자, 숫자로 혼합해 주세요';
	document.checkForm.id.focus();
	return false;
	}
}
</script>
<link rel="shortcut icon" href="#">
<body>

<%
String id = request.getParameter("id");
String memberid = request.getParameter("member_id");

// 조회할 아이디 값이 있을 경우 (null이 아니고 널스트링이 아닐 경우)에만 중복 확인 수행
if(id != null && !id.equals("")){
	// MemberDAO 객체의 dupCheckId() 메서드를 호출하여 아이디 조회 후 중복 여부 판별
	// => 파라미터 : 아이디(id) , 리턴타입 : boolean(isDuplicate)
	
	MemberDAO dao = MemberDAO.getInstance();

	boolean isDuplicate = dao.dupCheckId(id);
	%>
	<%
	
	if(isDuplicate){
	//	 아이디가 중복일 경우 (isDuplicate 값이 true) "아이디 중복"을 표시 
	out.println("<h3>"+id+" : 아이디 중복</h3>");
	}else{
	//	 아이디가 중복이 아닐 경우 (isDuplicate 값이 false) "아이디 사용가능"을 표시 
	%>
 	<h3><%=id %>
 	<input type="button" value="아이디 사용" onclick="useId('<%=id%>')"></h3>
	 <%	 
 	 }
 }
 %>

<!-- 아아디 중복 확인을 위한 입력 창 -->
<form action="dupIdCheck.jsp" method="post" name="checkForm" onsubmit="return DupChecked()">
	<br><br>
	
	아이디 <input type="text" name="id"  required="required" onkeyup="checkId(this.value)">
	<input type="submit" value="중복 확인"><br>
		<div id="checkIdResult"> <!--  메시지 표시 공간 --> </div><br>
</form>
</body>
</html>