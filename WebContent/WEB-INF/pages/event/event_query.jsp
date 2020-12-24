<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>追風者｜Document</title>
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                <style>
                    body {
                        background-color: #f5f5f5;
                    }
                    /* #search {
                        width: 250px;
                        top: 130px;
                        position: fixed;
                        left: 10px;
                        display: flex;
                    }
                    
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
                    } */
                    
                    .eventDescription {
                        height: 50px;
                        display: -webkit-box;
                        overflow: hidden;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        white-space: normal;
                        text-overflow: ellipsis;
                    }
                    
                    .eventTitle {
                        height: 66px;
                        width: 500px;
                        display: -webkit-box;
                        overflow: hidden;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        white-space: normal;
                        text-overflow: ellipsis;
                    }
                    
                    #count {
                        color: #85e0ec;
                    }
                    
                    .scrollby {
                        bottom: 50px;
                        position: fixed;
                        right: 10px;
                    }
                    
                    .event-favorite {
                        top: 0;
                        right: 0;
                    }
                    
                    .card {
                        padding: 5px 20px;
                        border: 0;
                        background-color: #fff;
                        border-radius: 6px;
                        margin-bottom: 15px;
                    }
                    
                    .product-list,
                    .product-count {
                        padding: 5px 0px;
                        border: 0;
                        background-color: #fff;
                        border-radius: 6px;
                        margin-bottom: 15px;
                    }
                    
                    .img-bg {
                        background-position: 50%;
                        left: 0;
                        background-repeat: no-repeat;
                        background-size: cover;
                        overflow: hidden;
                        margin-right: -10px;
                        border-radius: 6px 0 0 6px;
                    }
                    
                    body {
                        background-color: #f5f5f5;
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
                        background-image: url("img/event/img03.jpg");
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

                <input id="memberId" value="${loginOK.memberId}" type="hidden">
                <input id="favcounter" type="hidden" value="0">
                <div id="top-block">
                    <div id="top-box">
                        <h1 id="title" class="align-middle">活動搜尋</h1>
                    </div>
                </div>

                <div class="container mt-2">
                    <div id="backtop" class="font-weight-light text-secondary  ">
                        <span class="text-left "><a class="text-decoration-none" href="event"><i
                class="text-decoration-none text-muted fas fa-home">首頁</i></a></span> <span class="text-left ">
                <span class="text-decoration-none text-muted" ><i class="fa fa-angle-right"> 搜尋</i> </span></span> <span class="float-right"></span>
                    </div>
                    <h4 class="my-2">搜尋結果為 “ <span class="h3" id="querytext"> ${query}</span> ” </h4>
                    <div class="row">
                        <div class="col-md-3 my-2">
                            <div class="card" id="search">
                                <div class="card-body">
                                    <input type="text" class="float-left form-control w-75 border-secondary searchTerm" placeholder="搜尋活動">
                                    <button class="btn btn-sm btn-info float-right searchButton">
                                        <i class="fa fa-search"></i>
                                    </button>

                                </div>
                            </div>
                            <div class="filter-container">
                                <div class="card">

                                    <div id="location-btn" class="card-body rounded">
                                        <h4 class="collapsable">熱門目的地</h4>
                                        <hr>
                                        <span class="btn btn-sm btn-outline-info badge-pill my-1">台北</span>
                                        <span class="btn btn-sm btn-outline-info badge-pill my-1">新北</span>
                                        <span class="btn btn-sm btn-outline-info badge-pill my-1">基隆</span>
                                        <br>
                                        <span class="btn btn-sm btn-outline-info badge-pill my-1">桃園</span>
                                        <span class="btn btn-sm btn-outline-info badge-pill my-1">台中</span>
                                        <span class="btn btn-sm btn-outline-info badge-pill my-1">台南</span>
                                    </div>

                                </div>
                                <div class="card my-5">

                                    <div id="category-btn" class="card-body rounded">
                                        <h4 class="collapsable">活動種類</h4>
                                        <hr>
                                        <span id="cat1" class="btn btn-sm btn-outline-info badge-pill my-1">娛樂</span>
                                        <span id="cat2" class="btn btn-sm btn-outline-info badge-pill my-1">展覽</span>
                                        <span id="cat3" class="btn btn-sm btn-outline-info badge-pill my-1">親子</span>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div id="row" class="col-md-9">
                            <div class="product-count mb-4 shadow-sm rounded">
                                <h4 class="ml-3 mt-1"><span class="h3" id="count">${count}</span> 項活動</h4>

                            </div>
                            <div class="eventList">
                                <c:forEach items="${lists}" var="list" varStatus="s">
                                    <div class="product-list mb-4 shadow-sm rounded">
                                        <input id="eid${s.index}" class="eventId" value="${list.eventId}" type="hidden">
                                        <a id="favorite${s.index}" class="event-favorite btn float-right mt-0"><i class="far fa-heart"></i></a>
                                        <input class="favcounter" type="hidden" value="0">
                                        <a id="product-card-00${s.index}" class="text-muted text-decoration-none" href="event/${list.eventId}">
                                            <div class="row" style="left: 0px;">
                                                <div class="col-sm-5 col-lg-4">
                                                    <c:if test="${empty list.image}">
                                                        <div class="img-bg" style='background-image: url("img/event/img${s.index}.jpg" ); width: 272px;height: 255px;'></div>

                                                    </c:if>
                                                    <c:if test="${! empty list.image}">
                                                        <div class="img-bg" style='background-image: url("${list.image}.jpg" ); width: 272px;height: 255px;'></div>
                                                    </c:if>

                                                </div>
                                                <div class="col-sm-7 col-lg-8">
                                                    <div class="ml-2 mt-1">
                                                        <div class="text-decoration-none">
                                                            <h3 class="eventTitle">${list.title} </h3>
                                                            <p class="eventDescription card-text text-left m-1">${list.description}</p>
                                                            <p class="eventLocation card-text text-left m-1">
                                                                <i class="fas fa-map-marker-alt"></i> ${list.location}
                                                            </p>
                                                            <p class="card-text text-left m-1"><i class="far fa-calendar-check"></i> ${list.startDate}</p>
                                                            <p class="card-text text-left m-1"><i class="far fa-calendar-times"></i> ${list.endDate }</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>

                                    </div>
                                </c:forEach>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">

                                    <li class="page-item">
                                        <a class="prevbtn page-link btn" aria-label="Previous">&laquo;</a>
                                        <input class="prev" type="hidden" value='${pageNo-1}'></input>
                                    </li>
                                    <c:forEach var='page' items='${pages}'>
                                        <c:if test="${pageNo == page}">
                                            <li class="page-item"><a class="active pagenum page-link btn" aria-current="page">${page}</a></li>

                                        </c:if>
                                        <c:if test="${pageNo != page}">
                                            <li class="page-item"><a class="pagenum page-link btn">${page}</a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="nextbtn page-link btn" aria-label="Next">&raquo;</a>
                                        <input class="next" type="hidden" value='${pageNo+1}'></input>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                    </div>

                </div>
                <div class="m-2 scrollby ">
                    <span> <a id="goToTop" href="#" class="btn btn-secondary shadow"> <i class=" fa fa-2x fa-angle-up"></i>
				</a>
				</span>
                </div>

                <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
                    <script src="js/event/event_query.js"></script>
                    <script>
                        /* back To Top  */

                        $('.scrollby').scrollspy({
                            target: '#backtop'
                        });
                        /* $(window).scroll(function() {
                            if ( $(this).scrollTop() > 400){
                                $('.scrollby').fadeIn();
                            } else {
                                $('.scrollby').fadeOut();
                            }
                        }); */
                    </script>


        </body>

        </html>