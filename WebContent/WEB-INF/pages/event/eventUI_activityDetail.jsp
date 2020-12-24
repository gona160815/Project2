<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>追風者｜行程</title>
        <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.16/jquery.timepicker.min.css" integrity="sha512-GgUcFJ5lgRdt/8m5A0d0qEnsoi8cDoF0d6q+RirBPtL423Qsj5cI9OxQ5hWvPi5jjvTLM/YhaaFuIeWCLi6lyQ==" crossorigin="anonymous"
            />
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js" integrity="sha512-s5u/JBtkPg+Ff2WEr49/cJsod95UgLHbC00N/GglqdQuLnYhALncz8ZHiW/LxDRGduijLKzeYb7Aal9h3codZA==" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
            <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

            <!-- Google Fonts -->
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">

            <!-- Material Design Bootstrap -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">

            <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin="">
            </script>
            <style>
                .carousel .carousel-item img {
                    min-height: 400px;
                    max-height: 400px;
                    object-fit: cover;
                }
                
                @media ( max-width: 768px) {
                    .carousel-inner .carousel-item>div {
                        display: none;
                    }
                    .carousel-inner .carousel-item>div:first-child {
                        display: block;
                    }
                }
                
                .carousel-inner .carousel-item.active,
                .carousel-inner .carousel-item-next,
                .carousel-inner .carousel-item-prev {
                    display: flex;
                }
                /* display 3 */
                
                @media ( min-width: 768px) {
                    .carousel-inner .carousel-item-right.active,
                    .carousel-inner .carousel-item-next {
                        transform: translateX(33.333%);
                    }
                    .carousel-inner .carousel-item-left.active,
                    .carousel-inner .carousel-item-prev {
                        transform: translateX(-33.333%);
                    }
                }
                
                .carousel-inner .carousel-item-right,
                .carousel-inner .carousel-item-left {
                    transform: translateX(0);
                }
                
                @import url(https://fonts.googleapis.com/css?family=Open+Sans);
                body {
                    font-family: 'Open Sans', sans-serif;
                }
                
                .scrollby {
                    bottom: 50px;
                    position: fixed;
                    right: 10px;
                }
            </style>
    </head>

    <body>

        <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
            <!-- image -->



            <div class="container my-1">
                <input id="mgrmemberId" type="hidden" value="${memberId}">
                <input id="memberId" type="hidden" value="${loginOK.memberId}">
                <!-- HOMEPAGE EVENTCAT EVENTID -->
                <div id="backtop" class="font-weight-light text-secondary  ">
                    <span class="text-left "><a class="text-decoration-none" href="../event"><i
					class="text-decoration-none text-muted fas fa-home">首頁</i></a></span> <span class="text-left "><a
				class="text-decoration-none text-muted" href="../event.query?categoryId=${event.eventCat.categoryId}">/ 行程</a></span> <span class="float-right">行程編號#
				${actName.actNameId}</span>

                </div>
                <div class="font-weight-light text-secondary text-left"></div>
            </div>

            <!-- container -->
            <div class="container my-5">
                <div class="row">
                    <div id="actBody" class="col-md-8">
                        <!-- EVENT-TITLE -->
                        <div class="actName-name ">
                            <!-- website -->
                            <h3 id="actName" class="p-2">${actName.name}

                            </h3>

                        </div>

                    </div>

                    <!-- right side -->
                    <div class="col-md-4">
                        <hr>
                        <!-- event-price -->
                        <div class="event-price">

                            <h5 class="mb-3">
                                <i id="price" class="fas fa-dollar-sign">  ${actName.price}</i>
                            </h5>


                            <button id="addAct" type="button" class="btn btn-block btn-lg btn-info" data-toggle="modal" data-target="#sideModalTR">
                                加入行程表
                              </button>

                            <div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                                <div class=" modal-dialog modal-dialog-scrollable modal-side modal-top-right modal-info" role="document">


                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title w-100" id="myModalLabel">加入我的行程表</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                        </div>
                                        <div style="height: 500px;" class="modal-body">
                                            <div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>


                                                </ul>

                                            </div>
                                        </div>
                                        <div style="height: 200px; " class="modal-footer">
                                            <button id="reset" type="button" class="float-left btn btn-warning btn-md">重新選擇</button>
                                            <button id="cancel" type="button" class="btn btn-secondary btn-md" data-dismiss="modal">取消</button>
                                            <button id="addNewAct" type="button" class="btn btn-info btn-md">加入</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>
                        </div>
                    </div>

                    <!-- <div class="col-md-12">
                        <button id="googlemap" class="btn btn-link">Google Map</button>
                        <button id="osmmap" class="btn btn-link">Open Street Map</button>
                        <br>
                        <div id="map" class="mb-5 p-5">
                            <iframe width="600" height="450" frameborder="0" style="border: 0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBdJB1--ZS5ivTTtYU3dmQ1MEjrIQMTEsc
   							 &q=${event.locationName}" allowfullscreen>
						</iframe>
                        </div>

                        <hr>
                    </div>
                    <br>
                    <br> -->


                </div>

            </div>
            <!-- back to top -->
            <div class="m-2 scrollby ">
                <span> <a href="#" class="btn btn-secondary shadow"> <i class=" fa fa-2x fa-angle-up"></i>
		</a>
		</span>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            <!-- <script src="../js/event/eventUI_detail.js"></script> -->


            <script>
                function eventList(activity, list, i) {
                    return `<div class="activity-list card card-body my-2">
                            <input class="typeId" type="hidden" value="3">
                            <input class="infoId" type="hidden" value="` + list[i].eventId + `">
                            
                            <div >
                                <i class="far fa-clock"></i> 行程日期： <span class="activity-actDate "> ` + activity[i].actDate + `</span>
                                <br>
                                <span><i class="fas fa-angle-double-right"></i> 行程類別： 活動</span>
                                <span class="float-right"><i style="color:rgb(248, 225, 14);" class="price fas fa-dollar-sign"> &nbsp` + activity[i].price + `</i></span>
                            </div>
                            <div>
                                <hr>
                                <h4><b>` + list[i].title + `</b></h4>
                                <hr>
                            </div>
                            <div class="mt-2 event-locationname">
                                <span><i class="fas fa-location-arrow mx-1"></i>` + list[i].locationName + `</span>
                            </div>
                            <hr />
                            <div class="event-location">
                                <span><i class="fas fa-map-marker-alt mx-1"></i>` + list[i].location + `</span>
                            </div>
                            <hr />
                            <div class="event-date">
                                <span><i class="far fa-calendar-alt mx-1"></i></span> <span class="badge badge-pill badge-info">
                                    ` + list[i].startDate + `</span> ~ <span class="badge badge-pill badge-warning">` + list[i].endDate + `</span>
                            </div>
                            <hr/>
                            <div class="event-description">
                                <span>` + list[i].description + `</span>
                            </div>
                            <hr />
                        </div>`;
                };

                function bikeList(activity, list, i) {
                    return `<div class="activity-list card card-body my-2">
                             <input class="typeId" type="hidden" value="4">
                            <input class="infoId" type="hidden" value="` + list[i].id + `">
                            <div >
                                <i class="far fa-clock"></i> 行程日期： <span class="activity-actDate "> ` + activity[i].actDate + `</span>
                                <br>
                                <span><i class="fas fa-angle-double-right"></i>行程類別： 自行車道</span>
                                <span class="float-right"><i style="color:rgb(248, 225, 14);" class="price fas fa-dollar-sign"> &nbsp` + activity[i].price + `</i></span>
                            </div>
                            <div>
                                <hr>
                            </div>
                            <div class="mt-2 bike-name">
                                <h4><b>` + list[i].name + `</b></h4>
                            </div>
                            <hr />
                            <div class="bike-city">
                                <span><i class="fas fa-map-marker-alt mx-1"></i>` + list[i].city + `</span>
                                <span>` + list[i].town + `</span>
                            </div>
                            <hr />
                            <div class="bike-begin">
                                <span class="my-1 mx-1"><i class="fas fa-play">起點： </i></span> 
                                <span class="mx-1 badge badge-pill badge-info">
                                    ` + list[i].begin + `</span> <br/>
                                <span class="mx-1"><i class="fas fa-stop">終點： </i></span>
                                <span class="mx-1 badge badge-pill badge-warning">` + list[i].goal + `</span>
                            
                            </div>
                            <hr/>
                            <div class="bike-town">
                                <span><i class="fas fa-ruler-horizontal">總長： </i>` + list[i].m + ` 公尺</span>
                            </div>
                            
                            <hr />
                        </div>`;
                };

                function restAreaList(activity, list, i) {
                    return `<div class="activity-list card card-body my-2">
                             <input class="typeId" type="hidden" value="5">
                            <input class="infoId" type="hidden" value="` + list[i].id + `">
                            <div >
                                <i class="far fa-clock"></i> 行程日期： <span class="activity-actDate "> ` + activity[i].actDate + `</span>
                                <br>
                                <span><i class="fas fa-angle-double-right"></i>行程類別： 補給站</span>
                                <span class="float-right"><i style="color:rgb(248, 225, 14);" class="price fas fa-dollar-sign"> &nbsp` + activity[i].price + `</i></span>
                            </div>
                            <div>
                                <hr>
                            </div>
                            <div class="mt-2 restArea-name">
                                <h4><b>` + list[i].name + `</b></h4>
                            </div>
                            <hr />
                            <div class="bike-address">
                                <span class=""><i class="fas fa-location-arrow mx-1">` + list[i].address + `</i></span> 
                            </div>
                            <hr/>
                            <div class="restArea-city">
                                <span><i class="fas fa-map-marker-alt "></i>` + list[i].city + `</span>
                                <span>` + list[i].town + `</span>
                            </div>
                            <hr />
                            <div class="bike-town">
                                <span><i class="fas fa-phone-volume">電話： </i>` + list[i].tel + `</span>
                            </div>
                            
                            <hr />
                        </div>`;
                };

                function homestayList(activity, list, i) {
                    return `<div class="activity-list card card-body my-2">
                             <input class="typeId" type="hidden" value="1">
                            <input class="infoId" type="hidden" value="` + list[i].Id + `">
                            <div>
                                <i class="far fa-clock"></i> 行程日期： <span class="activity-actDate "> ` + activity[i].actDate + `</span>
                                <br>
                                <span><i class="fas fa-angle-double-right"></i>行程類別： 飯店</span>
                                <span class="float-right"><i style="color:rgb(248, 225, 14);" class="price fas fa-dollar-sign"> &nbsp` + activity[i].price + `</i></span>

                            </div>
                            <div>
                                <hr>
                            </div>
                            <div class="mt-2 homestay-name">
                                <h4><b>` + list[i].Name + `</b></h4>
                            </div>
                            <hr />
                            <div class="homestay-address">
                                <span class=""><i class="fas fa-location-arrow mx-1">` + list[i].Add + `</i></span> 
                            </div>
                            <hr/>
                            <div class="homestay-city">
                                <span><i class="fas fa-map-marker-alt "></i>` + list[i].Region + `</span>
                                <span>` + list[i].Town + `</span>
                            </div>
                            <hr />
                            <div class="homestay-tel">
                                <span><i class="fas fa-phone-volume">電話： </i>` + list[i].Tellphone + `</span>
                            </div>
                            
                            <hr />
                            <div class="homestay-parkingInfo">
                                <span><i class="fas fa-info-circle">停車資訊： </i>` + list[i].Parkinginfo + `</span>
                            </div>
                            
                            <hr />
                        </div>`;
                };

                $(function() {

                    $.ajax({
                        url: '../checkLogin',
                        type: 'post',
                        dataType: 'json',
                        success: function(res) {
                            /* 從這開始改自己想要增加的按鈕 */
                            console.log(res);
                            if (res.login == false) {
                                $("#addAct").removeAttr("data-target").removeAttr("data-toggle");
                                $("#addAct").click(function() {
                                    Swal.fire({
                                            title: "請先登入",
                                            text: "導向登入頁...",
                                            icon: "warning",
                                            timer: 1500,
                                            showConfirmButton: false,
                                        })
                                        .then(() => {
                                            window.location.href = "../loginPage";
                                        });
                                });

                            }
                        }
                    });
                    $.ajax({
                        url: '../getMyActName',
                        type: 'post',
                        data: {
                            memberId: $("#memberId").val()
                        },
                        success: function(res) {
                            $.each(res.actName, function(i, obj) {
                                $(".list-group").append('<li class=" list-group-item"><a class="actName h4">' + obj.name + '</a></li>');
                            });
                        }

                    });


                    $("#newAct").on("click", function() {
                        $(this).closest('li').after('<li class="inputText list-group-item "><input placeholder="請輸入行程名稱" type="text" class=" border-0 "><button id="createAct" class="btn btn-sm btn-primary">確認</button></li>');
                    });

                    $(".list-group").on("click", "#createAct", function() {
                        $.ajax({
                            url: '../addMyActName',
                            type: 'post',
                            data: {
                                memberId: $("#memberId").val(),
                                actName: $(this).siblings("input").val(),
                            },
                            success: function(res) {
                                $('.newAct').after('<li class="list-group-item"><a class="actName h4">' + res.actName.name + '</a></li>');
                                $(".inputText").remove();
                            }

                        });


                    });

                    $(".list-group").on("click", ".actName", function() {
                        // $(this).closest('li').prevAll().remove();
                        // $(this).closest('li').nextAll().remove();
                        // $(this).after('<li class="list-group-item"><input class="my-2 actDate form-control-lg" placeholder="請選擇日期" type="text" ></li>')
                        // const fp = flatpickr(".actDate", {})
                        var name = $(this).text().trim();
                        var orderTime = moment().format("yyyy-MM-DD");
                        if (!name == "" || !name == null) {
                            console.log("name");
                            var dataArray = new Array();
                            var actName = {};
                            actName.name = name;
                            actName.memberId = parseInt($("#memberId").val());
                            actName.orderTime = orderTime;
                            actName.status = 0;
                            actName.price = parseInt($("#price").text());
                            dataArray.push(actName);
                            $(".activity-list").each(function(i) {
                                var eventActivity = {};
                                eventActivity.typeId = $(this).find(".typeId").val();
                                eventActivity.infoId = $(this).find(".infoId").val();
                                eventActivity.actDate = $(this).find(".activity-actDate").text().trim();
                                eventActivity.name = name;
                                eventActivity.price = $(this).find(".price").text().trim();
                                eventActivity.memberId = parseInt($("#memberId").val());

                                dataArray.push(eventActivity);
                            });

                            console.log(JSON.stringify(dataArray));
                            $.ajax({
                                url: '../checkActivity',
                                type: 'post',
                                data: {
                                    memberId: $("#memberId").val(),
                                    actName: name
                                },
                                success: function(res) {
                                    console.log(res);
                                    var result = res.result;
                                    if (result) {
                                        Swal.fire({
                                            title: "名稱和現有行程重複，覆蓋原有行程?",
                                            icon: "warning",
                                            showCancelButton: true,
                                            closeOnConfirm: false,
                                            showLoaderOnConfirm: true,
                                            confirmButtonClass: "btn-warning",
                                            confirmButtonText: "覆蓋",
                                            cancelButtonText: "取消",
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                $.ajax({
                                                    headers: {
                                                        Accept: "application/json",
                                                        "Content-Type": "application/json",
                                                    },
                                                    url: '../addActivity',
                                                    type: 'post',
                                                    dataType: "json",
                                                    data: JSON.stringify(dataArray),
                                                    success: function() {
                                                        Swal.fire({
                                                                title: "儲存成功",
                                                                text: "導向行程頁...",
                                                                icon: "success",
                                                                timer: 3000,
                                                                showConfirmButton: false,
                                                            })
                                                            .then(() => {
                                                                window.location.href = "../myActivity";
                                                            });
                                                    }
                                                });
                                            }
                                        });
                                    } else {
                                        $.ajax({
                                            headers: {
                                                Accept: "application/json",
                                                "Content-Type": "application/json",
                                            },
                                            url: '../addActivity',
                                            type: 'post',
                                            dataType: "json",
                                            data: JSON.stringify(dataArray),
                                            success: function() {
                                                Swal.fire({
                                                        title: "儲存成功",
                                                        // text: "重新導向...",
                                                        icon: "success",
                                                        timer: 1500,
                                                        showConfirmButton: false,
                                                    })
                                                    .then(() => {
                                                        // window.location.href = "../myActivity";
                                                        location.reload();
                                                    });
                                            }
                                        });
                                    }
                                }
                            });
                        } else {
                            Swal.fire({
                                title: "請輸入行程名稱!",
                                icon: "warning",
                                timer: 1000,
                                showConfirmButton: false,
                            });
                        }

                    });

                    $("#addNewAct").on("click", function() {
                        var name = $(".actName").text().trim();
                        var orderTime = moment().format("yyyy-MM-DD");
                        if (!name == "" || !name == null) {
                            console.log("name");
                            var dataArray = new Array();
                            var actName = {};
                            actName.name = name;
                            actName.memberId = parseInt($("#memberId").val());
                            actName.orderTime = orderTime;
                            actName.status = 0;
                            actName.price = parseInt($("#price").text());
                            dataArray.push(actName);
                            $(".activity-list").each(function(i) {
                                var eventActivity = {};
                                eventActivity.typeId = $(this).find(".typeId").val();
                                eventActivity.infoId = $(this).find(".infoId").val();
                                eventActivity.actDate = $(this).find(".activity-actDate").text().trim();
                                eventActivity.name = name;
                                eventActivity.price = $(this).find(".price").text().trim();
                                eventActivity.memberId = parseInt($("#memberId").val());

                                dataArray.push(eventActivity);
                            });

                            console.log(JSON.stringify(dataArray));
                            $.ajax({
                                url: '../checkActivity',
                                type: 'post',
                                data: {
                                    memberId: $("#memberId").val(),
                                    actName: name
                                },
                                success: function(res) {
                                    console.log(res);
                                    var result = res.result;
                                    if (result) {
                                        Swal.fire({
                                            title: "名稱和現有行程重複，覆蓋原有行程?",
                                            icon: "warning",
                                            showCancelButton: true,
                                            closeOnConfirm: false,
                                            showLoaderOnConfirm: true,
                                            confirmButtonClass: "btn-warning",
                                            confirmButtonText: "覆蓋",
                                            cancelButtonText: "取消",
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                $.ajax({
                                                    headers: {
                                                        Accept: "application/json",
                                                        "Content-Type": "application/json",
                                                    },
                                                    url: '../addActivity',
                                                    type: 'post',
                                                    dataType: "json",
                                                    data: JSON.stringify(dataArray),
                                                    success: function() {
                                                        Swal.fire({
                                                                title: "儲存成功",
                                                                text: "導向行程頁...",
                                                                icon: "success",
                                                                timer: 3000,
                                                                showConfirmButton: false,
                                                            })
                                                            .then(() => {
                                                                window.location.href = "../myActivity";
                                                            });
                                                    }
                                                });
                                            }
                                        });
                                    } else {
                                        $.ajax({
                                            headers: {
                                                Accept: "application/json",
                                                "Content-Type": "application/json",
                                            },
                                            url: '../addActivity',
                                            type: 'post',
                                            dataType: "json",
                                            data: JSON.stringify(dataArray),
                                            success: function() {
                                                Swal.fire({
                                                        title: "儲存成功",
                                                        text: "重新導向...",
                                                        icon: "success",
                                                        timer: 3000,
                                                        showConfirmButton: false,
                                                    })
                                                    .then(() => {
                                                        window.location.href = "../myActivity";
                                                    });
                                            }
                                        });
                                    }
                                }
                            });
                        } else {
                            Swal.fire({
                                title: "請輸入行程名稱!",
                                icon: "warning",
                                timer: 1000,
                                showConfirmButton: false,
                            });
                        }

                    });

                    function originList() {
                        return `<li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>`
                    }

                    $("#reset").click(function() {

                        $.ajax({
                            url: '../getMyActName',
                            type: 'post',
                            data: {
                                memberId: $("#memberId").val()
                            },
                            success: function(res) {
                                $(".list-group").empty().append(originList());
                                $.each(res.actName, function(i, obj) {
                                    $(".list-group").append('<li class=" list-group-item"><a class="actName h4">' + obj.name + '</a></li>');
                                });
                            }

                        });
                    });

                    $.ajax({
                        url: '../getActivity',
                        type: 'post',
                        data: {
                            actName: $("#actName").text().trim(),
                            memberId: $("#mgrmemberId").val()
                        },
                        success: function(res) {
                            console.log(res);
                            var list = res.list;
                            var activity = res.activity;
                            $.each(res.activity, function(i, obj) {
                                var typeId = obj.typeId;
                                if (typeId == 1) {
                                    $("#actBody").append(homestayList(activity, list, i))
                                }
                                if (typeId == 2) {}
                                if (typeId == 3) {
                                    $("#actBody").append(eventList(activity, list, i))
                                }
                                if (typeId == 4) {
                                    $("#actBody").append(bikeList(activity, list, i))
                                }
                                if (typeId == 5) {
                                    $("#actBody").append(restAreaList(activity, list, i))
                                }



                            });
                        }


                    });


                });
            </script>

            <script>
                /* back To Top  */
                $('.scrollby').scrollspy({
                    target: '#backtop'
                });
            </script>
            <!-- map -->
    </body>

    </html>