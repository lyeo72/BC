<%@page import="vo.NoticeBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집밥선생_SellerPage</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
      
</head>
<body class="sb-nav-fixed">
 <%
 String sId = (String)session.getAttribute("sId");
 ArrayList<BoardBean> articleList = (ArrayList<BoardBean>)request.getAttribute("articleList");
 ArrayList<NoticeBean> noticeList = (ArrayList<NoticeBean>)request.getAttribute("noticeList");

 
 
 %>
  <jsp:include page="../inc/dashBoard_top.jsp"/>
     
                <!--  메인 Content -->
                 <!--  첫차트. -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4" style="background-color: #ddeefc;">
                        <h1 class=""><%= sId %> 판매자님 어서오십시오</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">DashBoard</li>&nbsp;&nbsp;&nbsp;
                            <li><a href="AddProduct.sc" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">글쓰기</a></li>
                        </ol>
                        
                      
                        <div class="row">      
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                       리뷰관리
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
                                            <th>내용</th>    
                                        </tr>
                                        <%for(int i = 0; i < noticeList.size(); i++) { %>                                    
                                        <tr onclick="location.href='NoticeView.ad?notice_num=<%=noticeList.get(i).getNotice_num()%>'">
                                            <td><%=noticeList.get(i).getNotice_num()%></td>
                                            <td><%=noticeList.get(i).getNotice_subject()%></td>
                                            <td><a href="#"><%=noticeList.get(i).getNotice_content()%></a></td><!-- 클릭시 상품 디테일 페이지로 이동. -->                                            
                                        </tr>
                                        <%} %>
                                        </table>
                                        <%} %>
                                    </div>
                                </div>
                                </div> 
                                
                                <!-- 상품관리. --> 
                          
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <a href="ProductList.sc">상품관리</a>
                            </div>
                            <div class="card-body">
                               <table id="datatablesSimple">
                                    <thead>
                                    <%
                                       if(articleList != null){
                                    %>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>회사명</th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>판매시작일</th>
                                            <th>총 판매금액</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>판매자</th>
                                            <th>상품이름</th>
                                            <th>가격</th>
                                            <th>판매시작일</th>
                                            <th>총 판매금액</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%for(int i=0; i<articleList.size(); i++){ %>
                                       <tr>
                                            <td><%=articleList.get(i).getProduct_num() %></td>
                                            <td><%=articleList.get(i).getSeller_id() %></td>
                                            <td><a href="#"><%=articleList.get(i).getProduct_name() %></a></td><!-- 클릭시 상품 디테일 페이지로 이동. -->
                                            <td><%=articleList.get(i).getProduct_stock() %></td>
                                            <td><%=articleList.get(i).getProduct_date() %></td>
                                            <td>$<%=articleList.get(i).getProduct_price() %></td>
                                            <td>
                                            	<div class="dropdown">
												  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
												    info
												  </button>
												  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
												    <li><button class="dropdown-item" type="button">수정</button></li>
												    <li><button class="dropdown-item" type="button">삭제</button></li>
												  </ul>
												</div>
											</td>
                                        </tr>
                                            <%} %>
                                    </tbody>
                                </table>
                                <%}%>
                            </div>
                        </div>
                    </div>
                    
                    
                </main>
                
               <jsp:include page="../inc/dashBoard_bottom.jsp"/>
            
            </div>
    
        <script src="js/assets/demo/scripts2.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/chart-area-demo.js"></script>
        <script src="js/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/assets/demo/datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>

</html>