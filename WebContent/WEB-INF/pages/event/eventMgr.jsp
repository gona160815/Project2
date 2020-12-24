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
            <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">

            <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->


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

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <h3 class="card-title"><i class="text-success fas fa-map-marker-alt"></i></i>縣市分布統計</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="locationChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <h3 class="card-title"><i class="tim-icons icon-send text-warning"></i>活動類型</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="catChart"></canvas>
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
                                            <a href="eventMgr">活動資訊</a>
                                        </h3>
                                        <span class="float-left">
                                        <div  class="dropdown">
                                            <button type="button" class="btn btn-link" data-toggle="dropdown">
                                                <i class="tim-icons">地區</i>
                                            </button>
                                            <div id="region" class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                            <button id="all" class="dropdown-item" >全部</button>
                                            <button class="dropdown-item" >基隆市</button>
											<button class="dropdown-item" >新北市</button>
											<button class="dropdown-item" >台北市</button>
											<button class="dropdown-item" >宜蘭縣</button>
											<button class="dropdown-item" >桃園市</button>
											<button class="dropdown-item" >新竹市</button>
											<button class="dropdown-item" >苗栗縣</button>
											<button class="dropdown-item" >臺中市</button>
											<button class="dropdown-item" >彰化縣</button>
											<button class="dropdown-item" >南投縣</button>
											<button class="dropdown-item" >嘉義縣</button>
											<button class="dropdown-item" >嘉義市</button>
											<button class="dropdown-item" >臺南市</button>
											<button class="dropdown-item" >高雄市</button>
											<button class="dropdown-item" >屏東縣</button>
											<button class="dropdown-item" >臺東縣</button>
											<button class="dropdown-item" >花蓮縣</button>
											<button class="dropdown-item" >澎湖縣</button>
											<button class="dropdown-item" >金門縣</button>
											<button class="dropdown-item" >連江縣</button>
                                             </div>
                                        </div>

                                </span>
                                        <span class="float-left">
                                        <div  class="dropdown">
                                            <button type="button" class="btn btn-link" data-toggle="dropdown">
                                                <i class="tim-icons">種類</i>
                                            </button>
                                            <div id="category" class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                            <button id="cat1"class="dropdown-item" >全部</button>
                                            <button id="cat2" class="dropdown-item" >娛樂</button>
                                            <button id="cat3" class="dropdown-item" >展覽</button>
                                            <button id="cat4"class="dropdown-item" >親子</button>
                                             </div>
                                        </div>

                                </span>

                                        <div id="sform" class="form-inline float-right mx-0">
                                            查詢：
                                            <input id="search" class="form-control h-25 w-75" type="text" name="query" />

                                        </div>

                                    </div>



                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <!-- <form id="dataForm" class="form-inline w-100 " action="eventmgr.controller" method="post"> -->
                                            <table class="table tablesorter " id="">
                                                <thead class=" text-primary">
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">名稱</th>
                                                        <th scope="col">地址</th>
                                                        <th scope="col">位置</th>
                                                        <th scope="col">主辦單位</th>
                                                        <th scope="col">開始日</th>
                                                        <th scope="col">結束日</th>
                                                        <th scope="col"></th>
                                                        <th scope="col">
                                                            <button id="preinsertbtn" type="button" class="float-right btn btn-success" data-toggle="modal" data-target="#exampleModal">
                                                                    <i class="fas fa-plus"></i>
                                                                  </button>

                                                        </th>
                                                    </tr>


                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div id="upload-wrap" class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">新增資料</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                  </button>
                                                                </div>
                                                                <div class="modal-body ">
                                                                    <div class="form-group form-row">
                                                                        <div class="col-sm-6 ">
                                                                            <label for="eventId">活動ID</label>
                                                                            <input type="text" class="form-control" id="eventId" value="" name="eventId" readonly />
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label class="col-form-label" for="catId">種類</label>
                                                                            <input type="text" class=" mb-2 form-control" id="catId" name="eventCat.categoryId" required />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-row">
                                                                        <div class="col-sm-12 ">
                                                                            <label for="title">名稱</label>
                                                                            <input type="text" class="form-control" id="title" value="" name="title" required />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-row">
                                                                        <div class="col-sm-6 ">
                                                                            <label for="location">地址</label>
                                                                            <input type="text" class="form-control" id="location" name="location" required />
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label class="col-form-label" for="LocationName">位置</label>
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
                                                                            <label for="showunit">主辦單位</label>
                                                                            <input type="text" class="form-control" id="showunit" name="showunit" required />
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label for="website">網站</label>
                                                                            <input type="text" class="form-control" id="website" name="website" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-row">
                                                                        <div class="col-sm-6">
                                                                            <label for="onsales">特價</label>
                                                                            <input type="text" class="form-control" id="onsales" name="onsales" />
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label for="price">價錢</label>
                                                                            <input type="text" class="form-control" id="price" name="price" />
                                                                        </div>

                                                                    </div>

                                                                    <div class="form-group form-row">
                                                                        <div class="col-sm-6">
                                                                            <label for="startDate">開始日</label>
                                                                            <input type="date" class="form-control" id="startDate" name="startDate" required />
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <label for="endDate">結束日</label>
                                                                            <input type="date" class="form-control" id="endDate" name="endDate" required />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-row">
                                                                        <label for="description">活動敘述</label>
                                                                        <textarea class="form-control" style="min-width:100%" id="description" rows="3" name="description" required></textarea>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button class="float-left btn btn-primary" type="button" @click="submit">上傳圖片</button>
                                                                    <button id="add" type="button" class="float-left btn btn-primary">一鍵輸入</button>
                                                                    <button id="insertbtn" type="button" class="float-right btn btn-primary">新增</button>
                                                                    <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">取消</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </thead>
                                                <tbody id="tbody">
                                                    <c:forEach var='query' items='${queryList}' varStatus="vs">
                                                        <tr>
                                                            <!-- 未來接event_detail.jsp-->
                                                            <td class='eventId'><a href="eventDetail/${query.eventId}">${query.eventId}</a></td>
                                                            <td class='title'>${query.title}</td>
                                                            <td class='location'>${query.location}</td>
                                                            <td class='locationName'>${query.locationName}</td>
                                                            <td class='showunit'>${query.showunit}</td>
                                                            <td class='startDate'>${query.startDate}</td>
                                                            <td class='endDate'>${query.endDate}</td>
                                                            <td><input class="preupdate btn btn-success my-2 my-sm-0 " type="button" name=${query.eventId} value="修改" data-toggle="modal" data-target="#exampleModal" /></td>
                                                            <td><input class="deletebtn btn btn-danger my-2 my-sm-0 " type="button" name=${query.eventId} value="刪除" /></td>
                                                            <input class="image" type="hidden" value="${query.image}">
                                                            <input class="categoryId" type="hidden" value="${query.eventCat.categoryId}">
                                                            <input class="description" type="hidden" value="${query.description}">
                                                            <input class="website" type="hidden" value="${query.website}">
                                                            <input class="onsales" type="hidden" value="${query.onsales}">
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>

                                            </table>
                                            <div id="pagebadgepre">
                                                <span id="pagebadge" class="float-left ml-2 badge badge-light w-25 ">第 ${pageNo} 頁 / 共 ${totalPages} 頁</span>
                                            </div>
                                            <div id="pageDiv" class="w-100 m-auto">
                                                <nav class="float-right" aria-label=" Page navigation example">
                                                    <ul id="pagination" class="pagination">
                                                        <li class="page-item"><a id="firstbtn" class="page-link" href="javascript:void(0)">第一頁</a></li>
                                                        <c:if test="${pageNo > 1}">
                                                            <li class="page-item"><a id="prevbtn" class="page-link" href="javascript:void(0)">上一頁</a></li>
                                                        </c:if>
                                                        <c:forEach var='page' items='${pages}'>
                                                            <c:if test="${pageNo != page}">
                                                                <li class="page-item"><a id="pageNo" class="pagebtn page-link" href="javascript:void(0)">${page}</a></li>
                                                            </c:if>
                                                            <c:if test="${pageNo == page}">
                                                                <li class="page-item active"><a id="pageNo" class="pagebtn page-link " href="javascript:void(0)">${page}<span class="sr-only">(current)</span></a></li>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${pageNo != totalPages}">
                                                            <li class="page-item"><a id="nextbtn" class="page-link" href="javascript:void(0)">下一頁</a></li>
                                                        </c:if>
                                                        <li class="page-item"><a id="lastbtn" class="page-link" href="javascript:void(0)">最末頁</a></li>
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
            </div>

            <!--   Core JS Files   -->
            <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="js/core/popper.min.js"></script>
            <script src="js/core/bootstrap.min.js"></script>
            <script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
            <!-- Chart JS -->
            <script src="js/plugins/chartjs.min.js"></script>
            <!--  Notifications Plugin    -->
            <script src="js/plugins/bootstrap-notify.js"></script>
            <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="js/black-dashboard.min.js?v=1.0.0"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


            <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
            <script src="js/event/eventMgr.js"></script>
        </body>

        </html>