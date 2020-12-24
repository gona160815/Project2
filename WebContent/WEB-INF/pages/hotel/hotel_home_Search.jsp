<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<title>追風者｜訂房</title>


<link href="assets/css/google-font.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="css/hotel-style-liberty.css">
<link rel="stylesheet" href="css/hotel-head.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<style>
.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	white-space: normal;
}

#pagenumber${NowPage} {
	font-size:20px;
	border-style:outset;

}

</style>
</head>

<body>
	<!-- 下列敘述設定變數funcName的值為SHO，top.jsp 會用到此變數 scope為在session有效的期限內 -->
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<!-- 引入共同的頁首 -->
	
	
	
	<section id="hero">
		<div class="hero-container" data-aos="fade-up">
			<h1>搜尋飯店</h1>
			<h2>❤Ｆｅｅｌ ｙｏｕｒ ｈｏｍｅ❤</h2>
			<div class="s01">
				<form class="form-inline float-right mx-0"
					action="sixsix.BookingHouse.controller" method="POST">
					<div class="inner-form">

						<div class="input-field box">
							<select id="" name="place" onChange="change()">
								<option value="1">依地區查詢</option>
								<option value="2">依飯店名稱查詢</option>
								<option value="3">飯店是否含自行車位查詢</option>
							</select>
							<!-- <input id="search" type="text" placeholder="What are you looking for?" /> -->
						</div>
						<div class="input-field second-wrap">
							<input id="location" type="text" name="inputAdd" placeholder="查詢" />
							<input type="hidden" name="inputPage" value="1">
						</div>
						<div class="input-field third-wrap">
							<button class="btn-search" type="submit">查詢</button>
						</div>
					</div>
				</form>
			</div>
	</section>

	
	


	<!-- ======= 上方欄 ======= -->

	<main id="main">

			<!-- Gallery img Start-->
        <div class="gallery-area g-padding fix">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="gallery-active owl-carousel">
                            <div class="gallery-img">
                                <a href="#"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Gallery img End-->
				

					<!--================ 一個房間的資料開始 ======================-->
					
					
					<section class="room-area">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8">
                        <!--font-back-tittle  -->
                        <div class="font-back-tittle mb-45">
                            <div class="archivment-front">
                                <h3>Our Rooms</h3>
                            </div>
                            <h3 class="archivment-back">Our Rooms</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                               <a href="rooms.html"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="room-caption">
                                <h3><a href="rooms.html">Classic Double Bed</a></h3>
                                <div class="per-night">
                                    <span><u>$</u>150 <span>/ par night</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                               <a href="rooms.html"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="room-caption">
                                <h3><a href="rooms.html">Classic Double Bed</a></h3>
                                <div class="per-night">
                                    <span><u>$</u>150 <span>/ par night</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                               <a href="rooms.html"> <img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="room-caption">
                                <h3><a href="rooms.html">Classic Double Bed</a></h3>
                                <div class="per-night">
                                    <span><u>$</u>150 <span>/ par night</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                                <a href="rooms.html"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="room-caption">
                                <h3><a href="rooms.html">Classic Double Bed</a></h3>
                                <div class="per-night">
                                    <span><u>$</u>150 <span>/ par night</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                                <a href="rooms.html"><img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="room-caption">
                                <h3><a href="rooms.html">Classic Double Bed</a></h3>
                                <div class="per-night">
                                    <span><u>$</u>150 <span>/ par night</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <!-- Single Room -->
                        <div class="single-room mb-50">
                            <div class="room-img">
                               <a href="rooms.html"> <img src="img/hotel_image/hotelPage.gif" width="250px" height="200px" alt=""></a>
                            </div>
                            <div class="room-caption">
                                <h3><a href="rooms.html">Classic Double Bed</a></h3>
                                <div class="per-night">
                                    <span><u>$</u>150 <span>/ par night</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="#" class="btn view-btn1">View more  <i class="ti-angle-right"></i> </a>
                    </div>
                </div>
            </div>

        </section>
        <!-- Room End -->
					
					<!-- Gallery img Start-->
        <div class="gallery-area fix">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="gallery-active owl-carousel">
                            <div class="gallery-img">
                                <a href="#"><img src="img/hotel_image/hotelPage.gif" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="img/hotel_image/hotelPage.gif" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="img/hotel_image/hotelPage.gif" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Gallery img End-->
					
					
					
					
					
					
					
					
					
					
					
					
					
				<!--================ 一個房間的資料結束 ======================-->
				
				
				
				
			<!--================ 分頁開始 ======================-->
			<c:choose>
				<c:when test="${NowPage>0}">
				
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center mt-5 mb-0">
						
						
						<c:choose>
							<c:when test="${NowPage>1 }">
								<li class="page-item"><a class="page-link page-number" id="pagenumber88888888" onmouseover="mouseOver(88888888)" onmouseout="mouseOut(88888888)"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${NowPage-1}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">上一頁</a></li>
							</c:when>
						</c:choose>
						
						
						<!-- 第一頁開始 -->
						
							<li class="page-item"><a class="page-link page-number" id="pagenumber1" onmouseover="mouseOver(1)" onmouseout="mouseOut(1)"
						 href="sixsix.selectData1.controller?inputPage=<c:out value="1"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">1</a></li>
						
						 <!-- 第一頁結束 -->
						 
						<c:choose>
							<c:when test="${NowPage-2 > 2}">
								<li class="page-item"><a class="page-link page-number"
							href="#">● ● ●</a></li>
							</c:when>
						</c:choose>	
						
						<c:choose>
							<c:when test="${PAGENUM<6 }">
								<c:forEach var="page" begin="2" end="${PAGENUM-1 }">
									<li class="page-item"><a class="page-link page-number" id="pagenumber${page }" onmouseover="mouseOver(${page})" onmouseout="mouseOut(${page})"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${page}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">${page}</a></li>
								</c:forEach>
							</c:when>
						
						
							<c:when test="${NowPage-2 <=1 && PAGENUM>=6 }">
								<c:forEach var="page" begin="2" end="${NowPage+2 }">
									<li class="page-item"><a class="page-link page-number" id="pagenumber${page }" onmouseover="mouseOver(${page})" onmouseout="mouseOut(${page})"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${page}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">${page}</a></li>
								</c:forEach>
							</c:when>
							
							<c:when test="${PAGENUM>NowPage+2}">
								<c:forEach var="page" begin="${NowPage-2 }" end="${NowPage+2 }">
									<li class="page-item" ><a class="page-link page-number"  id="pagenumber${page }" onmouseover="mouseOver(${page})" onmouseout="mouseOut(${page})"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${page}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">${page}</a></li>
								</c:forEach>
							
							</c:when>
							
							<c:when test="${PAGENUM == (NowPage+2)  }">
								<c:forEach var="page" begin="${NowPage-2 }" end="${NowPage+1 }">
									<li class="page-item" ><a class="page-link page-number"  id="pagenumber${page }" onmouseover="mouseOver(${page})" onmouseout="mouseOut(${page})"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${page}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>" >${page}</a></li>
								</c:forEach>
							
							</c:when>
							
							<c:when test="${PAGENUM < (NowPage+2) && NowPage>=2}">
								<c:forEach var="page" begin="${NowPage-2 }" end="${PAGENUM-1 }">
									<li class="page-item"><a class="page-link page-number" id="pagenumber${page }" onmouseover="mouseOver(${page})" onmouseout="mouseOut(${page})"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${page}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">${page}</a></li>
								</c:forEach>
							
							</c:when>
							
						</c:choose>
						
						<c:choose>
							<c:when test="${NowPage+3 < PAGENUM }">
								<li class="page-item"><a class="page-link page-number"
							href="#">● ● ●</a></li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${PAGENUM!=1 && NowPage<=PAGENUM }">
							<li class="page-item"><a class="page-link page-number" id="pagenumber${PAGENUM }" onmouseover="mouseOver(${PAGENUM })" onmouseout="mouseOut(${PAGENUM })"
							 href="sixsix.selectData1.controller?inputPage=<c:out value="${PAGENUM }"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">${PAGENUM }</a></li>
						 	</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${PAGENUM > NowPage }">
								<li class="page-item"><a class="page-link page-number" id="pagenumber999999999" onmouseover="mouseOver(999999999)" onmouseout="mouseOut(999999999)"
							href="sixsix.selectData1.controller?inputPage=<c:out value="${NowPage+1}"/>&inputAdd=<c:out value="${PLACE}"/>&place=<c:out value="${PLANUM}"/>">下一頁</a></li>
							</c:when>
						</c:choose>
					
					</ul>
				</nav>
				
				 </c:when>
						</c:choose>	
				<!--================ 分頁結束 ======================-->
				
			

		
		
		<script type="text/javascript">
		
		
	
			
		<!--================ 分頁方法 ======================-->
		function mouseOver(num){
			var pointPageStyle = document.getElementById("pagenumber"+num);
			pointPageStyle.style.fontSize = "50px";
			pointPageStyle.style.fontWeight = "900";
			
		}
		
		function mouseOut(num){
			var pointPageStyle = document.getElementById("pagenumber"+num);
			pointPageStyle.style.fontSize = "24px";
			pointPageStyle.style.fontWeight = "400";
		}
		
		<!--================ 分頁方法 ======================-->
		
		
		</script>
		
		
		<!-- Template JavaScript -->
		<script src="js/hotel/jquery-3.3.1.min.js"></script>

		<!-- <script src="assets/js/owl.carousel.js"></script> -->
		<!-- script for banner slider-->
		<script>
			$(window).bind("load", function() {

				"use strict";

				$(".spn_hol").fadeOut(1000);
			});
		</script>

		<script>
			$(document).ready(function() {
				$('.owl-one').owlCarousel({
					loop : true,
					margin : 0,
					nav : false,
					responsiveClass : true,
					autoplay : false,
					autoplayTimeout : 5000,
					autoplaySpeed : 1000,
					autoplayHoverPause : false,
					responsive : {
						0 : {
							items : 1,
							nav : false
						},
						480 : {
							items : 1,
							nav : false
						},
						667 : {
							items : 1,
							nav : true
						},
						1000 : {
							items : 1,
							nav : true
						}
					}
				})
			})
		</script>
		<!-- //script -->

		<!-- script for owlcarousel -->
		<script>
			$(document).ready(function() {
				$('.owl-testimonial').owlCarousel({
					loop : true,
					margin : 0,
					nav : true,
					responsiveClass : true,
					autoplay : false,
					autoplayTimeout : 5000,
					autoplaySpeed : 1000,
					autoplayHoverPause : false,
					responsive : {
						0 : {
							items : 1,
							nav : false
						},
						480 : {
							items : 1,
							nav : false
						},
						667 : {
							items : 1,
							nav : true
						},
						1000 : {
							items : 1,
							nav : true
						}
					}
				})
			})
		</script>
		<!-- //script for owlcarousel -->
		<script src="js/hotel/jquery.magnific-popup.min.js"></script>
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type : 'inline',

					fixedContentPos : false,
					fixedBgPos : true,

					overflowY : 'auto',

					closeBtnInside : true,
					preloader : false,

					midClick : true,
					removalDelay : 300,
					mainClass : 'my-mfp-zoom-in'
				});

				$('.popup-with-move-anim').magnificPopup({
					type : 'inline',

					fixedContentPos : false,
					fixedBgPos : true,

					overflowY : 'auto',

					closeBtnInside : true,
					preloader : false,

					midClick : true,
					removalDelay : 300,
					mainClass : 'my-mfp-slide-bottom'
				});
			});
		</script>


		<!-- disable body scroll which navbar is in active -->
		<script>
			$(function() {
				$('.navbar-toggler').click(function() {
					$('body').toggleClass('noscroll');
				})
			});
		</script>
		<!-- disable body scroll which navbar is in active -->

<!-- 		<script src="js/core/bootstrap.min.js"></script> -->
<!-- 		<script src="js/core/jquery.min.js"></script> -->
<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>

</html>