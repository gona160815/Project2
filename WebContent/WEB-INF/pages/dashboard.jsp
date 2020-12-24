<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
            <link rel="icon" type="image/png" href="img/favicon.png">
            <title>
                EEIT124Team1
            </title>
            <!--     Fonts and icons     -->
            <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
            <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
            <!-- Nucleo Icons -->
            <link href="css/nucleo-icons.css" rel="stylesheet" />
            <!-- CSS Files -->
            <link href="css/black-dashboard.css" rel="stylesheet" />
        </head>

        <body class="white-content">
            <div class="wrapper">
                <div class="sidebar" data="blue">

                    <div class="sidebar-wrapper">
                        <div class="logo">
                            <a href="javascript:void(0)" class="simple-text logo-mini">
                III
                </a>
                            <a href="javascript:void(0)" class="simple-text logo-normal">
                        EEIT124Team1
                </a>
                        </div>
                        <ul class="nav">
                            <li class="active">
                                <a href="dashboard"> <i class="tim-icons icon-chart-pie-36"></i>
                                    <p class="p-1">Dashboard</p>
                                </a>
                            </li>
                            <li>
                                <a href="adminPage.controller"> <i class="tim-icons icon-single-02"></i>
                                    <p>會員</p>
                                </a>
                            </li>
                            <li>
                                <a href="maintainStorePre.controller?pageNo=1"> <i class="tim-icons icon-cart"></i>
                                    <p>租車</p>
                                </a>
                            </li>
                            <li>
                                <a href="eventDashboard"> <i class="tim-icons icon-calendar-60"></i>
                                    <p>活動</p>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-bicycle" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                              </svg></i>
                                    <p class="p-1">自行車</p>
                                </a>
                            </li>
                            <li>
                                <a href="sixsix.Home.controller"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-house-fill" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                <path fill-rule="evenodd"
										d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                              </svg></i>
                                    <p class="p-1">住宿</p>
                                </a>
                            </li>

                            <li>
                                <a href="toSettingPage?authority=2"> <i class="tim-icons icon-settings-gear-63"></i>
                                    <p>設定</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="main-panel">
                    <!-- Navbar -->
                    <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
                        <div class="container-fluid">
                            <div class="navbar-wrapper">
                                <div class="navbar-toggle d-inline">
                                    <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
                                </div>
                            </div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
                            <div class="collapse navbar-collapse" id="navigation">
                            </div>
                        </div>
                    </nav>
                    <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Navbar -->

                    <div class="content">

                        <div class="row">
                            <div class="col-lg-7">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <span class="card-category">顯示數據為近七日之會員註冊數</span>
                                                <h2 class="card-title">
                                                    <i style="color:orange;font-size:25px" class="fas fa-user"></i>會員註冊數
                                                </h2>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                                    <label class="btn btn-sm btn-primary btn-simple active" id="A"> <input type="radio" name="options" checked>
                                                        <span
                                                        class="d-none d-sm-block d-md-block d-lg-block d-xl-block">今日會員註冊數</span>
                                                        <span class="d-block d-sm-none"> <i
                                                            class="tim-icons icon-single-02"></i>
                                                    </span>
                                                    </label> <label class="btn btn-sm btn-primary btn-simple " id="B">
                                                        <input type="radio" name="options" checked> <span
                                                        class="d-none d-sm-block d-md-block d-lg-block d-xl-block">本周會員註冊數</span>
                                                        <span class="d-block d-sm-none"> <i
                                                            class="tim-icons icon-single-02"></i>
                                                    </span>
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="chartLinePurple"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="card card-chart">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-sm-6 text-left">
                                                <h5 class="card-category">租車服務</h5>
                                                <h2 class="card-title">銷售額報表</h2>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                                    <label class="btn btn-sm btn-primary btn-simple active" id="annuel"> 
                                                        <input type="radio" name="options" checked>
												<span class="d-none d-sm-block d-md-block d-lg-block d-xl-block" >當週</span>
												<span class="d-block d-sm-none"> 
												<i class="tim-icons icon-single-02"></i>
                                                </span>
                                                </label>
                                                    <label class="btn btn-sm btn-primary btn-simple" id="1">
                                                    <input type="radio" class="d-none d-sm-none" name="options">
                                                    <span
                                                    class="d-none d-sm-block d-md-block d-lg-block d-xl-block">當月</span>
                                                    <span class="d-block d-sm-none"> <i
                                                        class="tim-icons icon-gift-2"></i>
                                                </span>
                                                </label> <label class="btn btn-sm btn-primary btn-simple" id="2">
                                                    <input type="radio" class="d-none" name="options"> 
                                                    <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">當年</span>
                                                    <span class="d-block d-sm-none"> <i
                                                        class="tim-icons icon-tap-02"></i>
                                                </span>
                                                </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="annuelSale"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <div id="changebtn" class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                            <label class="btn btn-sm btn-primary btn-simple active" id="week">
                                                <input type="radio" class="d-none d-sm-none " name="options ">
                                                <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">本周</span>
                                                <span class="d-block d-sm-none ">
                                                  <i class="tim-icons icon-gift-2 "></i>
                                                </span>
                                            </label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="month">
								                        <input type="radio" name="options " checked>
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">近三十日</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-single-02 "></i>
								                        </span>
							                      	</label>
                                            <label class="btn btn-sm btn-primary btn-simple " id="year">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">年度總覽</span>
								                        <span class="d-block d-sm-none ">
								                          <i class="tim-icons icon-gift-2 "></i>
								                        </span>
								                    </label>

                                        </div>
                                        <span class="card-category">行程</span>
                                        <h3 class="card-title"><i class="tim-icons icon-bell-55 text-primary"></i>營業額數據</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="actNameChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="card card-chart">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-sm-6 text-left">
                                                <h5 class="card-category">住宿訂單總數</h5>
                                                <h2 class="card-title">總共統計數量為：${order }</h2>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="btn-group btn-group-toggle float-right" data-toggle="buttons" id="myButton">
                                                    <label class="btn btn-sm btn-primary btn-simple active" id="0"> <input type="radio" name="options" checked>
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

            <script>
                $(function() {
                    //========= RENTAL CHART START=======
                    $.ajax({
                        url: 'monthSumByArea',
                        type: 'post',
                        dataType: 'json',
                        success: function(res) {
                            annuelDetail(res);
                        }
                    });

                    function annuelDetail(res) {
                        var ctx = document.getElementById('annuelSale').getContext("2d");
                        var gradientStroke7 = ctx.createLinearGradient(0, 230, 0, 50);
                        gradientStroke7.addColorStop(1, 'rgba(146,177,215,0.2)');

                        var annuelRbConfig = {
                            maintainAspectRatio: false,

                        };

                        var annuelRbData = {
                            labels: ["一月", "二月", "三月", "四月", "五月", "六月",
                                "七月", "八月", "九月", "十月", "十一月", "十二月 "
                            ],
                            datasets: [{
                                data: res.north,
                                label: "北部地區",
                                borderColor: "#3e95cd",
                                fill: true,
                                backgroundColor: gradientStroke7,
                            }, {
                                data: res.center,
                                label: "中部地區",
                                borderColor: "#3848a8",
                                fill: true,
                                backgroundColor: gradientStroke7,
                            }, {
                                data: res.south,
                                label: "南部地區",
                                borderColor: "#01B468",
                                fill: true,
                                backgroundColor: gradientStroke7,

                            }, {
                                data: res.east,
                                label: "東部地區",
                                borderColor: "#FF7575",
                                fill: true,
                                backgroundColor: gradientStroke7,
                            }],
                        };

                        var config7 = {
                            type: 'line',
                            data: annuelRbData,
                            options: annuelRbConfig
                        }

                        var annuelRbChart = new Chart(ctx, config7);
                        //FUNCTION結尾

                    };
                    // ============REATAL CHART END=============
                    //========= ACTIVITY CHART START============
                    $.ajax({
                        type: "post",
                        url: "actNameData",
                        dataType: "json",
                        success: function(res) {
                            console.log(res);
                            var weekLabel = res.weekDate;
                            var monthLabel = res.monthDate;
                            var yearLabel = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];


                            var weekData = res.weekRevenue;
                            var monthData = res.monthRevenue;
                            var yearData = res.yearRevenue;

                            var ctx = document.getElementById("actNameChart").getContext("2d");
                            var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

                            gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
                            gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
                            gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors



                            var actConfig = {
                                maintainAspectRatio: false,
                                legend: {
                                    display: false
                                },

                                tooltips: {
                                    backgroundColor: '#f5f5f5',
                                    titleFontColor: '#333',
                                    bodyFontColor: '#666',
                                    bodySpacing: 4,
                                    xPadding: 5,
                                    mode: "nearest",
                                    intersect: 0,
                                    position: "nearest"
                                },
                                responsive: true,
                                scales: {
                                    yAxes: [{
                                        barPercentage: 1.4,
                                        gridLines: {
                                            drawBorder: false,
                                            color: 'rgba(29,140,248,0.0)',
                                            zeroLineColor: "transparent",
                                        },
                                        ticks: {
                                            suggestedMin: 10,
                                            suggestedMax: 50,
                                            padding: 10,
                                            fontColor: "#9a9a9a"
                                        }
                                    }],

                                    xAxes: [{
                                        barPercentage: 1.4,
                                        gridLines: {
                                            drawBorder: false,
                                            color: 'rgba(225,78,202,0.1)',
                                            zeroLineColor: "transparent",
                                        },
                                        ticks: {
                                            padding: 5,
                                            fontColor: "#9a9a9a"
                                        }
                                    }]
                                }
                            };
                            var data = {
                                labels: weekLabel,
                                datasets: [{
                                    type: "line",
                                    label: "營業額",
                                    fill: true,
                                    backgroundColor: gradientStroke,
                                    borderColor: '#00d6b4',
                                    borderWidth: 2,
                                    borderDash: [],
                                    borderDashOffset: 0.0,
                                    pointBackgroundColor: '#00d6b4',
                                    pointBorderColor: 'rgba(255,255,255,0)',
                                    pointHoverBackgroundColor: '#00d6b4',
                                    pointBorderWidth: 20,
                                    pointHoverRadius: 4,
                                    pointHoverBorderWidth: 15,
                                    pointRadius: 4,
                                    data: weekData,
                                }]
                            };

                            var config = {
                                type: 'bar',
                                data: data,
                                options: actConfig
                            }

                            var actNameChart = new Chart(ctx, config);

                            $("#week").on("click", function() {
                                var data = actNameChart.config.data;
                                data.datasets[0].data = weekData;
                                data.labels = weekLabel;
                                actNameChart.update();
                            });

                            $("#month").on("click", function() {
                                var data = actNameChart.config.data;
                                data.datasets[0].data = monthData;
                                data.labels = monthLabel;
                                actNameChart.update();
                            });

                            $("#year").on("click", function() {
                                var data = actNameChart.config.data;
                                data.datasets[0].data = yearData;
                                data.labels = yearLabel;
                                actNameChart.update();
                            });
                        }
                    });
                    //============ ACTIVITY CHART END===========


                    // ===============MEMBER CHART START================
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


                    var ctx2 = document.getElementById("chartLinePurple").getContext("2d");

                    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

                    gradientStroke2.addColorStop(1, 'rgba(72,72,176,0.5)');
                    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.5)');
                    gradientStroke2.addColorStop(0, 'rgba(119,52,169,5)'); //purple colors

                    var data2 = {
                        labels: ['總數', '男性', '女性', '其他', '未驗證會員', '已驗證會員', "停權會員"],
                        legend: {
                            display: true
                        },
                        datasets: [{
                            label: "今日會員註冊數",
                            fill: true,
                            backgroundColor: ['#5CADAD', 'rgba(29,140,248,1)', '#FFAAD5', '#FFAF60', '#82D900', '#844200', '#CA8EC2'],
                            borderColor: ['#5CADAD', 'rgba(29,140,248,1)', '#FFAAD5', '#FFAF60', '#82D900', '#844200', '#CA8EC2'],
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
                            data: [80, 100, 70, 80, 120, 80],
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

                    var chartdata2;

                    $.ajax({
                        type: "post",
                        url: "getdaymember.controller",
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            var allnum = data.weekallnum
                            var male = data.weekallMale
                            var malenum = male.length
                            var female = data.weekallFemale
                            var femalenum = female.length
                            var other = data.weekallOther
                            var othernum = other.length
                            var basicnum = data.weekallBasic.length
                            var advancednum = data.weekallAdvanced.length
                            var deletenum = data.weekallDelete.length


                            chartdata2 = [allnum, malenum, femalenum, othernum, basicnum, advancednum, deletenum];
                            data2.datasets[0].data = chartdata2;
                            myChart2.update();
                        }
                    });

                    $("#A").on("click", function() {

                        $.ajax({
                            type: "post",
                            url: "getdaymember.controller",
                            dataType: "json",
                            success: function(data) {
                                console.log(data);
                                var allnum = data.weekallnum
                                var male = data.weekallMale
                                var malenum = male.length
                                var female = data.weekallFemale
                                var femalenum = female.length
                                var other = data.weekallOther
                                var othernum = other.length
                                var basicnum = data.weekallBasic.length
                                var advancednum = data.weekallAdvanced.length
                                var deletenum = data.weekallDelete.length


                                chartdata2 = [allnum, malenum, femalenum, othernum, basicnum, advancednum, deletenum];
                                data2.datasets[0].data = chartdata2;
                                data2.datasets[0].label = "今日會員註冊數";
                                myChart2.update();
                            }
                        });
                    })
                    $("#B").on("click", function() {
                        $.ajax({
                            type: "post",
                            url: "getweekmember.controller",
                            dataType: "json",
                            success: function(data) {
                                console.log(data);
                                var allnum = data.weekallnum
                                var male = data.weekallMale
                                var malenum = male.length
                                var female = data.weekallFemale
                                var femalenum = female.length
                                var other = data.weekallOther
                                var othernum = other.length
                                var basicnum = data.weekallBasic.length
                                var advancednum = data.weekallAdvanced.length
                                var deletenum = data.weekallDelete.length


                                chartdata2 = [allnum, malenum, femalenum, othernum, basicnum, advancednum, deletenum];
                                data2.datasets[0].data = chartdata2;
                                data2.datasets[0].label = "本周會員註冊數";
                                myChart2.update();
                            }
                        })
                    });
                    //============ MEMBER CHART END===============



                    // ============ HOTEL CHART START=================

                    var chartdata;
                    var ctx = document.getElementById('chartBig1')
                        .getContext("2d");
                    var gradientStroke7 = ctx.createLinearGradient(0, 230,
                        0, 50);
                    gradientStroke7.addColorStop(1, 'rgba(72,72,176,0.2)');

                    var seventCongig = {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
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
                                barPercentage: 1.4,
                                gridLines: {
                                    drawBorder: false,
                                    color: 'rgba(29,140,248,0.0)',
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    suggestedMin: 10,
                                    suggestedMax: 50,
                                    padding: 10,
                                    fontColor: "#9a9a9a"
                                }
                            }],

                            xAxes: [{
                                barPercentage: 1.4,
                                gridLines: {
                                    drawBorder: false,
                                    color: 'rgba(225,78,202,0.1)',
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    padding: 10,
                                    fontColor: "#9a9a9a"
                                }
                            }]
                        }
                    };



                    var data0 = {

                        labels: ["一月", "二月", "三月", "四月", "五月", "六月",
                            "七月", "八月", "九月", "十月", "十一月", "十二月 "
                        ],
                        datasets: [{
                            type: "line",
                            label: "當月營業額",
                            fill: true,
                            backgroundColor: gradientStroke7,
                            borderColor: '#3e95cd',
                            borderWidth: 2,
                            borderDash: [],
                            borderDashOffset: 0.0,
                            pointBackgroundColor: '#3e95cd',
                            pointBorderColor: 'rgba(255,255,255,0)',
                            pointHoverBackgroundColor: '#00d6b4',
                            pointBorderWidth: 20,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 15,
                            pointRadius: 4,
                            data: ${list},
                        }],

                    };



                    var config = {
                        type: 'bar',
                        data: data0,
                        options: seventCongig
                    }

                    ctx = document.getElementById('chartBig1')
                        .getContext("2d");

                    var sevenChart = new Chart(ctx, config);








                    $("#0").on(
                        "click",
                        function() {



                            $.ajax({
                                url: 'sixsix.countMonthMoney.json',
                                type: 'post',
                                dataType: 'json',
                                success: function(res) {
                                    console.log(res);
                                    cartDetail0(res);



                                }
                            });


                        });


                    function cartDetail0(res) {
                        console.log(res.list);

                        var ctx = document.getElementById('chartBig1')
                            .getContext("2d");
                        var gradientStroke7 = ctx.createLinearGradient(0, 230,
                            0, 50);
                        gradientStroke7.addColorStop(1, 'rgba(72,72,176,0.2)');

                        var seventCongig = {
                            maintainAspectRatio: false,
                            legend: {
                                display: false
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
                                    barPercentage: 1.4,
                                    gridLines: {
                                        drawBorder: false,
                                        color: 'rgba(29,140,248,0.0)',
                                        zeroLineColor: "transparent",
                                    },
                                    ticks: {
                                        suggestedMin: 10,
                                        suggestedMax: 50,
                                        padding: 10,
                                        fontColor: "#9a9a9a"
                                    }
                                }],

                                xAxes: [{
                                    barPercentage: 1.4,
                                    gridLines: {
                                        drawBorder: false,
                                        color: 'rgba(225,78,202,0.1)',
                                        zeroLineColor: "transparent",
                                    },
                                    ticks: {
                                        padding: 10,
                                        fontColor: "#9a9a9a"
                                    }
                                }]
                            }
                        };
                        //坐標軸結尾
                        console.log(res.list);
                        var data0 = {

                            labels: ["一月", "二月", "三月", "四月", "五月", "六月",
                                "七月", "八月", "九月", "十月", "十一月", "十二月 "
                            ],
                            datasets: [{
                                type: "line",
                                label: "當月營業額",
                                fill: true,
                                backgroundColor: gradientStroke7,
                                borderColor: '#3e95cd',
                                borderWidth: 2,
                                borderDash: [],
                                borderDashOffset: 0.0,
                                pointBackgroundColor: '#3e95cd',
                                pointBorderColor: 'rgba(255,255,255,0)',
                                pointHoverBackgroundColor: '#00d6b4',
                                pointBorderWidth: 20,
                                pointHoverRadius: 4,
                                pointHoverBorderWidth: 15,
                                pointRadius: 4,
                                data: res.list
                            }]

                        };

                        sevenChart.config.data = data0;
                        sevenChart.config.options = seventCongig;
                        sevenChart.update();




                        //FUNCTION結尾
                    }


                    //每月訂房總人數
                    $("#1").on("click", function() {



                        $.ajax({
                            url: 'sixsix.countMonthNum.json',
                            type: 'post',
                            dataType: 'json',
                            success: function(res) {
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
                                maintainAspectRatio: false,
                                legend: {
                                    display: false
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
                                        barPercentage: 1.4,
                                        gridLines: {
                                            drawBorder: false,
                                            color: 'rgba(29,140,248,0.0)',
                                            zeroLineColor: "transparent",
                                        },
                                        ticks: {
                                            suggestedMin: 10,
                                            suggestedMax: 50,
                                            padding: 10,
                                            fontColor: "#9a9a9a"
                                        }
                                    }],

                                    xAxes: [{
                                        barPercentage: 1.4,
                                        gridLines: {
                                            drawBorder: false,
                                            color: 'rgba(225,78,202,0.1)',
                                            zeroLineColor: "transparent",
                                        },
                                        ticks: {
                                            padding: 10,
                                            fontColor: "#9a9a9a"
                                        }
                                    }]
                                }
                            };
                            //坐標軸結尾
                            console.log(res.list);
                            var data1 = {

                                labels: ["一月", "二月", "三月", "四月", "五月", "六月",
                                    "七月", "八月", "九月", "十月", "十一月", "十二月 "
                                ],
                                datasets: [{
                                    type: "line",
                                    label: "當月消費人數",
                                    fill: true,
                                    backgroundColor: gradientStroke7,
                                    borderColor: '#00d6b4',
                                    borderWidth: 2,
                                    borderDash: [],
                                    borderDashOffset: 0.0,
                                    pointBackgroundColor: '#00d6b4',
                                    pointBorderColor: 'rgba(255,255,255,0)',
                                    pointHoverBackgroundColor: '#00d6b4',
                                    pointBorderWidth: 20,
                                    pointHoverRadius: 4,
                                    pointHoverBorderWidth: 15,
                                    pointRadius: 4,
                                    data: res.list
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

                    // ===============HOTEL CHART END============
                });
            </script>


            <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
            <script>
                window.TrackJS &&
                    TrackJS.install({
                        token: "ee6fab19c5a04ac1a32a645abde4613a",
                        application: "black-dashboard-free"
                    });
            </script>
        </body>

        </html>