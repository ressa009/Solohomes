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
	
	<title>Review Managemanet</title>
</head>
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/manager/review.js"></script>
<body>

    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
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
                        <h4 class="page-title">한줄평</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/manager/index.do">Main</a></li>
                            <li class="active">Review</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <input type="hidden" id="reviewPage"/> <!-- requestTable curPage -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">한줄평 리스트
                            	<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
                                    <select class="form-control pull-right row b-none" id="sortSelect">
                                        <option value="0">최근한줄평</option>
                                        <option value="1">신고많은순</option>
                                    </select>
                                </div>
                            </h3>
                            <form name="frmDelete" id="frmDelete" onsubmit="return chkDelete()">
	                            <div class="table-responsive">
	                                <table class="table" id="reviewTable">
	                                    <thead>
	                                        <tr>
	                                            <th class='review ColumnOfCheckBox'>선택</th>
	                                            <th>아이디</th>
	                                            <th>제품명</th>
	                                            <th>제목</th>
	                                            <th>신고횟수</th>
	                                            <th>작성일</th>
	                                            <th>내용보기</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    </tbody>
	                                </table>
	                            </div>
	                            <div class="col-sm-12">
		                            <button type="button" class="btn btn-info" id="reviewCheckBoxToggle">선택삭제</button>
		                            <button type="submit" class="btn btn-danger" id="reviewDeleteOk">선택완료</button>
		                        	<button type="button" class="btn btn-danger pull-right m-l-20 btn-circle btn-outline waves-effect waves-light prevPage" id="reviewNextPage"><i class="fa fa-chevron-right fa-fw" aria-hidden="true"></i></button>
		                            <button type="button" class="btn btn-danger pull-right m-l-20 btn-circle btn-outline waves-effect waves-light nextPage" id="reviewPrevPage"><i class="fa fa-chevron-left fa-fw" aria-hidden="true"></i></button>
	                            </div>
                            </form>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="modal fade" id="reviewModal" role="dialog">
					<div class="modal-dialog">
				    <!-- Modal content-->
				    	<div class="modal-content">
				       		<div class="modal-header">
				         		<button type="button" class="close" data-dismiss="modal">×</button>
				         		<h4 class="modal-title"></h4>
				       		</div>
				       		<div class="modal-body">
				       			<label class="col-md-12">Product</label>
						       	<div class="col-md-12 reviewModalProduct">
						       		<p></p>
						       	</div>
		                        <label class="col-md-12">Content</label>
		                        <div class="col-md-12 reviewModalContent">
		                        	<p></p>
		                        </div>
          		                <label class="col-md-12">More Info</label>
		                        <div class="col-md-12 reviewModalInfo">
		                        	<p></p>
		                        </div>
		                        <div class="clear"></div>
				       		</div>
					        <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					        </div>
				     	</div>
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