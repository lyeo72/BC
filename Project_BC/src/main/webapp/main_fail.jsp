<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>




<style type="./CSS/main.css"></style>
<script type="./js/jquery-3.6.0.js"></script>
<style type="text/css">
#img1{  border-radius: 10%;}
#card{  border-radius: 5%; }
</style>
<title>Hello, world!</title>
</head>
<body>
    <div class=" bg-light text-dark ">
        <div class="container">
            <!--  head top -->

            <div class="col text-size" align="right">
                <a class="btn btn-light" id="head_login" href="MemberLoginForm.me">로그인</a>
                <a class="btn btn-light" id="head_sign" href="SellerJoinForm.me">회원가입</a> <a
                    class="btn btn-light" id="head_Service center" href="#">장바구니</a>
            </div>

            <div class="row">
                <div class="col-12 text-center">
                    <a class="navbar-brand" href="#"> <img alt="logo"
                        src="./img/TestLogo.png" width="150" height="150">
                    </a>
                </div>
            </div>

            <!--  Header NavBar -->
            <div class="top-header py4 sticky-top">
                <nav
                    class="navbar navbar-expand-lg navbar-light bg-light text-dark ">
                    <div class="container-fluid ">
                        <div class="collapse navbar-collapse" id="navbarNavLightDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle font-weight-bold" href="#"
                                    id="navbarLightDropdownMenuLink" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
                                    <ul class="dropdown-menu dropdown-menu-light"
                                        aria-labelledby="navbarLightDropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">반찬</a></li>
                                        <li><a class="dropdown-item" href="#">국</a></li>
                                        <li><a class="dropdown-item" href="#">고급반찬</a></li>
                                    </ul></li>
                                <li class="nav-item"><a class="nav-link" href="#"> 할인특가
                                </a></li>
                                <li class="nav-item"><a class="nav-link" href="#"> 베스트
                                </a></li>
                                <li class="nav-item"><a class="nav-link" href="#"> 신상품
                                </a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-3">
                        <form class="d-flex" id="SearchBox" action="get">
                            <input class="form-control me-2" type="search" placeholder="검색"
                                aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">search</button>
                        </form>
                    </div>
                </nav>
            </div>



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
                        <img src="./img/carousel_sample1.jpg" class="d-block w-100"
                            height="500" alt="sampletest1">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>산딸기</h5>
                            <p>It's a fresh raspberry, actually, it's a snake berry lol</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="./img/carousel_sample2.jpg" class="d-block w-100 "
                            height="500" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>스테이크</h5>
                            <p>The steak looks very tasty. How much is it?</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="./img/carousel_sample3.jpg" class="d-block w-100 "
                            height="500" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>직화 숯불 꼬지</h5>
                            <p>Look so damn delicious I want to go camping</p>
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


            <!--  추천상품 -->
            <div class="row mt-5" id="recommended">
                <div>
                    <h3 align="center">추천상품</h3>
                </div>


                <nav>
                    <div class="nav nav-tabs nav-pills nav-fill mb-5" id="nav-tab"
                        role="tablist">
                        <a class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                            href="#good1" role="tab" aria-controls="nav-home"
                            aria-selected="true">추천상품1</a> <a class="nav-link"
                            id="nav-profile-tab" data-bs-toggle="tab" href="#good2"
                            role="tab" aria-controls="nav-profile" aria-selected="false">추천상품2</a>
                        <a class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
                            href="#good3" role="tab" aria-controls="nav-contact"
                            aria-selected="false">추천상품3</a> <a class="nav-link"
                            id="nav-contact-tab" data-bs-toggle="tab" href="#good4"
                            role="tab" aria-controls="nav-contact" aria-selected="false">추천상품4</a>
                    </div>
                </nav>
                <div class="tab-content " id="nav-tabContent">
                    <div class="tab-pane fade show active" id="good1" role="tabpanel"
                        aria-labelledby="nav-home-tab">
                        <div class="row bg-light">
                            <%
                            for (int i = 0; i < 8; i++) {
                            %>
                            <div class="col-lg-3 col-sm-6 mb-4">
                                <div class="card bg-light border-light" id="card">
                                    <img src="./img/innerbox_sample1.jpg" class="card-img-center w-100" id="img1"
                                        alt=".." style="width: 300px; height: 200px;">
                                    <div class="card-body">
                                        <h3 class="card-title" align="center">상품 이름</h3>
                                        <p class="card-text">상품설명상품설명상품설명상품설상품설명</p>
                                        <p align="right">15,000원</p>
                                        <a href="#" class="btn btn-success"> 구매하기</a> <a href="#"
                                            class="btn btn-dark"> 장바구니</a>
                                    </div>
                                </div>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="good2" role="tabpanel"
                        aria-labelledby="nav-profile-tab">
                        <div class="row">
                            <%
                            for (int i = 0; i < 4; i++) {
                            %>
                            <div class="col-lg-3 col-sm-6 mb-4">
                                <div class="card">
                                    <img src="./img/innerbox_sample2.jpg" class="card-img-center"
                                        alt=".." style="width: 300px; height: 200px;">
                                    <div class="card-body">
                                        <h3 class="card-title" align="center">상품 이름</h3>
                                        <p class="card-text">상품설명상품설명상품설명상품설상품설명</p>
                                        <p align="right">15,000원</p>
                                        <a href="#" class="btn btn-success"> 구매하기</a> <a href="#"
                                            class="btn btn-dark"> 장바구니</a>
                                    </div>
                                </div>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="good3" role="tabpanel"
                        aria-labelledby="nav-contact-tab">
                        <div class="row">
                            <%
                            for (int i = 0; i < 4; i++) {
                            %>
                            <div class="col-lg-3 col-sm-6 mb-4">
                                <div class="card">
                                    <img src="./img/innerbox_sample3.jpg" class="card-img-center"
                                        alt=".." style="width: 300px; height: 200px;">
                                    <div class="card-body">
                                        <h3 class="card-title" align="center">상품 이름</h3>
                                        <p class="card-text">상품설명상품설명상품설명상품설상품설명</p>
                                        <p align="right">15,000원</p>
                                        <a href="#" class="btn btn-success"> 구매하기</a> <a href="#"
                                            class="btn btn-dark"> 장바구니</a>
                                    </div>
                                </div>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="goodr" role="tabpanel"
                        aria-labelledby="nav-contact-tab">
                        <div class="row">
                            <%
                            for (int i = 0; i < 4; i++) {
                            %>
                            <div class="col-lg-3 col-sm-6 mb-4">
                                <div class="card">
                                    <img src="./img/innerbox_sample4.jpg" class="card-img-center"
                                        alt=".." style="width: 300px; height: 200px;">
                                    <div class="card-body">
                                        <h3 class="card-title" align="center">상품 이름</h3>
                                        <p class="card-text">상품설명상품설명상품설명상품설상품설명</p>
                                        <p align="right">15,000원</p>
                                        <a href="#" class="btn btn-success"> 구매하기</a> <a href="#"
                                            class="btn btn-dark"> 장바구니</a>
                                    </div>
                                </div>
                            </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>


   <!-- 기본상품  -->


            <div class="row mt-5" id="recommended">
                <h3 align="center">그냥 상품</h3>
                <hr>
                <div class="row">
                    <%
                    for (int i = 0; i < 8; i++) {
                    %>
                    <div class="col-lg-3 col-sm-6 mb-4">
                        <!--추천상품 1-->
                        <div class="tumnail">
                            <div class="btn" data-bs-toggle="collapse">
                                <a href="#" class="text-decoration-none"> <img
                                    class="img-thumbnail" src="./img/innerbox_sample1.jpg"
                                    alt="..." style="width: 300px; height: 200px;" />

                                    <h3 align="center">상품이름</h3>
                                    <div class="" align="right">햄버거</div>
                                    <div class="" align="right">15,000원</div>

                                </a>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>

                </div>

            </div>







            <!--  Footer -->
            <hr>

            <div class="text=center">
                <p>ITWILL 1 TEAM PROJECT_BC TEST FOOTER @2021-2021 DEAD</p>

            </div>
        </div>
    </div>

</body>
</html>