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
					<li><a href="adminPage.controller"> <i
							class="tim-icons icon-single-02"></i>
							<p>會員</p>
					</a></li>
					<li class="active "><a href="maintainStorePre.controller?pageNo=1"> <i
							class="tim-icons icon-cart"></i>
							<p>租車</p>
					</a></li>
					<li><a href="eventDashboard"> <i
							class="tim-icons icon-calendar-60"></i>
							<p>活動</p>
					</a></li>
					<li><a href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-bicycle" fill="currentColor"
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
					<li><a href="toSettingPage?authority=2"> <i
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
					<h1 class="h2">租車</h1>
				</div>

				<div class="row">
					<div class="col-md-12">

						<div class="card ">
							<div class="card-header">
								<h3 class="card-title">
									<a href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">門市管理</a>
									<a href="<c:url value='/MaintainBikePre.controller'/>">腳踏車管理</a>
								</h3>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									
										<table class="table tablesorter " id="">
											<thead class=" text-primary">
												<tr>
													<th>腳踏車名稱</th>
													<th>尺寸</th>
													<th class="text-right"><a
														class="btn btn-success my-2 my-sm-0"
														href="storePreInsert"><i class="fas fa-plus"></i></a></th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="BikeBean" items="${bike_DPP}">
											
												<tr>
													<td>${BikeBean.simBike.rbName}</td>
													<td>${BikeBean.rbSize.rbSize}</td>
													<td class="text-right">
														<input class="btn btn-success my-2 my-sm-0" type="button" value="修改"  onclick="javascript:location.href='updateSimBikePre?simRbId=<c:out value="${BikeBean.rbId}"/>'"/>
														<input class="btn btn-danger my-2 my-sm-0" type="button" value="刪除"   onclick="javascript:location.href='updateSimBikePre?simRbId=<c:out value="${BikeBean.rbId}"/>'"/>
												</tr>
											</c:forEach>

											</tbody>
										</table>
								
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="js/core/jquery.min.js"></script>
	<script src="js/core/popper.min.js"></script>
	<script src="js/core/bootstrap.min.js"></script>
	<script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Chart JS -->
	<script src="js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="js/black-dashboard.min.js?v=1.0.0"></script>

	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
</body>

</html>