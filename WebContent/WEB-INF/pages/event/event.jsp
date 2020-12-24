<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>追風者｜event</title>

            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                <style>
                    body {
                        background-color: #f5f5f5;
                        font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                        color: #333333;
                    }
                    
                    .scrollby {
                        bottom: 50px;
                        position: fixed;
                        right: 10px;
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
                    
                    .jumbotron {
                        top: 0;
                        background-image: url("img/event/img03.jpg");
                        background-color: (0, 0, 0, 0.1);
                        background-repeat: no-repeat;
                        /* background-attachment: fixed; */
                        background-position: 50%;
                        background-size: cover;
                        height: 300px;
                        overflow: hidden;
                        position: relative;
                    }
                    /* @import url(https://fonts.googleapis.com/css?family=Open+Sans);
                    body {
                        font-family: 'Open Sans', sans-serif;
                    } */
                    
                    .searchTerm {
                        width: 100%;
                        border: 3px solid #00B4CC;
                        border-right: none;
                        padding: 5px;
                        height: 35px;
                        border-radius: 5px 0 0 5px;
                        outline: none;
                        color: #9DBFAF;
                    }
                    
                    .searchTerm:focus {
                        color: #00B4CC;
                    }
                    
                    .searchButton {
                        width: 40px;
                        height: 36px;
                        border: 1px solid #00B4CC;
                        background: #00B4CC;
                        text-align: center;
                        color: #fff;
                        border-radius: 0 5px 5px 0;
                        cursor: pointer;
                        font-size: 20px;
                    }
                    /*Resize the wrap to see the search bar change!*/
                    
                    .wrap {
                        width: 50%;
                        height: 100%;
                        position: relative;
                        top: 30%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                    }
                    /* ---------------- */
                    
                    .img-box:hover .info-box {
                        display: block;
                        background: rgba(0, 0, 0, .4);
                        transition: opacity 0.5s ease-in-out;
                        /* transition-property: all;
					transition-duration: 1s;
					transition-timing-function: ease;
					transition-delay: 0.3s; */
                    }
                    
                    .img-box img {
                        position: relative;
                    }
                    
                    .hover-box .img-box {
                        position: relative;
                        overflow: hidden;
                    }
                    
                    .info-box {
                        background-size: cover;
                        overflow: hidden;
                        position: absolute;
                        width: 100%;
                        height: 100%;
                        top: 0px;
                        left: 0px;
                        border-radius: 5px;
                        display: none;
                    }
                    
                    .content {
                        color: white;
                        position: absolute;
                        top: 70px;
                        left: 30px;
                    }
                    
                    .mh-on {
                        -webkit-backface-visibility: hidden;
                        -webkit-filter: blur(3px);
                        filter: blur(3px);
                        opasity: 0.9;
                        transition: 0.5s ease-in-out;
                    }
                    
                    .form-control-borderless {
                        border: none;
                    }
                    
                    .form-control-borderless:hover,
                    .form-control-borderless:active,
                    .form-control-borderless:focus {
                        border: none;
                        outline: none;
                        box-shadow: none;
                    }
                    /* #search {
                    top: 150px;
                    left: 400px;
                    display: flex;
                } */
                    
                    #header-box {
                        top: 0px;
                        left: 180px;
                        width: 500px;
                        position: relative;
                    }
                </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
                <!-- nav bar end -->
                <!-- image -->
                <section id="backtop" class="jumbotron ">

                    <br/>
                    <div id="header-box" class="row justify-content-center">
                        <div id="search" class="col-md-12">
                            <form action="event.query" class="">
                                <div class="row no-gutters align-items-center">

                                    <div class="col">
                                        <input name="query" class="form-control form-control-lg form-control-borderless" type="search" placeholder="輸入想查詢的活動、地點或種類">
                                    </div>
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit">
                                        <i class="fa fa-search "></i>
                                    </button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
                        </div>
                        <!--end of col-->

                        <div id="location-btn " class="col-md-5 rounded">
                            <br>
                            <h4 class="text-light collapsable ">目的地</h4>
                            <a href="event.query?query=台北" class="btn btn-sm btn-outline-light badge-pill my-1 ">台北</a>
                            <a href="event.query?query=新北" class="btn btn-sm btn-outline-light badge-pill my-1 ">新北</a>
                            <a href="event.query?query=基隆" class="btn btn-sm btn-outline-light badge-pill my-1 ">基隆</a>
                            <br>
                            <a href="event.query?query=桃園" class="btn btn-sm btn-outline-light badge-pill my-1 ">桃園</a>
                            <a href="event.query?query=台中" class="btn btn-sm btn-outline-light badge-pill my-1 ">台中</a>
                            <a href="event.query?query=台南" class="btn btn-sm btn-outline-light badge-pill my-1 ">台南</a>
                        </div>
                        <div id="location-btn " class="col-md-5 rounded">
                            <br>
                            <h4 class="text-light collapsable ">活動類型</h4>
                            <a href="event.query?categoryId=1" class="btn btn-sm btn-outline-light badge-pill my-1 ">娛樂</a>
                            <a href="event.query?categoryId=2" class="btn btn-sm btn-outline-light badge-pill my-1 ">展覽</a>
                            <a href="event.query?categoryId=3" class="btn btn-sm btn-outline-light badge-pill my-1 ">親子</a>

                        </div>
                        <div class="col-md-2 rounded"></div>
                    </div>
                    <!-- < uses utility classes for typography and spacing to space content out within the larger container.</p> -->
                    <div class="wrap ">

                    </div>
                    <!-- </div> -->
                </section>




                <!-- container -->
                <div id="eventcontainer" class="container my-5">
                    <div class="container text-center my-3">
                        <div class="h3 my-4 mx-4 text-left">
                            <p>
                                <strong>來看看我們的行程吧 <i class="fas fa-bullhorn"></i></strong>
                            </p>
                        </div>
                        <div class="row mx-auto my-auto ">
                            <div id="actCarousel" class="carousel slide w-100" data-ride="carousel">
                                <div class="carousel-inner w-100" role="listbox">
                                    <c:forEach var='actName' items='${actNames}' varStatus="s">

                                        <c:if test="${s.index ==0 }">
                                            <div class="hover-box carousel-item active">

                                        </c:if>

                                        <c:if test="${s.index !=0 }">
                                            <div class="hover-box carousel-item">

                                        </c:if>
                                        <div class="img-box col-md-4">
                                            <a class="card-link" href="activity/${actName.actNameId}">
                                                <div class="card card-body p-0 rounded">

                                                    <img class="img-fluid card-img-top m-0 rounded-lg" src="img/activity/act${s.index}.jpg">
                                                    <div class="info-box">
                                                        <div class="content">
                                                            <h4 class="float-left">${actName.name}</h4>
                                                            <div class="clearfix"></div>
                                                            <p class="float-left mt-3"><i class="fa fa-angle-right">更多內容</i></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </div>
                                    </c:forEach>
                                    </div>

                                    <a class="carousel-control-prev w-auto" href="#actCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next w-auto" href="#actCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Next</span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        <div class="container text-center my-3">
                            <div class="h3 my-4 mx-4 text-left">
                                <p>
                                    <strong>最新活動資訊 <i class="fas fa-bullhorn"></i></strong>
                                </p>
                            </div>
                            <div class="row mx-auto my-auto ">
                                <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
                                    <div class="carousel-inner w-100" role="listbox">
                                        <c:forEach var='latest' items='${latests}' varStatus="s">

                                            <c:if test="${s.index ==0 }">
                                                <div class="hover-box carousel-item active">

                                            </c:if>

                                            <c:if test="${s.index !=0 }">
                                                <div class="hover-box carousel-item">

                                            </c:if>
                                            <div class="img-box col-md-4">
                                                <a class="card-link" href="event/${latest.eventId}">
                                                    <div class="card card-body p-0 rounded">
                                                        <c:if test="${! empty latest.image}">
                                                            <img class="img-fluid card-img-top m-0 rounded-lg" src="${latest.image}">
                                                        </c:if>
                                                        <c:if test="${empty latest.image }">
                                                            <img class="img-fluid card-img-top m-0 rounded-lg" src="img/event/img${s.index}.jpg">
                                                        </c:if>
                                                        <div class="info-box">
                                                            <div class="content">
                                                                <h4 class="float-left">${latest.title}</h4>
                                                                <div class="clearfix"></div>
                                                                <p class="float-left mt-3"><i class="fa fa-angle-right">更多內容</i></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            </div>
                                        </c:forEach>
                                        </div>

                                        <a class="carousel-control-prev w-auto" href="#recipeCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next w-auto" href="#recipeCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <div class="container text-center my-3">
                                <div class="h3 my-4 mx-4 text-left">
                                    <p>
                                        <strong>大家都在討論 <i class="fas fa-bullhorn"></i></strong>
                                    </p>
                                </div>
                                <div class="row mx-auto my-auto ">
                                    <div id="commentCarousel" class="carousel slide w-100" data-ride="carousel">
                                        <div class="carousel-inner w-100" role="listbox">
                                            <c:forEach var='comment' items='${comments}' varStatus="s">
                                                <c:if test="${s.index ==0 }">
                                                    <div class="hover-box carousel-item active">

                                                </c:if>
                                                <c:if test="${s.index !=0 }">
                                                    <div class="hover-box carousel-item">

                                                </c:if>
                                                <div class="img-box col-md-4">
                                                    <a class="card-link" href="event/${comment.eventId}">
                                                        <div class="card card-body p-0 rounded">
                                                            <c:if test="${! empty comment.image}">
                                                                <img class="img-fluid card-img-top m-0 rounded-lg" src="${comment.image}">
                                                            </c:if>
                                                            <c:if test="${empty comment.image}">
                                                                <img class="img-fluid card-img-top m-0 rounded-lg" src="img/event/img${s.index}.jpg">
                                                            </c:if>
                                                            <div class="info-box">
                                                                <div class="content">
                                                                    <h4 class="float-left">${comment.title}</h4>
                                                                    <div class="clearfix"></div>
                                                                    <p class="float-left mt-3"><i class="fa fa-angle-right">更多內容</i></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                </div>
                                            </c:forEach>



                                            </div>
                                            <a class="carousel-control-prev w-auto" href="#commentCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next w-auto" href="#commentCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Next</span>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                                <div class="container text-center my-3">
                                    <hr class="m-3" />
                                    <div class="h3 my-4 mx-4 text-left">
                                        <p>
                                            <strong>最多人瀏覽 <i class="fas fa-eye"></i></strong>
                                        </p>
                                    </div>
                                    <div class="row mx-auto my-auto">
                                        <div id="recipeCarousel2" class="carousel slide w-100" data-ride="carousel">
                                            <div class="carousel-inner w-100" role="listbox">
                                                <c:forEach var='view' items='${views}' varStatus="s">
                                                    <c:if test="${s.index ==0 }">
                                                        <div class="hover-box carousel-item active">

                                                    </c:if>
                                                    <c:if test="${s.index !=0 }">
                                                        <div class="hover-box carousel-item">

                                                    </c:if>
                                                    <div class="img-box col-md-4">
                                                        <a class="card-link" href="event/${view.eventId}">
                                                            <div class="card card-body p-0 rounded">
                                                                <c:if test="${empty view.image}">
                                                                    <img class="img-fluid card-img-top m-0 rounded-lg" src="img/event/img${s.index}.jpg">
                                                                </c:if>
                                                                <c:if test="${! empty view.image}">
                                                                    <img class="img-fluid card-img-top m-0 rounded-lg" width="328" height="400" src="${view.image}">
                                                                </c:if>

                                                                <div class="info-box">
                                                                    <div class="content">
                                                                        <h4 class="float-left">${view.title}</h4>
                                                                        <div class="clearfix"></div>
                                                                        <p class="float-left mt-3"><i class="fa fa-angle-right">更多內容</i></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    </div>

                                                </c:forEach>
                                                </div>
                                                <a class="carousel-control-prev w-auto" href="#recipeCarousel2" role="button" data-slide="prev"> <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="carousel-control-next w-auto" href="#recipeCarousel2" role="button" data-slide="next"> <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="test">
                                    </div>
                                    <div class="container text-center my-3">
                                        <hr class="m-3" />
                                        <div class="h3 my-4 mx-4 text-left">
                                            <p>
                                                <strong>TOP 10 熱門活動 <i class="fab fa-hotjar"></i></strong>
                                            </p>
                                        </div>
                                        <div class="row mx-auto my-auto">
                                            <div id="recipeCarousel3" class="carousel slide w-100" data-ride="carousel">
                                                <div class="carousel-inner w-100" role="listbox">

                                                    <c:forEach var='like' items='${likes}' varStatus="s">
                                                        <c:if test="${s.index ==0 }">
                                                            <div class="carousel-item active">

                                                        </c:if>
                                                        <c:if test="${s.index !=0 }">
                                                            <div class="carousel-item">

                                                        </c:if>
                                                        <div class="eventlist col-md-4">
                                                            <div class="card mb-4 shadow-sm">
                                                                <div class="card-body p-0 rounded">
                                                                    <!-- img -->
                                                                    <c:if test="${empty like.image}">
                                                                        <img class="img-fluid card-img-top m-0 rounded-lg" src="img/event/img${s.index}.jpg">
                                                                    </c:if>
                                                                    <c:if test="${! empty like.image}">
                                                                        <img class="img-fluid card-img-top m-0 rounded-lg" width="328" height="400" src="${like.image}">
                                                                    </c:if>

                                                                    <p class="eventTitle card-text text-left m-1">
                                                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M6 12.796L11.481 8 6 3.204v9.592zm.659.753l5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
                                                        </svg><a class="text-decoration-none text-muted" href="event/${like.eventId}">${like.title}</a></p>
                                                                    <p class="eventLocation card-text text-left m-1">
                                                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                        <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                        </svg>${like.locationName}</p>
                                                                    <div class="d-flex justify-content-between align-items-center">
                                                                        <!-- <div class="btn-group text-right">
                                                        <button type="button" class="btn btn-sm btn-outline-secondary float-right"></button>

                                                    </div> -->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </c:forEach>


                                                    </div>
                                                    <a class="carousel-control-prev w-auto" href="#recipeCarousel3" role="button" data-slide="prev"> <span class="carousel-control-prev-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                                                    </a>
                                                    <a class="carousel-control-next w-auto" href="#recipeCarousel3" role="button" data-slide="next"> <span class="carousel-control-next-icon bg-dark border border-dark rounded-circle" aria-hidden="true"></span> <span class="sr-only">Next</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <!-- <div class="m-2  ">
                                        <span> 
                                            <a class="scrollby btn btn-secondary shadow "> <i class=" fa fa-2x fa-angle-up "></i>
                                            </a>
                                        </span> -->
                                    <div class="m-2 scrollby ">
                                        <span> <a id="goToTop" href="#" class="btn btn-secondary shadow"> <i class=" fa fa-2x fa-angle-up"></i>
                                            </a>
                                            </span>
                                    </div>


                                    <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>

                                        <script>
                                            /* back To Top  */
                                            $('.scrollby').scrollspy({
                                                target: '#backtop'
                                            });
                                        </script>
                                        <!-- <script>
                                function utf8_to_b64(str) {
                                    return window.btoa(unescape(encodeURIComponent(str)));
                                }

                                $(function() {
                                    $(".card-link ").mouseenter(function() {
                                        $(this).find("img ").addClass("mh-on ");

                                    }).mouseleave(function() {
                                        $(this).find("img ").removeClass("mh-on ");
                                    });


                                    $.ajax({
                                        url: 'img1048',
                                        type: 'post',
                                        success: function(res) {
                                            console.log(res);
                                            var btstr = utf8_to_b64(res);
                                            var b64res = btoa(btstr);
                                            var outputImg = document.createElement('img');
                                            outputImg.src = 'data:image/jpg;base64,' + b64res;

                                            $("#test ").append(outputImg);
                                            /* $("#testimg ").attr('src','data:image/png;base64,'+b64res); */
                                        }



                                    });

                                });
                            </script> -->
                                        <script>
                                            $('#recipeCarousel').carousel({
                                                interval: 10000
                                            })

                                            $('.carousel .carousel-item').each(function() {
                                                var minPerSlide = 3;
                                                var next = $(this).next();
                                                if (!next.length) {
                                                    next = $(this).siblings(':first');
                                                }
                                                next.children(':first-child').clone().appendTo($(this));

                                                for (var i = 0; i < minPerSlide; i++) {
                                                    next = next.next();
                                                    if (!next.length) {
                                                        next = $(this).siblings(':first');
                                                    }

                                                    next.children(':first-child').clone().appendTo($(this));
                                                }
                                            });
                                        </script>


        </body>

        </html>