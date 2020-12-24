<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<li><a href="dashboard"> <i
							class="tim-icons icon-chart-pie-36"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="/adminPage.controller"> <i
							class="tim-icons icon-single-02"></i>
							<p>會員</p>
					</a></li>
					<li><a href="maintainStorePre.controller?pageNo=1"> <i
							class="tim-icons icon-cart "></i>
							<p>租車</p>
					</a></li>
					<li><a href="eventDashboard"> <i
							class="tim-icons icon-calendar-60"></i>
							<p>活動</p>
					</a></li>
					<li class="active"><a
						href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>"> <i
							class="tim-icons"><svg width="1.5em" height="1.2em"
									viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                              </svg></i>
							<p class="p-1">自行車</p>
					</a></li>
					<li><a href="sixsix.Home.controller"> <i class="tim-icons"><svg
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
					<li><a href="./setting.html"> <i
							class="tim-icons icon-settings-gear-63"></i>
							<p>設定</p>
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
					<h1 class="h2">自行車道</h1>

				</div>
				<div class="row">

					<form class="w-75 m-auto" action="bikeUpdate.controller" method="post">
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<label for="validationTooltip02">序號</label> <input
									type="text" class="form-control" id="validationTooltip02"
									name="id" required value="${changeid}" readonly/>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-3 mb-3">
								<label for="validationTooltip04">道路名稱</label> <input
									type="text" class="form-control" id="validationTooltip05"
									name="name" value="${param.name}" required />
								</div>
							<div class="col-md-3 mb-3">
								<label for="validationTooltip05">起點</label> <input
									type="text" class="form-control" id="validationTooltip05"
									name="begin" value="${param.begin}" />
							</div>
							<div class="col-md-6 mb-3">
								<label for="validationTooltip04">終點</label> <input
									type="text" class="form-control" id="validationTooltip05"
									name="goal" value="${param.goal}" />
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<label for="validationTooltip04">縣市</label>
								<select name="city"
					class="form-control" id="validationDefault05">					
					<option value="${param.city}">${param.city}</option>>
					<option value="台北市">台北市</option>>
					<option value="新北市">新北市</option>>
					<option value="基隆市">基隆市</option>>
					<option value="桃園市">桃園市</option>>
					<option value="新竹市">新竹市</option>>
					<option value="新竹縣">新竹縣</option>>
					<option value="苗栗縣">苗栗縣</option>>
					<option value="台中市">台中市</option>>
					<option value="彰化縣">彰化縣</option>>
					<option value="南投縣">南投縣</option>>
					<option value="雲林縣">雲林縣</option>>
					<option value="嘉義市">嘉義市</option>>
					<option value="嘉義縣">嘉義縣</option>>
					<option value="台南市">台南市</option>>
					<option value="高雄市">高雄市</option>>
					<option value="屏東縣">屏東縣</option>>
					<option value="宜蘭縣">宜蘭縣</option>>
					<option value="花蓮縣">花蓮縣</option>>
					<option value="台東縣">台東縣</option>>
					<option value="澎湖縣">澎湖縣</option>>
					<option value="金門縣">金門縣</option>>
				</select>
							</div>
							<div class="col-md-6 mb-3">
								<label for="validationTooltip05">區域</label> <input
									type="text" class="form-control" id="validationTooltip05"
									name="town" value="${param.town}" />
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-3 mb-3">
								<label for="validationTooltip04">管理單位</label> <input
									type="text" class="form-control" id="validationTooltip05"
									name="maintain" value="${param.maintain}" />
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationTooltip05">總長(M)</label> <input
									type="text" class="form-control" id="validationTooltip05"
									name="m" value="${param.m}" />
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationTooltip04">緯度</label> <input type="text"
									class="form-control" id="validationTooltip05" name="latitude" value="${param.latitude}" />
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationTooltip05">經度</label> <input type="text"
									class="form-control" id="validationTooltip05" name="longitude" value="${param.longitude}" />
							</div>
						</div>
						<hr>
						<button class="btn btn-success my-2 my-lg-3" type="submit">送出</button>
						<button class="btn btn-danger my-2 my-lg-3 mx-2" type="reset">復原</button>
						<button class="btn btn-primary my-2 my-sm-0" type="button" onclick="history.back()" >返回</button> 
							<br>
					</form>
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
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/js/demos.js
			demo.initDashboardPageCharts();

		});
	</script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
</body>

</html>