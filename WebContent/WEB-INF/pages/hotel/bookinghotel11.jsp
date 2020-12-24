<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp"%>
<meta-data android:name="com.google.android.geo.API_KEY"
	android:value="AIzaSyBHylr5Zb_QiRzs0k7LVoQY7OHpd0gokY8" />

<title>追風者｜Hotels</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css"
	rel="stylesheet">
</link>
<link rel="stylesheet" href="css/modal.css">


<!-- 	<link href="css/google-font.css" rel="stylesheet"> -->
<!-- 	<!-- Template CSS -->
<!-- 	<link rel="stylesheet" href="css/hotel-style-liberty.css"> -->
<!-- 	<link rel="stylesheet" href="css/hotel-head.css"> -->

<!-- 	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
<!-- 	<link href="assets/css/google-font.css" rel="stylesheet"> -->
<!-- 	<!-- Template CSS  -->
<!-- 	<link rel="stylesheet" href="css/hotel-style-liberty.css"> -->
<!-- 	<link rel="stylesheet" href="css/hotel-head.css"> -->
<!-- 	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->


<style>
.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	white-space: normal;
}

#iconTitle{
	
	padding-left:100px;
	position:static;
	z-index: 199999;
}

.container {
	max-width: 1200px;
	margin-top: 0px;
}

div img.dddiv {
	opacity: 0.5;
}

div img.dddiv:hover {
	opacity: 1;
	'
}

div img.dddiv {
	border-radius: 5px;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.dddiv1 {
	margin: 0px;
	padding: 0px;
	border-radius: 10px;
	width: 100%;
	height: 100%;
	/* 	object-fit: cover; */
}

div {
	object-fit: cover;
}

#dateForm {
	width: 100%;
	height: 100%;
	border: auto;
	border-radius: 10px;
}

#dateForm1 {
	width: 100%;
	height: 100%;
}

button {
	cursor: pointer;
	border: 1px white none;
	background-color: white;
}

.left, .right {
	padding: 10px;
	display: table-cell;
}

div {
	color: #465280
}
</style>
<style>
#sale {
	color: yellow;
	padding: 5px;
	animation: changeshadow 1s ease-in infinite;
	/* 其它浏览器兼容性前缀 */
	-webkit-animation: changeshadow 1s linear infinite;
	-moz-animation: changeshadow 1s linear infinite;
	-ms-animation: changeshadow 1s linear infinite;
	-o-animation: changeshadow 1s linear infinite;
}

@
keyframes changeshadow { 0%{
	text-shadow: 0 0 4px #ff73c7
}

50










%
{
text-shadow










:










0










0










60px










#ff73c7










}
100










%
{
text-shadow










:










0










0










4px










#ff73c7










}
}
/* 添加兼容性前缀 */
@
-webkit-keyframes changeshadow { 0%{
	text-shadow: 0 0 4px #ff73c7
}

50










%
{
text-shadow










:










0










0










60px










#ff73c7










}
100










%
{
text-shadow










:










0










0










4px










#ff73c7










}
}
@
-moz-keyframes changeshadow { 0%{
	text-shadow: 0 0 4px #ff73c7
}

50










%
{
text-shadow










:










0










0










60px










#ff73c7










}
100










%
{
text-shadow










:










0










0










4px










#ff73c7










}
}
@
-ms-keyframes changeshadow { 0%{
	text-shadow: 0 0 4px #4cc134
}

50










%
{
text-shadow










:










0










0










60px










#ff73c7










}
100










%
{
text-shadow










:










0










0










4px










#ff73c7










}
}
@
-o-keyframes changeshadow { 0%{
	text-shadow: 0 0 4px #4cc134
}
50










%
{
text-shadow










:










0










0










40px










#4cc134










}
100










%
{
text-shadow










:










0










0










4px










#4cc134










}
}
</style>

<style>
.box1 {
	border-radius: 10px;
	font-size: 30px;
	font-weight: 700;
	color: #465280;
	margin: 5px;
	/*     	animation: changeshadow 1s  ease-in  infinite ; */
	/*     	/* 其它浏览器兼容性前缀 */
	*/
	/* 	    -webkit-animation: changeshadow 1s linear infinite; */
	/* 	    -moz-animation: changeshadow 1s linear infinite; */
	/* 	    -ms-animation: changeshadow 1s linear infinite; */
	/* 	    -o-animation: changeshadow 1s linear infinite; */
}
/*     @keyframes changeshadow {   */
/*         0%{ text-shadow: 0 0 4px #C2FF68}   */
/*         50%{ text-shadow: 0 0 40px #FF0000}   */
/*         100%{ text-shadow: 0 0 4px #C2FF68}   */
/*     } */
/*     /* 添加兼容性前缀 */
*
/
/* 	@-webkit-keyframes changeshadow { */
/* 	  0%{ text-shadow: 0 0 4px #272727}   */
/*           50%{ text-shadow: 0 0 40px #272727}   */
/*           100%{ text-shadow: 0 0 4px #272727}   */
/* 	} */
/* 	@-moz-keyframes changeshadow { */
/* 	    0%{ text-shadow: 0 0 4px #4cc134}   */
/*             50%{ text-shadow: 0 0 40px #4cc134}   */
/*             100%{ text-shadow: 0 0 4px #4cc134}   */
/* 	} */
/* 	@-ms-keyframes changeshadow { */
/* 	    0%{ text-shadow: 0 0 4px #4cc134}   */
/*             50%{ text-shadow: 0 0 40px #4cc134}   */
/*             100%{ text-shadow: 0 0 4px #4cc134}   */
/* 	} */
/* 	@-o-keyframes changeshadow { */
/* 	    0%{ text-shadow: 0 0 4px #4cc134}   */
/*             50%{ text-shadow: 0 0 40px #4cc134}   */
/*             100%{ text-shadow: 0 0 4px #4cc134}   */
/* 	} */
</style>
<style>
#price1, #price2, #price3 {
	font-size: 0.975rem;
	font-style: inherit;
	font-weight: inherit;
	background-color: white;
	background-color: transparent;
	color: #005aeb;
	text-decoration: none;
	position: absolute;
	z-index: 4;
}

#priceDetail1, #priceDetail2, #priceDetail3 {
	/* 		 border:10px solid red; */
	width: 280px;
	position: absolute;
	top: 500px;
	left: 60px;
	background-color: white;
	box-shadow: 1px 1px 5px 5px #cccccc;
	color: #001959;
	border-radius: 10px;
	padding: 5px;
	text-decoration: inherit;
	vertical-align: inherit;
}
</style>


<style>
.ratings {
	position: relative;
	vertical-align: middle;
	display: inline-block;
	color: #F0F0F0; /*背景星星顏色*/
	overflow: hidden;
	font-size: 25px; /*調整字體大小可放大縮小星星*/
	text-shadow: 0px 1px 0 #999;
}

.full_star {
	width: ${controlStarWidth}%; /*調整寬度可變更星等*/
	position:absolute;
	left:0;
	top:0;
	white-space:nowrap;
	overflow:hidden;
	color:#FFFF37; /*前景星星顏色*/
}
.ratings1 {
	position: relative;
	vertical-align: middle;
	display: inline-block;
	color: #F0F0F0; /*背景星星顏色*/
	overflow: hidden;
	font-size: 25px; /*調整字體大小可放大縮小星星*/
	text-shadow: 0px 1px 0 #999;
}

.full_star1 {
	width: 60%; /*調整寬度可變更星等*/
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: blue; /*前景星星顏色*/
}

.modal-dialog {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.modal-content { /*overflow-y: scroll*/;
	position: absolute;
	top: 0;
	bottom: 0;
	width: 100%;
}

.modal-body {
	overflow-y: scroll;
	position: absolute;
	top: 55px;
	bottom: 65px;
	width: 100%;
}

.modal-header .close {
	margin-right: 15px;
}

 .modal-footer {
 	position: absolute; 
 	right: 30px; 
/*  	width: 40%;  */
 	bottom: 60px; 
 	border-top:none;
 	padding:0;
 } 

#assess{
	position: static;
	right: 30px;
	width: 20%;
	bottom: -10px;
	z-index:10001;
}

.modal{
	position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 10000;

}
</style>



</head>

<body>
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp"%>

	<!-- 下列敘述設定變數funcName的值為SHO，top.jsp 會用到此變數 scope為在session有效的期限內 -->


	<!-- 引入共同的頁首 -->
	<div class="modal" id="sideModalTR" tabindex="-1" role="dialog"
		aria-labelledby="hotelModalLabel" aria-hidden="true">
		<div
			class=" modal-dialog modal-dialog-scrollable modal-side modal-top-right modal-info"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title w-100" id="hotelModalLabel">加入我的行程表</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div style="height: 500px;" class="modal-body">
					<div>
						<ul class="list-group list-group-flush">
							<li class="newAct list-group-item "><i
								class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>
						</ul>
					</div>
				</div>
				<div style="height: 200px;" class="modal-footer">
					<button id="reset" type="button"
						class="float-left btn btn-warning btn-md">重新選擇</button>
					<button id="cancel" type="button" class="btn btn-secondary btn-md"
						data-dismiss="modal">取消</button>
					<button id="addNewAct" type="button" class="btn btn-info btn-md">加入</button>
				</div>
			</div>
		</div>
	</div>
	<div class="content" style="padding: 0;">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">



		</div>
		<!-- TABLE名稱   -->

		<div class="row">
			<div class="needs-validation w-75 m-auto">
				<%-- 			<form:form class="needs-validation w-75 m-auto" --%>
				<%-- 				action="sixsix.togetHouseDetail.controller" method="POST"  --%>
				<%-- 				modelAttribute="chg"> --%>

				<h1 id="hotelName" class="col-sm" style="font-weight: bold;">${chg.name }</h1>


				<!-- 上方圖片開始 -->

				<div class="container-fluid">
					<div style="height: 100%">
						<div class="row">

							<%-- 							<c:forEach var="x" begin="${starRand }+10" end="${starRand }+14" step="1"> --%>

							<div class="col-6 rounded float-left"
								style="padding: 10px 5px 10px 10px;">

								<button type="button" class="" data-toggle="modal"
									data-target="#myModal${starRand+10 }"
									style="width: 100%; height: 100%;"">
									<img src="img/hotel_image/hotel/${starRand+10 }.jpg"
										class=" dddiv1" alt="...">
								</button>

							</div>

							<div class="col-6 rounded float-left"
								style="padding: 10px 10px 10px 5px;">
								<div class="row">
									<div class="col-6 img-fluid" alt="Responsive image"
										style="padding: 1px;">
										<button type="button" class="" data-toggle="modal"
											data-target="#myModal${starRand+11 }"
											style="width: 100%; height: 100%;"">
											<img src="img/hotel_image/hotel/${starRand+11 }.jpg"
												class=" dddiv1" alt="...">
										</button>

									</div>
									<div class="col-6 img-fluid" alt="Responsive image"
										style="padding: 1px;">
										<button type="button" class="" data-toggle="modal"
											data-target="#myModal${starRand+12 }"
											style="width: 100%; height: 100%;"">
											<img src="img/hotel_image/hotel/${starRand+12 }.jpg"
												class="dddiv1" alt="...">
										</button>
									</div>
								</div>
								<div class="row">

									<div class="col-6 img-fluid" alt="Responsive image"
										style="padding: 1px;">
										<button type="button" class="" data-toggle="modal"
											data-target="#myModal${starRand+13 }"
											style="width: 100%; height: 100%;"">
											<img src="img/hotel_image/hotel/${starRand+13 }.jpg"
												class=" dddiv1" alt="...">
										</button>
									</div>
									<div class="col-6 img-fluid" alt="Responsive image"
										style="padding: 1px;">

										<button type="button" class="" data-toggle="modal"
											data-target="#myModal${starRand+14 }"
											style="width: 100%; height: 100%;"">
											<img src="img/hotel_image/hotel/${starRand+14 }.jpg"
												class=" dddiv1" alt="...">
										</button>

										<!-- 	---------------------------------- -->

<%-- 																		</c:forEach> --%>

										<div class="container">

											<!-- Button to Open the Modal -->

											<button type="button" class="btn btn-light"
												data-toggle="modal" data-target="#myModal"
												style="position: absolute; left: 50%; bottom: 10px; z-index: 1; opacity: 0.4;"
												width="70%" height="70%">
												<i class="fa fa-picture-o" aria-hidden="true"
													style="opacity: 1; font-size: 2rem;"> ${pictureNum }+</i>
											</button>

											<!-- The Modal -->
											<div class="modal fade" id="myModal">
												<div class="modal-dialog modal-dialog-scrollable modal-lg">
													<div class="modal-content">

														<!-- Modal Header -->
														<div class="modal-header">
															<h4 class="modal-title">ＰＨＯＴＯ</h4>
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>

														<!-- Modal body -->
														<div class="modal-body">
															<ul width="200px">
																<c:forEach var="zzz" begin="${starRand }"
																	end="${overRand }" step="1">
																	<li
																		style="float: left; display: inline; margin-right: 20px; margin-bottom: 10px;"><button
																			type="button" class="" data-toggle="modal"
																			data-target="#myModal${zzz }">
																			<img width="100px" height="100px"
																				src="img/hotel_image/hotel/${zzz }.jpg" alt="...">
																			</botton></li>

																</c:forEach>
															</ul>
														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">Close</button>
														</div>

													</div>
												</div>
											</div>

										</div>
										<!-- 					----------------------------			 -->
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- 上方圖片結束 -->

				<!-- The Modal -->

				<!-- ---------------------------------- -->

				<hr>

				<!-- 日期搜尋 -->


				<form action="getgettime" method="POST">
					<div class="row">
						<div class="col-6">


							<input class="default center" id="dateForm" name="datechoose"
								style="text-align: center; font-weight: bold; font-size: 20px;"
								type="text" value="${daterange }" />

						</div>

						<div class="col-6">

							<!--載入連結-->
							<c:choose>
								<c:when test="${loginOK==null ||empty loginOK}">
									<a href="loginPage" class="btn btn-danger" id="dateForm1">請先登入會員</a>
								</c:when>
								<c:when test="${loginOK!=null && !empty loginOK }">
									<input class="btn btn-primary btn-lg" id="dateForm1"
										type="submit" value="空房搜尋" />
									<input type="hidden" name="houseid" value="${chg.id }" />
								</c:when>
							</c:choose>
							<!--執行 Date Range Picker-->
						</div>
					</div>
				</form>


				<!-- 日期搜尋 -->

				<hr>


				<!-- 房間細項內容開始 -->


				<div class="row">
					<input id="memberId" type="hidden" value="${loginOK.memberId}">
					<input id="homestayId" type="hidden" value="${homestayId}">
					<input id="favcounter" type="hidden" value="0">
					<div class="col-6">
						<h3 class="box1">
							您查詢的日期為： <span style="font-size:16px;">${daterange }</span>
							<button id="favorite"
								class="hotel-favorite btn btn-sm float-right">
								<i class="far fa-heart"></i>
							</button>


						</h3>
						<hr>

						<h3 style="font-weight: bold">我們有的服務！</h3>
						<div class="row">
							<div class="col-4" style="margin: 16px 0;">
								<i class="fa fa-wifi fa-6" aria-hidden="true"><span
									style="font-size: 24px;"> WiFi</span></i>
							</div>
							<div class="col-4" style="margin: 16px 0;">
								<i class="fa fa-bath fa-6" aria-hidden="true"><span
									style="font-size: 24px;"> 浴室</span></i>
							</div>
							<div class="col-4" style="margin: 16px 0;">
								<i class="fa fa-snowflake" aria-hidden="true"><span
									style="font-size: 24px;"> 空調</span></i>
							</div>

							<div class="w-100"></div>

							<div class="col-4" style="margin: 16px 0;">
								<i class="fa fa-bicycle" aria-hidden="true"><span
									style="font-size: 24px;"> 腳踏車租借</span></i>
							</div>
							<div class="col-4" style="margin: 16px 0;">
								<i class="fa fa-bus" aria-hidden="true"><span
									style="font-size: 24px;"> 查詢公車班次</span></i>
							</div>
							<div class="col-4" style="margin: 16px 0;">
								<i class="fa fa-plane" aria-hidden="true"><span
									style="font-size: 24px;"> 航班代訂</span></i>
							</div>
						</div>
						<hr>

						<h1>民宿簡介：</h1>
						<p>${chg.description}</p>

					</div>

					<div class="col-6">

						<div class="ratings">
							<div class="empty_star">
								<i class="fa fa-send"></i> <i class="fa fa-send"></i> <i
									class="fa fa-send"></i> <i class="fa fa-send"></i> <i
									class="fa fa-send"></i>
							</div>
							<div class="full_star">
								<i class="fa fa-send"></i> <i class="fa fa-send"></i> <i
									class="fa fa-send"></i> <i class="fa fa-send"></i> <i
									class="fa fa-send"></i>
							</div>


						</div>
						<div style="font-size: 24px; font-weight: bold;">
						${countStarNum }/5
							<c:choose>
							<c:when test="${countStarNum>4&&countStarNum<=5 }">
								<span> 太棒了</span>
							</c:when>
							<c:when test="${countStarNum>3&&countStarNum<=4 }">
								<span> 不錯喔</span>
							</c:when>
							<c:when test="${countStarNum>2&&countStarNum<=3 }">
								<span> 尚可</span>
							</c:when>
							<c:when test="${countStarNum>1 && countStarNum<=2 }">
								<span> 有待加強</span>
							</c:when>
							<c:when test="${countStarNum<=1 && countStarNum!=0}">
								<span> 太糟了！</span>
							</c:when>
							</c:choose>
							<button
								style="float: right; color: #005aeb; text-decoration: none; font-size: 0.875rem;"
								type="button" data-toggle="modal" data-target="#myMoment"
								id="MMoment"
								class="uitk-link uitk-flex-item uitk-link-layout-inline uitk-type-300">
								<fmt:formatNumber type="number" value="${hotelMomentNum }"
									maxFractionDigits="2" />
								則評論 <i class="fa fa-angle-double-right"></i>
							</button>
						</div>
						<br>
						<div style="color: #465280; font-size: 0.75rem;">
							<span>旅客給了住宿 ${countStarNum }/5 的評價。</span>

						</div>
						<br> <br>
						<hr>
						<br>

						<div style="font-size: 20px; font-weight: bold;">
							<i class="fa fa-map-marker" aria-hidden="true"
								style="font-size: 25px; color: #4F4F4F"></i> 地圖資訊
						</div>
						<br>
						<div>
							<iframe width="500" height="200" frameborder="0" scrolling="no"
								marginheight="0" marginwidth="0"
								src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${chg.py},${chg.px}(飯店位置)&z=16&output=embed&t="></iframe>
						</div>


					</div>



				</div>













				<hr>

				<!-- 房間細項內容結束 -->


				<!-- 					下定房間開始位置 -->
				<input type="hidden" id="price">
				<div class="card-deck">
					<div class="card">
						<div>
							<img src="img/hotel_image/twohouse.jpg"
								class="card-img-top dddiv" alt="...">
						</div>
						<hr>

						<div class="card-body">
							<div>
								<span class="card-title"
									style="color: #001959; font-size: 2.5rem; font-weight: 700;">${s5.h_type }</span>
								<button id="addAct" type="button"
									class="addAct btn btn-sm btn-info float-right"
									data-toggle="modal" data-target="#sideModalTR">加入行程表</button>
								<input type="hidden" value="1000" class="roomPrice">
								<c:choose>
									<c:when test="${(daySize-1)>=5}">
										<i class="fa fa-tags fa-6"
											style="border: 5px solid yellow; border-radius: 10px; background-color: yellow; position: absolute; right: 20px; bottom: 190px;"
											aria-hidden="true"> <span
											style="color: #465280; font-size: 1.1rem;" id="sale">8折優惠
										</span>
										</i>
									</c:when>
									<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
										<i class="fa fa-tags fa-6"
											style="border: 5px solid yellow; border-radius: 10px; background-color: yellow; position: absolute; right: 20px; bottom: 190px;"
											aria-hidden="true"> <span
											style="color: #465280; font-size: 1.1rem;" id="sale">9折優惠
										</span>
										</i>
									</c:when>
								</c:choose>

							</div>

							<br>
							<div style="text-align: left;">
								<div class="container-fluid">
									<div class="row justify-content-around"
										style="color: #465280; font-size: 0.85rem;">
										<div class="col">
											<i class="fa fa-retweet fa-6" aria-hidden="true"><span
												style="font-size: 16px;"> 41 平方公尺</span></i>
										</div>

										<div class="col">
											<i class="fa fa-university fa-6" aria-hidden="true"><span
												style="font-size: 16px;"> 城市景</span></i>
										</div>
										<div class="w-100" style="margin: 5px;"></div>
										<div class="col">
											<i class="fa fa-users fa-6" aria-hidden="true"><span
												style="font-size: 16px;">最多可入住 2 人</span></i>
										</div>
										<div class="col">
											<i class="fa fa-bed fa-6" aria-hidden="true"><span
												style="font-size: 16px;">1 張加大雙人</span></i>
										</div>
										<div class="w-100" style="margin: 5px;"></div>
										<div class="col">
											<i class="fa fa-coffee fa-6" aria-hidden="true"><span
												style="font-size: 16px;"> 含吃到飽</span></i>
										</div>
										<div class="col">
											<i class="fa fa-car fa-6" aria-hidden="true"><span
												style="font-size: 16px;"> 含停車</span></i>
										</div>
									</div>
								</div>

							</div>







							<div style="padding: 10px;'">
								<button id="price1">
									價格詳情<i class="fa fa-arrow-circle-down fa-6" aria-hidden="true"></i>
								</button>
								<div id="priceDetail1">

									<c:choose>
										<c:when test="${(daySize-1)>=5}">
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s5.price*0.8 }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s5.price*(daySize-1)*0.1*0.8 }"
														maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s5.price*(daySize-1)*0.8*1.1 }"
														maxFractionDigits="2" />
												</div>


											</div>

										</c:when>
										<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s5.price*0.9 }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s5.price*(daySize-1)*0.1*0.9 }"
														maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s5.price*(daySize-1)*0.9*1.1 }"
														maxFractionDigits="2" />
												</div>


											</div>

										</c:when>

										<c:otherwise>
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s5.price }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s5.price*(daySize-1)*0.1 }" maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s5.price*(daySize-1)*1.1 }" maxFractionDigits="2" />
												</div>


											</div>

										</c:otherwise>
									</c:choose>


								</div>
							</div>
							<br> <br>
							<div style="text-align: right;">
								<c:choose>
									<c:when test="${(daySize-1)>=5}">
										<i class="fa fa-exclamation-circle fa-6" aria-hidden="true"><span
											style="font-size: inherit; line-height: inherit; color: #465280; text-decoration: line-through;">
												NT$：<fmt:formatNumber type="number" value="${s5.price }"
													maxFractionDigits="2" />
										</span></i>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s5.price*0.8 }"
												maxFractionDigits="2" />
										</div>
									</c:when>
									<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
										<i class="fa fa-exclamation-circle fa-6" aria-hidden="true"><span
											style="font-size: inherit; line-height: inherit; color: #465280; text-decoration: line-through;">
												NT$：<fmt:formatNumber type="number" value="${s5.price }"
													maxFractionDigits="2" />
										</span></i>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s5.price*0.9 }"
												maxFractionDigits="2" />
										</div>
									</c:when>
									<c:otherwise>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s5.price }"
												maxFractionDigits="2" />
										</div>
									</c:otherwise>
								</c:choose>
								<span class="card-text"
									style="color: #d40035; font-size: 0.625rem;">剩餘房間數：${order_Small_Hotelnum }</span>

								<br>
								<c:choose>

									<c:when test="${loginOK==null ||empty loginOK}">
										<a href="loginPage" class="btn btn-danger">請先登入會員</a>
									</c:when>
									<c:when test="${loginOK!=null && !empty loginOK }">
										<c:choose>
											<c:when
												test="${order_Small_Hotelnum>0 }">
												<a id="goSearch"
													href="sixsix.BookingHotelCheckOK?houseid=<c:out value="${chg.id }" />&daySize=
									<c:out value="${daySize }" />&memberTotalDays=
									<c:out value="${memberTotalDays }" />&houseType=5&hotelMoney=
									<c:out value="${s5.price }" />&dateChoose=<c:out value="${daterange }" />"
													class="btn btn-primary">確認下訂</a>

											</c:when>
											<c:when test="${empty order_Small_Hotelnum}">
												<a href="#" class="btn btn-success">請輸入日期查詢剩餘房間</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn btn-danger">已額滿</a>
											</c:otherwise>
										</c:choose>
									</c:when>

								</c:choose>


								<p class="card-text">

									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
					<div class="card">
						<div>
							<img src="img/hotel_image/threehouse.jpg"
								class="card-img-top dddiv" alt="...">
						</div>
						<hr>
						<div class="card-body">
							<div>
								<span class="card-title"
									style="color: #001959; font-size: 2.5rem; font-weight: 700;">${s6.h_type }</span>
								<button id="addAct" type="button"
									class="addAct btn btn-sm btn-info float-right"
									data-toggle="modal" data-target="#sideModalTR">加入行程表</button>
								<input type="hidden" value="2000" class="roomPrice">
								<c:choose>
									<c:when test="${(daySize-1)>=5}">
										<i class="fa fa-tags fa-6"
											style="border: 5px solid yellow; border-radius: 10px; background-color: yellow; position: absolute; right: 20px; bottom: 190px;"
											aria-hidden="true"> <span
											style="color: #465280; font-size: 1.1rem;" id="sale">8折優惠
										</span>
										</i>
									</c:when>
									<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
										<i class="fa fa-tags fa-6"
											style="border: 5px solid yellow; border-radius: 10px; background-color: yellow; position: absolute; right: 20px; bottom: 190px;"
											aria-hidden="true"> <span
											style="color: #465280; font-size: 1.1rem;" id="sale">9折優惠
										</span>
										</i>
									</c:when>
								</c:choose>
							</div>
							<br>
							<div class="container-fluid">
								<div class="row justify-content-around"
									style="color: #465280; font-size: 0.75rem;">
									<div class="col-6">
										<i class="fa fa-retweet fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 49 平方公尺</span></i>
									</div>
									<div class="col-6">
										<i class="fa fa-university fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 街道景</span></i>
									</div>
									<div class="w-100" style="margin: 5px;"></div>
									<div class="col-6">
										<i class="fa fa-users fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 最多可入住 4 人</span></i>
									</div>
									<div class="col-6">
										<i class="fa fa-bed fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 2 雙、1單</span></i>
									</div>
									<div class="w-100" style="margin: 5px;"></div>
									<div class="col-6">
										<i class="fa fa-coffee fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 含吃到飽</span></i>
									</div>
									<div class="col-6">
										<i class="fa fa-car fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 含停車</span></i>
									</div>
								</div>
							</div>

							<!-- 							--------------------------------- -->


							<div style="padding: 10px;'">
								<button id="price2">
									價格詳情<i class="fa fa-arrow-circle-down fa-6" aria-hidden="true"></i>
								</button>
								<div id="priceDetail2">
									<c:choose>
										<c:when test="${(daySize-1)>=5}">
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s6.price*0.8 }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s6.price*(daySize-1)*0.1*0.8 }"
														maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s6.price*(daySize-1)*0.8*1.1 }"
														maxFractionDigits="2" />
												</div>


											</div>
										</c:when>
										<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s6.price*0.9 }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s6.price*(daySize-1)*0.1*0.9 }"
														maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s6.price*(daySize-1)*0.9*1.1 }"
														maxFractionDigits="2" />
												</div>


											</div>
										</c:when>

										<c:otherwise>
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s6.price }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s6.price*(daySize-1)*0.1 }" maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s6.price*(daySize-1)*1.1 }" maxFractionDigits="2" />
												</div>


											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<br> <br>

							<!-- 							--------------------------------- -->


							<div style="text-align: right;">
								<c:choose>
									<c:when test="${(daySize-1)>=5}">
										<i class="fa fa-exclamation-circle fa-6" aria-hidden="true"><span
											style="font-size: inherit; line-height: inherit; color: #465280; text-decoration: line-through;">
												NT$：<fmt:formatNumber type="number" value="${s6.price }"
													maxFractionDigits="2" />
										</span></i>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s6.price*0.8 }"
												maxFractionDigits="2" />
										</div>
									</c:when>
									<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
										<i class="fa fa-exclamation-circle fa-6" aria-hidden="true"><span
											style="font-size: inherit; line-height: inherit; color: #465280; text-decoration: line-through;">
												NT$：<fmt:formatNumber type="number" value="${s6.price }"
													maxFractionDigits="2" />
										</span></i>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s6.price*0.9 }"
												maxFractionDigits="2" />
										</div>
									</c:when>
									<c:otherwise>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s6.price }"
												maxFractionDigits="2" />
										</div>
									</c:otherwise>
								</c:choose>
								<span class="card-text"
									style="color: #d40035; font-size: 0.625rem;">剩餘房間數：${order_Medium_Hotelnum }</span>
								<br>
								<c:choose>
									<c:when test="${loginOK==null ||empty loginOK}">
										<a href="loginPage" class="btn btn-danger">請先登入會員</a>
									</c:when>
									<c:when test="${loginOK!=null && !empty loginOK }">
										<c:choose>
											<c:when
												test="${order_Medium_Hotelnum>0 }">
												<a id="goSearch"
													href="sixsix.BookingHotelCheckOK?houseid=<c:out value="${chg.id }" />&daySize=
									<c:out value="${daySize }" />&memberTotalDays=
									<c:out value="${memberTotalDays }" />&houseType=6&hotelMoney=
									<c:out value="${s6.price }" />&dateChoose=<c:out value="${daterange }" />"
													class="btn btn-primary">確認下訂</a>
											</c:when>
											<c:when test="${empty order_Medium_Hotelnum}">
												<a href="#" class="btn btn-success">請輸入日期查詢剩餘房間</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn btn-danger">已額滿</a>
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
								<p class="card-text">
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
					<div class="card">
						<div>
							<img src="img/hotel_image/familyhouse.jpg"
								class="card-img-top dddiv" alt="...">
						</div>
						<hr>

						<div class="card-body">
							<div>
								<span class="card-title"
									style="color: #001959; font-size: 2.5rem; font-weight: 700;">${s7.h_type }</span>
								<button id="addAct" type="button"
									class="addAct btn btn-sm btn-info float-right"
									data-toggle="modal" data-target="#sideModalTR">加入行程表</button>
								<input type="hidden" value="3000" class="roomPrice">
								<c:choose>
									<c:when test="${(daySize-1)>=5}">
										<i class="fa fa-tags fa-6"
											style="border: 5px solid yellow; border-radius: 10px; background-color: yellow; position: absolute; right: 20px; bottom: 190px;"
											aria-hidden="true"> <span
											style="color: #465280; font-size: 1.1rem;" id="sale">8折優惠
										</span>
										</i>
									</c:when>
									<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
										<i class="fa fa-tags fa-6"
											style="border: 5px solid yellow; border-radius: 10px; background-color: yellow; position: absolute; right: 20px; bottom: 190px;"
											aria-hidden="true"> <span
											style="color: #465280; font-size: 1.1rem;" id="sale">9折優惠
										</span>
										</i>
									</c:when>
								</c:choose>
							</div>
							<br>
							<div class="container-fluid">
								<div class="row justify-content-around"
									style="color: #465280; font-size: 0.75rem;">
									<div class="col-6">
										<i class="fa fa-retweet fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 56平方公尺</span></i>
									</div>
									<div class="col-6">
										<i class="fa fa-university fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 海景</span></i>
									</div>
									<div class="w-100" style="margin: 5px;"></div>
									<div class="col-6">
										<i class="fa fa-users fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 最多可入住 5人</span></i>
									</div>
									<div class="col-6">
										<i class="fa fa-bed fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 2張加大雙人床</span></i>
									</div>
									<div class="w-100" style="margin: 5px;"></div>
									<div class="col-6">
										<i class="fa fa-coffee fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 含吃到飽</span></i>
									</div>
									<div class="col-6">
										<i class="fa fa-car fa-6" aria-hidden="true"><span
											style="font-size: 16px;"> 含停車</span></i>
									</div>
								</div>
							</div>

							<!-- 							--------------------------------- -->


							<div style="padding: 10px;'">
								<button id="price3">
									價格詳情<i class="fa fa-arrow-circle-down fa-6" aria-hidden="true"></i>
								</button>
								<div id="priceDetail3">
									<c:choose>
										<c:when test="${(daySize-1)>=5}">
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">共${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s7.price*0.8 }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s7.price*(daySize-1)*0.1*0.8 }"
														maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s7.price*(daySize-1)*0.8*1.1 }"
														maxFractionDigits="2" />
												</div>


											</div>
										</c:when>
										<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">共${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s7.price*0.9 }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number"
														value="${s7.price*(daySize-1)*0.1*0.9 }"
														maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$$
													<fmt:formatNumber type="number"
														value="${s7.price*(daySize-1)*0.9*1.1 }"
														maxFractionDigits="2" />
												</div>


											</div>
										</c:when>

										<c:otherwise>
											<p style="font-size: 1.375rem; font-weight: 700;">價格詳情：</p>
											<div class="row justify-content-between"
												style="font-size: 1.0rem;">
												<div class="col-6">共${daySize-1 }晚</div>
												<div class="col-6">
													NT$
													<fmt:formatNumber type="number" value="${s7.price }"
														maxFractionDigits="2" />
													*${daySize-1 }
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6">稅金：</div>
												<div class="col-6">
													NT
													<fmt:formatNumber type="number"
														value="${s7.price*(daySize-1)*0.1 }" maxFractionDigits="2" />
												</div>
												<div class="w-100" style="margin: 5px;"></div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">總價：</div>
												<div class="col-6"
													style="font-size: 1.2rem; font-weight: 700;">
													NT$
													<fmt:formatNumber type="number"
														value="${s7.price*(daySize-1)*1.1 }" maxFractionDigits="2" />
												</div>


											</div>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<br> <br>



							<!-- 							--------------------------------- -->
							<div style="text-align: right;">
								<c:choose>
									<c:when test="${(daySize-1)>=5}">
										<i class="fa fa-exclamation-circle fa-6" aria-hidden="true"><span
											style="font-size: inherit; line-height: inherit; color: #465280; text-decoration: line-through;">
												NT$：<fmt:formatNumber type="number" value="${s7.price }"
													maxFractionDigits="2" />
										</span></i>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s7.price*0.8 }"
												maxFractionDigits="2" />
										</div>
									</c:when>
									<c:when test="${(daySize-1)>=3 && (daySize-1)<5}">
										<i class="fa fa-exclamation-circle fa-6" aria-hidden="true"><span
											style="font-size: inherit; line-height: inherit; color: #465280; text-decoration: line-through;">
												NT$：<fmt:formatNumber type="number" value="${s7.price }"
													maxFractionDigits="2" />
										</span></i>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s7.price*0.9 }"
												maxFractionDigits="2" />
										</div>
									</c:when>
									<c:otherwise>
										<div
											style="font-size: 1.375rem; font-weight: 700; color: #001959;">
											每晚 NT$：
											<fmt:formatNumber type="number" value="${s7.price }"
												maxFractionDigits="2" />
										</div>
									</c:otherwise>
								</c:choose>
								<span class="card-text"
									style="color: #d40035; font-size: 0.625rem;">剩餘房間數：${order_Big_Hotelnum }</span>
								<br>
								<c:choose>
									<c:when test="${loginOK==null ||empty loginOK}">
										<a href="loginPage" class="btn btn-danger">請先登入會員</a>
									</c:when>
									<c:when test="${loginOK!=null && !empty loginOK }">
										<c:choose>
											<c:when
												test="${order_Big_Hotelnum>0 }">

												<a id="goSearch"
													href="sixsix.BookingHotelCheckOK?houseid=<c:out value="${chg.id
											}" />&daySize=
										<c:out value="${daySize }" />&memberTotalDays=
										<c:out value="${memberTotalDays }" />&houseType=7&hotelMoney=
										<c:out value="${s7.price }" />&dateChoose=<c:out value="${daterange }" />"
													class="btn btn-primary">確認下訂</a>

											</c:when>
											<c:when test="${empty order_Big_Hotelnum}">
												<a href="#" class="btn btn-success">請輸入日期查詢剩餘房間</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn btn-danger">已額滿</a>
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
								<p class="card-text">
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	</div>

	</div>
	</div>

	</div>

	<c:forEach var="zzz" begin="${starRand }" end="${overRand }" step="1">
		<div class="container">
			<div class="modal" id="myModal${zzz }">
				<div class="modal-dialog modal-lg">
					<div class="modal-content" style="max-width: 300%">
						<!-- Modal Header -->

						<img src="img/hotel_image/hotel/${zzz }.jpg" width="100%"
							height="100%" alt="...">
					</div>
				</div>
			</div>
		</div>
		</div>
	</c:forEach>


	//我的評論MODAL 開始

	<div class="modal fade" id="myMoment" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="max-width: 80%">
			<div class="modal-content" style="height: 700px">
				<div class="modal-header" style="margin-left: 0;border-bottom:none;">
					<h4 class="modal-title" id="myModalLabel">旅客評論</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid" id="commentDetail"></div>
				</div>
				<div class="modal-footer" id="assess1">
					<c:choose>
						<c:when test="${YesOrNotOrder==1&&YesOrNotComment==0 }">
							
								

								<select id="star" name="star" onChange="change()">
									<option value="5">５顆星</option>
									<option value="4">４顆星</option>
									<option value="3">３顆星</option>
									<option value="2">２顆星</option>
									<option value="1">１顆星</option>
								</select>
								<input id="commentt" type="text" name="commentDetail" >
								<button id="assess" type="button" class="btn btn-primary">提交評價</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">關閉</button>

							

						</c:when>
						<c:when test="${YesOrNotOrder==0 }">
						</c:when>
					</c:choose>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	//我的評論 結束



	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp"%>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
	<!--要選取日期的元素-->
	<script src="js/hotel/hotel.js"></script>
	<!--執行 Date Range Picker-->
	<script>
		$("input.default").daterangepicker(
				{
					opens : "center",
					autoApply : false,
					singleDatePicker : false, //是否為單個datepicker
					showDropdowns : true, //是否允許年月下拉式選單
					// 					startDate："03 / 05/2005",
					// 					endDate : "03 /  06/2005",
					minDate : new Date(),
					"locale" : {
						format : "YYYY-MM-DD", // 日期+時間的顯示格式
						applyLabel : "確定",
						cancelLabel : "取消",
						fromLabel : "開始日期",
						toLabel : "結束日期",
						customRangeLabel : "自訂日期區間",
						daysOfWeek : [ "日", "一", "二", "三", "四", "五", "六" ],
						monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月",
								"7月", "8月", "9月", "10月", "11月", "12月" ],
						firstDay : 1,
						separator : " ~ ",
						timepicker : false,

					}

				});
	</script>

	<script>
		$(document).ready(function() {
			$("#priceDetail1").toggle(300);
			$("#price1").click(function() {
				$("#priceDetail1").toggle(300);
			});
		});

		$(document).ready(function() {
			$("#priceDetail2").toggle(300);
			$("#price2").click(function() {
				$("#priceDetail2").toggle(300);
			});
		});

		$(document).ready(
				function() {
					$("#priceDetail3").toggle(300);
					$("#price3").click(function() {
						$("#priceDetail3").toggle(300);
					});

					$("#MMoment").on(
							"click",
							function() {
								var houseid = "${homestayId }";
								var member = "${loginOK }"
								$.ajax({
									url : 'sixsix.hotelcomment.json',
									type : 'post',
									data : {
										dataDetailparam : houseid
									},
									dataType : 'json',
									success : function(res) {
										console.log(res.list);
										var list = res.list;
										$("#commentDetail").empty();
										$.each(list, function(i, list) {
											$("#commentDetail")
													.append(
															commentDetail(list,
																	member));
										})
									}

								});

							});
					
					
					
					$("#assess").on("click",function(){
						var houseid = "${homestayId }";
						var member = '${loginOK }';
						var star = $("#star").val();
						var commentt = $("#commentt").val();
							$.ajax({
								url : 'sixsix.hotelSubmitcomment.json',
								type : 'post',
								data : {
									dataDetailparam : houseid,
									star : star,
									commentt : commentt
								},
								dataType : 'json',
								success : function(res) {
									console.log(res.list);
									var list = res.list;
									$.each(list, function(i, list) {
										$("#commentDetail")
												.append(
														commentDetail(list,
																member));
									})
									
									$("#assess1").empty();
								}

							});
					
					});
					

				});

		function commentDetail(list, member) {
			
				
			if(list.starnum==1){
				var areuOK = '太糟了'
			}else if(list.starnum==2){
				var areuOK = '有待加強哦!'
			}else if(list.starnum==3){
				var areuOK = '尚可'
			}else if(list.starnum==4){
				var areuOK = '不錯哦'
			}else{
				var areuOK = '太棒了'
			}
			var starYellow ='';
			var starBlack ='';
			
			for(var i = 0;i<list.starnum;i++){
				starYellow += '<i class="fa fa-star" style="color:#FFFF37;"></i>';
			}
			
			for(var j=0;j<(5-list.starnum);j++){
				starBlack += '<i class="fa fa-star" ></i>';
			}
			
			
			var data = '<div>' + list.starnum + '/5 '+ areuOK + '<div >'+ starYellow + starBlack +'</div></div>' + '<div>'
					+'會員ID編號:'+ list.memberid + '</div>' + '<div>' + list.commentt
					+ '</div>' + '<div><img src=""></div>' + '<div>於 '
					+ list.orderdate + '下訂</div>' + '<hr>';

				
			return data;

		}
		
		
		
	</script>

	<!-- --------------------GOOGEL 地圖 -->
	<!-- 將 YOUR_API_KEY 替換成你的 API Key 即可 -->


</body>

</html>