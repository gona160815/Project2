<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>追風者｜補給站點</title>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp"%>
<link rel="stylesheet" href="css/modal.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
.carousel .carousel-item img {
	min-height: 200px;
	max-height: 200px;
	object-fit: cover;
}

body {
	font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro",
		"ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
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
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp"%>

	<div id="top-block">
		<div id="top-box">
			<h1 id="title" class="align-middle">追風者｜補給站點</h1>
		</div>
	</div>

	<!-- container -->
	<div class="container my-5">
		<input id="favcounter" type="hidden" value="0">
		<input id="bikeId" type="hidden" value="${changeid}">
		<input id="memberId" type="hidden" value="${loginOK.memberId}">

		<p>
			<a class="float-left mx-4 h4" href="#">
				<strong id="bikeName">${param.name}</strong>
			</a>
		</p>
		<div class="clearfix"></div>
		<hr class=" border-secondary" />
		<div class="card-body">
			<div class="row">
				<div class="col-md-4 pb-2 ">
					<!--                     <img src="img01.jpg" class="img-thumbnail rounded mt-0" alt="..."> -->
					<iframe width="100%" height="300" frameborder="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${param.address}&z=16&output=embed&t=h"></iframe>
				</div>
				<div class="col-md-8">

					<p class="float-left ">
						<a href="#" class="badge badge-light">${param.city}</a>
						<a href="#" class="badge badge-light">${param.town}</a>
					</p>
					<a id="favorite" class="bikeRoad-favorite btn btn-sm float-right">
						<i class="far fa-heart"></i>
					</a>
					<button id="addAct" type="button" class="float-right btn btn-sm btn-info" data-toggle="modal" data-target="#sideModalTR">加入行程表</button>

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
											<li class="newAct list-group-item ">
												<i class="fas fa-plus-circle"></i>
												<a id="newAct">加入新行程</a>
											</li>


										</ul>

									</div>
								</div>
								<div style="height: 200px;" class="modal-footer">
									<button id="reset" type="button" class="float-left btn btn-warning btn-md">重新選擇</button>
									<button id="cancel" type="button" class="btn btn-secondary btn-md" data-dismiss="modal">取消</button>
									<button id="addNewAct" type="button" class="btn btn-info btn-md">加入</button>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>

					<p class="float-left badge badge-success">
						<!--                     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> -->
						<!--                         <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/> -->

						<!--                     </svg> -->
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd"
								d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z" />
  								<path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
							</svg>
						地址
					</p>
					<span class="mx-2">${param.address}</span>
					<div class="clearfix"></div>
					<p class="float-left badge badge-secondary">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-telephone-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd"
								d="M2.267.98a1.636 1.636 0 0 1 2.448.152l1.681 2.162c.309.396.418.913.296 1.4l-.513 2.053a.636.636 0 0 0 .167.604L8.65 9.654a.636.636 0 0 0 .604.167l2.052-.513a1.636 1.636 0 0 1 1.401.296l2.162 1.681c.777.604.849 1.753.153 2.448l-.97.97c-.693.693-1.73.998-2.697.658a17.47 17.47 0 0 1-6.571-4.144A17.47 17.47 0 0 1 .639 4.646c-.34-.967-.035-2.004.658-2.698l.97-.969z" />
					</svg>
						電話
					</p>
					<span class="mx-2">${param.tel}</span>
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
            <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
          </svg>
				<strong class=" mx-2 my-0">地圖位置資訊</strong>
			</p>
			<hr class=" border-secondary" />
			<iframe width="100%" height="300" frameborder="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${param.address}&z=16&output=embed&t=p"></iframe>
			<!--                          <form> -->
			<!--                          <input id="start" class="controls" type="text" placeholder="Enter an origin location"> -->
			<!-- <!--                          <input type="submit" id="submit" value="送出"> -->
			<!--                          </form> -->
			<iframe width="100%" height="300" frameborder="0"
				src="https://www.google.com/maps/embed/v1/directions?origin=資策會&destination=${param.address}&mode=bicycling&key=AIzaSyD5v5CjTEgBm2yqpNlh8yUXWt7SfHHiLgY"></iframe>


		</div>
		<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp"%>
		<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
		<!-- <!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
		<!-- <!-- 		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
		<!-- <!-- 		crossorigin="anonymous"></script> -->
		<!-- 	<script -->
		<!-- 		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" -->
		<!-- 		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" -->
		<!-- 		crossorigin="anonymous"></script> -->
		<!-- 	<script -->
		<!-- 		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" -->
		<!-- 		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" -->
		<!-- 		crossorigin="anonymous"></script> -->
		<!-- ///////////////////////////////////////////////////////////////////////////// -->
		<!-- 使用須知： -->
		<!-- 1.每一隻ajax記得url要改一下
			 2.check Login 裡的success改成自己需要判斷的按鈕(url也要改)
			 3.需要增加的屬性:
			 
			 愛心:  <a id="favorite" class="event-favorite btn float-right"> <i class="far fa-heart"></i></a>
			會員ID :<input id="memberId" value="${loginOK.memberId}" type="hidden">
			計數器:  <input id="favcounter" type="hidden" value="0">
			
			4. icon cdn加到head裡: <script src="https://kit.fontawesome.com/731d88c153.js" crossorigin="anonymous"></script>
		 -->
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
                                            });
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
                                        typeId: 5,
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
                                            "typeId": 5,
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
                                            "typeId": 5,
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
                            })


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
                                        typeId: 5,
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
                        </script>
</body>

</html>