<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>追風者</title>
    <script src="https://kit.fontawesome.com/731d88c153.js" crossorigin="anonymous"></script>
    <!-- bootstrap-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- -->
    <link rel="stylesheet" href="css/index/all.css">
    <link rel="stylesheet" href="css/index/flickity.css">
    <link rel="stylesheet" href="css/index/flickity-global.css">
    <link rel="stylesheet" href="css/index/page-index.css">
    <link rel="stylesheet" href="css/index/instagram-photo-light-box.css">
    <link type="text/css" rel="stylesheet" charset="UTF-8" href="css/index/translateelement.css">
    <link type="text/css" rel="stylesheet" href="css/index/banner.css">

    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="/img/apple-touch-icon-precomposed.png">
    <link rel="Shortcut Icon" type="image/x-icon" href="<c:url value='img/bikeIcon.png'/>" />


    <style>
		carousel-inner img {
		    width: 100%;
		    height: 100%;
		}
		
		@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700,800');
		@import url('https://fonts.googleapis.com/css?family=Lobster');
		.navbar {
		    position: absolute;
		    left: 0;
		    top: 0;
		    padding: 0;
		    width: 100%;
		    transition: background 0.6s ease-in;
		    z-index: 99999;
		}
		
		.navbar .navbar-brand {
		    font-family: 'Lobster', cursive;
		    font-size: 1.5rem;
		}
		
		.navbar .navbar-toggler {
		    position: relative;
		    height: 30px;
		    width: 50px;
		    border: none;
		    cursor: pointer;
		    outline: none;
		}
		
		.navbar .navbar-toggler .menu-icon-bar {
		    position: absolute;
		    left: 5px;
		    right: 5px;
		    height: 2px;
		    background-color: #fff;
		    opacity: 0;
		    -webkit-transform: translateY(-1px);
		    -ms-transform: translateY(-1px);
		    transform: translateY(-1px);
		    transition: all 0.3s ease-in;
		}
		
		.navbar .navbar-toggler .menu-icon-bar:first-child {
		    opacity: 1;
		    -webkit-transform: translateY(-1px) rotate(45deg);
		    -ms-sform: translateY(-1px) rotate(45deg);
		    transform: translateY(-1px) rotate(45deg);
		}
		
		.navbar .navbar-toggler .menu-icon-bar:last-child {
		    opacity: 1;
		    -webkit-transform: translateY(-1px) rotate(135deg);
		    -ms-sform: translateY(-1px) rotate(135deg);
		    transform: translateY(-1px) rotate(135deg);
		}
		
		.navbar .navbar-toggler.collapsed .menu-icon-bar {
		    opacity: 1;
		}
		
		.navbar .navbar-toggler.collapsed .menu-icon-bar:first-child {
		    -webkit-transform: translateY(-7px) rotate(0);
		    -ms-sform: translateY(-7px) rotate(0);
		    transform: translateY(-7px) rotate(0);
		}
		
		.navbar .navbar-toggler.collapsed .menu-icon-bar:last-child {
		    -webkit-transform: translateY(5px) rotate(0);
		    -ms-sform: translateY(5px) rotate(0);
		    transform: translateY(5px) rotate(0);
		}
		
		.navbar-dark .navbar-nav .nav-link {
		    position: relative;
		    color: #fff;
		    font-size: 1.2rem;
		}
		
		.navbar-dark .navbar-nav .nav-link:focus,
		.navbar-dark .navbar-nav .nav-link:hover {
		    color: #fff;
		}
		
		.navbar .dropdown-menu {
		    padding: 0;
		    background-color: rgba(56, 56, 56, 0.712);
		}
		
		.navbar .dropdown-menu .dropdown-item {
		    position: relative;
		    padding: 10px 10px;
		    color: #fff;
		    font-size: 1.2rem;
		    border-bottom: 1px solid rgba(255, 255, 255, .1);
		    transition: color 0.2s ease-in;
		}
		
		.navbar .dropdown-menu .dropdown-item:last-child {
		    border-bottom: none;
		}
		
		.navbar .dropdown-menu .dropdown-item:hover {
		    background: transparent;
		    color: #ffffff;
		}
		
		.navbar .dropdown-menu .dropdown-item::before {
		    content: '';
		    position: absolute;
		    bottom: 0;
		    left: 0;
		    top: 0;
		    width:10px;
		    background-color: #ffffff;
		    opacity: 0;
		    transition: opacity 0.2s ease-in;
		}
		
		.navbar .dropdown-menu .dropdown-item:hover::before {
		    opacity: 1;
		}
		
		.navbar.fixed-top {
		    position: fixed;
		    -webkit-animation: navbar-animation 0.6s;
		    animation: navbar-animation 0.6s;
		    background-color: #36c1b3d5;
		}
		
		.navbar.fixed-top.navbar-dark .navbar-nav .nav-link.active {
		    color: #ffffff;
		}
		
		.navbar.fixed-top.navbar-dark .navbar-nav .nav-link::after {
		    background-color: #ffffff;
		}
		
		.content {
		    padding: 120px 0;
		}
		
		@media screen and (max-width: 768px) {
		    .navbar-brand {
		        margin-left: 5px;
		    }
		    .navbar-nav {
		        padding: 0 20px;
		        background-color: #36c1b3d5;
		    }
		    .navbar.fixed-top .navbar-nav {
		        background: transparent;
		    }
		}
		
		@media screen and (min-width: 767px) {
		    .banner {
		        padding: 0 15px;
		    }
		    .banner h1 {
		        font-size: 5rem;
		    }
		    .banner p {
		        font-size: 2rem;
		    }
		    .navbar-dark .navbar-nav .nav-link {
		        padding: 23px 15px;
		    }
		    .navbar-dark .navbar-nav .nav-link::after {
		        content: '';
		        position: absolute;
		        bottom: 15px;
		        left: 1%;
		        right: 10%;
		        height: 1px;
		        background-color: #fff;
		        -webkit-transform: scaleX(0);
		        -ms-transform: scaleX(0);
		        transform: scaleX(0);
		        transition: transform 0.1s ease-in;
		    }
		    .navbar-dark .navbar-nav .nav-link:hover::after {
		        -webkit-transform: scaleX(1);
		        -ms-transform: scaleX(1);
		        transform: scaleX(1);
		    }
		    .dropdown-menu {
		        min-width: 200px;
		        -webkit-animation: dropdown-animation 0.3s;
		        animation: dropdown-animation 0.3s;
		        -webkit-transform-origin: top;
		        -ms-transform-origin: top;
		        transform-origin: top;
		    }
		}
		
		@-webkit-keyframes navbar-animation {
		    0% {
		        opacity: 0;
		        -webkit-transform: translateY(-100%);
		        -ms-transform: translateY(-100%);
		        transform: translateY(-100%);
		    }
		    100% {
		        opacity: 1;
		        -webkit-transform: translateY(0);
		        -ms-transform: translateY(0);
		        transform: translateY(0);
		    }
		}
		
		@keyframes navbar-animation {
		    0% {
		        opacity: 0;
		        -webkit-transform: translateY(-100%);
		        -ms-transform: translateY(-100%);
		        transform: translateY(-100%);
		    }
		    100% {
		        opacity: 1;
		        -webkit-transform: translateY(0);
		        -ms-transform: translateY(0);
		        transform: translateY(0);
		    }
		}
		
		@-webkit-keyframes dropdown-animation {
		    0% {
		        -webkit-transform: scaleY(0);
		        -ms-transform: scaleY(0);
		        transform: scaleY(0);
		    }
		    75% {
		        -webkit-transform: scaleY(1.1);
		        -ms-transform: scaleY(1.1);
		        transform: scaleY(1.1);
		    }
		    100% {
		        -webkit-transform: scaleY(1);
		        -ms-transform: scaleY(1);
		        transform: scaleY(1);
		    }
		}
		
		@keyframes dropdown-animation {
		    0% {
		        -webkit-transform: scaleY(0);
		        -ms-transform: scaleY(0);
		        transform: scaleY(0);
		    }
		    75% {
		        -webkit-transform: scaleY(1.1);
		        -ms-transform: scaleY(1.1);
		        transform: scaleY(1.1);
		    }
		    100% {
		        -webkit-transform: scaleY(1);
		        -ms-transform: scaleY(1);
		        transform: scaleY(1);
		    }
		}
	</style>

</head>

<body>
	
		<header class="header-area overlay" >
		    <nav class="navbar navbar-expand-md navbar-dark" >
		    <div class="container" style="margin-top:0px">
		    <div style="position:static;margin-left:-170px;margin-top:5px;">
		      <a href="http://localhost:8080/EEIT124Team1FinalProject/" class="navbar-brand" ><img src="img/index/title.png" ></a>
		      </div>
		      <div id="main-nav" class="collapse navbar-collapse" style="position:absolute;left:180px;top:2px">
		        <ul class="navbar-nav ml-auto">
		          <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">自行車道</a>
		            <div class="dropdown-menu">
		              <a class="dropdown-item" href="<c:url value='/newBikeIndexEntry.controller?pageNo=1'/>">自行車道</a>
                      <a class="dropdown-item" href="<c:url value='/REEntry.controller?pageNo=1'/>">補給車站</a>
                      <a class="dropdown-item" href="<c:url value='/bikeMapEntry.controller'/>">地圖規劃</a>
		            </div>
		          </li>
		          
		          <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">預約租車</a>
		            <div class="dropdown-menu">
		               <a class="dropdown-item" href="<c:url value='/bikeStorePre.controller?pageNo=1' />">門市資訊</a>
                       <a class="dropdown-item" href="<c:url value='/BikeTypeUser' />">預約租車</a>
		            </div>
		          </li>
		          
		         <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">住宿訂房</a>
		            <div class="dropdown-menu">
		              <a class="dropdown-item" href="<c:url value='/sixsix.Search.controller'/>">訂房查詢</a>
		            </div>
		          </li>
		          
		          <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">活動資訊</a>
		            <div class="dropdown-menu">
		              	<a class="dropdown-item" href="<c:url value='/event'/>">活動首頁</a>
                        <a class="dropdown-item" href="<c:url value='/event.query'/>">活動搜尋</a>
                        <c:if test="${ !empty loginOK }"> 
	                        <a class="dropdown-item" href="<c:url value='/eventActivity'/>">規劃行程</a>
	                        <a class="dropdown-item" href="<c:url value='/myActivity'/>">個人行程表</a>
                        </c:if>
                        <c:if test="${ empty loginOK }"> 
                      		<a class="dropdown-item" href="<c:url value='/loginPage'/>">規劃行程</a>
	                        <a class="dropdown-item" href="<c:url value='/loginPage'/>">個人行程表</a>
                        </c:if>
		            </div>
		          </li>
		          
		           <!-- 會員登入(未登入) 開始--> 
			        <c:if test="${ empty loginOK }"> 
			            <li style="padding-left:700px"><a class="nav-item nav-link" href="/EEIT124Team1FinalProject/loginPage">
			                    <i class="fa fa-sign-in" style="color:white;font-size:25px;">
			                      </i>
			                    <span style="font-size:18px;text-decoration: none;">登入</span>
			                </a>
			            </li>  
			            
			            <li><a class="nav-item nav-link" href="/EEIT124Team1FinalProject/registPage">
			                    <i class="fa fa-users" style="color:white;font-size:25px;">
			                      </i>
			                    <span style="font-size:18px;text-decoration: none;">註冊</span>
			                </a>
			            </li>
			        </c:if>
			       <!-- 會員登入(未登入) 結束-->
			       
			        <!-- 會員登入(有登入) 開始-->
		            <c:if test="${! empty loginOK }"> 
			            <c:if test="${! empty loginOK.memberAdvanced.icon}">
						    <img height='50px' width='50px' style="border-radius:50%;position:absolute;left:1200px;top:10px"
							src="<c:url value='/showMemberIcon?id=${loginOK.memberId}'/>">
						</c:if>
						<c:if test="${ empty loginOK.memberAdvanced.icon}">
							<c:if test="${ empty pictureUrl}">
								<img src="<c:url value='/img/mike.jpg'/>" height='50px' width='50px'alt="Avatar" style="border-radius:50%;position:absolute;left:1200px;top:10px">
							</c:if>	
							<c:if test="${! empty pictureUrl}">
								<img src="${pictureUrl}" height='50px' width='50px' alt="Avatar" style="border-radius:50%;position:absolute;left:1200px;top:10px">
							</c:if>						
						</c:if>	
		            <li class="dropdown" style="osition:absolute;left:680px">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">${loginOK.name}</a>
		            <div class="dropdown-menu">
		               <a class="dropdown-item" href="<c:url value='/infoPage'/>"><i class="fa fa-user-o"></i> 會員中心</a>
	                   <a class="dropdown-item" id="logout" href="<c:url value='/memberLogout.controller'/>"><i class="fa fa-sign-out"></i> 登出</a>
		            </div>
		           </li>      
				</c:if>
<!--              		會員登入(有登入) 結束   -->
             		
		          
		        </ul>
		      </div>
		    </div>
		  </nav>
	</header>
		
	

            <div class="main-container" style="padding-top:0px;margin-top: 0%;">

                <!--======================== 上方圖片輪播開始========================-->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    </ol>

                    <div class="carousel-inner" style="max-height:715px">
                        <div class="carousel-item active">
                            <img src="img/index/list.jpg" class="d-block w-100" style="margin-buttom:100px">
                        </div>
                        <div class="carousel-item">
                            <img src="img/index/list02.jpg" class="d-block w-100" style="top:400px">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <!-- ========================上方圖片輪播結束======================== -->
                <!-- ========================車道開始======================== -->
                <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding">
                    <h2 class="text-heavy fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">經典車道</h2>
                    <p class="text-dark fz-15px fz-md-18px text-center mb-1 mb-md-3"></p>
                    <div class="index-recommend-blk d-lg-flex">
                        <ul class="row mb-3 mb-md-2 mb-lg-0 index-recommend-list">

                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=1" title="新北淡水河左岸自行車道 ">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad01.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        新北淡水河左岸自行車道 </div>
                                </a>
                            </li>


                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=4" title="臺北河濱自行車道">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad02.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        臺北河濱自行車道 </div>
                                </a>
                            </li>



                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=2" title="新北市大漢及新店溪自行車道 ">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad03.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        新北市大漢及新店溪自行車道 </div>
                                </a>
                            </li>



                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=3" title="東北角舊草嶺環狀自行車道">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad04.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        東北角舊草嶺環狀自行車道 </div>
                                </a>
                            </li>



                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=5" title="宜蘭冬山河自行車道">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad05.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        宜蘭冬山河自行車道</div>
                                </a>
                            </li>


                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=7" title="南投集集綠色隧道暨環鎮自行車道">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad06.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        南投集集綠色隧道自行車道 </div>
                                </a>
                            </li>


                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=8" title="日月潭自行車道系統 ">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad07.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        日月潭自行車道系統 </div>
                                </a>
                            </li>

                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/hotBikeDetail.controller?id=6" title="臺中東豐自行車綠廊 ">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <source media="(min-width: 768px)">
                                            <img src="img/index/bikeRoad08.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                            <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                        </picture>
                                    </div>
                                    <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                        臺中東豐自行車綠廊</div>
                                </a>
                            </li>


                            <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                                <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/newBikeIndexEntry.controller?pageNo=1" title="更多自行車道">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture>
                                            <img src="img/index/bikeRoad09.jpg" data-src="/zh-tw/content/images/index/attraction.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/content/images/index/attraction.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="d-flex justify-content-center align-items-center text-white bg-black-50 hover-bg-white-80 p-1 text-truncate absolute-top-left w-100 h-100 fz-15px">
                                        看更多</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="d-flex d-md-none justify-content-center mt-xl-auto"><a href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/list" title="更多景點" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
                </section>
				<!-- ========================車道結束======================== -->
                <!-- ========================活動開始======================== -->
                <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding bg-lake lake-02">
                    <h2 class="text-white fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">行程推薦</h2>
                    <p class="text-white fz-15px fz-md-18px text-center mb-1 mb-md-3"></p>
                    <ul class="row mb-4 index-event-list">
                        <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/activity/866" title="台北文青一日遊">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/activity/act0.jpg" data-src="/zh-tw/image/5629/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5629/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">2020-12-25～2020-12-25</small>
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">台北文青一日遊
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/activity/867" title="2020台北101跨年">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/activity/act1.jpg" data-src="/zh-tw/image/5612/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5612/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">2020-12-31～2020-12-31</small>
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">2020台北101跨年
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/activity/868" title="山岳之美中部兩日行">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/activity/act2.jpg" data-src="/zh-tw/image/5479/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5479/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">2021-01-08～2021-01-09</small>
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">山岳之美中部兩日行
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/activity/871" title="來去九份住一晚">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/activity/act3.jpg" data-src="/zh-tw/image/5613/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5613/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">2021-01-04～2021-01-04</small>
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">來去九份住一晚
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>
                    <div class="d-flex justify-content-center mt-xl-auto"><a href="event" title="更多活動" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
                </section>
 				<!-- ========================活動結束======================== -->
				<!-- ========================消息開始======================== -->
			   <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding">
                   <h2 class="text-heavy fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">熱門車種</h2>
                <div class="px-2 px-md-3 px-xl-0 py-4 py-md-6 py-xl-8 border-top max-width-xl mx-auto">
                    <ul class="row mb-2" >
                    
                  	<li class="item col-12 col-md-3"   >
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical" >
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/BikeTypeUser" title=" PROPEL ADVANCED PRO 1 ">
                                    <div style="width:320px;height:180px;">
                                        <picture >  <img   style="max-width:320px;max-height:180px;margin:30px auto;background-color:white" src="http://localhost:8080/bikeImage/PROPEL%20ADVANCED%20PRO%201.jpg" data-src="http://localhost:8080/bikeImage/PROPEL%20ADVANCED%20PRO%201.jpg" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=http://localhost:8080/bikeImage/PROPEL%20ADVANCED%20PRO%201.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div><br>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2"> PROPEL ADVANCED PRO 1 </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                  	  <li class="item col-12 col-md-3"   >
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical" >
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/BikeTypeUser" title="CONTEND SL 1">
                                    <div style="width:320px;height:180px;">
                                        <picture >  <img   style="max-width:320px;max-height:180px;margin:30px auto;background-color:white" src="http://localhost:8080/bikeImage/CONTEND%20SL%201.jpg" data-src="http://localhost:8080/bikeImage/CONTEND%20SL%201.jpg" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=http://localhost:8080/bikeImage/DEFY%20ADVANCED%201.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div><br>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">CONTEND SL 1</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                        <li class="item col-12 col-md-3"   >
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical" >
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/BikeTypeUser" title="DEFY ADVANCED 1">
                                    <div style="width:320px;height:180px;">
                                        <picture >  <img   style="max-width:320px;max-height:180px;margin:30px auto;background-color:white" src="http://localhost:8080/bikeImage/DEFY%20ADVANCED%201.jpg" data-src="http://localhost:8080/bikeImage/DEFY%20ADVANCED%201.jpg" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=http://localhost:8080/bikeImage/DEFY%20ADVANCED%201.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div><br>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">DEFY ADVANCED 1</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                       <li class="item col-12 col-md-3"   >
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical" >
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/BikeTypeUser" title="TCR ADVANCED 1 KOM">
                                    <div style="width:320px;height:180px;">
                                        <picture >  <img   style="max-width:320px;max-height:180px;margin:30px auto;background-color:white" src="http://localhost:8080/bikeImage/TCR%20ADVANCED%201%20KOM.jpg" data-src="http://localhost:8080/bikeImage/TCR%20ADVANCED%201%20KOM.jpg" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=http://localhost:8080/bikeImage/TCR%20ADVANCED%201%20KOM.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div><br>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">TCR ADVANCED 1 KOM</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                    </ul>
                    <div class="d-flex justify-content-center mt-xl-auto"><a href="http://localhost:8080/EEIT124Team1FinalProject/BikeTypeUser" title="更多" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
                </div>
                </section>
                <!-- ========================消息結束======================== -->
				<!-- ========================住宿開始======================== -->
                <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding bg-bike">
                    <h2 class="text-white fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">近期熱門住宿</h2>
                    <p class="text-white fz-15px fz-md-18px text-center mb-1 mb-md-3"></p>
                    <ul class="row mb-4 index-bike-list">
                        <li class="item col-12 col-md-3">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/sixsix.BookingHouseDetail.controller?homenum=C4_315080000H_000094" title="樂活民宿">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/index/hotel01.jpg" data-src="img/index/hotel01.jpg" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/Content/images/static/bike/bike-list-01.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">樂活民宿</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                        <li class="item col-12 col-md-3">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/sixsix.BookingHouseDetail.controller?homenum=C4_315080000H_000134" title="杉林溪大飯店">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/index/hotel02.jpg" data-src="img/index/hotel02.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=img/index/hotel02.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">杉林溪大飯店</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                        <li class="item col-12 col-md-3">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/sixsix.BookingHouseDetail.controller?homenum=C4_315080000H_000167" title="金毛屋">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/index/hotel03.jpg" data-src="img/index/hotel03.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=img/index/hotel03.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">金毛屋</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                        <li class="item col-12 col-md-3">
                            <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                                <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="http://localhost:8080/EEIT124Team1FinalProject/sixsix.BookingHouseDetail.controller?homenum=C4_315080000H_000171" title="老爺大酒店">
                                    <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                        <picture> <img src="img/index/hotel04.jpg" data-src="img/index/hotel04.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=img/index/hotel04.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                                    </div>
                                    <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                        <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">老爺大酒店</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                        
                    </ul>
                    <div class="d-flex justify-content-center mt-xl-auto"><a href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/sml-cycling" title="單車追風" class="btn btn-outline-white w-100 mw-300px"> 看更多 </a></div>
                </section>
                <!-- ========================住宿結束======================== -->
                <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding bg-lake lake-03">
                    <h2 class="text-heavy fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-4 mb-lg-5">規劃一趟屬於自己的自行車行程!
                    </h2>
                    <ul class="row mb-3">
                        <li class="col-6 col-md-3 px-md-2 px-lg-5">
                            <a class="d-block text-decoration-none position-relative hover-title" href="http://localhost:8080/EEIT124Team1FinalProject/newBikeIndexEntry.controller?pageNo=1" title="自行車道" target="_blank">
                                <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="img/bikeroad/bike_01.jpg" style="background-position:50%;background-size:cover;background-image: url(&quot;img/bikeroad/bike_01.jpg&quot;);">
                                    <!-- <i class="icon icon-bus-stop absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i> -->
                                </div>
                                <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">自行車道</div>
                            </a>
                        </li>
                        <li class="col-6 col-md-3 px-md-2 px-lg-5">
                            <a class="d-block text-decoration-none position-relative hover-title" href="http://localhost:8080/EEIT124Team1FinalProject/BikeTypeUser" title="單車租借" target="_blank">
                                <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="/storeImage/st_1606985954262.jpg" style="background-position:50%;background-size:cover;background-image: url(&quot;/storeImage/st_1606985954262.jpg&quot;);">
                                    <!-- <i class="icon icon-bus absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i> -->
                                </div>
                                <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">單車租借</div>
                            </a>
                        </li>
                        <li class="col-6 col-md-3 px-md-2 px-lg-5">
                            <a class="d-block text-decoration-none position-relative hover-title" href="http://localhost:8080/EEIT124Team1FinalProject/sixsix.Search.controller" title="住宿訂房" target="_blank">
                                <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="https://taiwan.taiwanstay.net.tw/twpic/9215.jpg" style="background-position:50%;background-size:cover;background-image: url(&quot;https://taiwan.taiwanstay.net.tw/twpic/9215.jpg&quot;);">
                                    <!-- <i class="icon icon-bike absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i> -->
                                </div>
                                <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">住宿訂房</div>
                            </a>
                        </li>
                        <li class="col-6 col-md-3 px-md-2 px-lg-5">
                            <a class="d-block text-decoration-none position-relative hover-title" href="event" title="行程規劃" target="_blank">
                                <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="img/activity/act3.jpg" style="background-position:50%;background-size:cover;background-image: url(&quot;img/activity/act3.jpg&quot;);">
                                    <!-- <i class="icon icon-train absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i> -->
                                </div>
                                <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">行程規劃</div>
                            </a>
                        </li>
                    </ul>
                </section>

                <footer class="footer-wrapper pt-8 bg-lake lake-04">

                    <div class="footer d-flex flex-column flex-md-row align-items-center pb-8 pb-xl-4 flex-lg-row justify-content-md-center align-items-md-start mx-auto">
                        <span class="d-block mt-1" style="position:absolute;left:280px;bottom:63px">
                    <img src="img/index/iii.png"  alt="Sustainable_Destina" class="thumb embed-responsive-item" >
                </span>
                        <div class="mx-md-6 d-xl-flex">
                            <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center text-md-left">
                                <p class="mb-1 font-weight-bold text-white fz-14px fz-md-15px">EEIT124第一組</p>
                                <p class="mb-1">黃祐善　徐浩然　葉政廷</p>
                                <p class="mb-1">黃喻喧　張文軒</p><br>
                                <p class="mb-1 font-weight-bold text-white fz-14px fz-md-10px">本網站僅做為學習使用</p>
                                <p class="mb-1 font-weight-bold text-white fz-14px fz-md-10px">絕不用於任何商業用途</p>
                            </div>
                            <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center">
                                <p class="mb-1 font-weight-bold text-white fz-14px fz-md-15px">資料/圖片來源</p>
                                <p class="mb-1">捷安特自行車</p>
                                <p class="mb-1">日月潭觀光旅遊網</p>
                                <p class="mb-1">台灣自行車旅遊網</p>
                                <p class="mb-1">格上租車</p>
                                <p class="mb-1">智遊網</p>
                            </div>
                            <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center">
                            <p class="mb-1 font-weight-bold text-white fz-14px fz-md-15px">資料/圖片來源</p>
                                <p class="mb-1">BOOKING</p>
                                <p class="mb-1">KKDAY</p>
                                <p class="mb-1">pexels</p>
                                <p class="mb-1">Creative Tim Black DashBoard</p>
                            </div>
                        </div>
                </footer>
                </div>
        
        <script>
        jQuery(function($) {
            $(window).on('scroll', function() {
        		if ($(this).scrollTop() >= 200) {
        			$('.navbar').addClass('fixed-top');
        		} else if ($(this).scrollTop() == 0) {
        			$('.navbar').removeClass('fixed-top');
        		}
        	});
        	
        	function adjustNav() {
        		var winWidth = $(window).width(),
        			dropdown = $('.dropdown'),
        			dropdownMenu = $('.dropdown-menu');
        		
        		if (winWidth >= 768) {
        			dropdown.on('mouseenter', function() {
        				$(this).addClass('show')
        					.children(dropdownMenu).addClass('show');
        			});
        			
        			dropdown.on('mouseleave', function() {
        				$(this).removeClass('show')
        					.children(dropdownMenu).removeClass('show');
        			});
        		} else {
        			dropdown.off('mouseenter mouseleave');
        		}
        	}
        	
        	$(window).on('resize', adjustNav);
        	
        	adjustNav();
        });
        </script>
</body>

</html>