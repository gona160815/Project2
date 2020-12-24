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
            <link rel="stylesheet" href="css/modal.css">
            <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
            <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
            <!-- Nucleo Icons -->
            <link href="css/nucleo-icons.css" rel="stylesheet" />
            <!-- CSS Files -->
            <link href="css/black-dashboard.css" rel="stylesheet" />
            <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
            <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

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
                            <h1 class="h2">行程</h1>
                            <div class="btn-toolbar mb-2 mb-md-0">
                                <!-- <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">預覽報表</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">匯出報表</button>
                                </div>
                                <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar">本周</span>
                                                                                   
                    </button> -->
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
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
                                        <h3 class="card-title"><i class="tim-icons icon-bell-55 text-primary"></i>營業額數據</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="actNameChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card card-chart">
                                    <div class="card-header">

                                        <h3 class="card-title"><i class="tim-icons icon-send text-success"></i>行程訂單類型</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="activityType"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <input id="memberId" type="hidden" value="${mgrId}">
                                <div class="card ">
                                    <div class="card-header">
                                        <h3 class="card-title">
                                            <a href="activityMgr">行程管理</a>
                                        </h3>



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
                                                        <th class="text-center" scope="col">ID</th>
                                                        <th class="text-center" scope="col">行程名稱</th>
                                                        <th class="text-center" scope="col">創建時間</th>
                                                        <th class="text-center" scope="col">價錢</th>
                                                        <th class="text-center" scope="col"></th>
                                                        <th class="text-right" scope="col">
                                                            <button id="preinsertbtn" type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal">
                                                                    <i class="fas fa-plus"></i>
                                                                  </button>

                                                        </th>
                                                    </tr>


                                                    <!-- Modal -->
                                                    <div class="modal right" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered ">
                                                            <div id="upload-wrap" class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">新增資料</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                  </button>
                                                                </div>
                                                                <div class="modal-body ">
                                                                    <div>
                                                                        <h3 class="">平台行程規劃表
                                                                        </h3>
                                                                        <p class="input-group">
                                                                            <input id="name" type="text" class="form-control col-sm-3 border-0 " placeholder="請輸入活動名稱" />
                                                                            <span class="text-center h4 col-sm-7">總金額：<i style="color:rgb(248, 225, 14);" class="totalPrice fas fa-dollar-sign"> 0</i></span>

                                                                            <span id="plus" class="btn btn-info float-right"><i class="fas fa-plus"></i>新增</span>
                                                                        </p>
                                                                        <hr/>
                                                                    </div>
                                                                    <div id="myAct" class="row">
                                                                        <div id="act-list" class="act-list col-md-12">
                                                                            <p class="mx-2 ">
                                                                                <input placeholder="行程日期" type="text" class="actDate custom-select custom-select-lg col-md-2" required>
                                                                                <span class="remove float-right btn btn-sm btn-danger "><i class="fas fa-minus-circle"></i> 移除</span>
                                                                                <span class="float-right col-sm-1 "><i style="color:rgb(248, 225, 14);" class="price fas fa-dollar-sign">0</i></span>
                                                                            </p>

                                                                            <select class="typeId mx-2 custom-select custom-select-lg col-md-2">
                                                                                <option selected>請選擇行程類型</option>
                                                                                <option value="1">飯店</option>
                                                                                <option value="2">租車</option>
                                                                                <option value="3">活動</option>
                                                                                <option value="4">車道</option>
                                                                                <option value="5">補給站</option>
                                                                                <option value="6">我的最愛</option>
                                                                            </select>


                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <hr/>
                                                                        </div>



                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button class="float-left btn btn-primary" type="button" @click="submit">上傳圖片</button>
                                                                    <button id="add" type="button" class="float-left btn btn-primary">一鍵輸入</button>
                                                                    <span id="save" class="btn btn-info float-right">儲存</span>
                                                                    <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">取消</button>
                                                                </div>
                                                                <!-- </form> -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </thead>
                                                <tbody id="tbody">
                                                    <c:forEach var='query' items='${queryList}' varStatus="vs">
                                                        <tr class="actNameList">
                                                            <td class='actNameId text-center'>${query.actNameId}</td>
                                                            <td class='act-name text-center'>${query.name}</td>
                                                            <td class='text-center'>${query.orderTime}</td>
                                                            <td class='text-center'>${query.price}</td>
                                                            <td class="info text-center"><input class="preupdate btn btn-info my-2 my-sm-0 " type="button" name="" value="行程內容" /></td>
                                                            <td class="controllbtn text-right">
                                                                <input class="preupdate btn btn-success my-2 my-sm-0 " type="button" name="" value="修改" data-toggle="modal" data-target="#exampleModal" />
                                                                <input class="deletebtn btn btn-danger my-2 my-sm-0 " type="button" name="" value="刪除" />
                                                            </td>
                                                        </tr>
                                                        <tr class="eventActivityList" style="display:none;">
                                                            <th scope="row" class="text-center"><span>行程類別</span><br><span class="typeId"></span></th>
                                                            <td class="text-center"><span>行程名稱</span><br><span class="name"></span></td>
                                                            <td class="text-center"><span>行程時間</span><br><span class="actDate"></span></td>
                                                            <td class="text-center"><span>金額</span><br><span class="price"></span></td>
                                                            <td class="text-center"><br></td>
                                                            <td class="text-center"><br></td>
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
                                            <!-- </form> -->
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--   Core JS Files   -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
            <script src="js/event/eventMgr_activity.js"></script>

            <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
            <script>
                $(function() {


                    $("#tbody").on("click", ".info", function() {
                        $(this).attr("id", "enable");
                        $(this).closest("tr").next().css("display", "table-row");
                        var $t = $(this);
                        var actName = $t.closest("td").siblings(".act-name").text().trim();
                        var memberId = $("#memberId").val();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".typeId").empty();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".name").empty();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".actDate").empty();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".price").empty();
                        $.ajax({
                            url: 'getActivity',
                            type: 'post',
                            data: {
                                actName: actName,
                                memberId: memberId
                            },
                            success: function(res) {
                                console.log(res);
                                var list = res.list;
                                $.each(res.activity, function(i, obj) {
                                    var typeId = obj.typeId;
                                    if (typeId == 1) {
                                        $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("飯店<br/>");
                                        $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="sixsix.BookingHouseDetail.controller?homenum=' + list[i].Id + '">' + list[i].Name + "</a><br/>");
                                    }
                                    if (typeId == 2) {
                                        $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("租車<br/>");
                                        $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="BikeTypeUser">' + list[i].rbName + "<br/>");
                                    }
                                    if (typeId == 3) {
                                        $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("活動<br/>");
                                        $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="event/' + list[i].eventId + '">' + list[i].title + "<br/>");
                                    }
                                    if (typeId == 4) {
                                        $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("自行車道<br/>");
                                        $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="bikeIndexDetailEntry.controller?changeid=' +
                                            list[i].id + '&name=' + list[i].name + '&begin=' + list[i].begin + '&goal=' + list[i].goal + '&city=' + list[i].city + '&town=' + list[i].town + '&maintain=' + list[i].maintain + '&m=' + list[i].m + '&latitude=' + list[i].latitude + '&longitude=' + list[i].longtitude + '">' + res.list[i].name + "<br/>");
                                    }
                                    if (typeId == 5) {
                                        $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("補給站<br/>");
                                        $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="RestAreaDetailEntry.controller?changeid=' +
                                            list[i].id + '&name=' + list[i].name + '&city=' + list[i].city + '&town=' + list[i].town + '&address=' + list[i].address + '&tel=' + list[i].tel + '">' + list[i].name + "<br/>");
                                    }


                                    $t.closest(".actNameList").next(".eventActivityList").find(".actDate").append(obj.actDate + "<br/>");
                                    $t.closest(".actNameList").next(".eventActivityList").find(".price").append(obj.price + "<br/>");

                                });
                            }


                        });
                    });
                    $("#tbody").on("click", "#enable", function() {
                        $(this).closest(".actNameList").next(".eventActivityList").find(".typeId").empty();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".name").empty();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".actDate").empty();
                        $(this).closest(".actNameList").next(".eventActivityList").find(".price").empty();
                        $(this).closest("tr").next().css("display", "none");
                        $(this).removeAttr("id");
                    });



                    // delete btn 

                    $("#tbody").on("click", ".deletebtn", function() {
                        var $t = $(this);
                        Swal.fire({
                            title: "確認刪除此行程嗎?",
                            icon: "error",
                            showCancelButton: true,
                            closeOnConfirm: false,
                            showLoaderOnConfirm: true,
                            confirmButtonClass: "btn-danger",
                            confirmButtonText: "刪除",
                            cancelButtonText: "取消",
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: 'removeActivity',
                                    type: 'post',
                                    data: {
                                        memberId: $("#memberId").val(),
                                        actNameId: $(this).closest(".controllbtn").siblings(".actNameId").text().trim()
                                    },
                                    success: function(res) {
                                        if (res.result == true) {
                                            Swal.fire({
                                                    title: "刪除成功",
                                                    icon: "success",
                                                    timer: 1500,
                                                    showConfirmButton: false,
                                                })
                                                .then(() => {
                                                    $t.closest("tr").next().remove();
                                                    $t.closest("tr").remove();
                                                });

                                        }
                                    }
                                });
                            }
                        });
                    });

                    //  ACTIVITY TYPE CHART
                    var ctx3 = document.getElementById("activityType").getContext("2d");

                    var myDoughnutChart = new Chart(ctx3, {
                        type: 'doughnut',
                        data: {
                            labels: ["飯店", "租車", "活動", "自行車道", "補給站"],
                            datasets: [{
                                label: "會員行程偏好",
                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", '#FF2D2D', '#FFD306', '#00395c'],
                                data: [0, 0, 0, 0, 0]
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            legend: {
                                display: true
                            }


                        },
                        tooltips: {
                            callbacks: {
                                label: function(tooltipItem, data) {
                                    var dataset = data.datasets[tooltipItem.datasetIndex];
                                    var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                                        return previousValue + currentValue;
                                    });
                                    var currentValue = dataset.data[tooltipItem.index];
                                    var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
                                    return percentage + "%";
                                }
                            }
                        },

                    });



                    $.ajax({
                        type: "post",
                        url: "activityData",
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            myDoughnutChart.data.datasets[0].data = data;

                            myDoughnutChart.update();
                        }
                    })


                    //  訂單營業額圖表


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
                    })
                })
            </script>
        </body>

        </html>