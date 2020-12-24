<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員資訊</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css"/>
 

<style>
body {
	font-family: Microsoft JhengHei;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>
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
				<li class="nav-item dropdown mx-2"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <svg width="3.2em" height="3.2em"
							viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                        </svg>
				</a></li>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item"
						href="<c:url value='/bikeIndex.controller'/>">自行車道</a> <a
						class="dropdown-item" href="#">補給站點</a> <a class="dropdown-item"
						href="<c:url value='/bikeStorePre.controller?page=1' />">門市資訊</a>
					<a class="dropdown-item"
						href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">門市管理</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="<c:url value='/hotel/homestay.jsp' />">友善住宿</a> <a
						class="dropdown-item"
						href="<c:url value='/hotel/insertdata.jsp' />">新增民宿資料</a>
				</div>
				<!-- 租車 -->
				<li class="nav-item dropdown mx-2"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <svg width="2.8em" height="2.8em"
							viewBox="0 0 16 16" class="bi bi-shop" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
                        </svg>
				</a></li>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item"
						href="<c:url value='/bikeIndex.controller'/>">自行車道</a> <a
						class="dropdown-item" href="#">補給站點</a> <a class="dropdown-item"
						href="<c:url value='/bikeStorePre.controller?page=1' />">門市資訊</a>
					<a class="dropdown-item"
						href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">門市管理</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="<c:url value='/hotel/homestay.jsp' />">友善住宿</a> <a
						class="dropdown-item"
						href="<c:url value='/hotel/insertdata.jsp' />">新增民宿資料</a>
				</div>
				<!-- 活動 -->
				<li class="nav-item dropdown mx-2"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <svg width="2.8em" height="2.8em"
							viewBox="0 0 16 16" class="bi bi-calendar-date"
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
                            <path
								d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z" />
                        </svg>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item"
							href="event.controller?pageNo=1&query=&categoryId=">一般用戶查詢</a> <a
							class="dropdown-item"
							href="eventmgr.controller?pageNo=1&query=&categoryId=">管理者</a>
					</div></li>
				<!-- 住宿 -->
				<li class="nav-item dropdown mx-2"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <svg width="3em" height="3em"
							viewBox="0 0 16 16" class="bi bi-house" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
								d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                            <path fill-rule="evenodd"
								d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                        </svg>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item"
							href="event.controller?pageNo=1&query=&categoryId=">一般用戶查詢</a> <a
							class="dropdown-item"
							href="eventmgr.controller?pageNo=1&query=&categoryId=">管理者</a>
					</div></li>



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
					<!-- 訂單管理 -->
					<li class="nav-item mx-2"><a class="nav-link " href="#"><svg
								width="2.5em" height="2.5em" viewBox="0 0 16 16"
								class="bi bi-bag-check" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
									d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5H2z" />
                                <path fill-rule="evenodd"
									d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
                            </svg></a></li>
					<!-- 購物車 -->
					<li class="nav-item dropdown mx-1"><a href=""
						class="nav-link mx-3"> <svg width="2.5em" height="2.5em"
								viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
									d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                            </svg>
					</a></li>

					<!-- 會員登入 -->
					<c:if test="${ empty loginOK }">
						<li class="nav-item dropdown mx-1"><a href="loginPage"
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



					<!-- 會員注册 -->

					<li class="nav-item dropdown mx-1 my-2"><a
						class="btn btn-outline-primary" href="registPage" role="button">會員註冊</a>
					</li>
				</ul>

			</div>
		</div>
	</nav>
	<hr>

	<table class="table w-75 m-auto" id="table1">
		<thead>
			<tr>
				<th scope="col" ></th>
				<th class="h3" scope="col" id="table1-head">一般帳號設定<p id="msg2"></p></th>
				<th scope="col" ></th>
				<th scope="col" ></th>
			</tr>
		</thead>
		<tbody>
		<form:form id="form-1" method="POST"
		modelAttribute="loginOK" enctype="multipart/form-data">
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class=" btn text-muted text-decoration-none inline-text" href="infoPage"><svg
							width="1.6em" height="1.5em" viewBox="0 0 16 16"
							class="bi bi-gear" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
								d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
                    <path fill-rule="evenodd"
								d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
                  </svg>&nbsp&nbsp一般</a>
				</th>
				<td class=" border-left border-bottom-0 h5 p-3"><form:label path="email">電子信箱</form:label></td>
				<td><form:input type="text" readonly="true" class="form-control" name="email" id="staticEmail" value="" path="email"/></td>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class="btn text-muted text-decoration-none inline-text" href="resetPasswordPage"><svg
							width="1.5em" height="1.5em" viewBox="0 0 16 16"
							class="bi bi-lock" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
								d="M11.5 8h-7a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1zm-7-1a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-7zm0-3a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z" />
                  </svg>&nbsp&nbsp更改密碼</a>
				</th>
				<td class=" border-left border-bottom-0 h5 p-3"><form:label path="name">姓名</form:label></td>
				<td><form:input type="text" class="form-control" placeholder="陳齦滑" name="name" value="" path="name"/></td>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " >
					<a class="btn text-muted text-decoration-none inline-text" id="myfav">
					<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-suit-heart" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg" >
                        <path fill-rule="evenodd"
								d="M8 6.236l.894-1.789c.222-.443.607-1.08 1.152-1.595C10.582 2.345 11.224 2 12 2c1.676 0 3 1.326 3 2.92 0 1.211-.554 2.066-1.868 3.37-.337.334-.721.695-1.146 1.093C10.878 10.423 9.5 11.717 8 13.447c-1.5-1.73-2.878-3.024-3.986-4.064-.425-.398-.81-.76-1.146-1.093C1.554 6.986 1 6.131 1 4.92 1 3.326 2.324 2 4 2c.776 0 1.418.345 1.954.852.545.515.93 1.152 1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                      </svg>&nbsp&nbsp我的最愛</a>
				</th>
				<td class=" border-left border-bottom-0 h5 p-3"><form:label path="tel">電話</form:label></td>
				<td><form:input type="text" class="form-control" placeholder=""
					name="tel" value="" path="tel" /></td>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class="btn text-muted text-decoration-none inline-text" href=""><svg
							width="1.5em" height="1.5em" viewBox="0 0 16 16"
							class="bi bi-file-text" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
								d="M4 0h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4z" />
                        <path fill-rule="evenodd"
								d="M4.5 10.5A.5.5 0 0 1 5 10h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z" />
                      </svg>&nbsp&nbsp訂單紀錄</a>
				</th>
				
				<td class=" border-left border-bottom-0 h5 p-3"><form:label path="areaIdStr">居住地區</form:label></td>
				<td>
					<form:select id="inputState"  class="form-control" path="areaIdStr">
						<form:option value="1">台北市</form:option>
						<form:option value="2">新北市</form:option>
						<form:option value="3">基隆市</form:option>
						<form:option value="4">宜蘭縣</form:option>
						<form:option value="5">桃園市</form:option>
						<form:option value="6">新竹市</form:option>
						<form:option value="7">新竹縣</form:option>
						<form:option value="8">苗栗縣</form:option>
						<form:option value="9">台中市</form:option>
						<form:option value="10">彰化縣</form:option>
						<form:option value="11">南投縣</form:option>
						<form:option value="12">雲林縣</form:option>
						<form:option value="13">嘉義市</form:option>
						<form:option value="14">嘉義縣</form:option>
						<form:option value="15">台南市</form:option>
						<form:option value="16">高雄市</form:option>
						<form:option value="17">屏東縣</form:option>
						<form:option value="18">台東縣</form:option>
						<form:option value="19">花蓮縣</form:option>
						<form:option value="20">澎湖縣</form:option>
						<form:option value="21">金門縣</form:option>
						<form:option value="22">連江縣</form:option>
					</form:select>
				</td>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " scope="row "></th>
				<td class=" border-left h5 p-3"><form:label path="gender">性別</form:label></td>
				<td><form:input type="text" class="form-control" name="gender" value="" path="gender" readonly="true" /></td>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " scope="row "></th>
				<td class=" border-left h5 p-3"><form:label path="favorIdStr">自行車偏好</form:label></td>
				<td><form:select id="inputState2"
						name="favor" class="form-control" path="favorIdStr">
						<option value="1">公路車</option>
						<option value="2">登山車</option>
						<option value="3">極限單車</option>
						<option value="4">摺疊車</option>
						<option value="5">淑女車</option>
						<option value="6">單速車</option>
						<option value="7">電動單車</option>
						<option value="8">斜躺車</option>
					</form:select>
				</td>
										

			</tr>
			<tr>
				<th class="border-top  border-light " scope="row "></th>
				<td class=" border-left ">
					<form:button class="btn btn-primary my-2 my-lg-3" id="basicButton" type="button">修改</form:button>
				</td>
				<td></td>

			</tr>
		</form:form>
		</tbody>
		</table>


	<c:if test="${! empty MemberAdvanced}">
	
		<table class="table w-75 m-auto" id="table2">
			<thead>
				<tr>
					<th scope="col"></th>
					<th class="h3" scope="col">個人詳細資訊<p id="msg"></p></th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>

			<tbody>
	<form:form method="POST"
		modelAttribute="MemberAdvanced" id="form-2" enctype="multipart/form-data">
				<tr>
					<th class="border-top border-bottom border-light " scope="row "></th>
					<td class=" border-left border-bottom-0 h5 p-3"><form:label
							path="nickName">暱稱</form:label></td>
					<td><form:input type="text" class="form-control"
							 path="nickName"/></td>
				</tr>
			 	<tr>
					<th class="border-top border-bottom border-light " scope="row "></th>
					<td class=" border-left border-bottom-0 h5 p-3"><form:label
							path="address">地址</form:label></td>
					<td><form:input type="text" class="form-control"
							id="staticEmail" value="" path="address" /></td>
				</tr>
				 <tr>
					<th class="border-top border-bottom border-light " scope="row "></th>
					<td class=" border-left border-bottom-0 h5 p-3"><form:label
							path="birthStr">生日</form:label></td>
					<td><form:input type="date" class="form-control"
							path="birthStr" value="${loginOK.memberAdvanced.birthday}"></form:input></td>
				</tr> 
				<tr>
					<th class="border-top border-bottom border-light " scope="row "></th>
					<td class=" border-left border-bottom-0 h5 p-3"><form:label
							path="mFile">大頭貼</form:label></td>
					<td><div class="input-group">
							<div class="custom-file">
								<form:input type="file" class="custom-file-input"
									id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"
									path="mFile"></form:input>
								  <form:label class="custom-file-label" for="inputGroupFile04" path="mFile">請選擇檔案</form:label>  
							</div>
						</div></td>
				</tr>
				<tr>
					<th class="border-top border-bottom border-light " scope="row "></th>
					<td class=" border-left border-bottom-0 h5 p-3"><form:label
							path="intro">個人簡介</form:label></td>
					<td><form:textarea class="form-control"
							id="exampleFormControlTextarea1" rows="3" required=""
							path="intro"></form:textarea></td>
				</tr>
				<tr>
					<th class="border-top border-bottom border-light " scope="row "></th>
					<td class=" border-left ">
					<form:button class="btn btn-success my-2 my-lg-3" value="Send" type="button" id="submit">送出</form:button>
					</td>
					<td></td>
				</tr>
				</form:form>
			</tbody>
		</table>
	</c:if>
	<input type="hidden" id="memberId" value="${loginOK.memberId}"/>
	<script>
		$(function(){

			function time(data){
				$.ajax({
					type:"post",
					url:"selectByAddTimeASC",
					dataType:"json",
					data:{"memberId":$("#memberId").val()},
					success:function(data){
						var favlist = data.favorites;
						var evelist = data.events;
						var typelist = data.types;
						console.log(data);

						$("tbody tr").eq(0).append(myFavListHead());
						var j=1;
						for( var i=0 ; i < data.favorites.length ; i++){							
								console.log(j);
								myFavListBodyover(i,j,favlist,evelist,typelist);
								j++;
								console.log(i);														
						}						
					}					
				}); 
			}



			
			function myFavListHead(){
				var list = '<td><span class="btn">項目名稱</span></td>'+
			      '<td><span class="btn">種類</span></td><td><span class="btn" onclick="time(this)">加入時間</span></td>';
			    return list;
			}
			/*function myFavListBody(data,i){
				var list = '<td>'+data[i].favoriteId+'</td><td>'+data[i].typeId+'</td><td>'+data[i].addTime+'</td>';
			    return list;
			}*/
			function myFavListBodyover(i,j,favlist,evelist,typelist){
				if(j>6){
					$("tbody").append("<tr></tr>")
					$("tbody tr").eq(j).append('<th class="border-top border-bottom border-light " scope="row"></th>')
				}
				$("tbody tr").eq(j).append('<td><a target="_blank" href="event/'+evelist[i].eventId+'">'+evelist[i].title+'</a></td><td>'+typelist[i]+'</td><td>'+favlist[i].addTime+'</td>')
				j++;
			}
			
			$("#myfav").on("click",function(){
				$("tbody td").remove();
				$("#table2").remove();
				$("#table1-head").text("我的最愛");
				
				
				$.ajax({
					type:"post",
					url:"selectByAddTime",
					dataType:"json",
					data:{"memberId":$("#memberId").val()},
					success:function(data){
						var favlist = data.favorites;
						var evelist = data.events;
						var typelist = data.types;
						console.log(data);

						$("tbody tr").eq(0).append(myFavListHead());
						var j=1;
						for( var i=0 ; i < data.favorites.length ; i++){							
								console.log(j);
								myFavListBodyover(i,j,favlist,evelist,typelist);
								j++;
								console.log(i);														
						}						
						/*$("#table1").DataTable();*/
					}					
				}); 
			});

			
			

			
//-------------selected----------------------------------------------
 			var favor = ${loginOK.favor.favorId}-1
			var area = ${loginOK.memberArea.areaId}-1
			
			$("#inputState")[0].selectedIndex = area; 
			$("#inputState2")[0].selectedIndex = favor; 
			
//-------------advanced----------------------------------------------
		 	$("#submit").click(function(){	
			 	
				var form = new FormData($('form')[1]);
			
			 		
				$.ajax({
					type:"POST",
					url:"advancedRegister.json",
					dataType:"json",
					/* contentType :"application/json;charset=UTF-8", */
					data:form,
					contentType: false, //required
				    processData: false, // required
					success:function(data){
					console.log(data.aaa);
					$("#msg").text(data.success);
					}
				});
			});  
//----------------basic--------------------------------------------------------------
			var basicInfo = {
				/* "email":$("#email").val(), */
				"name":$("#name").val(),
				"tel":$("#tel").val(),
				/* "gender":$("#gender").val(), */
				"areaId":$("#areaId").val(),
				"favorId":$("#favorId").val()
			}
			
			var str2 = $("#form-1").serialize();
			$("#basicButton").click(function(){
				
			var form1 = new FormData($('form')[0]);
			
				$.ajax({
					type:"POST",
					url:"updateBasicInfo.controller",
					dataType:"json",
					data:form1,
					contentType: false, //required
				    processData: false, // required
					success:function(data){
						/* result = JSON.parse(data); */
						$("#msg2").text(data.success);
					}
				});
			});
		})
	</script>