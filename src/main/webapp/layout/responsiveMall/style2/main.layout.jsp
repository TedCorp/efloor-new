<%@ page trimDirectiveWhitespaces="true"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/layout/inc/taglib.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>    
    <!-- Basic page needs
    ============================================ -->
    <title>e층창고</title>
    <meta charset="utf-8">
    <meta name="keywords" content="e층창고, cjflsmart," />
    
    <!-- Mobile specific metas
    ============================================ -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" type="image/ico" href="${contextPath}/resources/images/responsive/icon/after_icon.ico"/>

    <!-- Libs CSS
    ============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/css/responsive/bootstrap/css/bootstrap.min.css">
    <link href="${contextPath}/resources/css/responsive/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/js/responsive/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/js/responsive/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/themecss/lib.css" rel="stylesheet">
    <link href="${contextPath}/resources/js/responsive/jquery-ui/jquery-ui.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/js/responsive/minicolors/miniColors.css" rel="stylesheet">
    
    <!-- Theme CSS
    ============================================ -->
    <link href="${contextPath}/resources/css/responsive/themecss/so_searchpro.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/themecss/so_megamenu.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/themecss/so-categories.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/themecss/so-listing-tabs.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/themecss/so-category-slider.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/themecss/so-newletter-popup.css" rel="stylesheet">

    <link href="${contextPath}/resources/css/responsive/footer/footer2.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/responsive/header/header2.css?v=${DATE }" rel="stylesheet">
    <link id="color_scheme" href="${contextPath}/resources/css/responsive/home2.css?v=${DATE }" rel="stylesheet"> 
    <link href="${contextPath}/resources/css/responsive/responsive.css?v=${DATE }" rel="stylesheet">

     <!-- Google web fonts
    ============================================ -->
    <link href='https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700' rel='stylesheet' type='text/css'>
    <style type="text/css">
         /* body{font-family:'Poppins', sans-serif} */
    </style>

	<!-- Include Libs & Plugins
	============================================ -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/slick-slider/slick.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/themejs/libs.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/unveil/jquery.unveil.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/countdown/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/dcjqaccordion/jquery.dcjqaccordion.2.8.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/datetimepicker/moment.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/modernizr/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/minicolors/jquery.miniColors.min.js"></script>
	
	<!-- Theme files
	============================================ -->	
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/themejs/homepage.js"></script>	
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/themejs/toppanel.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/themejs/so_megamenu.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/responsive/themejs/addtocart.js"></script>  


    <!--폴라베어  -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/resources2/css/common.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/resources2/swiper/dist/css/swiper.min.css">
	<script defer type="text/javascript" src="${contextPath}/resources/resources2/js/common.js"></script>
	<script defer type="text/javascript" src="${contextPath}/resources/resources2/swiper/dist/js/swiper.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/resources2/css/211021.css">	


	<!-- jquery-number-2.1.5 -->
	<script type="text/javascript" src="${contextPath}/resources/adminlte/plugins/number/jquery.number.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/common.js?v=${DATE }"></script>
</head>
<body>

    
    <div class="wrapper" >	    
		<tiles:insertAttribute name="header" />	
		<tiles:insertAttribute name="center" />	
		<tiles:insertAttribute name="footer" />	    
    </div>
       
</body>

</html>
