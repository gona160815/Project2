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
							<p class="p-1">Dashboard</p>
					</a></li>
					<li><a href="adminPage.controller"> <i
							class="tim-icons icon-single-02"></i>
							<p>會員</p>
					</a></li>
					<li><a href="maintainStorePre.controller?pageNo=1"> <i
							class="tim-icons icon-cart"></i>
							<p>租車</p>
					</a></li>
					<li><a href="eventDashboard"> <i
							class="tim-icons icon-calendar-60"></i>
							<p>活動</p>
					</a></li>
					<li><a
						href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>"> <i
							class="tim-icons"><svg width="1.5em" height="1.2em"
									viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                              </svg></i>
							<p class="p-1">自行車</p>
					</a></li>
					<li class="active"><a href="sixsix.Home.controller"> <i
							class="tim-icons"><svg width="1.5em" height="1.2em"
									viewBox="0 0 16 16" class="bi bi-house-fill"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
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
					<h1 class="h2">住宿</h1>
					
				</div>

				<div class="row">
					<div class="col-12">
						<div class="card card-chart">
							<div class="card-header ">
								<div class="row">
									<div class="col-sm-6 text-left">
										<h5 class="card-category">訂單總數</h5>
										<h2 class="card-title">總共統計數量為：${order }</h2>
									</div>
									<div class="col-sm-6">
										<div class="btn-group btn-group-toggle float-right"
											data-toggle="buttons" id="myButton">
											<label class="btn btn-sm btn-primary btn-simple active"
												id="0"> <input type="radio" name="options" checked>
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">每月營業額</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-single-02"></i>
											</span>
											</label> <label class="btn btn-sm btn-primary btn-simple" id="1">
												<input type="radio" class="d-none d-sm-none" name="options">
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">每月訂房人數</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-gift-2"></i>
											</span>
											</label> 
										</div>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartBig1"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				 <div class="row">
          <div class="col-lg-8">
            <div class="card card-chart">
              <div class="card-header">
                <span class="card-category">顯示數據為各地區本站飯店民宿總數</span>
                <h2 class="card-title"><i class="tim-icons icon-bell-55 text-primary"></i> 台灣各地民宿：</h2>
              </div>
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="chartLinePurple"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card card-chart">
              <div class="card-header">
                
              	<span class="card-category">本站台灣分區數量</span>
                <h2 class="card-title"><i class="tim-icons icon-send text-success"></i>台灣四區飯店總數</h2>

              </div>
               
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="chartLineGreen"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
				<div class="row">
					<div class="col-md-12">

						<div class="card ">
							<div class="card-header">
								<h3 class="card-title">
									<a href="homestay.html">住宿資訊</a>
								</h3>


								



								<form class="form-inline float-right"
									action="sixsix.selectData.controller" method="POST">
									<div class="form-group">
									<select
										class="form-control  dropdown-toggle"
										name="place" size="1" onChange="change()">
										<option value="1">依地區查詢</option>
										<option value="2">依飯店名稱查詢</option>
										<option value="3">飯店是否含自行車位查詢</option>
									</select>
									</div>
									<div class="form-group mx-sm-3">
									 <input class="form-control " type="text"
										name="inputAdd" /> 
									</div>
										<input type="hidden" name="inputPage"
										value="1"> 
										<button class="btn btn-success"
										type="submit" >查詢</button>
								</form>

							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table tablesorter " id="">
										<thead class=" text-primary">
											<tr>
												<th>名稱</th>
												<th>縣市</th>
												<th>地址</th>
												<th class="text-center">電話</th>
												<th class="text-right"><a
													class="btn btn-success my-2 my-sm-0  "
													href="sixsix.toInsertPage.controller">
													<i class="fas fa-plus"></i>
													</a></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="x" items="${ADDD}" varStatus="status">
												<tr>
													<td><a href="sixsix.HomeDetail.controller">${x.name}</a></td>
													<td>${x.region}</td>
													<td>${x.add}</td>
													<td class="text-center">${x.tellphone}</td>
													<td class="text-right"><a
														class="btn btn-success my-2 my-sm-0  "
														href="sixsix.checkDataUpdate.controller?homenum=<c:out value="${x.id}"/>">修改</a>
														<a class="btn btn-danger my-2 my-sm-0  "
														href="sixsix.deleteData.controller?deletegood=<c:out value="${x.id}"/>">刪除</a>

													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<nav class="float-right" aria-label=" Page navigation example">
										<ul class="pagination justify-content-center">

											<c:choose>
												<c:when test="${NowPage<10}">
													<c:forEach var="page" begin="1" end="10" step="1">
														<form action="sixsix.selectData.controller" method="POST">
															<input type="hidden" name="place" value="${PLANUM}">
															<input type="hidden" name="inputAdd" value="${PLACE}">
															<li class="page-item"><button class="page-link"
																	type="sumit" name="inputPage" value="${page}">${page}</button></li>
														</form>
													</c:forEach>
												</c:when>
												<c:when test="${NowPage>=10}">
													<c:forEach var="page" begin="${NowPage-4}"
														end="${NowPage+6}" step="1">
														<form action="sixsix.selectData.controller" method="POST">
															<input type="hidden" name="place" value="${PLANUM}">
															<input type="hidden" name="inputAdd" value="${PLACE}">
															<li class="page-item"><button class="page-link"
																	type="sumit" name="inputPage" value="${page}">${page}</button></li>
														</form>
													</c:forEach>
												</c:when>

											</c:choose>

										</ul>
									</nav>
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
		//每月訂房總額
		
		$(document).ready(function() {
			
			
	
				var chartdata ;
				var ctx = document.getElementById('chartBig1')
				.getContext("2d");
		var gradientStroke7 = ctx.createLinearGradient(0, 230,
				0, 50);
		gradientStroke7.addColorStop(1, 'rgba(72,72,176,0.2)');

		var seventCongig = {
			maintainAspectRatio : false,
			legend : {
				display : false
			},

			tooltips : {
				backgroundColor : '#f5f5f5',
				titleFontColor : '#333',
				bodyFontColor : '#666',
				bodySpacing : 4,
				xPadding : 12,
				mode : "nearest",
				intersect : 0,
				position : "nearest"
			},
			responsive : true,
			scales : {
				yAxes : [ {
					barPercentage : 1.4,
					gridLines : {
						drawBorder : false,
						color : 'rgba(29,140,248,0.0)',
						zeroLineColor : "transparent",
					},
					ticks : {
						suggestedMin : 10,
						suggestedMax : 50,
						padding : 10,
						fontColor : "#9a9a9a"
					}
				} ],

				xAxes : [ {
					barPercentage : 1.4,
					gridLines : {
						drawBorder : false,
						color : 'rgba(225,78,202,0.1)',
						zeroLineColor : "transparent",
					},
					ticks : {
						padding : 10,
						fontColor : "#9a9a9a"
					}
				} ]
			}
		};
				
				
	
	 var data0 = {
			
			labels : [ "一月", "二月", "三月", "四月", "五月", "六月",
					"七月", "八月", "九月", "十月", "十一月", "十二月 "],
			datasets : [{
				type : "line",
				label : "當月營業額",
				fill : true,
				backgroundColor : gradientStroke7,
				borderColor : '#3e95cd',
				borderWidth : 2,
				borderDash : [],
				borderDashOffset : 0.0,
				pointBackgroundColor : '#3e95cd',
				pointBorderColor : 'rgba(255,255,255,0)',
				pointHoverBackgroundColor : '#00d6b4',
				pointBorderWidth : 20,
				pointHoverRadius : 4,
				pointHoverBorderWidth : 15,
				pointRadius : 4,
				data : ${list},
			}]

		};
	 
	 
	 
	 var config = {
				type : 'bar',
				data : data0,
				options : seventCongig
			}
			
			ctx = document.getElementById('chartBig1')
					.getContext("2d");
	 
			var sevenChart = new Chart(ctx, config);
	
			
			
			
		
	
		
			
		$("#0").on(
				"click",
				function() {
					
					
					
					$.ajax({
						url : 'sixsix.countMonthMoney.json',
						type : 'post',
						dataType : 'json',
						success : function(res) {
							console.log(res);
							cartDetail0(res);
							
							

						}
					});
					
					
					
				

					function cartDetail0(res) {
						console.log(res.list);

						var ctx = document.getElementById('chartBig1')
								.getContext("2d");
						var gradientStroke7 = ctx.createLinearGradient(0, 230,
								0, 50);
						gradientStroke7.addColorStop(1, 'rgba(72,72,176,0.2)');

						var seventCongig = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},

							tooltips : {
								backgroundColor : '#f5f5f5',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.4,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 10,
										suggestedMax : 50,
										padding : 10,
										fontColor : "#9a9a9a"
									}
								} ],

								xAxes : [ {
									barPercentage : 1.4,
									gridLines : {
										drawBorder : false,
										color : 'rgba(225,78,202,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 10,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
						//坐標軸結尾
						console.log(res.list);
						var data0 = {
								
							labels : [ "一月", "二月", "三月", "四月", "五月", "六月",
									"七月", "八月", "九月", "十月", "十一月", "十二月 "],
							datasets : [{
								type : "line",
								label : "當月營業額",
								fill : true,
								backgroundColor : gradientStroke7,
								borderColor : '#3e95cd',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#3e95cd',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#00d6b4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : res.list
							}]

						};
						
						sevenChart.config.data = data0;
						sevenChart.config.options = seventCongig;
						sevenChart.update();
						
						
				

						//FUNCTION結尾
					}

				});

		//每月訂房總人數
		$("#1").on("click", function() {
			
			
			
			$.ajax({
				url : 'sixsix.countMonthNum.json',
				type : 'post',
				dataType : 'json',
				success : function(res) {
					cartDetail1(res);
					
				}
			});
			
			function cartDetail1(res) {
				console.log(res.list);

				
				var ctx = document.getElementById('chartBig1')
						.getContext("2d");
				var gradientStroke7 = ctx.createLinearGradient(0, 230,
						0, 50);
				gradientStroke7.addColorStop(1, 'rgba(72,72,176,0.2)');

				var seventCongig = {
					maintainAspectRatio : false,
					legend : {
						display : false
					},

					tooltips : {
						backgroundColor : '#f5f5f5',
						titleFontColor : '#333',
						bodyFontColor : '#666',
						bodySpacing : 4,
						xPadding : 12,
						mode : "nearest",
						intersect : 0,
						position : "nearest"
					},
					responsive : true,
					scales : {
						yAxes : [ {
							barPercentage : 1.4,
							gridLines : {
								drawBorder : false,
								color : 'rgba(29,140,248,0.0)',
								zeroLineColor : "transparent",
							},
							ticks : {
								suggestedMin : 10,
								suggestedMax : 50,
								padding : 10,
								fontColor : "#9a9a9a"
							}
						} ],

						xAxes : [ {
							barPercentage : 1.4,
							gridLines : {
								drawBorder : false,
								color : 'rgba(225,78,202,0.1)',
								zeroLineColor : "transparent",
							},
							ticks : {
								padding : 10,
								fontColor : "#9a9a9a"
							}
						} ]
					}
				};
				//坐標軸結尾
				console.log(res.list);
				var data1 = {
						
					labels : [ "一月", "二月", "三月", "四月", "五月", "六月",
							"七月", "八月", "九月", "十月", "十一月", "十二月 "],
					datasets : [{
						type : "line",
						label : "當月消費人數",
						fill : true,
						backgroundColor : gradientStroke7,
						borderColor : '#00d6b4',
						borderWidth : 2,
						borderDash : [],
						borderDashOffset : 0.0,
						pointBackgroundColor : '#00d6b4',
						pointBorderColor : 'rgba(255,255,255,0)',
						pointHoverBackgroundColor : '#00d6b4',
						pointBorderWidth : 20,
						pointHoverRadius : 4,
						pointHoverBorderWidth : 15,
						pointRadius : 4,
						data : res.list
					}]

				};
				
				sevenChart.config.data = data1;
				sevenChart.config.options = seventCongig;
				sevenChart.update();
				
				
				

				//FUNCTION結尾
			}
			
			
		});
		
		
		//每月還在思考要加甚麼
		$("#2").on("click", function() {
			var chooseButton = $(this).next().val(); //選取

			console.log("----------------------");

			console.log(chooseButton);

		});
		
		
		
		//柱狀圖開始
		
		gradientChartOptionsConfigurationWithTooltipPurple = {
      maintainAspectRatio: false,
      legend: {
        display: true
      },

      tooltips: {
        backgroundColor: '#f5f5f5',
        titleFontColor: '#333',
        bodyFontColor: '#666',
        bodySpacing: 4,
        xPadding: 12,
        mode: "nearest",
        intersect: 0,
        position: "nearest"
      },
      responsive: true,
      scales: {
        yAxes: [{
          barPercentage: 1.6,
          gridLines: {
            drawBorder: false,
            color: 'rgba(29,140,248,0.0)',
            zeroLineColor: "transparent",
          },
          ticks: {
            suggestedMin: 0,
            suggestedMax: 50,
            padding: 10,
            fontColor: "#9a9a9a"
          }
        }],

        xAxes: [{
          barPercentage: 0.8,
          gridLines: {
            drawBorder: false,
            color: 'rgba(225,78,202,0.1)',
            zeroLineColor: "transparent",
          },
          ticks: {
            padding: 20,
            fontColor: "#9a9a9a"
          }
        }]
      }
    };
		
		$.ajax({
			url : 'sixsix.hotelTotalNum.json',
			type : 'post',
			dataType : 'json',
			success : function(res) {
				
		var ctx2 = document.getElementById("chartLinePurple").getContext("2d");

	    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

	    gradientStroke2.addColorStop(1, 'rgba(72,72,176,0.5)');
	    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.5)');
	    gradientStroke2.addColorStop(0, 'rgba(119,52,169,5)'); //purple colors

	    var data2 = {
	      labels: ["臺北","新北","桃園","新竹","苗栗","臺中","南投","彰化","雲林","嘉義","臺南","高雄","屏東","臺東","花蓮","宜蘭","金門","蘭嶼","綠島"],
	      legend: {
		        display: true
		      },
	      datasets: [{
	        label: "全台各地民宿飯店總數",
	        fill: true,
	        backgroundColor: ['#5CADAD','rgba(29,140,248,1)','#FFAAD5','#FFAF60','#82D900','#844200','#CA8EC2','#6A6AFF','#00FFFF','#53FF53','#82D900','#F9F900','#D9B300','#FFBB77','#B87070','#B9B973','#A6A6D2','#95CACA','#D2A2CC'],
	        borderColor: ['#5CADAD','rgba(29,140,248,1)','#FFAAD5','#FFAF60','#82D900','#844200','#CA8EC2','#6A6AFF','#00FFFF','#53FF53','#82D900','#F9F900','#D9B300','#FFBB77','#B87070','#B9B973','#A6A6D2','#95CACA','#D2A2CC'],
	        borderWidth: 2,
	        borderDash: [],
	        borderDashOffset: 0.0,
	        pointBackgroundColor: '#d048b6',
	        pointBorderColor: 'rgba(255,255,255,0)',
	        pointHoverBackgroundColor: '#d048b6',
	        pointBorderWidth: 20,
	        pointHoverRadius: 4,
	        pointHoverBorderWidth: 15,
	        pointRadius: 4,
	        data: res.list,
	      }]
	    };
		
	    var myChart2 = new Chart(ctx2, {
	      type: 'bar',
	      responsive: true,
	      legend: {
		        display: true
		      },
	      data: data2,
	      options: gradientChartOptionsConfigurationWithTooltipPurple
	    });
	    
			}
		});
	    //柱狀圖結束
		
		
		//圓餅圖開始
			
		$.ajax({
			url : 'sixsix.hotelAreaTotalNum.json',
			type : 'post',
			dataType : 'json',
			success : function(res) {
		
		
		
			var ctx3 = document.getElementById("chartLineGreen").getContext("2d");
	
	var myDoughnutChart = new Chart(ctx3, {
	    type: 'doughnut',
	    data: {
	      labels: ["北部", "西部", "南部", "東部"],
	      datasets: [
	        {
	          label: "各區飯店數",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
	          data: res.list,
	        }
	      ]
	    },
	    options: {
	      
	      responsive: true,
	      legend: {
		        display: true
		      }
	    }
	    //
	    ,tooltips: {
	        callbacks: {
	          label: function(tooltipItem, data) {
	          	var dataset = data.datasets[tooltipItem.datasetIndex];
	            var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
	              return previousValue + currentValue;
	            });
	            var currentValue = dataset.data[tooltipItem.index];
	            var percentage = Math.floor(((currentValue/total) * 100)+0.5);         
	            return percentage + "%";
	          }
	        }
	      }
	    //
	});
		

	
			}
		});
		//圓餅圖結束
		
		
		});
	</script>

</body>

</html>