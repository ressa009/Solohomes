<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="${pageContext.request.contextPath}/img/favi.png">
	<!-- Bootstrap Core CSS -->
	<link href="../admin/pixel-html/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Menu CSS -->
	<link href="../admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
	<!-- toast CSS -->
	<link href="../admin/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
	<!-- morris CSS -->
	<link href="../admin/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
	<!-- animation CSS -->
	<link href="../admin/pixel-html/css/animate.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="../admin/pixel-html/css/style.css" rel="stylesheet">
	<!-- color CSS -->
	<link href="../admin/pixel-html/css/colors/blue-dark.css" id="theme" rel="stylesheet">
	<title>HoloHomes Manager</title>
</head>
<body>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/manager/index.js"></script>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
    
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
            	<a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse">
            		<i class="fa fa-bars"></i>
            	</a>
                <div class="top-left-part">
                	<a class="logo" href="${pageContext.request.contextPath}/user/main.do">
	                	<b>H</b>
	                	<span class="hidden-xs">HoloHomes</span>
                	</a>
                </div>
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a href="${pageContext.request.contextPath}/member/logOut.do">로그아웃</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <!-- Left navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="${pageContext.request.contextPath}/manager/index.do" class="waves-effect"><i class="fa fa-home fa-fw" aria-hidden="true"></i><span class="hide-menu">메인페이지</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/member.do" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i><span class="hide-menu">회원관리</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/goods.do" class="waves-effect"><i class="fa fa-database fa-fw" aria-hidden="true"></i><span class="hide-menu">상품관리</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/review.do" class="waves-effect"><i class="fa fa-heart fa-fw" aria-hidden="true"></i><span class="hide-menu">리뷰관리</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/manager/request.do" class="waves-effect"><i class="fa fa-info-circle fa-fw" aria-hidden="true"></i><span class="hide-menu">고객문의</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Left navbar-header end -->
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">메인페이지</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/manager/index.do">Main</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- row -->
                <div class="row">
                    <!--col -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="white-box">
                            <div class="col-in row">
                                <div class="col-md-6 col-sm-6 col-xs-6"> <i data-icon="E" class="linea-icon linea-basic"></i>
                                    <h5 class="text-muted vb">Today Sign Up</h5> </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h3 class="counter text-right m-t-15 text-danger">${countOfMembers}</h3> </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> <span class="sr-only">40% Complete (success)</span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <!--col -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="white-box">
                            <div class="col-in row">
                                <div class="col-md-6 col-sm-6 col-xs-6"> <i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
                                    <h5 class="text-muted vb">Today Sales</h5> </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h3 class="counter text-right m-t-15 text-megna">${countOfSales}</h3> </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-megna" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> <span class="sr-only">40% Complete (success)</span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                    <!--col -->
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="white-box">
                            <div class="col-in row">
                                <div class="col-md-6 col-sm-6 col-xs-6"> <i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
                                    <h5 class="text-muted vb">Today Sales Amount(10,000)</h5> </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h3 class="counter text-right m-t-15 text-megna">${sumOfSales}</h3> </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-megna" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> <span class="sr-only">40% Complete (success)</span> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <!--row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                            <h3 class="box-title">Monthly Sales Chart</h3>
                            <ul class="list-inline text-right">
                                <li>
                                    <h5><i class="fa fa-circle m-r-5" style="color: #e60012; opacity : 0.5;"></i>Sales Amount</h5>
                                </li>
                            </ul>
                            <div id="salesChart" style="height: 370px;"></div>
                        </div>
                    </div>
                </div>
                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title"><b>월별 판매현황</b>
                                <div class="col-md-2 col-sm-4 col-xs-12 pull-right">
                                	<!-- month select -->
                                    <select class="form-control pull-right row b-none" id="selectMonth">
                                    	<c:set var="size" value="${fn:length(mothlySalesList) - 1}"/>
                                  		<c:forEach var="i" begin="0" end="${size}">
                                  			<option value="${mothlySalesList[size - i].year_month}">${mothlySalesList[size - i].year_month}</option>
                                  		</c:forEach>
                                    </select>
                                </div>
                            </h3>
                            <div class="table-responsive">
                                <table class="table" id="dailySalesTable">
                                    <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th>판매수량</th>
                                            <th>판매액</th>
                                            <th>누적판매액</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                               	</table>
                               	<div class="pull-right">단위 : (&#8361)</div>
                        	</div>
                    	</div>
                	</div>
                <!-- /.row -->
            	</div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2020 &copy; α-team HoloHomes </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="../admin/pixel-html/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="../admin/pixel-html/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../admin/pixel-html/js/waves.js"></script>
    <!--Counter js -->
    <script src="../admin/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
    <script src="../admin/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
    <!--Morris JavaScript -->
    <script src="../admin/plugins/bower_components/raphael/raphael-min.js"></script>
    <script src="../admin/plugins/bower_components/morrisjs/morris.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../admin/pixel-html/js/custom.min.js"></script>
    <script src="../admin/pixel-html/js/dashboard1.js"></script>
    <script src="../js/manager/morrisChartData.js"></script>
    <script src="../admin/plugins/bower_components/toast-master/js/jquery.toast.js"></script>
</body>
</html>
