<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

        
        <title>일반 회원 조회</title>

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <!-- 컨트롤러 작업 시 CSS/styles.css 로 사용 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        

</head>
<body class="sb-nav-fixed">
        
        <%@include file="../inc/dashBoard_top.jsp" %>
            
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원 정보</h1>
                        <ol class="breadcrumb mb-4">
                            
                        </ol>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                일반 회원 정보
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>나이</th>
                                            <th>등급</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>나이</th>
                                            <th>등급</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>ddddd</td>
                                            <td>ddddd</td>
                                            <td>ddddd</td>
                                            <td>ddddd</td>
                                            <td>ddddd</td>
                                            
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                
                <%@include file="../inc/dashBoard_bottom.jsp" %>
                
            </div>
        </div>

    </body>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/scripts2.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/assets/demo/datatables-simple-demo.js"></script> 
        <script src="js/assets/demo/datatables-simple-demo.js"></script>
        <script src="js/assets/demo/chart-area-demo.js"></script>

</html>