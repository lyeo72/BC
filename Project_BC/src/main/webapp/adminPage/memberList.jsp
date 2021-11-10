<%@page import="vo.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Admin DashBoard</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<%
ArrayList<CustomerBean> memberList = (ArrayList<CustomerBean>)request.getAttribute("memberList");
%>

</head>

<body>
 <%@include file="../inc/dashBoard_top.jsp" %>



<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">MemberList</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                               회원 조회                           
                            </div>
                        </div>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 조회   
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                       <% if(memberList != null){ %>
                                       <tr>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>등급</th> 
                                            <th>status</th>                                          
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>등급</th>  
                                            <th>status</th>                                           
                                        </tr>
                                    </tfoot>
                                      <tbody>
                                        <%for(int i=0; i<memberList.size(); i++){ %>
                                            <%if(memberList.get(i).getMember_status()==1){ %>
                                        <tr style="text-decoration:none; color:#009000">
                                        <%}else{ %>
                                        <tr  style="text-decoration:none; color:#FF0000">
                                        <%} %>
                                            <td><%=memberList.get(i).getId()%></td>
                                            <td><%=memberList.get(i).getPhone() %></td>
                                            <td><%=memberList.get(i).getEmail() %></td>
                                            <td>
                                            <% if(memberList.get(i).getGrade()==2){ %>
                                            판매자<%}else{ %>
                                            소비자<%} %>
                                            </td>
                                            <td><%=memberList.get(i).getMember_status() %> </td>
                                            <td>
	                                             <div class="dropdown">
	                                               <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
	                                                 info
	                                               </button>
	                                               <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
	                                                 <li><button class="dropdown-item" type="button" onclick="location.href='${pageContext.request.contextPath}/MemberStatus.ad?id=<%=memberList.get(i).getId() %>&grade=<%=memberList.get(i).getGrade()%>'">권한변경</button></li>
	                                                 <li><button class="dropdown-item" type="button" onclick="location.href='${pageContext.request.contextPath}'/MemberLeave.ad?id=<%=memberList.get(i).getId() %>'">회원탈퇴</button></li>
	                                               </ul>
	                                             </div>
                                            </td> 
                                        </tr>
                                   <%} 
                                   }%>
                                    </tbody>
                                    
                                </table>
                            </div>
                        
                        </div>
                    </div>
                </main>
                 <%@include file="../inc/dashBoard_bottom.jsp" %>
            </div>
        </div>
        <script src="js/assets/demo/scripts2.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/assets/demo/datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>