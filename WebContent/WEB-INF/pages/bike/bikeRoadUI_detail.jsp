<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>追風者｜自行車道</title>
            <!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
            <!-- <link rel="stylesheet" -->
            <!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
            <!-- 	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
            <!-- 	crossorigin="anonymous"> -->
            <link rel="stylesheet" href="css/modal.css">
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>

                <style>
                    .carousel .carousel-item img {
                        min-height: 200px;
                        max-height: 500px;
                        object-fit: cover;
                    }
                    
                    body {
                        font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                        /*font-family: Meiryo, メイリオ, 'MS PGothic', arial, helvetica, sans-serif;*/
                        color: #333333;
                    }
                    
                    #top-block {
                        height: 200px;
                        width: 100%;
                        background-color: #f5f5f5;
                        top: 0;
                        background-position: 50%;
                        background-repeat: no-repeat;
                        background-size: cover;
                        overflow: hidden;
                        position: relative;
                        background-image: url("img/bikeroad/bike5.jpg");
                    }
                    
                    #top-box {
                        background-size: cover;
                        overflow: hidden;
                        position: absolute;
                        width: 100%;
                        height: 100%;
                        top: 0px;
                        left: 0px;
                        display: block;
                        background: rgba(0, 0, 0, 0.3);
                        transition: opacity 0.5s ease-in-out;
                        color: #FFF;
                        text-align: center;
                    }
                    
                    #title {
                        position: relative;
                        text-align: center;
                        top: 50px;
                        font-family: "Material Icons";
                        font-size: 40px;
                        color: #fff;
                    }
                </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

                <div id="top-block">
                    <div id="top-box">
                        <h1 id="title" class="align-middle">自行車道</h1>
                    </div>
                </div>
                <!-- ---------search bar------------ -->


                <!-- container -->
                <div class="container my-5">
                    <input id="favcounter" type="hidden" value="0">
                    <input id="bikeId" type="hidden" value="${changeid}">
                    <input id="memberId" type="hidden" value="${loginOK.memberId}">

                    <p>
                        <a class="float-left mx-4 h4" href="#"><strong id="bikeName">${param.name}</strong></a>
                    </p>
                    <div class="clearfix"></div>
                    <hr class=" border-secondary" />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 pb-2 ">
                                <!--                     <img src="img01.jpg" class="img-thumbnail rounded mt-0" alt="..."> -->
                                <%--                                 <iframe width="100%" height="300" frameborder="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${param.latitude},${param.longitude}&z=16&output=embed&t=h"></iframe> --%>
                                    <iframe width="100%" height="300" frameborder="0" src="https://www.google.com/maps/embed/v1/streetview?key=AIzaSyD5v5CjTEgBm2yqpNlh8yUXWt7SfHHiLgY&location=${param.latitude},${param.longitude}&heading=60&pitch=30&fov=90"></iframe>
                            </div>
                            <div class="col-md-8">

                                <p class="float-left ">
                                    <a href="#" class="badge badge-light">${param.city}</a> <a href="#" class="badge badge-light">${param.town}</a>
                                </p>
                                <a id="favorite" class="bikeRoad-favorite btn btn-sm float-right"> <i class="far fa-heart"></i></a>
                                <button id="addAct" type="button" class="float-right btn btn-sm btn-info" data-toggle="modal" data-target="#sideModalTR">
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
                                <div class="clearfix"></div>
                                <p class="float-left badge badge-success">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path
								d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
                        
                    </svg> 起點
                                </p>
                                <c:if test="${not empty param.begin}">
                                    <span class="mx-2">${param.begin}</span>
                                </c:if>
                                <c:if test="${empty param.begin}">
                                    <span class="mx-2">未提供</span>
                                </c:if>
                                <div class="clearfix"></div>
                                <p class="float-left badge badge-secondary">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-stop-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path
								d="M5 3.5h6A1.5 1.5 0 0 1 12.5 5v6a1.5 1.5 0 0 1-1.5 1.5H5A1.5 1.5 0 0 1 3.5 11V5A1.5 1.5 0 0 1 5 3.5z" />
                      </svg> 終點
                                </p>
                                <c:if test="${not empty param.goal}">
                                    <span class="mx-2">${param.goal}</span>
                                </c:if>
                                <c:if test="${empty param.goal}">
                                    <span class="mx-2">未提供</span>
                                </c:if>
                                <div class="clearfix"></div>
                                <p class="float-left badge badge-info">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
                        <g>
                            <g>
                                <path
								d="M504,200H8c-4.416,0-8,3.584-8,8v128c0,4.416,3.584,8,8,8h496c4.416,0,8-3.584,8-8V208C512,203.584,508.416,200,504,200z
                                     M496,328H16V216h480V328z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M504,168H8c-4.416,0-8,3.584-8,8v32c0,4.416,3.584,8,8,8h496c4.416,0,8-3.584,8-8v-32C512,171.584,508.416,168,504,168z
                                     M496,200H16v-16h480V200z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M64,280c-4.416,0-8,3.584-8,8v48c0,4.416,3.584,8,8,8s8-3.584,8-8v-48C72,283.584,68.416,280,64,280z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M192,280c-4.416,0-8,3.584-8,8v48c0,4.416,3.584,8,8,8s8-3.584,8-8v-48C200,283.584,196.416,280,192,280z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M320,280c-4.416,0-8,3.584-8,8v48c0,4.416,3.584,8,8,8c4.416,0,8-3.584,8-8v-48C328,283.584,324.416,280,320,280z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M448,280c-4.416,0-8,3.584-8,8v48c0,4.416,3.584,8,8,8c4.416,0,8-3.584,8-8v-48C456,283.584,452.416,280,448,280z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M384,240c-4.416,0-8,3.584-8,8v88c0,4.416,3.584,8,8,8c4.416,0,8-3.584,8-8v-88C392,243.584,388.416,240,384,240z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M256,240c-4.416,0-8,3.584-8,8v88c0,4.416,3.584,8,8,8s8-3.584,8-8v-88C264,243.584,260.416,240,256,240z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path
								d="M128,240c-4.416,0-8,3.584-8,8v88c0,4.416,3.584,8,8,8s8-3.584,8-8v-88C136,243.584,132.416,240,128,240z" />
                            </g>
                        </g>

                        </svg> 總長
                                </p>
                                <c:if test="${not empty param.m}">
                                    <span class="mx-2">${param.m}公尺</span>
                                </c:if>
                                <c:if test="${empty param.m}">
                                    <span class="mx-2">未提供</span>
                                </c:if>
                                <div class="clearfix"></div>
                                <p class="float-left badge badge-warning">
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
								d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z" />
                        <path fill-rule="evenodd"
								d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z" />
                      </svg> 維護單位
                                </p>
                                <c:if test="${not empty param.maintain}">
                                    <span class="mx-2">${param.maintain}</span>
                                </c:if>
                                <c:if test="${empty param.maintain}">
                                    <span class="mx-2">未提供</span>
                                </c:if>
                                <div class="clearfix"></div>
                                <form action="<c:url value='/bikeErrorInsertEntry.controller'/>" method="get">
                                    <a class="btn btn-danger" id="errorreport" href="javacript:void(0)">
                                        <!-- 					<p class="float-left badge badge-danger"> -->
                                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-shield-fill-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
									d="M8 .5c-.662 0-1.77.249-2.813.525a61.11 61.11 0 0 0-2.772.815 1.454 1.454 0 0 0-1.003 1.184c-.573 4.197.756 7.307 2.368 9.365a11.192 11.192 0 0 0 2.417 2.3c.371.256.715.451 1.007.586.27.124.558.225.796.225s.527-.101.796-.225c.292-.135.636-.33 1.007-.586a11.191 11.191 0 0 0 2.418-2.3c1.611-2.058 2.94-5.168 2.367-9.365a1.454 1.454 0 0 0-1.003-1.184 61.09 61.09 0 0 0-2.772-.815C9.77.749 8.663.5 8 .5zM6.854 6.146a.5.5 0 1 0-.708.708L7.293 8 6.146 9.146a.5.5 0 1 0 .708.708L8 8.707l1.146 1.147a.5.5 0 0 0 .708-.708L8.707 8l1.147-1.146a.5.5 0 0 0-.708-.708L8 7.293 6.854 6.146z" />
</svg> 問題回報
                                    
                                    </a>
                                </form>
                            </div>





                        </div>
                        <p class="h4 my-4">
                            <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd"
						d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
            <path fill-rule="evenodd"
						d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
          </svg>
                            <strong class=" mx-2 my-0">地圖位置資訊</strong>
                        </p>
                        <hr class=" border-secondary" />
                        <c:if test="${empty param.goal}">
                            <iframe width="100%" height="300" frameborder="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${param.latitude},${param.longitude}&z=16&output=embed&t=p"></iframe>
                        </c:if>
                        <!-- 			<iframe width="100%" height="300" frameborder="0"  -->
                        <%-- 				src="https://www.google.com/maps/embed/v1/streetview?key=AIzaSyD5v5CjTEgBm2yqpNlh8yUXWt7SfHHiLgY&location=${param.latitude},${param.longitude}&heading=60&pitch=30&fov=90"></iframe> --%>
                            <c:if test="${not empty param.goal}">
                                <iframe width="100%" height="300" frameborder="0" src="https://www.google.com/maps/embed/v1/directions?origin=${param.begin}&destination=${param.goal}&mode=bicycling&key=AIzaSyD5v5CjTEgBm2yqpNlh8yUXWt7SfHHiLgY"></iframe>
                            </c:if>
                    </div>

                    <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
                        <script>
                            /* check login */
                            /* jackey/controller/EventPageController --> checkLogin */

                            $(function() {
                                $.ajax({
                                    url: 'checkLogin',
                                    type: 'post',
                                    dataType: 'json',
                                    success: function(res) {
                                        if (res.login == false) {
                                            $("#errorreport").click(function() {
                                            	Swal.fire({
                                                    text: "請先登入...",
                                                    icon: "warning",
                                                    timer: 1500,
                                                    showConfirmButton: false,
                                                }).then(() => {
                                                    window.location.href = "loginPage";
                                                });
                                            });
                                            $("#favorite").click(function() {
                                                Swal.fire({
                                                        title: "請先登入",
                                                        text: "導向登入頁...",
                                                        icon: "warning",
                                                        timer: 1500,
                                                        showConfirmButton: false,
                                                    })
                                                    .then(() => {
                                                        window.location.href = "loginPage";
                                                    });
                                            })
                                        }else {
                                        	$("#errorreport").prop("href",
                                            "bikeErrorInsertEntry.controller");
                                        }
                                    }
                                });
                                $.ajax({
                                    url: 'checkMyFavorite',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        typeId: 4,
                                        infoId: $("#bikeId").val(),
                                        memberId: $("#memberId").val(),
                                    },
                                    success: function(res) {
                                        console.log(res);
                                        if (res.favorite == true) {
                                            $("#favorite").empty();
                                            $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                                            $("#favcounter").val(1);
                                        } else {
                                            $("#favcounter").val(2);
                                        }
                                    }

                                });

                                function checkFavorite() {
                                    var counter = $("#favcounter").val();
                                    if (counter % 2 == 0) {
                                        var info = {
                                            "memberId": $("#memberId").val(),
                                            "typeId": 4,
                                            "infoId": $("#bikeId").val(),
                                            "favName": $("#bikeName").text().trim()
                                        }
                                        $.ajax({
                                            url: 'addMyFavorite',
                                            type: 'post',
                                            dataType: 'json',
                                            data: info,
                                            success: function(res) {
                                                console.log(res);
                                                if (res.success == true) {
                                                    $("#favorite").empty();
                                                    $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                                                }
                                            }
                                        });

                                    }
                                    if (counter % 2 == 1) {
                                        var info = {
                                            "memberId": $("#memberId").val(),
                                            "typeId": 4,
                                            "infoId": $("#bikeId").val(),
                                        }
                                        $.ajax({
                                            url: 'deleteMyFavorite',
                                            type: 'post',
                                            dataType: 'json',
                                            data: info,
                                            success: function(res) {
                                                console.log(res);
                                                if (res.success == true) {
                                                    $("#favorite").empty();
                                                    $("#favorite").append('<i class="far fa-heart"></i>');
                                                }
                                            }
                                        });

                                    }
                                    counter++;
                                    $("#favcounter").val(counter);
                                }

                                /* =============ADD FAVORITE============== */
                                $("#favorite").on("click", function() {
                                    checkFavorite();
                                });



                                $.ajax({
                                    url: 'getMyActName',
                                    type: 'post',
                                    data: {
                                        memberId: $("#memberId").val()
                                    },
                                    success: function(res) {
                                        console.log(res);
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
                                        url: 'addMyActName',
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
                                    $(this).closest('li').prevAll().remove();
                                    $(this).closest('li').nextAll().remove();
                                    $(this).after('<li class="list-group-item"><input class="my-2 actDate form-control-lg" placeholder="請選擇日期" type="text" ></li>')
                                    const fp = flatpickr(".actDate", {})
                                });

                                $("#addNewAct").on("click", function() {
                                    $.ajax({
                                        url: 'addActivityByCart',
                                        type: 'post',
                                        data: {
                                            typeId: 4,
                                            infoId: $("#bikeId").val(),
                                            actDate: $(".actDate").val(),
                                            name: $(".actName").text().trim(),
                                            price: 0,
                                            memberId: $("#memberId").val()
                                        },
                                        success: function(res) {
                                            Swal.fire({
                                                    title: "新增成功",
                                                    icon: "success",
                                                    timer: 3000,
                                                    showConfirmButton: false,
                                                })
                                                .then(() => {
                                                    location.reload();
                                                });

                                        }

                                    });

                                });


                                function originList() {
                                    return `<li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>`
                                }

                                $("#reset").click(function() {

                                    $.ajax({
                                        url: 'getMyActName',
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
                            });
                        </script>

        </body>

        </html>