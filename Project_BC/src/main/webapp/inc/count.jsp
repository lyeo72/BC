<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cartCount = (Integer)session.getAttribute("CartCount");
%>


<%=cartCount %>
