<%@page import="vo.ChartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%
		ArrayList<ChartBean> mData = (ArrayList<ChartBean>)request.getAttribute("mData");
	%>
    <head>       
    <meta charset="UTF-8">
    <title>집밥선생_AdminPage</title>
<style type="text/css">
 		.hidden_data {
 display: none;
}
 </style>
        <link href="CSS/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    
    <body class="sb-nav-fixed">
        
        <%@include file="../inc/dashBoard_top.jsp" %>        	
        
            <div id="layoutSidenav_content">
                <main>
		    	<%if (mData !=null){ %>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">매출차트</h1>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                일별 차트
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월별 차트
                                    </div>
	                                    <div class="hidden_data">
							        		<ul class="total_data">
							        		<%for(int i=0; i<mData.size();i++){ %>
							        			<li><%=mData.get(i).getMonth_total() %></li>
							        		<%} %>
							        		</ul>        	
							        	</div>
							        	<div class="hidden_data">
							        		<ul class="date_data">
							        		<%for(int i=0; i<mData.size();i++){ %>
							        			<li><%=mData.get(i).getMonth_date()%>월</li>
							        		<%} %>
							        		</ul>        	
							        	</div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        뭐하지
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </main>
             
             <%@include file="../inc/dashBoard_bottom.jsp" %>
             
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/scripts2.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<!--         <script src="js/assets/demo/chart-area-demo.js"></script> -->
        <script src="assets/demo/chart-bar-demo.js"></script>
<!--         <script src="js/assets/demo/chart-pie-demo.js"></script> -->
    </body>
</html>
