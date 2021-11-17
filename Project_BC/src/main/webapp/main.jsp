<%@page import="vo.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <%
    ArrayList<BoardBean> productList = (ArrayList<BoardBean>)request.getAttribute("productList");
    ArrayList<BoardBean> saleList = (ArrayList<BoardBean>)request.getAttribute("saleList");
    ArrayList<BoardBean> brandNewList = (ArrayList<BoardBean>)request.getAttribute("brandNewList");
  
  %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="index, follow">

<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    


<!--     <script type="text/javascript" src="//www.thebanchan.co.kr/common/js/jquery-1.12.4.min.js"></script> -->
<script src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
   
</script>
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>


    <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/main.css?v=20211014190" type="text/css">
<title>집밥선생!Project_BC</title>
</head>
<body>

    

    <!-- HEADER -->
    <jsp:include page="inc/top.jsp" />
    <!--// HEADER -->
<!--  Main CSS -->


    <!-- CONTENT -->
    <!-- <div id="content" class="content"  > -->
    <div id="container" style="outline: none;">
        <!-- WRAP -->
        <!-- <div class="wrap main"> -->
        <section id="content" class="main" style="padding-top: 118px;">
            <!-- wrap addClass -->

            <!--  caousel -->
            <div id="carouselExampleCaptions" class="carousel slide"
                data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide-to="0" class="active" aria-current="true"
                        aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/causel2.png" class="d-block w-100"
                            height="400" alt="sampletest1">
                        <div class="carousel-caption d-none d-md-block">
                            <h5></h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="img/causel3.png" class="d-block w-100 "
                            height="400" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5></h5>
                            <p></p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="img/causel1.png" class="d-block w-100 "
                            height="400" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5></h5>
                            <p></p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
    <!--  caousel END -->






            <!-- 영역 레벨 시작  -->
            <div id="D1706000841" class="area_lv1">


                <!-- 영역 레벨 시작  -->
                <div id="D1706000845" class="area_lv1">

                    <!-- MD 추천 -->
                    <article class="article md-article">
                        <div class="title-wrap">
                            <div class="title-type">MD 추천</div>
                        </div>
                        <div class="inner-box">
                            <div class="tab-wrap">
                                <ul class="tab-type js-tab">
                                    <li><a href="#md-01" id="TAB_D2007000995">오늘은   이거 어때요?</a></li>
                                    <li class="active"><a href="#md-02" id="TAB_D2007000997">집밥선생추천!</a></li>
                                    <li><a href="#md-03" id="TAB_D2007001032">집밥처럼먹고싶을때</a></li>
                                    <li><a href="#md-04" id="TAB_D2007001033">국밥 먹고싶다</a> </li>
                                </ul>
                                
                                
                                <div class="tab-content active" id="md-01">
                                    <div class="prd-slider md-slider slick-initialized slick-slider" id="MD_D2007000995">
                                        <p class="title-type2" id="SUB_D2007000995"></p>
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track" style="opacity: 1; width: 1280px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                                                <div class="list slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false"
                                                    style="width: 1280px;" tabindex="-1" role="option"aria-describedby="slick-slide70">
                                                    
                                                    
                                                    
                                                    <%                                        
                                                      int productCount = 0;
                                                      if(productList!=null){ 
                                                        if(productList.size() <4){
                                                            productCount = productList.size();
                                                        }else{
                                                            productCount = 4;
                                                        }
                                                      
                                                      %>
                                                        <%for(int i=0; i<productCount; i++){ %>
                                                        <% 
                                                        String productImgName = productList.get(i).getProduct_name();
                                                        int discountPrice = (int)(productList.get(i).getProduct_price()*(100-productList.get(i).getProduct_discount())/100); 
                                                        int price =  productList.get(i).getProduct_price();
                                                        int discount = productList.get(i).getProduct_discount();
                                                        int productNum = productList.get(i).getProduct_num();
                                                        String product_name = productList.get(i).getProduct_name();
                                                        double product_review_score = productList.get(i).getProduct_review_score(); 
                                                        %>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href="Product.do?product_num=<%=productNum %>" tabindex="0"> 
                                                                 <img src="${pageContext.request.contextPath}/img/<%=productImgName %>01_01.jpg"  width="296" height="296">
                                                            </a>
                                                        </div>
                                                        <div class="info">
<%--                                                             <img src="${pageContext.request.contextPath}/upload/<%=productImgName %>01_01.png" tabindex="0"> --%>
                                                                <p class="subject"><%=product_name %></p>
                                                               <div class="price">
                                                                <p>
                                                                    <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                                </p>
                                                                <%if(discount!=0){ %>
                                                                <p class="original">
                                                                <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                                </p>
                                                                <%} %>
                                                            </div>                                                      
                                                        </div>
                                                    </div>
                                                    <%}
                                                        } %>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


 


               <div class="tab-content active" id="md-02">
                <div class="prd-slider md-slider slick-initialized slick-slider" id="MD_D2007000997">
                   <p class="title-type2" id="SUB_D2007000997"></p>
                    <div aria-live="polite" class="slick-list draggable">
                       <div class="slick-track" style="opacity: 1; width: 1280px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                          <div class="list slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" 
                                style="width: 1280px;" tabindex="-1" role="option" aria-describedby="slick-slide80">
                                                    
                                                                                                        
                                                    
                                                    <%                                        
                                                      if(productList!=null){ 
                                                        if(productList.size() < 8){
                                                            productCount = productList.size();
                                                        }else{
                                                        	productCount = 8;
                                                        }
                                                      
                                                      %>
                                                        <%for(int i=4; i<productCount; i++){ 
	                                                        String productImgName = productList.get(i).getProduct_name();
	                                                        int discountPrice = (int)(productList.get(i).getProduct_price()*(100-productList.get(i).getProduct_discount())/100); 
	                                                        int price =  productList.get(i).getProduct_price();
	                                                        int discount = productList.get(i).getProduct_discount();
	                                                        int productNum = productList.get(i).getProduct_num();
	                                                        String product_name = productList.get(i).getProduct_name();
	                                                        double product_review_score = productList.get(i).getProduct_review_score(); 
                                                        %>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href="Product.do?product_num=<%=productNum %>" tabindex="0"> 
                                                                 <img src="${pageContext.request.contextPath}/img/<%=productImgName %>01_01.jpg"  width="296" height="296">
                                                            </a>
                                                        </div>
                                                        <div class="info">
<%--                                                             <img src="${pageContext.request.contextPath}/upload/<%=productImgName %>01_01.png" tabindex="0"> --%>
                                                                <p class="subject"><%=product_name %></p>
                                                               <div class="price">
                                                                <p>
                                                                    <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                                </p>
                                                                <%if(discount!=0){ %>
                                                                <p class="original">
                                                                <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                                </p>
                                                                <%} %>
                                                            </div>                                                      
                                                        </div>
                                                    </div>
                                                    <%}
                                                        } %>
                                                    
                                                    
                                                    
                                                  
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                   
                                    
                                
                                
                                <div class="tab-content" id="md-03">
                                    <div class="prd-slider md-slider slick-initialized slick-slider" id="MD_D2007001032">
                                        <p class="title-type2" id="SUB_D2007001032"></p>
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track" style="opacity: 1; width: 1280px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                                                <div class="list slick-slide slick-current slick-active"  data-slick-index="0" aria-hidden="false" 
                                                style="width: 1280px;" tabindex="-1" role="option" aria-describedby="slick-slide90">
                                                   
                                                   
                                                   
                                                      <%                                        
                                                      if(productList!=null){ 
                                                        //productCount = 12;
                                                        if(productList.size() <12){
                                                            productCount = productList.size();
                                                        }else{
                                                        	productCount = 12;
                                                        }
                                                      
                                                      %>
                                                        <%for(int i=8; i<productCount; i++){ %>
                                                        <% 
                                                        String productImgName = productList.get(i).getProduct_name();
                                                        int discountPrice = (int)(productList.get(i).getProduct_price()*(100-productList.get(i).getProduct_discount())/100); 
                                                        int price =  productList.get(i).getProduct_price();
                                                        int discount = productList.get(i).getProduct_discount();
                                                        int productNum = productList.get(i).getProduct_num();
                                                        String product_name = productList.get(i).getProduct_name();
                                                        double product_review_score = productList.get(i).getProduct_review_score(); 
                                                        %>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href="Product.do?product_num=<%=productNum %>" tabindex="0"> 
                                                                 <img src="${pageContext.request.contextPath}/img/<%=productImgName %>01_01.jpg"  width="296" height="296">
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                                <p class="subject"><%=product_name %></p>
                                                               <div class="price">
                                                                <p>
                                                                    <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                                </p>
                                                                <%if(discount!=0){ %>
                                                                <p class="original">
                                                                <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                                </p>
                                                                <%} %>
                                                            </div>                                                      
                                                        </div>
                                                    </div>
                                                    <%}
                                                        } %>                                   
                                                    
                                                        
                                                        
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                               
                               
                                <div class="tab-content" id="md-04">
                                    <div
                                        class="prd-slider md-slider slick-initialized slick-slider"
                                        id="MD_D2007001033">
                                        <p class="title-type2" id="SUB_D2007001033"></p>
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track"
                                                style="opacity: 1; width: 1280px; transform: translate3d(0px, 0px, 0px);"
                                                role="listbox">
                                                <div class="list slick-slide slick-current slick-active"  data-slick-index="0" aria-hidden="false"
                                                    style="width: 1280px;" tabindex="-1" role="option" aria-describedby="slick-slide100">
													                             
													                             
													<%                                        
                                                      if(productList!=null){ 
                                                        //productCount = 12;
                                                        if(productList.size() <16){
                                                            productCount = productList.size();
                                                        }else{
                                                            productCount = 16;
                                                        }
                                                      
                                                      %>
                                                        <%for(int i=12; i<productCount; i++){ %>
                                                        <% 
                                                        String productImgName = productList.get(i).getProduct_name();
                                                        int discountPrice = (int)(productList.get(i).getProduct_price()*(100-productList.get(i).getProduct_discount())/100); 
                                                        int price =  productList.get(i).getProduct_price();
                                                        int discount = productList.get(i).getProduct_discount();
                                                        int productNum = productList.get(i).getProduct_num();
                                                        String product_name = productList.get(i).getProduct_name();
                                                        double product_review_score = productList.get(i).getProduct_review_score(); 
                                                        %>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href="Product.do?product_num=<%=productNum %>" tabindex="0"> 
                                                                 <img src="${pageContext.request.contextPath}/img/<%=productImgName %>01_01.jpg"  width="296" height="296">
                                                            </a>
                                                        </div>
                                                        <div class="info">
<%--                                                             <img src="${pageContext.request.contextPath}/upload/<%=productImgName %>01_01.png" tabindex="0"> --%>
                                                                <p class="subject"><%=product_name %></p>
                                                               <div class="price">
                                                                <p>
                                                                    <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                                </p>
                                                                <%if(discount!=0){ %>
                                                                <p class="original">
                                                                <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                                </p>
                                                                <%} %>
                                                            </div>                                                      
                                                        </div>
                                                    </div>
                                                    <%}
                                                        } %>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                </div>
                               </div>
                             </article>
                            </div>
                            <!-- // 2020-07-08 레이아웃 변경 -->
                       
                    <!-- //MD 추천 -->
                </div>
                <!-- //영역 레벨 끝 -->
                
                
                
                
                
                
                <!-- 영역 레벨 시작  -->
                <div id="D1706000843" class="area_lv1">



                    <article class="article sale-article">
                        <div class="inner-box">
                            <div class="title-wrap">
                             <a href=" " class="title-type arrow"> 할인 특가 </a>
                            </div>
                            <div class="sale-wrap">                            
                               
                                <div class="sale-box primary">
                                   <div class="item">
                                        <div class="thumb">
                                            <a href="Product.do?product_num=<%=saleList.get(0).getProduct_num() %>">
                                                <img
                                                src="${pageContext.request.contextPath}/img/<%=saleList.get(0).getProduct_name()%>01_01.jpg"
                                                width="420" height="420" alt="할인특가1">
                                                <span class="tag sale v3"> <strong><%=saleList.get(0).getProduct_discount()%> %</strong>
                                            </span>
                                                                                            
                                            </a>
                                        </div>
                                        <div class="info">
                                            <a href="Product.do?product_num=<%=saleList.get(0).getProduct_num() %>">
                                                <p class="subject"><%=saleList.get(0).getProduct_name()%></p>
                                                <div class="price">
                                                    <p>
                                                        <strong><fmt:formatNumber value="<%=(int)(saleList.get(0).getProduct_price()*(100-saleList.get(0).getProduct_discount())/100) %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                    </p>
                                                    <p class="original">
                                                        <fmt:formatNumber value="<%=saleList.get(0).getProduct_price() %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                    </p>

                                                </div>
                                            </a>
                                            <div class="btn-cart">
                                                <a href=" "onclick="">
                                                <i class="ico-cart2"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                
                                <div class="sale-box list">
                                    <ul>
                                    
                                    
                                    
                                     <% 
                                     if(saleList!=null){ 
                                           int saleCount = 1;
                                           if(saleList.size() <7){
                                        	   saleCount = saleList.size();
                                           }else{
                                        	   saleCount = 7;
                                           }
                                         
                                         %>
                                    
                                    
                                    <%for(int i =1; i<saleCount; i++){
                                    	 int discountPrice = (int)(productList.get(i).getProduct_price()*(100-productList.get(i).getProduct_discount())/100); 
                                    	 %>
                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href="Product.do?product_num=<%=saleList.get(i).getProduct_num() %>">
                                                        <img src="${pageContext.request.contextPath}/img/<%=saleList.get(i).getProduct_name()%>01_01.jpg"
                                                        width="170" height="170" alt="[윙잇] 한입 인절미">

                                                        <span class="tag sale v3"><strong><%=saleList.get(i).getProduct_discount() %></strong>%</span>
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href="Product.do?product_num=<%=saleList.get(i).getProduct_num() %>">
                                                        <p class="subject"><%=saleList.get(i).getProduct_name() %></p>
                                                        <div class="price">
                                                         <p>
                                                         <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                        </p>
                                                         <p class="original">
                                                         <fmt:formatNumber value="<%=saleList.get(i).getProduct_price() %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                        </p>

                                                </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" ">
                                                            <i class="ico-cart2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%}
                                    }%>

                                    </ul>

                                </div>
                            </div>
                        </div>
                    </article>
                  </div>
                    
                    <!-- //할인 메뉴 -->

                    <!-- 새로나옸어요 -->
                    <article class="article md-article bdNone">
                        <div class="title-wrap">
                            <a href=" "
                                onclick=""
                                class="title-type arrow"> 신상품 </a>
                        </div>
                        <div class="inner-box">
                            <!-- 2020-07-08 레이아웃 변경 -->
                            <div class="tab-wrap">
                                <div class="tab-content active">
                                    <div class="prd-slider md-sliderSecond pt0 slick-initialized slick-slider slick-dotted" role="toolbar">
                                        

                                         <div class="tab-content active" id="md-01">
                                    <div class="prd-slider md-slider slick-initialized slick-slider" id="MD_D2007000995">
                                        <p class="title-type2" id="SUB_D2007000995"></p>
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track" style="opacity: 1; width: 1280px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                                                <div class="list slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false"
                                                    style="width: 1280px;" tabindex="-1" role="option"aria-describedby="slick-slide70">
                                                    
                                                    
                                                    
                                                    <%                                        
                                                      if(brandNewList!=null){ 
                                                        int newCount = 0;
                                                        if(brandNewList.size() <4){
                                                        	newCount = brandNewList.size();
                                                        }else{
                                                        	newCount = 4;
                                                        }
                                                      
                                                      %>
                                                        <%for(int i=0; i<newCount; i++){ %>
                                                        <% 
                                                        String productImgName = brandNewList.get(i).getProduct_name();
                                                        int discountPrice = (int)(brandNewList.get(i).getProduct_price()*(100-brandNewList.get(i).getProduct_discount())/100); 
                                                        int price =  brandNewList.get(i).getProduct_price();
                                                        int discount = brandNewList.get(i).getProduct_discount();
                                                        int productNum = brandNewList.get(i).getProduct_num();
                                                        String product_name = brandNewList.get(i).getProduct_name();
                                                        double product_review_score = brandNewList.get(i).getProduct_review_score(); 
                                                        %>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href="Product.do?product_num=<%=productNum %>" tabindex="0"> 
                                                                 <img src="${pageContext.request.contextPath}/img/<%=productImgName %>01_01.jpg"  width="296" height="296">
                                                            </a>
                                                        </div>
                                                        <div class="info">
<%--                                                             <img src="${pageContext.request.contextPath}/upload/<%=productImgName %>01_01.png" tabindex="0"> --%>
                                                                <p class="subject"><%=product_name %></p>
                                                               <div class="price">
                                                                <p>
                                                                    <strong><fmt:formatNumber value="<%=discountPrice %>" pattern="#,###.##"/></strong><span class="is-noto">원</span>
                                                                </p>
                                                                <%if(discount!=0){ %>
                                                                <p class="original">
                                                                <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/><span class="is-noto">원</span>
                                                                </p>
                                                                <%} %>
                                                            </div>                                                      
                                                        </div>
                                                    </div>
                                                    <%}
                                                        } %>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                    </div>
                                    <!-- // 2020-07-08 레이아웃 변경 -->
                                </div>
                            </div>
                        </div>
                    </article>
                    

    
                </div>
                <!-- //영역 레벨 끝 -->
                <!-- 영역 레벨 시작  -->
                <div id="D1706000847" class="area_lv1"></div>
                <!-- //영역 레벨 끝 -->
                <!-- 영역 레벨 시작  -->
                <div id="D1706000852" class="area_lv1">

                    <!-- 카테고리별 베스트 -->

                    <jsp:include page="inc/bottom.jsp" />


                    <!-- //APP LAYER -->

</div>


</body>
</html>