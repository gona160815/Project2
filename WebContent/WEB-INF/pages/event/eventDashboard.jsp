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
            <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
            <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2/dist/Chart.min.js"></script> -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
            <style>

            </style>
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
                            <li>
                                <a href="<c:url value='/dashboard'/>">
                                    <i class="tim-icons icon-chart-pie-36"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/adminPage.controller'/>">
                                    <i class="tim-icons icon-single-02"></i>
                                    <p>會員</p>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">
                                    <i class="tim-icons icon-cart "></i>
                                    <p>租車</p>
                                </a>
                            </li>
                            <li class="active">
                                <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"> <i class="tim-icons icon-calendar-60"></i>
                                    <p>活動</p>
                                </a>
                                <div class="collapse" id="collapseExample">
                                    <div class="container card card-body">
                                        <a class="my-2" href="eventDashboard">Dashboard</a>
                                        <a class="my-2" href="eventMgr">活動管理</a>
                                        <a class="my-2" href="activityMgr">行程管理</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>">
                                    <i class="tim-icons"><svg width="1.5em" height="1.2em" viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z"/>
                              </svg></i>
                                    <p class="p-1">自行車</p>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/sixsix.Home.controller'/>">
                                    <i class="tim-icons"><svg width="1.5em" height="1.2em" viewBox="0 0 16 16" class="bi bi-house-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                              </svg></i>
                                    <p class="p-1">住宿</p>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/toSettingPage?authority=2'/>">
                                    <i class="tim-icons icon-settings-gear-63"></i>
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

                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h1 class="h2">活動</h1>


                            <div class="btn-toolbar mb-2 mb-md-0">
                                <div class="btn-group mr-2">
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="dropdown">
	                                              	  預覽報表		
	                                    </button>
                                        <div id="view" class="view dropdown-menu dropdown-menu-left" aria-labelledby="">
                                            <a href="eventAllData" id="view-json" class="dropdown-item">JSON</a>
                                            <!-- <button id="view-excel" class="dropdown-item">EXCEL</button> -->
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="dropdown">
	                                              	  匯出報表		
	                                    </button>
                                        <div id="export" class="export dropdown-menu dropdown-menu-right" aria-labelledby="">
                                            <a href="eventAllData" download="eventChart.json" id="export-json" class="dropdown-item">JSON</a>
                                            <!-- <a id="export-excel" class="dropdown-item">EXCEL</a> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="dropdown">
                                    <button class="btn btn-info dropdown-toggle btn-sm mb-2 mb-md-0" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">儲存圖表
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a id="exportToday-png" class="dropdown-item" download="eventTodayChart.png">今日數據</a>
                                        <a id="export7-png" class="dropdown-item" download="event7daysChart.png">近七日數據</a>
                                        <a id="export30-png" class="dropdown-item" href="javascript:void(0)" download="event30daysChart.png">近三十日數據</a>
                                        <a id="exportYear-png" class="dropdown-item" download="eventYearChart.png">年度分析</a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card card-chart">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-sm-6 text-left">
                                                <h5 class="card-category">活動</h5>
                                                <h2 id="firstTitle" class="card-title"><i class="fas fa-chart-line fa-7x text-primary"></i>年度分析</h2>
                                            </div>
                                            <div class="col-sm-6">
                                                <div id="categorybtn" class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                                    <label class="btn btn-sm btn-info btn-simple active" id="catmon">
								                        <input type="radio" name="options " checked>
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">年度</span>
								                        
							                      	</label>
                                                    <label class="btn btn-sm btn-info btn-simple " id="cat30">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">近三十日</span>
								                        
								                    </label>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="chart-area">
                                            <canvas id="monthly"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <h3 class="card-title"><i style="color:rgb(223, 223, 20)" class="tim-icons icon-bell-55 "></i>今日數據</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="today"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card card-chart">
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
                                        <h3 class="card-title"><i class="tim-icons icon-send text-success"></i>近七日數據</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="sevenDays"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--   Core JS Files   -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="js/core/popper.min.js"></script>
                <script src="js/core/bootstrap.min.js"></script>
                <script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
                <!-- Chart JS -->
                <!-- <script src="js/plugins/chartjs.min.js"></script> -->

                <!--  Notifications Plugin    -->
                <script src="js/plugins/bootstrap-notify.js"></script>
                <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
                <script src="js/black-dashboard.min.js?v=1.0.0"></script>


                <script src="js/event/homeChart.js"></script>


                <script>
                    $(document).ready(function() {
                        $().ready(function() {
                            $sidebar = $('.sidebar');
                            $navbar = $('.navbar');
                            $main_panel = $('.main-panel');

                            $full_page = $('.full-page');

                            $sidebar_responsive = $('body > .navbar-collapse');
                            sidebar_mini_active = true;
                            white_color = false;

                            window_width = $(window).width();

                            fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



                            $('.fixed-plugin a').click(function(event) {
                                if ($(this).hasClass('switch-trigger')) {
                                    if (event.stopPropagation) {
                                        event.stopPropagation();
                                    } else if (window.event) {
                                        window.event.cancelBubble = true;
                                    }
                                }
                            });

                            $('.fixed-plugin .background-color span').click(function() {
                                $(this).siblings().removeClass('active');
                                $(this).addClass('active');

                                var new_color = $(this).data('color');

                                if ($sidebar.length != 0) {
                                    $sidebar.attr('data', new_color);
                                }

                                if ($main_panel.length != 0) {
                                    $main_panel.attr('data', new_color);
                                }

                                if ($full_page.length != 0) {
                                    $full_page.attr('filter-color', new_color);
                                }

                                if ($sidebar_responsive.length != 0) {
                                    $sidebar_responsive.attr('data', new_color);
                                }
                            });

                            $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
                                var $btn = $(this);

                                if (sidebar_mini_active == true) {
                                    $('body').removeClass('sidebar-mini');
                                    sidebar_mini_active = false;
                                    blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
                                } else {
                                    $('body').addClass('sidebar-mini');
                                    sidebar_mini_active = true;
                                    blackDashboard.showSidebarMessage('Sidebar mini activated...');
                                }

                                // we simulate the window Resize so the charts will get updated in realtime.
                                var simulateWindowResize = setInterval(function() {
                                    window.dispatchEvent(new Event('resize'));
                                }, 180);

                                // we stop the simulation of Window Resize after the animations are completed
                                setTimeout(function() {
                                    clearInterval(simulateWindowResize);
                                }, 1000);
                            });

                            $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
                                var $btn = $(this);

                                if (white_color == true) {

                                    $('body').addClass('change-background');
                                    setTimeout(function() {
                                        $('body').removeClass('change-background');
                                        $('body').removeClass('white-content');
                                    }, 900);
                                    white_color = false;
                                } else {

                                    $('body').addClass('change-background');
                                    setTimeout(function() {
                                        $('body').removeClass('change-background');
                                        $('body').addClass('white-content');
                                    }, 900);

                                    white_color = true;
                                }


                            });
                            $('.light-badge').click(function() {
                                $('body').addClass('white-content');
                            });
                            $('.dark-badge').click(function() {
                                $('body').removeClass('white-content');
                            });
                        });
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