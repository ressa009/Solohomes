<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favi.png">
    <!-- Bootstrap Core CSS -->
    <link href="../admin/pixel-html/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="../admin/pixel-html/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../admin/pixel-html/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="../admin/pixel-html/css/colors/blue-dark.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link href="${pageContext.request.contextPath}/css/manager/common.css" rel="stylesheet">
	
	<title>Goods Management</title>
</head>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/manager/goods.js"></script>
<body>

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
                        <h4 class="page-title">상품관리</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/manager/index.do">Main</a></li>
                            <li class="active">Goods</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <input type="hidden" id="goodsPage"/> <!-- requestTable curPage -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                        	<div class="box-title"><b>상품목록</b>
                        		<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
                        			<button onclick="location.href='${pageContext.request.contextPath}/manager/goodsWrite.do'" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline waves-effect waves-light">신규 상품등록</button>
                        		</div>
                        		<div class="clear"></div>
                        	</div>
                            <div class="box-title">
                            	<div class="col-md-2 col-sm-3 col-xs-10 pull-right">
                                    <select class="form-control pull-right row b-none" id="typeSelect">
                                        <option value="0" selected>모든상품</option>
                                        <option value="1">침대</option>
                                        <option value="2">화장대</option>
                                        <option value="3">서랍장</option>
                                        <option value="4">소파</option>
                                        <option value="5">거실장</option>
                                        <option value="6">옷장</option>
                                        <option value="7">테이블</option>
                                        <option value="8">의자</option>
                                        <option value="9">책상</option>
                                        <option value="10">책장</option>
                                    </select>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-10 pull-right">
                                    <select class="form-control pull-right row b-none" id="sortSelect">
                                        <option value="0" selected>상세옵션</option>
                                        <option value="1">좋아요순</option>
                                        <option value="2">최신순</option>
                                        <option value="3">판매횟수순</option>
                                    </select>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <form name="frmDelete" id="frmDelete" onsubmit="return chkDelete()">
	                            <div class="table-responsive">
	                                <table class="table" id="goodsTable">
	                                    <thead>
	                                        <tr>
	                                            <th class='goods ColumnOfCheckBox'>선택</th>
	                                            <th>상품명</th>
	                                            <th>카테고리</th>
	                                            <th>가격</th>
	                                            <th>좋아요</th>
	                                            <th>판매수량</th>
	                                            <th></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <div class="col-sm-12">
		                            <button type="button" class="btn btn-info" id="goodsCheckBoxToggle">선택삭제</button>
		                            <button type="submit" class="btn btn-danger" id="goodsDeleteOk">선택완료</button>
		                        	<button type="button" class="btn btn-danger pull-right m-l-20 btn-circle btn-outline waves-effect waves-light nextPage" id="goodsNextPage"><i class="fa fa-chevron-right fa-fw" aria-hidden="true"></i></button>
		                            <button type="button" class="btn btn-danger pull-right m-l-20 btn-circle btn-outline waves-effect waves-light prevPage" id="goodsPrevPage"><i class="fa fa-chevron-left fa-fw" aria-hidden="true"></i></button>
	                            </div>
                            </form>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                        	<div class="box-title"><b>시리즈목록</b>
                        		<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
                        			<button onclick="location.href='${pageContext.request.contextPath}/manager/seriesWrite.do'" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline waves-effect waves-light">시리즈등록</button>
                        		</div>
                        		<div class="clear"></div>
                        	</div>
                            <form name="frmSeriesDelete" id="frmSeriesDelete" onsubmit="return chkSeriesDelete()">
	                            <div class="table-responsive">
	                                <table class="table" id="seriesTable">
	                                    <thead>
	                                        <tr>
	                                            <th class='series ColumnOfCheckBox'>선택</th>
	                                            <th>번호</th>
	                                            <th>시리즈명</th>
	                                            <th>등록일</th>
	                                            <th>구성상품</th>
	                                            <th></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <div class="col-sm-12">
		                            <button type="button" class="btn btn-info" id="seriesCheckBoxToggle">선택삭제</button>
		                            <button type="submit" class="btn btn-danger" id="seriesDeleteOk">선택완료</button>
	                            </div>
                            </form>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
              	<div id="popupImg">
			       	<div class="col-md-12 content">
			       		<img id="goodsImg" style="max-width:300px;" width="100%" height="100%" alt="goods" src="http://placehold.it/150x150">
			       	</div>
				</div>             
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
    <!-- Custom Theme JavaScript -->
    <script src="../admin/pixel-html/js/custom.min.js"></script>
</body>

</html>

