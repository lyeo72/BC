<%@page import="vo.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <%
    ArrayList<BoardBean> productList = (ArrayList<BoardBean>)request.getAttribute("productList");
  
  
  
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


<title>집밥선생!Project_BC</title>
</head>
<body>

    

    <!-- HEADER -->
    <jsp:include page="inc/top.jsp" />
    <!--// HEADER -->
<!--  Main CSS -->
    <link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/main.css?v=20211014190" type="text/css">


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
                            <!-- 2020-07-08 레이아웃 변경 -->
                            <div class="tab-wrap">
                                <ul class="tab-type js-tab">
                                    <li class="active"><a href="#md-01" id="TAB_D2007000995">오늘은
                                            이거 어때요?</a></li>
                                    <li><a href="#md-02" id="TAB_D2007000997">집밥선생추천!</a>
                                    </li>
                                    <li><a href="#md-03" id="TAB_D2007001032">집밥처럼먹고싶을때</a>
                                    </li>
                                    <li><a href="#md-04" id="TAB_D2007001033">국밥 먹고싶다</a>
                                    </li>
                                </ul>
                                <div class="tab-content active" id="md-01">
                                    <div class="prd-slider md-slider slick-initialized slick-slider" id="MD_D2007000995">
                                        <p class="title-type2" id="SUB_D2007000995"></p>
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track" style="opacity: 1; width: 1280px; transform: translate3d(0px, 0px, 0px);" role="listbox">
                                                <div class="list slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false"
                                                    style="width: 1280px;" tabindex="-1" role="option"aria-describedby="slick-slide70">
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=" "
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" "
                                                            onclick= ""
                                                                tabindex="0"> <img
                                                                src="img/innerbox_sample1.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=" "
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" "
                                                            onclick= ""
                                                                tabindex="0"> <img
                                                                src="img/innerbox_sample1.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=" "
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" "
                                                            onclick= ""
                                                                tabindex="0"> <img
                                                                src="img/innerbox_sample1.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                    onclick=" "
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" "
                                                            onclick= ""
                                                                tabindex="0"> <img
                                                                src="img/innerbox_sample1.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
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
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "  onclick=" " tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" " onclick= "" tabindex="0"> 
                                                            <img src="img/innerbox_sample2.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "  onclick=" " tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" " onclick= "" tabindex="0"> 
                                                            <img src="img/innerbox_sample2.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "  onclick=" " tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" " onclick= "" tabindex="0"> 
                                                            <img src="img/innerbox_sample2.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "  onclick=" " tabindex="0"> <i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                            <a href=" " onclick= "" tabindex="0"> 
                                                            <img src="img/innerbox_sample2.jpg">
                                                                <span class="tag sale v3"><strong>20</strong>%</span>
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href="#"  onclick="" tabindex="0">
                                                                <p class="subject">햄버거!</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,520</strong>원
                                                                    </p>
                                                                    <p class="original">11,900원</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
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
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/284/253/210615000027253.jpg">
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">NEW 스키야키(넉넉한2인분)</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>19,800</strong>원
                                                                    </p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/284/294/201026000026294.jpg">
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">고구마 품은 라자냐(450g)</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>9,600</strong>원
                                                                    </p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/284/373/200608000025373.jpg">
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">[프레시지]감바스 알 아히요</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>12,900</strong>원
                                                                    </p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="thumb">
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"> <i class="ico-cart2"></i>장바구니 담기
                                                                </a>
                                                            </div>
                                                            
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/284/292/201026000026292.jpg">
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">[남향푸드또띠아] 간편브리또 8종 (2개 세트)</p>
                                                                <div class="price">
                                                                    <p>
                                                                        <strong>5,800</strong>원
                                                                    </p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
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
                                                      	int productCount = 0;
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
                                                                 <img src="${pageContext.request.contextPath}/upload/<%=productImgName %>01_01.png"  width="296" height="296">
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
							                                    <fmt:formatNumber value="<%=price %>" pattern="#,###.##"/><span cla   ss="is-noto">원</span>
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
                            <!-- // 2020-07-08 레이아웃 변경 -->
                        </div>
                    </article>
                    <!-- //MD 추천 -->
                </div>
                <!-- //영역 레벨 끝 -->
                <!-- 영역 레벨 시작  -->
                <div id="D1706000843" class="area_lv1">



                    <article class="article sale-article">
                        <div class="inner-box">
                            <div class="title-wrap">
                                <a href=" "
                                
                                    class="title-type arrow"> 할인 특가 </a>
                            </div>
                            <div class="sale-wrap">
                                <div class="sale-box primary">

                                    <div class="item">
                                        <div class="thumb">
                                            <a href=" "
                                                onclick="">
                                                <img
                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/480/627/210108000026627.jpg"
                                                width="420" height="420" alt="[생생빵상회] 미니 메이플피칸"
                                                onerror="this.src='/common/images/common/noimg_480.jpg'">
                                                <span class="tag sale v3"> <strong>20</strong>%
                                            </span>
                                                                                            
                                            </a>
                                        </div>
                                        <div class="info">
                                            <a href=" "
                                            onclick="">
                                                <p class="subject">[생생빵상회] 미니 메이플피칸</p>
                                                <div class="price">

                                                    <p>
                                                        <strong>7,200</strong><span class="is-noto">원</span>
                                                    </p>
                                                    <p class="original">
                                                        8,980<span class="is-noto">원</span>
                                                    </p>

                                                </div>
                                            </a>
                                            <div class="btn-cart">
                                                <a href=" "
                                                onclick="">
                                                    class="ico-cart2"></i></a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="sale-box list">

                                    <ul>

                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href=" "
                                                    onclick="">
                                                        <img
                                                        src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/170/676/210115000026676.jpg"
                                                        width="170" height="170" alt="[윙잇] 한입 인절미"
                                                        onerror="this.src='/common/images/common/noimg_170.jpg'">

                                                        <span class="tag sale v3"><strong>20 </strong>%</span>


                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href=" "
                                                    onclick="">
                                                        <p class="subject">[윙잇] 한입 인절미</p>
                                                        <div class="price">

                                                            <p>
                                                                <strong>3,920</strong><span class="is-noto">원</span>
                                                            </p>
                                                            <p class="original">
                                                                4,900<span class="is-noto">원</span>
                                                            </p>

                                                        </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" "
                                                        onclick="">
                                                            class="ico-cart2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href=" "
                                                    onclick="">
                                                        <img
                                                        src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/170/674/210115000026674.jpg"
                                                        width="170" height="170" alt="[윙잇] 우유백설기 (90g*6ea)"
                                                        onerror="this.src='/common/images/common/noimg_170.jpg'">

                                                        <span class="tag sale v3"><strong>30 </strong>%</span>


                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href=" "
                                                    onclick="">
                                                        <p class="subject">[윙잇] 우유백설기 (90g*6ea)</p>
                                                        <div class="price">

                                                            <p>
                                                                <strong>6,930</strong><span class="is-noto">원</span>
                                                            </p>
                                                            <p class="original">
                                                                9,900<span class="is-noto">원</span>
                                                            </p>

                                                        </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" "
                                                        onclick="">
                                                            class="ico-cart2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href=" "
                                                    onclick="">
                                                        <img
                                                        src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/170/812/200722000025812.jpg"
                                                        width="170" height="170" alt="[미트Q] 금천한돈 칼집 목살(구이용/570g)"
                                                        onerror="this.src='/common/images/common/noimg_170.jpg'">

                                                        <span class="tag sale v3"><strong>30 </strong>%</span>


                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href=" "
                                                    onclick="">
                                                        <p class="subject">[미트Q] 금천한돈 칼집 목살(구이용/570g)</p>
                                                        <div class="price">

                                                            <p>
                                                                <strong>11,760</strong><span class="is-noto">원</span>
                                                            </p>
                                                            <p class="original">
                                                                16,800<span class="is-noto">원</span>
                                                            </p>

                                                        </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" "
                                                        onclick="">
                                                            class="ico-cart2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href=" "
                                                    onclick="">
                                                        <img
                                                        src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/170/804/200722000025804.jpg"
                                                        width="170" height="170" alt="[미트Q] 금천한돈 칼집 삼겹살(구이용/570g)"
                                                        onerror="this.src='/common/images/common/noimg_170.jpg'">

                                                        <span class="tag sale v3"><strong>10 </strong>%</span>


                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href=" "
                                                    onclick="">
                                                        <p class="subject">[미트Q] 금천한돈 칼집 삼겹살(구이용/570g)</p>
                                                        <div class="price">

                                                            <p>
                                                                <strong>15,750</strong><span class="is-noto">원</span>
                                                            </p>
                                                            <p class="original">
                                                                17,500<span class="is-noto">원</span>
                                                            </p>

                                                        </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" "
                                                        onclick="">
                                                            class="ico-cart2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href=" "
                                                    onclick="">
                                                        <img
                                                        src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/170/214/210528000027214.jpg"
                                                        width="170" height="170" alt="[미트Q] 금천한돈 목살(수육용/300g)"
                                                        onerror="this.src='/common/images/common/noimg_170.jpg'">

                                                        <span class="tag sale v3"><strong>30 </strong>%</span>


                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href=" "
                                                    onclick="">
                                                        <p class="subject">[미트Q] 금천한돈 목살(수육용/300g)</p>
                                                        <div class="price">

                                                            <p>
                                                                <strong>5,950</strong><span class="is-noto">원</span>
                                                            </p>
                                                            <p class="original">
                                                                8,500<span class="is-noto">원</span>
                                                            </p>

                                                        </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" "
                                                        onclick="">
                                                            class="ico-cart2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="item">
                                                <div class="thumb">
                                                    <a href=" "
                                                    onclick="">
                                                        <img
                                                        src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/170/810/200722000025810.jpg"
                                                        width="170" height="170" alt="[미트Q] 금천한돈 삼겹살(수육용/300g)"
                                                        onerror="this.src='/common/images/common/noimg_170.jpg'">

                                                        <span class="tag sale v3"><strong>25 </strong>%</span>


                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <a href=" "
                                                    onclick="">
                                                        <p class="subject">[미트Q] 금천한돈 삼겹살(수육용/300g)</p>
                                                        <div class="price">

                                                            <p>
                                                                <strong>7,350</strong><span class="is-noto">원</span>
                                                            </p>
                                                            <p class="original">
                                                                9,800<span class="is-noto">원</span>
                                                            </p>

                                                        </div>
                                                    </a>
                                                    <div class="btn-cart">
                                                        <a href=" "
                                                        onclick="">
                                                           </i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>

                                </div>
                            </div>
                        </div>
                    </article>
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
                                    <div
                                        class="prd-slider md-sliderSecond pt0 slick-initialized slick-slider slick-dotted"
                                        role="toolbar">
                                        <button type="button" data-role="none"
                                            class="slick-prev slick-arrow" aria-label="Previous"
                                            role="button" style="display: block;">Previous</button>

                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track"
                                                style="opacity: 1; width: 6400px; transform: translate3d(-1280px, 0px, 0px);"
                                                role="listbox">
                                                <div class="list slick-slide slick-cloned"
                                                    data-slick-index="-1" aria-hidden="true"
                                                    style="width: 1280px;" tabindex="-1">

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/637/210927000027637.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치쌈장 양배추 쌈세트"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[동원참치x더반찬]참치쌈장 양배추 쌈세트</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>4,500</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="list slick-slide slick-current slick-active"
                                                    data-slick-index="0" aria-hidden="false"
                                                    style="width: 1280px;" tabindex="-1" role="option"
                                                    aria-describedby="slick-slide60">

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/635/210927000027635.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치 두부 고추장찌개"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">[동원참치x더반찬]참치 두부 고추장찌개</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>6,300</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/629/210924000027629.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬] 묵은지 참치 말이 키트"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">[동원참치x더반찬] 묵은지 참치 말이 키트</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>5,900</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/637/210927000027637.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치쌈장 양배추 쌈세트"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">[동원참치x더반찬]참치쌈장 양배추 쌈세트</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>4,500</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/478/210802000027478.jpg"
                                                                width="300" height="300" alt="[바르게 만든] 키즈 한우무국(5set)"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">

                                                                <span class="tag sale v3"><strong>12 </strong>%</span>


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="0">
                                                                <p class="subject">[바르게 만든] 키즈 한우무국(5set)</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>19,900</strong><span class="is-noto">원</span>
                                                                    </p>
                                                                    <p class="original">
                                                                        22,500<span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="0"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="list slick-slide" data-slick-index="1"
                                                    aria-hidden="true" style="width: 1280px;" tabindex="-1"
                                                    role="option" aria-describedby="slick-slide61">

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/480/210802000027480.jpg"
                                                                width="300" height="300" alt="[바르게 만든] 키즈 한우미역국(5set)"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">

                                                                <span class="tag sale v3"><strong>12 </strong>%</span>


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[바르게 만든] 키즈 한우미역국(5set)</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>19,900</strong><span class="is-noto">원</span>
                                                                    </p>
                                                                    <p class="original">
                                                                        22,500<span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/449/210730000027449.jpg"
                                                                width="300" height="300" alt="치킨마요덮밥재료(200g)"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">치킨마요덮밥재료(200g)</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>4,200</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/446/210729000027446.jpg"
                                                                width="300" height="300" alt="돼지고기고추장찌개(600g)"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">돼지고기고추장찌개(600g)</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>7,900</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/635/210927000027635.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치 두부 고추장찌개"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[동원참치x더반찬]참치 두부 고추장찌개</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>6,300</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="list slick-slide" data-slick-index="2"
                                                    aria-hidden="true" style="width: 1280px;" tabindex="-1"
                                                    role="option" aria-describedby="slick-slide62">

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/637/210927000027637.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치쌈장 양배추 쌈세트"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[동원참치x더반찬]참치쌈장 양배추 쌈세트</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>4,500</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="list slick-slide slick-cloned"
                                                    data-slick-index="3" aria-hidden="true"
                                                    style="width: 1280px;" tabindex="-1">

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/635/210927000027635.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치 두부 고추장찌개"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[동원참치x더반찬]참치 두부 고추장찌개</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>6,300</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/629/210924000027629.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬] 묵은지 참치 말이 키트"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[동원참치x더반찬] 묵은지 참치 말이 키트</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>5,900</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/637/210927000027637.jpg"
                                                                width="300" height="300" alt="[동원참치x더반찬]참치쌈장 양배추 쌈세트"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[동원참치x더반찬]참치쌈장 양배추 쌈세트</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>4,500</strong><span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="item">
                                                        <div class="thumb">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1"> <img
                                                                src="//cdn.thebanchan.co.kr/upload/C00001/goods/prd/326/478/210802000027478.jpg"
                                                                width="300" height="300" alt="[바르게 만든] 키즈 한우무국(5set)"
                                                                onerror="this.src='/common/images/common/noimg_326.jpg'">

                                                                <span class="tag sale v3"><strong>12 </strong>%</span>


                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <a href=" "
                                                            onclick=""
                                                                tabindex="-1">
                                                                <p class="subject">[바르게 만든] 키즈 한우무국(5set)</p>
                                                                <div class="price">

                                                                    <p>
                                                                        <strong>19,900</strong><span class="is-noto">원</span>
                                                                    </p>
                                                                    <p class="original">
                                                                        22,500<span class="is-noto">원</span>
                                                                    </p>

                                                                </div>
                                                            </a>
                                                            <div class="btn-cart">
                                                                <a href=" "
                                                                onclick=""
                                                                    tabindex="-1"><i class="ico-cart2"></i>장바구니 담기</a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>




                                        <button type="button" data-role="none"
                                            class="slick-next slick-arrow" aria-label="Next"
                                            role="button" style="display: block;">Next</button>
                                        <ul class="slick-dots" style="display: block;" role="tablist">
                                            <li class="slick-active" aria-hidden="false"
                                                role="presentation" aria-selected="true"
                                                aria-controls="navigation60" id="slick-slide60"
                                                style="width: 33.3333%;"><a href="#"
                                                onclick="return false;"><span>undefined</span></a></li>
                                            <li aria-hidden="true" role="presentation"
                                                aria-selected="false" aria-controls="navigation61"
                                                id="slick-slide61" style="width: 33.3333%;"><a href="#"
                                                onclick="return false;"><span>undefined</span></a></li>
                                            <li aria-hidden="true" role="presentation"
                                                aria-selected="false" aria-controls="navigation62"
                                                id="slick-slide62" style="width: 33.3333%;"><a href="#"
                                                onclick="return false;"><span>undefined</span></a></li>
                                        </ul>
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

</div></div></section></div>


</body>
</html>