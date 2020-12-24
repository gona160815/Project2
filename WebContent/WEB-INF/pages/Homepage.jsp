<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bike-Homepage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<style>
.carousel .carousel-item img {
	min-height: 600px;
	max-height: 600px;
	object-fit: cover;
}

.navbar {
	width: 100%;
	top: 0;
	position: fixed;
	box-sizing: border-box;
	z-index: +100;
}

/* .bg-light {
    background-color:#e0ffff;
    color:#e0ffff;
    } */

/* .navbar-light .navbar-nav .nav-link {
	    color: blue
	} */

/*  .navbar-light .navbar-brand {
	    color:  #e0ffff;
	} */
</style>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript">
$("logout").on("click",function(){
	alert("logout")
	FB.logout(function(response) {
	   // Person is now logged out
		});
})
FB.logout(function(response) {
	   // Person is now logged out
		});
</script>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light ">
		<!-- 首頁&品牌 -->

		<a class="navbar-brand text-center"
			href="<c:url value='/Homepage.jsp'/>">去騎腳踏車吧</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <!-- 自行車資訊 -->
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <svg width="3.2em"
                            height="3.2em" viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                        </svg>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="<c:url value='/newBikeIndexEntry.controller?pageNo=1'/>">自行車道</a> 
                    <a class="dropdown-item" href="<c:url value='/REEntry.controller?pageNo=1'/>">補給站點</a> 
               		 </div>
                </li>
                
                <!-- 租車 -->
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg width="2.8em" height="2.8em" viewBox="0 0 16 16" class="bi bi-shop" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
                        </svg>
                    </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item"
							href="<c:url value='/bikeStorePre.controller?pageNo=1' />">門市資訊</a> 
						<a class="dropdown-item" href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">門市管理</a>
                   
                	</div>
                </li>
               
                <!-- 活動 -->
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg width="2.8em" height="2.8em" viewBox="0 0 16 16" class="bi bi-calendar-date"
                            fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                            <path
                                d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z" />
                        </svg> </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="event.controller?pageNo=1&query=&categoryId=">一般用戶查詢</a>
                        <a class="dropdown-item" href="eventmgr.controller?pageNo=1&query=&categoryId=">管理者</a>
                    </div>
                </li>
                <!-- 住宿 -->
                <li class="nav-item dropdown mx-2">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-house" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                            <path fill-rule="evenodd"
                                d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                        </svg> </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item"
							href="sixsix.Home.controller">友善住宿</a> 
					<a class="dropdown-item"
							href="sixsix.toInsertPage.controller">新增民宿資料</a>
                    </div>
                </li>



            </ul>
            <div class="" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <!-- 搜尋 -->
                    <li class="nav-item dropdown mx-1">
                        <a href="" class="nav-link mx-3"> <svg width="2.5em" height="2.5em" viewBox="0 0 16 16"
                                class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                                <path fill-rule="evenodd"
                                    d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                            </svg>
                        </a>
                    </li>
                    <!-- 訂單管理 -->
                    <li class="nav-item mx-2"><a class="nav-link " href="#"><svg width="2.5em" height="2.5em"
                                viewBox="0 0 16 16" class="bi bi-bag-check" fill="currentColor"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5H2z" />
                                <path fill-rule="evenodd"
                                    d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
                            </svg></a>
                    </li>
                    <!-- 購物車 -->
                    <li class="nav-item dropdown mx-1">
                        <a href="" class="nav-link mx-3"> <svg width="2.5em" height="2.5em" viewBox="0 0 16 16"
                                class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                            </svg>
                        </a>
                    </li>

					<!-- 會員登入 -->
					<c:if test="${ empty loginOK }">
						<li class="nav-item dropdown mx-1"><a
							href="loginPage" class="nav-link mx-3">
								<svg width="2.5em" height="2.5em" viewBox="0 0 16 16"
									class="bi bi-person-square" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
	                                    <path fill-rule="evenodd"
										d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
	                                    <path fill-rule="evenodd"
										d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
	                                  </svg>
						</a></li>
					</c:if>
					<c:if test="${! empty loginOK }">
						<li class="nav-item dropdown mx-1"><a
							href="infoPage"
							class="nav-link mx-3"> <svg width="2.5em" height="2.5em"
									viewBox="0 0 16 16" class="bi bi-person-square"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	                                    <path fill-rule="evenodd"
										d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
	                                    <path fill-rule="evenodd"
										d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
	                                  </svg>
						</a></li>
					</c:if>
					<li class="nav-item dropdown mx-1"><c:if
							test="${! empty loginOK }">
							<c:if test="${! empty memberAd.icon}">
								<img height='80px' width='70px'
									src='showMemberIcon?id=${loginOK.memberId}'>
								<p>會員：${loginOK.name}</p>
							</c:if>
							<c:if test="${ empty memberAd.icon}">
								<img height='80px' width='70px'
									src="http://i.imgur.com/Qj9FXu6.jpg" />
							</c:if>
						</c:if></li>

					<!-- 會員注册 -->

					<li class="nav-item dropdown mx-1 my-2"><a
						class="btn btn-outline-primary"
						href="registPage" role="button">會員註冊</a>
					</li>
				</ul>

			</div>
		</div>

		<c:if test="${! empty loginOK }">
			<form action="adminPage.controller" method="post">
				<input class="btn btn-outline-primary" type="submit" value="管理員" />
			</form>
		</c:if>
		<!-- 登出 -->
		<c:if test="${! empty loginOK }">
		<a	class="m-4  text-decoration-none inline-text" href="service">聯絡客服</a>
			<li class="nav-item dropdown mx-1" id="logout" onclick="FB.logout()"><a
				href="memberLogout.controller" >登出</a></li>
		</c:if>
	</nav>
	<hr>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" data-interval="1500">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value='/image/S__71647237.jpg'/>"
					class="d-block w-100 " alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/image/S__71647238.jpg'/>"
					class="d-block w-100 " alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/image/S__71647234.jpg'/>"
					class="d-block w-100 " alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/image/S__71647239.jpg'/>"
					class="d-block w-100 " alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/image/S__71647240.jpg'/>"
					class="d-block w-100 " alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/image/S__71647241.jpg'/>"
					class="d-block w-100 " alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="container marketing">

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					<a href="<c:url value='bike/bikeindex.jsp' />">首先，選擇最適合你的自行車道吧</a>
					<br>
					<h6 class="text-muted">
						上千條車道任君挑選
						</h5>
				</h2>
				<p class="lead">收錄全台各縣市自行車道資訊，依照個人需求挑選出今天要騎的路線吧！</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
	        <image
						xlink:href="https://taiwanbike.tw/att/ablum/02000021/b_14000209.jpg">
	      </svg>
			</div>
		</div>
		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading">
					<a href="<c:url value='/EventsController' />">騎累了嗎？不妨停下來走走</a> <br>
					<h6 class="text-muted">
						各種活動總會有適合你的</span>
					</h6>
				</h2>
				<p class="lead">
					幫你整理了娛樂、展覽、親子、文化，及音樂等類型的活動。<br>我都放在那裡了，自己去找吧！
				</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
	      <image
						xlink:href="https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2019-07/e4ec8aa0-9bf9-11e9-87df-d417487db9c0"
						width="600" height="400">
	      </svg>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					<a href="<c:url value='/RetrievePageStore' />">你終究是要升級的，何不一開始就升</a>
					<br>
					<h6 class="text-muted">台灣首家自行車線上商城上線啦(目前只有租借服務的啦)</h6>
				</h2>
				<p class="lead">登入就送S級煞車皮，各種福利商品不必VIP10就能擁有</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
        <image
						xlink:href="https://www.sportscience.com.tw/data/image/article/3a/d7/c2/eb/d88136e43d2cce49c42e2ed.jpg?v=1563206371"
						width="600" height="400">
        </svg>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading">
					<a href="<c:url value='Hotel/homestay.jsp' />">流了一整天的汗，辛苦了</a> <br>
					<h6 class="text-muted">
						約泡湯嗎，約嗎約嗎</span>
					</h6>
					<p class="lead">
						忙碌了一天，你值得睡一場好覺。<br>不必再換網頁找住宿了，這裡都幫你想好了！
					</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
        <image
						xlink:href="https://www.fun-taiwan.com/Images/HousePhotos/657201.jpg"
						width="600" height="400">
        </svg>
			</div>
		</div>

		<hr class="featurette-divider">

	</div>
	<!-- /.container -->


	<!-- FOOTER -->
	<footer class="container">
		<p class="float-right">
			<a href="#">Back to top</a>
		</p>
		
		<!-- <p>© 2017-2020 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p> -->
	</footer>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>

</html>