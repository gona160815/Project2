<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html>

        <head>
            <title>追風者｜補給站點</title>
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <style>
                    .carousel .carousel-item img {
                        min-height: 200px;
                        max-height: 500px;
                        object-fit: cover;
                    }
                    
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
                        <h1 id="title" class="align-middle">補給站點</h1>
                    </div>
                </div>
                <!-- ---------search bar------------ -->


                <!-- container -->
                <div class="container my-5">
                    <form action="<c:url value='/RestAreaSearch.controller'/>" method="get">
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
                                <div class="col-md-4 pb-2 my-5">

                                    <iframe width="100%" height="300" frameborder="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${search.address}&z=16&output=embed&t="></iframe>

                                </div>
                                <div class="col-md-8 ">
                                    <p class="mt-5 float-left">

                                        <a class="float-left mx- h4" href="RestAreaDetailEntry.controller?changeid=${search.id}&name=${search.name}&city=${search.city}&town=${search.town}&address=${search.address}&tel=${search.tel}">${search.name}</a>
                                    </p>
                                    </form>
                                    <div class="clearfix"></div>
                                    <p class="float-left">
                                        <a href="#" class="badge badge-light">${search.city}</a> <a href="#" class="badge badge-light">${search.town}</a>
                                    </p>
                                    <div class="clearfix"></div>
                                    <p class="float-left badge badge-success">

                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
									<path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
									</svg> 地址
                                    </p>
                                    <span class="mx-2">${search.address}</span>
                                    <div class="clearfix"></div>
                                    <p class="float-left badge badge-secondary">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-telephone-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M2.267.98a1.636 1.636 0 0 1 2.448.152l1.681 2.162c.309.396.418.913.296 1.4l-.513 2.053a.636.636 0 0 0 .167.604L8.65 9.654a.636.636 0 0 0 .604.167l2.052-.513a1.636 1.636 0 0 1 1.401.296l2.162 1.681c.777.604.849 1.753.153 2.448l-.97.97c-.693.693-1.73.998-2.697.658a17.47 17.47 0 0 1-6.571-4.144A17.47 17.47 0 0 1 .639 4.646c-.34-.967-.035-2.004.658-2.698l.97-.969z"/>
</svg> 電話
                                    </p>
                                    <span class="mx-2">${search.tel}</span>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                        </c:forEach>
                        <span class="ml-4 badge badge-danger" style="width:400px">第 ${pageNo} 頁 / 共 ${totalPages} 頁</span>
                        <div id="pageDiv" class="w-100 m-auto">
                            <input type="hidden" name="pageNo" value="${pageNo}">
                            <ul class="list-group flex-sm-row">
                                <li class="list-group-item border border-white">
                                    <div id="pfirst">
                                        <a class="btn btn-sm btn btn-primary m-2 " href="RestAreaSearch.controller?city=${city}&search=${search}&pageNo=1">第一頁</a>
                                    </div>
                                </li>
                                <li class="list-group-item border border-white">
                                    <c:if test="${pageNo > 1}">
                                        <div id="pprev">
                                            <a class="btn btn-sm btn btn-primary m-2 " href="RestAreaSearch.controller?city=${city}&search=${search}&pageNo=${pageNo-1}">上一頁</a>
                                        </div>
                                    </c:if>
                                </li>
                                <c:forEach var='page' items='${pages}'>
                                    <c:if test="${pageNo == page}">
                                        <li class="list-group-item border border-white">
                                            <div id="">
                                                <a id="pageNo" class="btn btn-sm btn-info m-2 " href="RestAreaSearch.controller?city=${city}&search=${search}&pageNo=${page}">${page}</a>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageNo != page}">
                                        <li class="list-group-item border border-white">
                                            <div id="pprev">
                                                <a class="btn btn-sm btn-outline-primary m-2 " href="RestAreaSearch.controller?city=${city}&search=${search}&pageNo=${page}">${page}</a>
                                            </div>
                                        </li>
                                    </c:if>

                                </c:forEach>
                                <li class="list-group-item border border-white">
                                    <c:if test="${pageNo != totalPages}">
                                        <div id="pnext">
                                            <a class="btn btn-sm btn btn-primary m-2 " href="RestAreaSearch.controller?city=${city}&search=${search}&pageNo=${pageNo+1}">下一頁</a>
                                        </div>
                                    </c:if>
                                </li>
                                <li class="list-group-item border border-white">
                                    <div id="plast">
                                        <a class="btn btn-sm btn btn-primary m-2 " href="RestAreaSearch.controller?city=${city}&search=${search}&pageNo=${totalPages}">最末頁</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
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
                                    console.log(res);
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

                                        })
                                    }else {
                                    	$("#errorreport").prop("href",
                                        "bikeErrorInsertEntry.controller");
                                    }
                                }
                            });
                        })
                    </script>

        </body>


        </html>