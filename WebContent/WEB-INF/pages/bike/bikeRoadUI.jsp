<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>追風者｜自行車道</title>
            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link rel="stylesheet" href="css/bike.css">
            <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin="">
            </script>
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <style>
                    /* .carousel .carousel-item img {
                        min-height: 200px;
                        max-height: 500px;
                        object-fit: cover;
                    } */
                    
                    body {
                        background-color: #f5f5f5;
                        font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                        color: #333333;
                    }
                    
                    .bikelist {
                        background-color: #fff;
                        margin: 50px auto;
                        padding-left: 20px;
                    }
                    
                    #topimg img {
                        min-height: 200px;
                        max-height: 200px;
                        object-fit: cover;
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
                    
                    .acik-renk-form {
                        border: 0px;
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




                <!-- container -->
                <c:if test="${pageNo ==1 }">
                    <div>
                        <!-- <div id="eventcontainer" class="container my-5"> -->
                        <!-- <div class="container text-center my-3"> -->
                        <div class="h3 mt-5 mb-3 mx-5 text-left">
                            <p>
                                <strong>十大經典自行車道 <i class="fas fa-biking"></i></strong>
                            </p>
                        </div>
                        <!-- <div class="row mx-auto my-auto "> -->
                        <!-- <div class="wrapper"> -->
                        <div class="news">
                            <c:forEach var='hot' items='${hot}' varStatus="s">
                                <figure class="rounded figure article">
                                    <a class="card-link" href="<c:url value='/hotBikeDetail.controller?id=${hot.id}'/>">
                                            <img class="figure-img img-fluid rounded" src="<c:url value='/img/bikeroad/${hot.id}.jpg'/>" />
                                            <figcaption class="figure-caption rounded">
												<br>
												<br>
												<br>
												<br>
                                                <h3>${hot.name}</h3>
                                                
                                            </figcaption>
										</a>
                                </figure>
                            </c:forEach>
                        </div>

                    </div>
                </c:if>

                <div class="container my-5">
                    <!-- ---------search bar------------ -->
                    <form action="<c:url value='/bikeRoadSearch.controller'/>" method="get">
                        <!-- <div class="container pt-5"> -->
                        <div class="card acik-renk-form">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group ">
                                            <label for="ctl00_ContentPlaceHolder1_tb_keyword" id="ctl00_ContentPlaceHolder1_lb_keyword" class="font-weight-light text-dark"><i class="text-success fas fa-map-marker-alt"></i>  地區</label>
                                            <select name="city" id="ctl00_ContentPlaceHolder1_ddl_area" class="form-control">
												<option value="0">全臺</option>
												<option value="1">台北市</option>
												<option value="2">新北市</option>
												<option value="3">基隆市</option>
												<option value="4">桃園市</option>
												<option value="5">新竹市</option>
												<option value="6">新竹縣</option>
												<option value="7">苗栗縣</option>
												<option value="8">台中市</option>
												<option value="9">彰化縣</option>
												<option value="10">南投縣</option>
												<option value="11">雲林縣</option>
												<option value="12">嘉義市</option>
												<option value="13">嘉義縣</option>
												<option value="14">台南市</option>
												<option value="15">高雄市</option>
												<option value="16">屏東縣</option>
												<option value="17">宜蘭縣</option>
												<option value="18">花蓮縣</option>
												<option value="19">台東縣</option>
												<option value="20">澎湖縣</option>
												<option value="21">金門縣</option>
											</select>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="ctl00_ContentPlaceHolder1_tb_keyword" id="ctl00_ContentPlaceHolder1_lb_keyword" class="font-weight-light text-dark"><i class="text-primary fas fa-info"></i>  關鍵字</label>

                                            <input name="search" type="text" id="ctl00_ContentPlaceHolder1_tb_keyword" class="form-control" placeholder="請輸入關鍵字">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <input type="hidden" name="pageNo" value="1">
                                        <br>
                                        <input type="submit" class="btn btn-primary letters-1 pr-4 pl-4 pt-2 pb-2 mt-1" value="搜尋">
                                    </div>
                                </div>
                                <!--addForAA-->

                            </div>
                        </div>
                        <!-- </div> -->
                    </form>
                    <div id="topPageDiv" class="w-100 m-auto">
                        <input type="hidden" name="pageNo" value="${pageNo}">
                    </div>
                    <div class="card-body">
                        <form action="<c:url value='/bikeErrorSearchEntry.controller'/>" method="post">
                            <input name="memberid" value="${loginOK.memberId}" type="hidden">
                            <input name="pageNo" value="1" type="hidden">
                            <a class="btn btn-danger" id="errorreport" href="javacript:void(0)">
                                <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-shield-fill-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M8 .5c-.662 0-1.77.249-2.813.525a61.11 61.11 0 0 0-2.772.815 1.454 1.454 0 0 0-1.003 1.184c-.573 4.197.756 7.307 2.368 9.365a11.192 11.192 0 0 0 2.417 2.3c.371.256.715.451 1.007.586.27.124.558.225.796.225s.527-.101.796-.225c.292-.135.636-.33 1.007-.586a11.191 11.191 0 0 0 2.418-2.3c1.611-2.058 2.94-5.168 2.367-9.365a1.454 1.454 0 0 0-1.003-1.184 61.09 61.09 0 0 0-2.772-.815C9.77.749 8.663.5 8 .5zM6.854 6.146a.5.5 0 1 0-.708.708L7.293 8 6.146 9.146a.5.5 0 1 0 .708.708L8 8.707l1.146 1.147a.5.5 0 0 0 .708-.708L8.707 8l1.147-1.146a.5.5 0 0 0-.708-.708L8 7.293 6.854 6.146z"/>
								</svg> 問題回報
                            </a>

                            <c:if test="${not empty loginOK.memberId}">
                                <input type="submit" value="查詢回報紀錄" class="btn btn-primary m-2" id="errorsearch">
                            </c:if>
                        </form>

                        <c:forEach var="search" items="${queryResult}">
                            <div class="row rounded bikelist ">
                                <div class="col-md-4  my-5">
                                    <iframe width="100%" height="300" frameborder="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${search.latitude},${search.longitude}&z=16&output=embed&t="></iframe>

                                </div>
                                <div class="col-md-8 pt-5">
                                    <a class="float-left h4" href="bikeIndexDetailEntry.controller?changeid=${search.id}&name=${search.name}&begin=${search.begin}&goal=${search.goal}&city=${search.city}&town=${search.town}&maintain=${search.maintain}&m=${search.m}&latitude=${search.latitude}&longitude=${search.longitude}">${search.name}</a>
                                    </p>
                                    <div class="clearfix"></div>
                                    <p class="float-left">
                                        <a href="javascript:void(0)" class="badge badge-light">${search.city}</a> <a href="javascript:void(0)" class="badge badge-light">${search.town}</a>
                                    </p>
                                    <div class="clearfix"></div>
                                    <p class="float-left ">
                                        <span class="badge badge-success">
											<i class="fas fa-play"></i> 起點
										</span>
                                        <c:if test="${not empty search.begin}">
                                            <span class="mx-2">${search.begin}</span>
                                        </c:if>
                                        <c:if test="${empty search.begin}">
                                            <span class="mx-2">未提供</span>
                                        </c:if>
                                    </p>
                                    <div class="clearfix"></div>
                                    <p class="float-left ">
                                        <span class="badge badge-secondary">
											<i class="fas fa-stop"></i> 終點
										</span>
                                        <c:if test="${not empty search.goal}">
                                            <span class="mx-2">${search.goal}</span>
                                        </c:if>
                                        <c:if test="${empty search.goal}">
                                            <span class="mx-2">未提供</span>
                                        </c:if>
                                    </p>
                                    <div class="clearfix"></div>
                                    <p class="float-left ">
                                        <span class="badge badge-info">
											<i class="fas fa-ruler-horizontal"></i> 總長
										</span>
                                        <c:if test="${not empty search.m}">
                                            <span class="mx-2">${search.m}公尺</span>
                                        </c:if>
                                        <c:if test="${empty search.m}">
                                            <span class="mx-2">未提供</span>
                                        </c:if>
                                    </p>
                                    <div class="clearfix"></div>

                                </div>
                            </div>

                        </c:forEach>

                    </div>
                    <div id="pageDiv">
                        <input type="hidden" name="pageNo" value="${pageNo}">
<%--                         <span class=" float-right badge badge-primary" style="width:400px">第 ${pageNo} 頁 / 共 ${totalPages} 頁</span> --%>
  								<span class="ml-4 badge badge-danger" style="width:400px">第 ${pageNo} 頁 / 共 ${totalPages} 頁</span>
                        <ul class="m-auto list-group flex-sm-row rounded">
                            <li class="list-group-item border border-white">
                                <div id="pfirst">
                                    <a class="btn btn-sm btn-primary m-2 " href="bikeRoadSearch.controller?city=${city}&search=${search}&pageNo=1">第一頁</a>
                                </div>
                            </li>
                            <li class="list-group-item border border-white">
                                <c:if test="${pageNo > 1}">
                                    <div id="pprev">
                                        <a class="btn btn-sm btn-primary m-2 " href="bikeRoadSearch.controller?city=${city}&search=${search}&pageNo=${pageNo-1}">上一頁</a>
                                    </div>
                                </c:if>
                            </li>
                            <c:forEach var='page' items='${pages}'>
                                <c:if test="${pageNo == page}">
                                    <li class="list-group-item border border-white">
                                        <div id="">
                                            <a id="pageNo" class="btn btn-sm btn-primary m-2 " href="bikeRoadSearch.controller?city=${city}&search=${search}&pageNo=${page}">${page}</a>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${pageNo != page}">
                                    <li class="list-group-item border border-white">
                                        <div id="pprev">
                                            <a class="btn btn-sm btn-primary m-2 " href="bikeRoadSearch.controller?city=${city}&search=${search}&pageNo=${page}">${page}</a>
                                        </div>
                                    </li>
                                </c:if>

                            </c:forEach>
                            <li class="list-group-item border border-white">
                                <c:if test="${pageNo != totalPages}">
                                    <div id="pnext">
                                        <a class="btn btn-sm btn-primary m-2 " href="bikeRoadSearch.controller?city=${city}&search=${search}&pageNo=${pageNo+1}">下一頁</a>
                                    </div>
                                </c:if>
                            </li>
                            <li class="list-group-item border border-white">
                                <div id="plast">
                                    <a class="btn btn-sm btn-primary m-2 " href="bikeRoadSearch.controller?city=${city}&search=${search}&pageNo=${totalPages}">最末頁</a>
                                </div>
                            </li>
                        </ul>
                    </div>


                </div>
                <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
                    <script>

                        $(function() {
                            $.ajax({
                                url: 'checkLogin',
                                type: 'post',
                                dataType: 'json',
                                success: function(res) {
                                    if (res.login == false) {
                                        //沒登入案愛心導向登入頁
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
                                    }else {
                                    	$("#errorreport").prop("href", "bikeErrorInsertEntry.controller");
                                    }
                                }
                            });
                        })
                    </script>

        </body>


        </html>