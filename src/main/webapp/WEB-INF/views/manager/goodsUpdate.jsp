<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <script src="${pageContext.request.contextPath}/js/manager/goodsWrite.js"></script>
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
                        <h4 class="page-title">상품수정</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/manager/index.do">Main</a></li>
                            <li><a href="${pageContext.request.contextPath}/manager/goods.do">Goods</a></li>
                            <li class="active">Update</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row --><!-- ${pageContext.request.contextPath}/manager/goodswriteOk.do -->
                <form method="POST" id="frmGoods" action="${pageContext.request.contextPath}/manager/goodsUpdateOk.do" enctype="multipart/form-data" class="form-horizontal form-material">
                <input type="hidden" name="g_uid" value="${goods.g_uid }">
                <!-- .row -->
                <div class="row" id="frmContent">
                    <div class="white-box">
		                <div class="col-md-4 col-xs-12">
		                    <div class="white-box">
		                    	<label class="col-sm-12"><b>대표이미지</b></label>
		                        <div class="user-bg"><img id="goodsImg" style="max-width:300px;" width="100%" height="100%" alt="goods" src="${pageContext.request.contextPath}/img/goods/${goods.g_img}"></div>
		                        <div class="user-btm-box">
								<input type="file" name="g_img" id="g_img" accept="image/*" required>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-8 col-xs-12">
		                    <div class="white-box">
		 	                	<div class="form-group">
		                         <label class="col-sm-12"><b>가구종류</b></label>
		                         <div class="col-sm-12">
		                         	 <script>
		                   				$(document).ready(function(){
		                   					$("option[value=" + ${goods.g_type} + "]").attr("selected", true);	
		                   				});
		                         	 </script>
		                             <select class="form-control form-control-line" name="g_type" required>
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
		                     </div>
		                     <div class="form-group">
		                         <label class="col-md-12"><b>가구이름</b></label>
		                         <div class="col-md-12">
		                             <input type="text" name="g_name" placeholder="name" class="form-control form-control-line" value="${goods.g_name}" required> </div>
		                     </div>
		                     <div class="form-group">
		                         <label class="col-md-12"><b>가구크기</b></label>
		                         <div class="col-md-12">
		                             <input type="text" name="g_size" placeholder="000*000*000" class="form-control form-control-line" value="${goods.g_size}"> </div>
		                     </div>
		                     <div class="form-group">
		                         <label class="col-md-12"><b>가구가격</b></label>
		                         <div class="col-md-12">
		                             <input type="text" name="g_price" placeholder="단위(&#8361)" class="form-control form-control-line" value="${goods.g_price}" required> </div>
		                     </div>
		                     <div class="clear"></div>
		                    </div>
		                </div>
                    	<div class="clear"></div>
                    </div>
                    <c:set var="count" value="${fn:length(inList)}"></c:set>
                    <input type="hidden" id="optionCnt" value="${count}">
                    <!-- info -->
                    <div class="white-box" id="optionList">
	                	<div class="col-md-12" id="options">
	                		<c:forEach var="info" items="${inList}" varStatus="status">
    				        <div class="col-md-12 option">
		                    	<div class="form-group col-md-6">
			                    	<label class="col-sm-12"><b>옵션이미지${status.count }</b></label>
			      					<div class="col-md-12">
				                    	<input type="file" name="in_img" id="in_img${status.count }" accept="image/*" required></div>
		                    	</div>
			                    <div class="form-group col-md-6">
			                        <label class="col-md-12"><b>색상${status.count }</b></label>
			                        <div class="col-md-12">
			                            <input type="text" name="in_color" placeholder="color" class="form-control form-control-line" value="${info.in_color}" required> </div>
			                    </div>
	                    	</div>
	                		</c:forEach>
	                    </div>
	                    <div class="clear"></div>
	               	</div>
         
                    <div class="white-box" id="buttonList">
	                    <div align="right" class="col-sm-12">
	                    	<button type="button" class="btn btn-danger" id="minusInfo">옵션제거</button>
	                        <button type="button" class="btn btn-danger" id="plusInfo">옵션추가</button>
	                        <button type="submit" class="btn btn-info" id="submit">상품수정</button>
	                    </div>      
	                    <div class="clear"></div>           	
                    </div>
                </div>
                <!-- /.row -->
                </form>
                <!-- /form -->
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
