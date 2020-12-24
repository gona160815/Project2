<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>追風者｜經典車道</title>
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
                        background-color: #f5f5f5;
                        font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                        color: #333333;
                    }
                    #des  div{
                    	background-color: #f5f5f5;
                        font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                        color: #333333;
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
                </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

                <div id="top-block">
                    <div id="top-box">
                        <h1 id="title" class="align-middle">經典車道</h1>
                    </div>
                </div>
                <!-- ---------search bar------------ -->


                <!-- container -->
                <div class="container my-5">
                    <input id="favcounter" type="hidden" value="0">
                    <input id="bikeId" type="hidden" value="${changeid}">
                    <input id="memberId" type="hidden" value="${loginOK.memberId}">

                    <p>
                        <a class="float-left mx-4 h4" href="javascript:void(0)"><strong id="bikeName">${queryResult.name}</strong></a>
                    </p>
                    <div class="clearfix"></div>
                    <hr class=" border-secondary" />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 pb-2 ">
                                <img src="<c:url value='/img/bikeroad/${queryResult.id}.jpg'/>" class="d-block w-100 " alt="...">
                            </div>
                            <div class="col-md-8">

                                <p class="float-left ">
                                    <a href="#" class="badge badge-light" style="font-size: 20px;">${queryResult.city}</a> <a href="#" class="badge badge-light" style="font-size: 20px;">${queryResult.town}</a>
                                </p>
                                <p class="float-left" >
                                ${queryResult.description}
								</p>

                                <div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                                    <div class=" modal-dialog modal-dialog-scrollable modal-side modal-top-right modal-info" role="document">


                                    </div> 

                                </div>
                            </div>
                            <div class="clearfix"></div>


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
                        <strong class=" mx-2 my-0">推薦路線&周邊景點</strong>
                    </p>
                    <hr class=" border-secondary" />
                    <c:if test="${queryResult.id == 3}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/embed?mid=12l8y76LZnmq2c4v1rpXzxRnEAL2iVheL"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 4}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/embed?mid=1-W04plRFiKJrsrldo-7NA_ODDWdEC-Gp"></iframe>
                    </c:if>

                    <c:if test="${queryResult.id == 1}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/embed?mid=18MoiA--rsSuTYD1wWtdy66H4XkEzHJ4h"></iframe>
                    </c:if>


                    <c:if test="${queryResult.id == 2}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/embed?mid=1WikqC8c8P6OAj1xKtrMm1JJfVFo-HlHS"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 5}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/embed?mid=1tnqlL9eJcD_E1cPX-9pdHMxIeiYYiuxN"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 6}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/u/0/embed?mid=1RwlEdrZfB-EZKp6nhMfho9aY6edNtLS3"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 7}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/u/0/embed?mid=1_dww9bGAG_yAJhUpUN4bb-T0t4X-U90W"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 8}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/u/0/embed?mid=1ex3vczWqHgr6DN3MW0iUTyOce0d8Zy9d"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 9}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/u/0/embed?mid=13TrdDFT9gQTemQP19g2dH4JcIyZfYqUO"></iframe>
                    </c:if>
                    <c:if test="${queryResult.id == 10}">
                        <iframe width="100%" height="480" frameborder="0" src="https://www.google.com/maps/d/u/0/embed?mid=1V0a3Y0kwT7euRQrfI7Xy66KITFLPsjpt"></iframe>
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
                                            /* 從這開始改自己想要增加的按鈕 */
                                            $("#errorreport").prop("href",
                                                "bikeErrorInsertEntry.controller");
                                            console.log(res);
                                            if (res.login == false) {
                                                //沒登入案愛心導向登入頁
                                                $("#errorreport").prop("href", "loginPage");
                                                $("#errorreport").click(function() {
                                                    alert("請先登入會員");
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
                                            }
                                        }
                                    });
                                    //                                 $.ajax({
                                    //                                     url: 'checkMyFavorite',
                                    //                                     type: 'post',
                                    //                                     dataType: 'json',
                                    //                                     data: {
                                    //                                         typeId: 4,
                                    //                                         infoId: $("#bikeId").val(),
                                    //                                         memberId: $("#memberId").val(),
                                    //                                     },
                                    //                                     success: function(res) {
                                    //                                         console.log(res);
                                    //                                         if (res.favorite == true) {
                                    //                                             $("#favorite").empty();
                                    //                                             $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                                    //                                             $("#favcounter").val(1);
                                    //                                         } else {
                                    //                                             $("#favcounter").val(2);
                                    //                                         }
                                    //                                     }

                                    //                                 });

                                    //                                 function checkFavorite() {
                                    //                                     var counter = $("#favcounter").val();
                                    //                                     if (counter % 2 == 0) {
                                    //                                         var info = {
                                    //                                             "memberId": $("#memberId").val(),
                                    //                                             "typeId": 4,
                                    //                                             "infoId": $("#bikeId").val(),
                                    //                                             "favName": $("#bikeName").text().trim()
                                    //                                         }
                                    //                                         $.ajax({
                                    //                                             url: 'addMyFavorite',
                                    //                                             type: 'post',
                                    //                                             dataType: 'json',
                                    //                                             data: info,
                                    //                                             success: function(res) {
                                    //                                                 console.log(res);
                                    //                                                 if (res.success == true) {
                                    //                                                     $("#favorite").empty();
                                    //                                                     $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                                    //                                                 }
                                    //                                             }
                                    //                                         });

                                    //                                     }
                                    //                                     if (counter % 2 == 1) {
                                    //                                         var info = {
                                    //                                             "memberId": $("#memberId").val(),
                                    //                                             "typeId": 4,
                                    //                                             "infoId": $("#bikeId").val(),
                                    //                                         }
                                    //                                         $.ajax({
                                    //                                             url: 'deleteMyFavorite',
                                    //                                             type: 'post',
                                    //                                             dataType: 'json',
                                    //                                             data: info,
                                    //                                             success: function(res) {
                                    //                                                 console.log(res);
                                    //                                                 if (res.success == true) {
                                    //                                                     $("#favorite").empty();
                                    //                                                     $("#favorite").append('<i class="far fa-heart"></i>');
                                    //                                                 }
                                    //                                             }
                                    //                                         });

                                    //                                     }
                                    //                                     counter++;
                                    //                                     $("#favcounter").val(counter);
                                    //                                 }

                                    //                                 /* =============ADD FAVORITE============== */
                                    //                                 $("#favorite").on("click", function() {
                                    //                                     checkFavorite();
                                    //                                 });



                                    //                                 $.ajax({
                                    //                                     url: 'getMyActName',
                                    //                                     type: 'post',
                                    //                                     data: {
                                    //                                         memberId: $("#memberId").val()
                                    //                                     },
                                    //                                     success: function(res) {
                                    //                                         console.log(res);
                                    //                                         $.each(res.actName, function(i, obj) {
                                    //                                             $(".list-group").append('<li class=" list-group-item"><a class="actName h4">' + obj.name + '</a></li>');
                                    //                                         });
                                    //                                     }

                                    //                                 });

                                    //                                 $("#newAct").on("click", function() {
                                    //                                     $(this).closest('li').after('<li class="inputText list-group-item "><input placeholder="請輸入行程名稱" type="text" class=" border-0 "><button id="createAct" class="btn btn-sm btn-primary">確認</button></li>');
                                    //                                 });

                                    //                                 $(".list-group").on("click", "#createAct", function() {
                                    //                                     $.ajax({
                                    //                                         url: 'addMyActName',
                                    //                                         type: 'post',
                                    //                                         data: {
                                    //                                             memberId: $("#memberId").val(),
                                    //                                             actName: $(this).siblings("input").val(),
                                    //                                         },
                                    //                                         success: function(res) {
                                    //                                             $('.newAct').after('<li class="list-group-item"><a class="actName h4">' + res.actName.name + '</a></li>');
                                    //                                             $(".inputText").remove();
                                    //                                         }

                                    //                                     });


                                    //                                 });

                                    //                                 $(".list-group").on("click", ".actName", function() {
                                    //                                     $(this).closest('li').prevAll().remove();
                                    //                                     $(this).closest('li').nextAll().remove();
                                    //                                     $(this).after('<li class="list-group-item"><input class="my-2 actDate form-control-lg" placeholder="請選擇日期" type="text" ></li>')
                                    //                                     const fp = flatpickr(".actDate", {})
                                    //                                 });

                                    //                                 $("#addNewAct").on("click", function() {
                                    //                                     $.ajax({
                                    //                                         url: 'addActivityByCart',
                                    //                                         type: 'post',
                                    //                                         data: {
                                    //                                             typeId: 4,
                                    //                                             infoId: $("#bikeId").val(),
                                    //                                             actDate: $(".actDate").val(),
                                    //                                             name: $(".actName").text().trim(),
                                    //                                             price: 0,
                                    //                                             memberId: $("#memberId").val()
                                    //                                         },
                                    //                                         success: function(res) {
                                    //                                             Swal.fire({
                                    //                                                     title: "新增成功",
                                    //                                                     icon: "success",
                                    //                                                     timer: 3000,
                                    //                                                     showConfirmButton: false,
                                    //                                                 })
                                    //                                                 .then(() => {
                                    //                                                     location.reload();
                                    //                                                 });

                                    //                                         }

                                    //                                     });

                                    //                                 });


                                    //                                 function originList() {
                                    //                                     return `<li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>`
                                    //                                 }

                                    //                                 $("#reset").click(function() {

                                    //                                     $.ajax({
                                    //                                         url: 'getMyActName',
                                    //                                         type: 'post',
                                    //                                         data: {
                                    //                                             memberId: $("#memberId").val()
                                    //                                         },
                                    //                                         success: function(res) {
                                    //                                             $(".list-group").empty().append(originList());
                                    //                                             $.each(res.actName, function(i, obj) {
                                    //                                                 $(".list-group").append('<li class=" list-group-item"><a class="actName h4">' + obj.name + '</a></li>');
                                    //                                             });
                                    //                                         }
                                    //                                     });
                                    //                                 });
                                    //                             });
                    </script>

        </body>

        </html>