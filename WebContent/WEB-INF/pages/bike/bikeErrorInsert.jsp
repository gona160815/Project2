<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>追風者｜問題回報</title>
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                <style>
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
                    
                    #top-title {
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
                        <h1 id="top-title" class="align-middle">自行車道</h1>
                    </div>
                </div>
                <div class="content">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <!-- TABLE名稱 -->
                        <h1 class="h2 ml-2">問題回報</h1>

                    </div>
                </div>
                <div class="row my-2">

                    <form class="w-75 m-auto" action="bikeErrorInsert.controller" method="post" enctype="multipart/form-data">

                        <div class="form-row">
                            <div class="col-md-3 mb-3">
                                <label for="validationTooltip04">會員序號</label> <input type="text" class="form-control" id="validationTooltip05" name="memberid" value="${loginOK.memberId}" required readonly/>
                            </div>
                            <div class="col-md-9 mb-3">
                                <label for="validationTooltip05">問題主旨</label>
                                <input type="text" class="form-control " id="title" name="title" required />
                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationTooltip04">問題類型</label> <select name="tag" class="form-control" id="tag">
							<option value="自行車道">自行車道</option>
							<option value="補給站點">補給站點</option>
							<option value="其他">其他類型</option>
						</select>
                            </div>
                            <div class="col-md-8 mb-3">
                                <label for="validationTooltip05">檔案上傳</label> <input type="file" class="form-control" id="file" name="picture" />
                                <div id="box">
                                    <img id="imgshow" src="" alt="" />
                                </div>
                            </div>
                        </div>

                        <!-- 						<div class="form-row"> -->
                        <!-- 							<div class="col-md-6 mb-3"> -->
                        <!-- 								<label for="validationTooltip04">Start Date</label> <input -->
                        <!-- 									type="date" class="form-control" id="validationTooltip05" -->
                        <!-- 									name="startDate" required /> -->
                        <!-- 							</div> -->
                        <!-- 							<div class="col-md-6 mb-3"> -->
                        <!-- 								<label for="validationTooltip05">End Date</label> <input -->
                        <!-- 									type="date" class="form-control" id="validationTooltip05" -->
                        <!-- 									name="endDate" required /> -->
                        <!-- 							</div> -->
                        <!-- 						</div> -->
                        <div class="form-row">
                            <label for="exampleFormControlTextarea1">問題描述</label>
                            <textarea class="form-control" id="description" rows="3" name="description" required></textarea>
                        </div>
                        <hr>
                        <button class="btn btn-primary my-2 my-lg-3" type="submit">送出</button>
                        <button class="btn btn-primary my-2 my-lg-3" type="button" id="add">一鍵輸入</button>
                        <button class="btn btn-danger my-2 my-lg-3 mx-2" type="reset">清空</button>
                        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick="history.back()">返回</button>
                        <br>
                    </form>
                </div>


                <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
                    <!-- container -->
                    <script>
                        //在input file內容改變的時候觸發事件
                        $('#file').change(function() {
                            //獲取input file的files檔案陣列;
                            //$('#filed')獲取的是jQuery物件，.get(0)轉為原生物件;
                            //這邊預設只能選一個，但是存放形式仍然是陣列，所以取第一個元素使用[0];
                            var file = $('#file').get(0).files[0];
                            //建立用來讀取此檔案的物件
                            var reader = new FileReader();
                            //使用該物件讀取file檔案
                            reader.readAsDataURL(file);
                            //讀取檔案成功後執行的方法函式
                            reader.onload = function(e) {
                                //讀取成功後返回的一個引數e，整個的一個進度事件
                                console.log(e);
                                //選擇所要顯示圖片的img，要賦值給img的src就是e中target下result裡面
                                //的base64編碼格式的地址
                                $('#imgshow').get(0).src = e.target.result;
                            }
                        })
                        $(function() {

                            $("#add").on("click", function() { //一鍵輸入
                                $("#title").val("車道長度有誤");
                                $("#tag").val("自行車道")
                                $("#description").val("追風者車道長度不正確");

                            });



                        });
                    </script>
                    <!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
                    <!-- 		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
                    <!-- 		crossorigin="anonymous"></script> -->
                    <!-- 	<script -->
                    <!-- 		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" -->
                    <!-- 		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" -->
                    <!-- 		crossorigin="anonymous"></script> -->
                    <!-- 	<script -->
                    <!-- 		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" -->
                    <!-- 		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" -->
                    <!-- 		crossorigin="anonymous"></script> -->
        </body>


        </html>