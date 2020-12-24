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
            <link href="../css/nucleo-icons.css" rel="stylesheet" />
            <!-- CSS Files -->
            <link href="../css/black-dashboard.css" rel="stylesheet" />
            <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">

        </head>

        <body class="white-content">
            <div class="wrapper">
                <div class="sidebar" data="blue">

                    <div class="sidebar-wrapper">
                        <div class="logo">
                            <a href="javascript:void(0)" class="simple-text logo-mini">
                    CT
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
                                        <a class="my-2" href="../eventDashboard">Dashboard</a>
                                        <a class="my-2" href="../eventMgr">活動管理</a>
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
                                <a href="./analyze.html">
                                    <i class="tim-icons icon-chart-bar-32"></i>
                                    <p>分析</p>
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
                                <a class="navbar-brand" href="javascript:void(0)">Team Name :</a>
                            </div>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
                            <div class="collapse navbar-collapse" id="navigation">
                                <ul class="navbar-nav ml-auto">
                                    <li class="search-bar input-group">
                                        <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" ></i>
                  <span class="d-lg-none d-md-block">Search</span>
                </button>
                                    </li>
                                    <li class="dropdown nav-item">
                                        <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                            <div class="notification d-none d-lg-block d-xl-block"></div>
                                            <i class="tim-icons icon-sound-wave"></i>
                                            <p class="d-lg-none">
                                                Notifications
                                            </p>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-right dropdown-navbar">
                                            <li class="nav-link"><a href="#" class="nav-item dropdown-item">Mike John responded to your email</a></li>
                                            <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">You have 5 more tasks</a></li>
                                            <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Your friend Michael is in town</a></li>
                                            <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Another notification</a></li>
                                            <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Another one</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown nav-item">
                                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                            <div class="photo">
                                                <img src="../assets/img/anime3.png" alt="Profile Photo">
                                            </div>
                                            <b class="caret d-none d-lg-block d-xl-block"></b>
                                            <p class="d-lg-none">
                                                Log out
                                            </p>
                                        </a>
                                        <ul class="dropdown-menu dropdown-navbar">
                                            <li class="nav-link"><a href="./user.html" class="nav-item dropdown-item">Profile</a></li>
                                            <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Settings</a></li>
                                            <li class="dropdown-divider"></li>
                                            <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Log out</a></li>
                                        </ul>
                                    </li>
                                    <li class="separator d-lg-none"></li>
                                </ul>
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
                            <div id="categorybtn" class="btn-group btn-group-toggle float-right" data-toggle="buttons">

                                <label class="cat7 btn btn-sm btn-info btn-simple active" id="cat7">
								                        <input type="radio" name="options " checked>
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">近七日</span>
								                        
							                      	</label>
                                <label class="cat30 btn btn-sm btn-info btn-simple " id="cat30">
								                        <input type="radio" class="d-none d-sm-none " name="options ">
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">近三十日</span>
								                        
								                    </label>
                                <label class="catmon btn btn-sm btn-info btn-simple " id="catmon">
								                        <input type="radio" name="options " checked>
								                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block ">年度總覽</span>
								                        
							                      	</label>
                            </div>
                            <div class="btn-toolbar mb-2 mb-md-0">
                                <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">預覽報表</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">匯出報表</button>
                                </div>
                                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                                
                        <span data-feather="calendar"></span>
                        本周
                    </button>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-4">
                                <div class="card card-chart">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-sm-6 text-left">
                                                <h5 class="card-title">今日數據</h5>
                                            </div>
                                            <div class="col-sm-6">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="event-todayChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card card-chart">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-sm-6 text-left">
                                                <h5 id="chart-title" class="card-title">近七日數據</h5>
                                            </div>
                                            <div class="col-sm-6">

                                                <!-- <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                                    <label class="totalbtn btn btn-sm btn-primary btn-simple active" id="totalbtn">
                                                        <input type="radio" name="options" checked>
                                                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">總覽</span>
                                                        <span class="d-block d-sm-none">
                                                        <i class="tim-icons icon-single-02"></i>
                                                        </span>
                                                    </label>
                                                    <label class="commbtn btn btn-sm btn-primary btn-simple" id="commbtn">
                                                        <input type="radio" class="d-none d-sm-none" name="options">
                                                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">評論數</span>
                                                        <span class="d-block d-sm-none">
                                                        <i class="tim-icons icon-gift-2"></i>
                                                        </span>
                                                    </label>
                                                    <label class="likebtn btn btn-sm btn-primary btn-simple" id="likebtn">
                                                        <input type="radio" class="d-none" name="options">
                                                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">按讚數</span>
                                                        <span class="d-block d-sm-none">
                                                        <i class="tim-icons icon-tap-02"></i>
                                                        </span>
                                                    </label>
                                                    <label class="viewbtn btn btn-sm btn-primary btn-simple" id="viewbtn">
                                                        <input type="radio" class="d-none" name="options">
                                                        <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">瀏覽次數</span>
                                                        <span class="d-block d-sm-none">
                                                        <i class="tim-icons icon-tap-02"></i>
                                                        </span>
                                                    </label>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="event-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <div class="card ">
                                    <div class="card-header">
                                        <h3 class="card-title"><a id="eventbtn" href="../eventDetail/${event.eventId}">活動編號#${event.eventId}</a>
                                            <a id="commentbtn">&nbsp&nbsp&nbsp評論管理</a></h3>
                                        <h2 class="card-title">${event.title}</h2>

                                        <div id="commandbtn">
                                            <button id="deleteComment" class="float-right btn btn-danger my-2 my-sm-0  ">刪除</button>
                                            <button id="preupdate" class="float-right btn btn-success my-2 my-sm-0  " data-toggle="modal" data-target="#exampleModal">修改</button>

                                        </div>

                                    </div>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div id="upload-wrap" class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">更新資料</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                <!-- <form id="saveForm" action="saveEvent" method="post" enctype="multipart/form-data"> -->
                                                <div class="modal-body ">
                                                    <div class="form-group form-row">
                                                        <div class="col-sm-6 ">
                                                            <label for="eventId">Event Id</label>
                                                            <input type="text" class="form-control" id="eventId" value="" name="eventId" readonly />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="col-form-label" for="catId">Category</label>
                                                            <input type="text" class=" mb-2 form-control" id="catId" name="eventCat.categoryId" required />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-row">
                                                        <div class="col-sm-12 ">
                                                            <label for="title">Title</label>
                                                            <input type="text" class="form-control" id="title" value="" name="title" required />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-row">
                                                        <div class="col-sm-6 ">
                                                            <label for="location">Location</label>
                                                            <input type="text" class="form-control" id="location" name="location" required />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label class="col-form-label" for="LocationName">Location Name</label>
                                                            <input type="text" class="form-control" id="locationName" name="locationName" required />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-row">
                                                        <div class="col-sm-6 ">
                                                            <label class="col-form-label " for="upload">選擇上傳圖檔<i class="fas fa-cloud-upload-alt"></i></label>
                                                            <input class="form-control " id="upload" type="file" accept="image/*" @change="showFile">
                                                        </div>
                                                        <div class="col-sm-6 ">
                                                            <label class="col-form-label" for="title">圖片名稱</label>
                                                            <input class="form-control" name="image" id="image" type="text" v-model="title" @keyup.13="submit" required>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-row">
                                                        <div class="col-sm-6">
                                                            <label for="showunit">Showunit</label>
                                                            <input type="text" class="form-control" id="showunit" name="showunit" required />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label for="website">Website</label>
                                                            <input type="text" class="form-control" id="website" name="website" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-row">
                                                        <div class="col-sm-6">
                                                            <label for="onsales">Onsales</label>
                                                            <input type="text" class="form-control" id="onsales" name="onsales" />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label for="price">Price</label>
                                                            <input type="text" class="form-control" id="price" name="price" />
                                                        </div>

                                                    </div>

                                                    <div class="form-group form-row">
                                                        <div class="col-sm-6">
                                                            <label for="startDate">Start Date</label>
                                                            <input type="date" class="form-control" id="startDate" name="startDate" required />
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label for="endDate">End Date</label>
                                                            <input type="date" class="form-control" id="endDate" name="endDate" required />
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-row">
                                                        <label for="description">Description</label>
                                                        <textarea class="form-control" style="min-width:100%" id="description" rows="3" name="description" required></textarea>
                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button class="float-left btn btn-primary" type="button" @click="submit">上傳圖片</button>
                                                    <button id="add" type="button" class="float-left btn btn-primary">一鍵輸入</button>
                                                    <button id="updatebtn" type="button" class="float-right btn btn-primary">更新</button>
                                                    <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">取消</button>
                                                </div>
                                                <!-- </form> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table class="table tablesorter " id="">
                                            <thead id="thead" class=" text-primary">
                                                <tr>
                                                    <th>
                                                        Title
                                                    </th>
                                                    <th>
                                                        Location
                                                    </th>
                                                    <th>
                                                        Location Name
                                                    </th>
                                                    <th class="text-center">
                                                        Start Date
                                                    </th>
                                                    <th class="text-center">
                                                        End Date
                                                    </th>
                                                    <th class="text-right">
                                                        Price
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbody">
                                                <tr>
                                                    <td class="title">
                                                        ${event.title}
                                                    </td>
                                                    <td class="location">
                                                        ${event.location}
                                                    </td>
                                                    <td class="locationName">
                                                        ${event.locationName}
                                                    </td>
                                                    <td class="text-center">
                                                        ${event.startDate}
                                                    </td>
                                                    <td class="text-center">
                                                        ${event.endDate}
                                                    </td>
                                                    <td class="price text-right">
                                                        ${event.price}
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <input id="eid" type="hidden" value="${event.eventId}">
                                        <input class="categoryId" type="hidden" value="${event.eventCat.categoryId}">
                                        <input class="image" type="hidden" value="${event.image}">
                                        <input class="showunit" type="hidden" value="${event.showunit}">
                                        <input class="website" type="hidden" value="${event.website}">
                                        <input class="onsales" type="hidden" value="${event.onsales}">
                                        <input class="startDate" type="hidden" value="${event.startDate}">
                                        <input class="endDate" type="hidden" value="${event.endDate}">
                                        <div id="des">
                                            <h4>Description</h4>
                                            <span class="description text-center">${event.description}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <footer class="footer">
                        <div class="container-fluid">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a href="../event" class="nav-link">
				                		回前台
				              </a>
                                </li>
                                <li class="nav-item">
                                    <a href="javascript:void(0)" class="nav-link">
                About Us
              </a>
                                </li>
                                <li class="nav-item">
                                    <a href="javascript:void(0)" class="nav-link">
                Blog
              </a>
                                </li>
                            </ul>
                            <div class="copyright">
                                ©
                                <script>
                                    document.write(new Date().getFullYear())
                                </script>2018 made with <i class="tim-icons icon-heart-2"></i> by
                                <a href="javascript:void(0)" target="_blank">Creative Tim</a> for a better web.
                            </div>
                        </div>
                    </footer>
                </div>
            </div>

            <!--   Core JS Files   -->
            <script src="../js/core/jquery.min.js"></script>
            <script src="../js/core/popper.min.js"></script>
            <script src="../js/core/bootstrap.min.js"></script>
            <script src="../js/plugins/perfect-scrollbar.jquery.min.js"></script>
            <!-- Chart JS -->
            <script src="../js/plugins/chartjs.min.js"></script>
            <!--  Notifications Plugin    -->
            <script src="../js/plugins/bootstrap-notify.js"></script>
            <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="../js/black-dashboard.min.js?v=1.0.0"></script>

            <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            <script src="../js/event/eventChart.js"></script>
            <script src="../js/event/eventDetail.js"></script>


        </body>

        </html>