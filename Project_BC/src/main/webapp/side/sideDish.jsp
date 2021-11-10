
<%@page import="vo.BoardBean"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 숫자 자릿수 콤마 -->
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <%
    ArrayList<BoardBean> sideList = (ArrayList<BoardBean>)request.getAttribute("sideList");
    %>
<!DOCTYPE html>
<html>
<head>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<meta charset="utf-8">

<!-- Bootstrap CSS -->
    


<!--     <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/jquery-1.12.4.min.js"></script> -->
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
   
</script>
<!-- <script type="text/javascript" charset="UTF-8" -->
<!--     src="//t1.daumcdn.net/adfit/static/kp.js"></script> -->



<title>집밥선생!Project_BC</title>
</head>
<body>

    

    <!-- HEADER -->
    <jsp:include page="../inc/top.jsp" />
    <!--// HEADER -->
<!--  Main CSS -->
<!--     <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/main.css?v=20211014190" type="text/css"> -->


    <!-- CONTENT -->
    <!-- <div id="content" class="content"  > -->
    <div id="container" style="outline: none;" >
        <!-- WRAP -->
        <!-- <div class="wrap main"> -->
        <section id="content" class="main" style="padding-top: 50px; margin: 0px 150px;">
            <!-- wrap addClass -->
    

    <div class="list-wrap">
        <div class="page-title">
            <div class="title">
                <span class="icon"><img
                    src="//cdn.thebanchan.co.kr/upload/C00001/dspl/banner/8010/210/00/200700000012210.png"
                    style="width: 50px; height: 50px;"></span>
                    <%if(request.getParameter("category").equals("all")||request.getParameter("category").equals("SideDishside")||request.getParameter("category").equals("SideDishmeat")||request.getParameter("category").equals("SideDishfish")){ %>
                    <strong>반찬</strong>
                    <%}else if(request.getParameter("category").equals("Kimchikimchi")){ %>
                    <strong>김치</strong>
                    <%}else if(request.getParameter("category").equals("Soupsoup")){ %>
                    <strong>국</strong>
                    <%} %>
            </div>
            <%if(request.getParameter("category").equals("all")||request.getParameter("category").equals("SideDishside")||request.getParameter("category").equals("SideDishmeat")||request.getParameter("category").equals("SideDishfish")){ %>
            <div class="sort-box">
                <div class="sort-type ctg">
                    <div class="cate-wrap">
                        <div class="ctg-bind cate-inner">
                            <a  href="SideDish.side?category=all" class="item" data-type="ctg" data-ctg-no="1707080301" data-cnt="23">
                                <span>전체</span>
                            </a>
                            <a  href="SideDish.side?category=SideDishside" class="item" data-upper-ctg-no="1707080301" data-type="ctg" data-ctg-no="1707080310" data-cnt="57">
                                <span>밑반찬</span>
                            </a>
                            <a  href="SideDish.side?category=SideDishmeat" class="item " data-upper-ctg-no="1707080301" data-type="ctg"
                                data-ctg-no="1707080312" data-cnt="23">
                                <span>고기반찬</span>
                            </a>
                            <a  href="SideDish.side?category=SideDishfish" class="item"
                                data-upper-ctg-no="1707080301" data-type="ctg"
                                data-ctg-no="1707080311" data-cnt="19">
                                <span>생선반찬</span>
                            </a>
                                
                        </div>
                    </div>
                </div>
                
            </div>
            <%}else if(request.getParameter("category").equals("Kimchi")){ %>
             <div class="sort-box">
                <div class="sort-type ctg">
                    <div class="cate-wrap">
                        <div class="ctg-bind cate-inner">
                            <a  href="SideDish.side?category=김치" class="item" data-type="ctg" data-ctg-no="1707080301" data-cnt="23">
                                <span>김치</span>
                            </a>
                            </div>
                    </div>
                </div>
            </div>
            <%}else if(request.getParameter("category").equals("Soup")){ %>
            <div class="sort-box">
                <div class="sort-type ctg">
                    <div class="cate-wrap">
                        <div class="ctg-bind cate-inner">
                            <a  href="SideDish.side?category=국" class="item" data-type="ctg" data-ctg-no="1707080301" data-cnt="23">
                                <span>국</span>
                            </a>
                            </div>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        <div class="prd-area">
            <ul>

             
<!--                  String productImgName = bo.getProduct_name()+"0101"; -->
<!--                  int discountPrice = (int)(bo.getProduct_price()*(100-bo.getProduct_discount())/100);  -->
<!--                  int price =  bo.getProduct_price(); -->
<!--                  int discount = bo.getProduct_discount();  -->
            <%for(int i=0; i<sideList.size(); i++){ %>
             
            
            <%
                  String productImgName = sideList.get(i).getProduct_name();
                  int discountPrice = (int)(sideList.get(i).getProduct_price()*(100-sideList.get(i).getProduct_discount())/100); 
                  int price =  sideList.get(i).getProduct_price();
                  int discount = sideList.get(i).getProduct_discount(); 
                  int productNum = sideList.get(i).getProduct_num();
                  String product_name = sideList.get(i).getProduct_name();
                  double product_review_score = sideList.get(i).getProduct_review_score();
                  int reviewCount = sideList.get(i).getReviewCount();
            %>   
                <li >
                    <div class="prd-box">
                        <div class="thumb">
                            <div class="btn-box">
                                <a href=" " class="btn-shop-cart"
                                    onclick=""><i
                                    class="ico-cart2"></i>장바구니</a>
                            </div>
                            <a href="Product.do?product_num=<%=productNum %>">
                                  <img src="${pageContext.request.contextPath}/upload/<%=productImgName %>01_01.png"
                                width="296" height="296"
                                alt="더반찬&amp; 집밥만찬 2종 골라담기 (5,000원 부터~)"
                                >
                                <%if(discount!=0){ %>
                                <span class="tag sale"><span></span><strong><%=discount %></strong>%</span></a>
                                <%} %>
                        </div>
                        <div class="info">
                             <a href="Product.do?product_num=<%=productNum %>"
                                onclick="">
                                    <p class="subject"><%=product_name %></p>
                                <div class="price">
                                    <p>
                                        <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/>
                                            </strong><span class="is-noto">원</span>
                                    </p>
                                    <%if(discount!=0){ %>
                                    <p class="original">
                                    <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/> <span class="is-noto">원</span>
                                    </p>
                                    <%} %>
                                </div>
                                <div class="star-wrap">
                                    <i class="ico-star"></i><span class="num"><strong><%=product_review_score%></strong>(<%=reviewCount %>)</span>
                                </div>
                                <div class="tag-box"></div></a>
                        </div>
                    </div>
                </li>
                <%} %>
            </ul>
        
            
            
            
        </div>
        
    </div>
    </section>
    </div>

</body>
</html>