<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>追風者｜活動</title>
        <link rel="stylesheet" href="../css/modal.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />

        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin="">
        </script>
        <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
            <style>
                body {
                    background-color: #f5f5f5;
                    font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
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
                    background-image: url("../img/event/img03.jpg");
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
                
                .imgcontainer {
                    background-color: (0, 0, 0, 0.1);
                    background-repeat: no-repeat;
                    background-attachment: scroll;
                    background-position: center;
                    width: 60%;
                    top: 0;
                    padding: 0;
                    height: 300px;
                    border-radius: 1%;
                    margin: auto;
                    background-size: contain;
                    -moz-border-radius: 1%;
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


            <div id="top-block">
                <div id="top-box">
                    <h1 id="title" class="align-middle">活動資訊</h1>
                </div>
            </div>
            <div class="container my-1">
                <!-- HOMEPAGE EVENTCAT EVENTID -->
                <div id="backtop" class="font-weight-light text-secondary  ">
                    <span class="text-left "><a class="text-decoration-none" href="../event"><i
					class="text-decoration-none text-muted fas fa-home">首頁</i></a></span> <span class="text-left "><a
				class="text-decoration-none text-muted" href="../event.query?categoryId=${event.eventCat.categoryId}">/ ${event.eventCat.type}</a></span> <span class="float-right">活動編號#
				${event.eventId}</span>

                </div>
                <div class="font-weight-light text-secondary text-left"></div>
            </div>
            <div class="imgcontainer" style="background-image: url(${event.image})">
            </div>
            <input id="favcounter" type="hidden" value="0">
            <input id="likecounter" type="hidden" value="0">
            <!-- container -->
            <div class="container my-5">

                <div class="row">
                    <div class="col-md-8">
                        <!-- EVENT-TITLE -->
                        <div class="event-title ">
                            <!-- website -->
                            <h3 class="p-2">${event.title}
                                <!-- event-favorite -->
                                <a id="favorite" class="event-favorite btn btn-sm float-right"> <i class="far fa-heart"></i>
                                </a>
                                <!-- event-like -->
                                <a id="like" class="event-like btn btn-sm float-right"> <i class="far fa-thumbs-up"></i>
                                </a>
                            </h3>

                        </div>
                        <!-- event-locationname -->
                        <div class="mt-2 event-locationname">
                            <span><i class="fas fa-location-arrow mx-1"></i>${event.locationName}</span>
                        </div>
                        <hr />
                        <!-- event-location -->
                        <div class="event-location">
                            <span><i class="fas fa-map-marker-alt mx-1"></i>${event.location}</span>
                        </div>
                        <hr />
                        <!-- event-startdate enddate -->
                        <div class="event-date">
                            <span><i class="far fa-calendar-alt mx-1"></i></span> <span class="badge badge-pill badge-info">${event.startDate}</span> ~ <span class="badge badge-pill badge-warning">${event.endDate}</span>
                        </div>
                        <hr />
                        <div class="event-description">
                            <span>${event.description}</span>
                        </div>
                        <hr />
                    </div>
                    <div class="col-md-4">
                        <hr>
                        <!-- event-price -->
                        <div class="event-price">

                            <h5 class="mb-3">
                                <i class="fas fa-dollar-sign">${event.price}</i>
                                <!-- event onsales? if onsales show it  -->
                                <span class="onsales h6 badge-pill badge-success float-right"><small>現場購票</small></span> <br>
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
                                                    <li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct" href="javascript:void(0)">加入新行程</a></li>
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

                    <div class="col-md-12">
                        <button id="googlemap" class="btn btn-link">Google Map</button>
                        <button id="osmmap" class="btn btn-link">Open Street Map</button>
                        <br>
                        <!-- event-pxpy or event-location -->
                        <div id="map" class="mb-5 p-5">
                            <iframe width="600" height="450" frameborder="0" style="border: 0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBdJB1--ZS5ivTTtYU3dmQ1MEjrIQMTEsc
   							 &q=${event.locationName}" allowfullscreen>
						</iframe>
                        </div>

                        <hr>
                    </div>
                    <br>
                    <br>
                    <div class="col-md-12">
                        <br>
                        <br>
                        <div id="comment">
                            <!-- 判斷是否登入 無登入placeholder:請先登入 -->
                            <form>
                                <div id="mycomment" class="input-group mb-3">
                                    <c:if test="${! empty loginOK.memberAdvanced.icon}">
                                        <img class="rounded-circle" width="60" height="60" src="../showMemberIcon?id=${loginOK.memberId}">
                                    </c:if>
                                    <c:if test="${ empty loginOK.memberAdvanced.icon}">
                                        <c:if test="${ empty pictureUrl}">
                                            <img class="rounded-circle" width="60" height="60" src="../img/road.jpg">
                                        </c:if>
                                        <c:if test="${! empty pictureUrl}">
                                            <img class="rounded-circle" width="60" height="60" src="${pictureUrl}">
                                        </c:if>
                                    </c:if>
                                    <input id="memberId" value="${loginOK.memberId}" type="hidden">
                                    <input id="eventId" name="event.eventId" value="${event.eventId}" type="hidden">
                                    <input id="time" name="time" value="" type="hidden">

                                    <input id="content" name="content" type="text" class="align-middle mx-1 rounded form-control" placeholder="發表您的評論" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                    <a id="sendComment" type="button" class="btn btn-outline-primary">留言</a>
                                    <button type="reset" class="btn btn-outline-light">取消</button>
                                </div>
                            </form>

                            <div id="firstcomment">
                            </div>


                        </div>

                    </div>

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
            <script src="../js/event/eventUI_detail.js"></script>



            <script>
                /* back To Top  */
                $('.scrollby').scrollspy({
                    target: '#backtop'
                });
            </script>
    </body>

    </html>