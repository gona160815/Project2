<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" href="img/favicon.png">
<title>EEIT124Team1</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="css/black-dashboard.css" rel="stylesheet" />
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("確定刪除此項資料(ID:${bean.eventId})?")) {
			document.forms[0].action = "eventDelete.controller?pageNo=${param.pageNo}&eventID=${bean.eventId}";
			document.forms[0].method = "post";
			document.forms[0].submit();
		} else {
		}
	}
	function update() {
		document.forms[0].action = "eventUpdate.controller?pageNo=${param.pageNo}&eventID=${bean.eventId}";
		document.forms[0].method = "post";
		document.forms[0].enctype = "multipart/form-data";
		document.forms[0].contentType = "false";
		document.forms[0].processData = "false";
		document.forms[0].submit();
	}

	function textval() {
		var texta = document.getElementById("texta");
		texta.value = texta.placeholder;
	}
</script>
</head>

<body class="white-content">

	<div class="wrapper">
		<div class="sidebar" data="blue">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="javascript:void(0)" class="simple-text logo-mini"> III
					</a> <a href="javascript:void(0)" class="simple-text logo-normal">
						EEIT124Team1 </a>
				</div>
				<ul class="nav">
					<li><a href="./dashboard.html"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-pie-chart" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd"
										d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
							  <path fill-rule="evenodd"
										d="M7.5 7.793V1h1v6.5H15v1H8.207l-4.853 4.854-.708-.708L7.5 7.793z" />
							</svg></i>
							<p class="p-1">Dashboard</p>
					</a></li>
					<li><a href="./member.html"> <i class="tim-icons "><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-person-square" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd"
										d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
							  <path fill-rule="evenodd"
										d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
							</svg> </svg></i>
							<p class="p-1">會員</p>
					</a></li>
					<li><a href="./rental.html "> <i class="tim-icons "><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-card-checklist" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd"
										d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
							  <path fill-rule="evenodd"
										d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
							</svg></i>
							<p class="p-1">租車</p>
					</a></li>
					<li class="active"><a href="./event.html"> <i
							class="tim-icons "><svg width="1.5em" height="1.2em"
									viewBox="0 0 16 16" class="bi bi-calendar-event"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd"
										d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
							  <path
										d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
							</svg></i>
							<p class="p-1">活動</p>
					</a></li>
					<li><a href="./bike.html"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-bicycle" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                              </svg></i>
							<p class="p-1">自行車</p>
					</a></li>
					<li><a href="./homestay.html"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-house-fill" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                <path fill-rule="evenodd"
										d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                              </svg></i>
							<p class="p-1">住宿</p>
					</a></li>
					<li><a href="./setting.html"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-gear" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd"
										d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
							  <path fill-rule="evenodd"
										d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
							</svg></i>
							<p class="p-1">設定</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle d-inline">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse" id="navigation">
					</div>
				</div>
			</nav>
			<div class="modal modal-search fade" id="searchModal" tabindex="-1"
				role="dialog" aria-labelledby="searchModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<input type="text" class="form-control" id="inlineFormInputGroup"
								placeholder="SEARCH">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<i class="tim-icons icon-simple-remove"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- End Navbar -->

			<div class="content">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<!-- TABLE名稱 -->
					<h1 class="h2">民宿資料</h1>

				</div>
				<div class="row">
					<form:form class="w-75 m-auto"
						action="sixsix.InsertData.controller"
						enctype="multipart/form-data" method="POST"
						modelAttribute="homeinsertpage">

						<div class="form-row">
							<div class="col-md-6 mb-3">
								<form:label for="validationTooltip02" path="Name">民宿名稱：</form:label>
								<form:input for="validationTooltip02" class="form-control"
									id="validationTooltip02" path="Name" rows="3" />

							</div>
							<div class="col-md-6 mb-3">
								<label for="validationTooltip02">上傳民宿圖片：</label> <input
									for="validationTooltip02" name="picturefile" type="file"
									class="form-control" id="validationTooltip02" rows="3" />

							</div>
						</div>
						<div class="form-row">
							<div class="col-md-3 mb-3">
								<form:label for="validationTooltip04" path="Region">民宿所在縣：</form:label>
								<form:input path="Region" class="form-control"
									id="validationTooltip05" name="category" rows="3" />
							</div>
							<div class="col-md-3 mb-3">
								<form:label for="validationTooltip05" path="Town">民宿所在市：</form:label>
								<form:input path="Town" class="form-control"
									id="validationTooltip05" name="location" rows="3" />
							</div>
							<div class="col-md-6 mb-3">
								<form:label for="validationTooltip04" path="Add">民宿地址：</form:label>
								<form:input path="Add" class="form-control"
									id="validationTooltip05" name="locationName" rows="3" />
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<form:label for="validationTooltip04" path="Serviceinfo">民宿特殊設備：</form:label>
								<form:input path="Serviceinfo" class="form-control"
									id="validationTooltip05" name="showunit" rows="3" />
							</div>
							<div class="col-md-6 mb-3">
								<form:label for="validationTooltip05" path="Parkinginfo">民宿車位：</form:label>
								<form:input path="Parkinginfo" class="form-control"
									id="validationTooltip05" name="website" rows="3" />
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<form:label for="validationTooltip04" path="Tellphone">民宿電話：</form:label>
								<form:input path="Tellphone" class="form-control"
									id="validationTooltip05" name="onsales" />
							</div>
							<!-- 							<div class="col-md-3 mb-3"> -->
							<!-- 								<label for="validationTooltip05">Price</label> <input -->
							<!-- 									type="text" class="form-control" id="validationTooltip05" -->
							<!-- 									name="price" /> -->
							<!-- 							</div> -->
							<div class="col-md-3 mb-3">
								<form:label for="validationTooltip04" path="Px">經度：</form:label>
								<form:input path="Px" onkeyup="onlyNumber(this)"
									class="form-control" id="validationTooltip05" name="px"
									rows="3" />
							</div>
							<div class="col-md-3 mb-3">
								<form:label for="validationTooltip05" path="Py">緯度：</form:label>
								<form:input path="Py" onkeyup="onlyNumber(this)"
									class="form-control" id="validationTooltip05" name="py"
									rows="3" />
							</div>
						</div>
						<!-- 						<div class="form-row"> -->
						<!-- 							<div class="col-md-6 mb-3"> -->
						<!-- 								<label for="validationTooltip04">Start Date</label> <input -->
						<!-- 									type="date" class="form-control" id="validationTooltip05" -->
						<!-- 									name="startDate" required /> -->
						<!-- 							</div> -->
						<!-- 							<div class="col-md-6 mb-3"> -->
						<!-- 								<label for="validationTooltip05">End Date</label> <input -->
						<!-- 									type="date" class="form-control" id="validationTooltip05" -->
						<!-- 									name="endDate" required /> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<div class="form-row">
							<form:label id="exampleFormControlTextarea1"
								for="exampleFormControlTextarea1" path="Description">民宿簡介：</form:label>
							<form:textarea id="exampleFormControlTextarea1"
								name="description" path="Description" class="form-control"
								rows="3" />
						</div>
						<hr>
						<form:button class="btn btn-success my-2 my-lg-3" type="submit">送出</form:button>
						<form:button class="btn btn-danger my-2 my-lg-3 mx-2"
							type="reset">清空</form:button>
						<a class="btn btn-primary my-2 my-sm-0  "
							href="sixsix.Home.controller">返回</a>
						<br>
					</form:form>
				</div>

			</div>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="js/core/jquery.min.js"></script>
	<script src="js/core/popper.min.js"></script>
	<script src="js/core/bootstrap.min.js"></script>
	<script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<!-- Place this tag in your head or just before your close body tag. -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="js/black-dashboard.min.js?v=1.0.0"></script>

	<script>
		$(document)
				.ready(
						function() {
							$()
									.ready(
											function() {
												$sidebar = $('.sidebar');
												$navbar = $('.navbar');
												$main_panel = $('.main-panel');

												$full_page = $('.full-page');

												$sidebar_responsive = $('body > .navbar-collapse');
												sidebar_mini_active = true;
												white_color = false;

												window_width = $(window)
														.width();

												fixed_plugin_open = $(
														'.sidebar .sidebar-wrapper .nav li.active a p')
														.html();

												$('.fixed-plugin a')
														.click(
																function(event) {
																	if ($(this)
																			.hasClass(
																					'switch-trigger')) {
																		if (event.stopPropagation) {
																			event
																					.stopPropagation();
																		} else if (window.event) {
																			window.event.cancelBubble = true;
																		}
																	}
																});

												$(
														'.fixed-plugin .background-color span')
														.click(
																function() {
																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data',
																						new_color);
																	}

																	if ($main_panel.length != 0) {
																		$main_panel
																				.attr(
																						'data',
																						new_color);
																	}

																	if ($full_page.length != 0) {
																		$full_page
																				.attr(
																						'filter-color',
																						new_color);
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.attr(
																						'data',
																						new_color);
																	}
																});

												$('.switch-sidebar-mini input')
														.on(
																"switchChange.bootstrapSwitch",
																function() {
																	var $btn = $(this);

																	if (sidebar_mini_active == true) {
																		$(
																				'body')
																				.removeClass(
																						'sidebar-mini');
																		sidebar_mini_active = false;
																		blackDashboard
																				.showSidebarMessage('Sidebar mini deactivated...');
																	} else {
																		$(
																				'body')
																				.addClass(
																						'sidebar-mini');
																		sidebar_mini_active = true;
																		blackDashboard
																				.showSidebarMessage('Sidebar mini activated...');
																	}

																	// we simulate the window Resize so the charts will get updated in realtime.
																	var simulateWindowResize = setInterval(
																			function() {
																				window
																						.dispatchEvent(new Event(
																								'resize'));
																			},
																			180);

																	// we stop the simulation of Window Resize after the animations are completed
																	setTimeout(
																			function() {
																				clearInterval(simulateWindowResize);
																			},
																			1000);
																});

												$('.switch-change-color input')
														.on(
																"switchChange.bootstrapSwitch",
																function() {
																	var $btn = $(this);

																	if (white_color == true) {

																		$(
																				'body')
																				.addClass(
																						'change-background');
																		setTimeout(
																				function() {
																					$(
																							'body')
																							.removeClass(
																									'change-background');
																					$(
																							'body')
																							.removeClass(
																									'white-content');
																				},
																				900);
																		white_color = false;
																	} else {

																		$(
																				'body')
																				.addClass(
																						'change-background');
																		setTimeout(
																				function() {
																					$(
																							'body')
																							.removeClass(
																									'change-background');
																					$(
																							'body')
																							.addClass(
																									'white-content');
																				},
																				900);

																		white_color = true;
																	}

																});

												$('.light-badge')
														.click(
																function() {
																	$('body')
																			.addClass(
																					'white-content');
																});

												$('.dark-badge')
														.click(
																function() {
																	$('body')
																			.removeClass(
																					'white-content');
																});
											});
						});
	</script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
	<script>
		function onlyNumber(obj) {

			let Pysp = document.getElementById("spPy");

			//先把非數字的都替換掉，除了數字和. 
			obj.value = obj.value.replace(/[^\d\.]/g, '');
			//必須保證第一個為數字而不是. 
			obj.value = obj.value.replace(/^\./g, '');
			//保證只有出現一個.而沒有多個. 
			obj.value = obj.value.replace(/\.{2,}/g, '.');
			//保證.只出現一次，而不能出現兩次以上 
			obj.value = obj.value.replace('.', '$#$').replace(/\./g, '')
					.replace('$#$', '.');
			//如果第一位是負號，則允許新增
		}
	</script>
</body>

</html>