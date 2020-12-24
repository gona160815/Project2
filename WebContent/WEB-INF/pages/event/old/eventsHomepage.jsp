<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EVENTHOMEPAGE</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<style>
</style>
</head>

<body>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light ">
		<!-- 首頁&品牌 -->
		<a class="navbar-brand text-center" href="<c:url value='/Homepage.jsp'/>">去騎腳踏車吧</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- 自行車資訊 -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown mx-2"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <svg width="3.2em" height="3.2em"
							viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                          </svg>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">自行車道</a> <a
							class="dropdown-item" href="#">補給站點</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">友善住宿</a>
					</div>
				</li>
				<!-- 活動 -->
				<li class="nav-item dropdown mx-2"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><svg
							width="3em" height="3em" viewBox="0 0 16 16"
							class="bi bi-calendar-date" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                            <path
								d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z" />
                          </svg>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href='<c:url value='/EventsController?pageNo=1&query='/>'>一般用戶查詢</a> 
						<a class="dropdown-item" href='<c:url value='/PageEntertainment'/>'>管理者</a>
						<!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">友善住宿</a> -->
					</div>
				</li>		
				<!-- 訂單管理 -->
				<li class="nav-item mx-2"><a class="nav-link " href="#"><svg
							width="2.8em" height="2.8em" viewBox="0 0 16 16"
							class="bi bi-bag-check" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5H2z" />
                            <path fill-rule="evenodd"
								d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
                          </svg></a></li>
				</li>

			</ul>
			<div class="" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<!-- 搜尋 -->
					<li class="nav-item dropdown mx-1"><a href=""
						class="nav-link mx-3"> <svg width="2.5em" height="2.5em"
								viewBox="0 0 16 16" class="bi bi-search" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
									d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                                    <path fill-rule="evenodd"
									d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                             </svg>
					</a></li>
					<!-- 購物車 -->
					<li class="nav-item dropdown mx-1"><a href=""
						class="nav-link mx-3"> <svg width="2.5em" height="2.5em"
								viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
									d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                              </svg>
					</a></li>
					<!-- 會員 -->
					<li class="nav-item dropdown mx-1"><a href=""
						class="nav-link mx-3"> <svg width="2.5em" height="2.5em"
								viewBox="0 0 16 16" class="bi bi-person-square"
								fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
									d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                    <path fill-rule="evenodd"
									d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                  </svg>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<hr>

	<section class="jumbotron text-center">
		<div class="container ">
			<div class="btn-group float-none ">
				<button type="button"
					class="btn btn-lg btn-info dropdown-toggle dropdown-toggle-split"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="">&nbsp&nbsp&nbsp查詢功能&nbsp&nbsp&nbsp </span>
				</button>
				<div class="dropdown-menu">
					<ul class="list-group">
						<li class="list-group-item">全部查詢</li>
						<li class="list-group-item">偏好查詢</li>
						<li class="list-group-item"></li>
					</ul>
				</div>
			</div>

			<div class="btn-group float-none ">
				<button type="button"
					class="btn btn-lg btn-info dropdown-toggle dropdown-toggle-split"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="">&nbsp&nbsp&nbsp依縣市查詢&nbsp&nbsp&nbsp </span>
				</button>
				<div class="dropdown-menu">
					<ul class="list-group">
						<li class="list-group-item">台北市</li>
						<li class="list-group-item">新北市</li>
						<li class="list-group-item">基隆市</li>
						<li class="list-group-item">桃園市</li>
						<li class="list-group-item">新竹市</li>
					</ul>
				</div>
			</div>

			<div class="btn-group float-none ">
				<button type="button"
					class="btn btn-lg btn-info dropdown-toggle dropdown-toggle-split"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="">&nbsp&nbsp&nbsp依鄉政區查詢&nbsp&nbsp&nbsp </span>
				</button>
				<div class="dropdown-menu">
					<ul class="list-group">
						<li class="list-group-item">台北市</li>
						<li class="list-group-item">新北市</li>
						<li class="list-group-item">基隆市</li>
						<li class="list-group-item">桃園市</li>
						<li class="list-group-item">新竹市</li>
					</ul>
				</div>
			</div>

		</div>
	</section>



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