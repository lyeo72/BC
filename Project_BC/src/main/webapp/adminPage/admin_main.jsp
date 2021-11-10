<%@page import="vo.CustomerBean"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<NoticeBean> noticeList = (ArrayList<NoticeBean>)request.getAttribute("noticeList");
    ArrayList<CustomerBean> memberList = (ArrayList<CustomerBean>)request.getAttribute("memberList");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥선생_AdminPage</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
      <!-- Bootstrap CSS -->

      
      
</head>
<body class="sb-nav-fixed">
 
  <jsp:include page="../inc/dashBoard_top.jsp"/>
     
                <!--  메인 Content -->
                 <!--  첫차트. -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Admin</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">DashBoard</li>
                        </ol>
                        
                      
                        <div class="row">      
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                       1:1문의
                                    </div>
                                    <div class="card-body">
                                       <table class="table table-striped text-wrap">
                                        <tr>
                                            <th>번호</th>
                                            <th>상담유형</th>
                                            <th>상담제품</th>
                                            <th>고객명</th>
                                            <th>제목</th>                                            
                                            <th>전화번호</th>
                                            <th>날짜</th>   
                                            
                                        </tr>                                    
                                        <tr>
                                            <td>000001</td>
                                            <td>제품상담</td>
                                            <td><a href="#">미트신선한미트</a></td><!-- 클릭시 상품 디테일 페이지로 이동. -->
                                            <td>정성원</td>
                                            <td>고기가 맛없어요</td>
                                            <td>010-123-1234</td>
                                            <td>2021-10-19</td>
                                        </tr>
                                        <tr>
                                            <td>000001</td>
                                            <td>제품상담</td>
                                            <td><a href="#">미트신선한미트</a></td><!-- 클릭시 상품 디테일 페이지로 이동. -->
                                            <td>정성원</td>
                                            <td>고기가 맛없어요</td>
                                            <td>010-123-1234</td>
                                            <td>2021-10-19</td>
                                        </tr> 
                                        <tr>
                                            <td>000001</td>
                                            <td>제품상담</td>
                                            <td><a href="#">미트신선한미트</a></td><!-- 클릭시 상품 디테일 페이지로 이동. -->
                                            <td>정성원</td>
                                            <td>고기가 맛없어요</td>
                                            <td>010-123-1234</td>
                                            <td>2021-10-19</td>
                                        </tr>                                         
                                    
                                                                                                           
                                      </table>
                                    </div>
                                  </div>                                    
                                </div>                        
                            
                            
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                       공지사항
                                    </div>
                                    <div class="card-body">
                                   <table class="table table-striped text-wrap">
                                        <%  if(noticeList != null){  %>
                                        <tr>                                        
                                            <th>글번호</th>
                                            <th>제목</th>
                                            <th>등록일</th>    
                                        </tr>
                                        <%for(int i = 0; i < noticeList.size(); i++) { %>                                    
                                        <tr onclick="location.href='NoticeView.ad?notice_num=<%=noticeList.get(i).getNotice_num()%>'">
                                            <td><%=noticeList.get(i).getNotice_num()%></td>
                                            <td><a href="#"><%=noticeList.get(i).getNotice_subject()%></a></td>
                                            <td><%=noticeList.get(i).getNotice_date()%></td><!-- 클릭시 상품 디테일 페이지로 이동. -->                                            
                                        </tr>
                                          <%} %>
                                        <%}else{ %>
                                        <tr>
                                            <td>공지가 없습니다.</td>                                            
                                        </tr>
                                        <%} %>
                                        </table>
                                    </div>
                                </div>
                                </div>                          
                       
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                       일별차트
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            
                             <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                       월별차트
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원관리
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
                                                     <li><button class="dropdown-item" type="button" onclick="location.href='${pageContext.request.contextPath}/MemberStatus.ad?id=<%=memberList.get(i).getId() %>'">권한변경</button></li>
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
                
               <jsp:include page="../inc/dashBoard_bottom.jsp"/>
            
            </div>
        </div>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/scripts2.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/chart-area-demo.js"></script>
        <script src="js/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/assets/demo/datatables-simple-demo.js"></script>
    </body>

</html>