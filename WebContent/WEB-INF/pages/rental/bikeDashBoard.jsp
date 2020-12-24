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
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">預覽報表</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">匯出報表</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> 本周
						</button>
					</div>
				</div>
				

		<!-- 上方列 12格 年度 季 月 銷售額   (分區) 開始 -->

				<div class="row">
					<div class="col-12">
						<div class="card card-chart">
							<div class="card-header ">
								<div class="row">
									<div class="col-sm-6 text-left">
										<h5 class="card-category">租車服務</h5>
										<h2 class="card-title">銷售額報表</h2>
									</div>
									<div class="col-sm-6">
										<div class="btn-group btn-group-toggle float-right"
											data-toggle="buttons">
											<label class="btn btn-sm btn-primary btn-simple active"
												id="annuel"> <input type="radio" name="options" checked>
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block" >當週銷售額</span>
												<span class="d-block d-sm-none"> 
												<i class="tim-icons icon-single-02"></i>
											</span>
											</label> <label class="btn btn-sm btn-primary btn-simple" id="1">
												<input type="radio" class="d-none d-sm-none" name="options">
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">當月銷售額</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-gift-2"></i>
											</span>
											</label> <label class="btn btn-sm btn-primary btn-simple" id="2">
												<input type="radio" class="d-none" name="options"> <span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">當年銷售額</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-tap-02"></i>
											</span>
											</label>
										</div>
									</div>
								</div>
							</div>
							
					<!--折線圖-->
							<div class="card-body">
								<div class="chart-area">
									<canvas id="annuelSale"></canvas>
								</div>
							</div>
					<!--折線圖 end-->
						
						</div>
					</div>
				</div>
				
		<!-- 上方列 12格 年度  月 週 當日 銷售額   結束 -->	
				
				
		<!--  下方列 6格  -->
		
		 <div class="row">
                              <div class="col-lg-6">
                                <div class="card card-chart" style="height:110%">
                                    <div class="card-header">
                                        <div id="changebtn7" class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                            <label class="btn btn-sm btn-primary btn-simple " id="likebtn7">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">年度銷售額</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								                    </label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="commentbtn7">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">月份銷售額</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								                    </label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="viewbtn7">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">今日銷售額</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								            </label>
                                        </div>
                                        <h3 class="card-title"><i class="tim-icons icon-send text-success"></i>門市銷售額</h3>
                                    </div>
                                    
                                    
						<!-- 今日各門市訂單 -->
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="store"></canvas>
                                        </div>
                                    </div>
                       <!-- 今日各門市訂單 -->
                                  
                                    
                                </div>
                            </div>
                            
                            
                            
                            <div class="col-lg-6">
                                <div class="card card-chart" style="height:110%">
                                    <div class="card-header">
                                        <div id="changebtn7" class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                            <label class="btn btn-sm btn-primary btn-simple active" id="totalbtn7">
								                        <input type="radio" name="options " checked>
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">總覽</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-single-02 "></i>
								                        </span>
							                      	</label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="likebtn7">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">按讚數</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								                    </label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="commentbtn7">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">評論數</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								                    </label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="viewbtn7">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">觀看次數</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								            </label>
                                        </div>
                                        <h3 class="card-title"><i class="tim-icons icon-send text-success"></i>自行車銷售額</h3>
                                    </div>
                                    
								<!--單車總類圓餅圖 -->
                                    <div class="card-body" >
                                        <div class="chart-area">
                                            <canvas id="sales"></canvas>
                                        </div>
                                    </div>
                                <!--單車總類圓餅圖 -->    
                                
                                </div>
                            </div>
                </div>
                
            <!--  下方列 6格 -->
				
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

	<!-- 套版附帶的 -->
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
	<script>
	
	$(function(){

		$.ajax({
			url : 'monthSumByArea',
			type : 'post',
			dataType : 'json',
			success : function(res) {
				annuelDetail(res);
			  }
			});
		
		function annuelDetail(res) {
			var ctx = document.getElementById('annuelSale').getContext("2d");
			var gradientStroke7 = ctx.createLinearGradient(0, 230,0,50);
			gradientStroke7.addColorStop(1, 'rgba(146,177,215,0.2)');

			var annuelRbConfig = {
					maintainAspectRatio : false,
			
				};
			
			var annuelRbData = {
					labels : [ "一月", "二月", "三月", "四月", "五月", "六月",
							   "七月", "八月", "九月", "十月", "十一月", "十二月 "],
					datasets : [{
						data : res.north,
				        label: "北部地區",
				        borderColor: "#3e95cd",
				        fill:true,
						backgroundColor : gradientStroke7,
				},{
						data : res.center,
				        label: "中部地區",
				        borderColor:"#3848a8",
				        fill:true,
						backgroundColor : gradientStroke7,
					},{
						data : res.south,
				        label: "南部地區",
				        borderColor: "#01B468",
				        fill:true,
						backgroundColor : gradientStroke7,

					},{
						data : res.east,
				        label: "東部地區",
				        borderColor: "#FF7575",
				        fill:true,
						backgroundColor : gradientStroke7,
					}],							
				};

			var config7 = {
					type: 'line',
					data : annuelRbData,
					options :annuelRbConfig
				}
				
				var annuelRbChart = new Chart(ctx, config7);
				//FUNCTION結尾

			}
	});
	
	</script>
	
	<script>
// 	new Chart(document.getElementById("sales"), {
// 	    type: 'pie',
// 	    data: {
// 	      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
// 	      datasets: [{
// 	        label: "Population (millions)",
// 	        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
// 	        data: [2478,5267,734,784,433]
// 	      }]
// 	    },
// 	    options: {
// 	      title: {

// 	        text: 'Predicted world population (millions) in 2050'
// 	      }
// 	    }
// 	});
	</script>
	
	<script>
	//各分店年度銷售量
	$(function(){
		$.ajax({
			url:'annualSaleByStore',
			type:'post',
			dataType:'json',
			success:function(res){
				console.log("啊啊啊啊啊");
				annualSaleByStore(res);
			}
		})
	})

	//-------------------------------------------------------------------------
    
	function annualSaleByStore(res) {


		new Chart(document.getElementById("store"), {
		    type: 'bar',
		    data: {
		      labels :res.stname,
		      datasets: [
		        {
		        	backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#8e5ea2"],
		 		    data:res.totalMoney,
		        }
		      ]
		    },
		      options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        text: '年度各分店總銷售額'
		      }
		    }
		});
	};

	//-------------------------------------------------------------------------	
	</script>
	
	<script>
	//各腳踏車種年度銷售量
	$(function(){
		$.ajax({
			url:'annualSaleByBike',
			type:'post',
			dataType:'json',
			success:function(res){
				annualSaleByBike(res);
			}
		})
	})

	//-------------------------------------------------------------------------
	function annualSaleByBike(res) {
		
	new Chart(document.getElementById("sales"), {
	    type: 'pie',
	    data: {
	      labels:res.typeName,
	      datasets: [{
	        label: "Population (millions)",
	        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
	        data:res.totalMoney,
	      }]
	    },
	    options: {
	      title: {

	        text: 'Predicted world population (millions) in 2050'
	      }
	    }
	});
	
  };

	</script>
	
</body>

</html>