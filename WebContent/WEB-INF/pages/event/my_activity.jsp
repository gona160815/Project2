<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>追風者｜event</title>
            <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.16/jquery.timepicker.min.css" integrity="sha512-GgUcFJ5lgRdt/8m5A0d0qEnsoi8cDoF0d6q+RirBPtL423Qsj5cI9OxQ5hWvPi5jjvTLM/YhaaFuIeWCLi6lyQ==" crossorigin="anonymous"
            />
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js" integrity="sha512-s5u/JBtkPg+Ff2WEr49/cJsod95UgLHbC00N/GglqdQuLnYhALncz8ZHiW/LxDRGduijLKzeYb7Aal9h3codZA==" crossorigin="anonymous"></script>
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <style>
                    /* @import url(https://fonts.googleapis.com/css?family=Open+Sans);
                    body {
                        font-family: 'Open Sans', sans-serif;
                    } */
                    
                    .scrollby {
                        bottom: 50px;
                        position: fixed;
                        right: 10px;
                    }
                    
                    #memberName {
                        color: #5050f1;
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
                <div id="top-block">
                    <div id="top-box">
                        <h1 id="title" class="align-middle">行程訂單</h1>
                    </div>
                </div>

                <div class="container my-1">
                    <!-- HOMEPAGE EVENTCAT EVENTID -->
                    <div id="backtop" class="font-weight-light text-secondary  ">
                        <span class="text-left "><a class="text-decoration-none" href="#"><i class="text-decoration-none text-muted fas fa-home">首頁</i></a></span>
                        <span class="text-left "><a class="text-decoration-none text-muted" href="#">/ 行程</a></span>


                    </div>
                    <div class="font-weight-light text-secondary text-left">

                    </div>
                </div>

                <!-- container -->
                <div class="container my-5">
                    <input id="memberId" type="hidden" value="${loginOK.memberId}">
                    <div class="my-2">
                        <h3 class=""><span id="memberName">${loginOK.name}</span>的行程表
                        </h3>

                    </div>
                    <div id="myAct" class="row">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center" scope="col">行程編號</th>
                                    <th class="text-center" scope="col">行程名稱</th>
                                    <th class="text-center" scope="col">創建時間</th>
                                    <th class="text-center" scope="col">金額</th>
                                    <th class="text-center" scope="col"></th>
                                    <th class="text-center" scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="act" items="${actName}" varStatus="s">
                                    <tr class="actNameList">
                                        <th id="act${s.index}" scope="row" class="actNameId text-center">${act.actNameId}</th>
                                        <td class="act-name text-center">${act.name}</td>
                                        <td class="orderTime text-center">${act.orderTime}</td>
                                        <td class="price text-center">${act.price}</td>
                                        <td class="text-center">
                                            <a class=" mx-2 mb-1  btn btn-outline-info float-right" href="myactivity/${act.actNameId}">詳細資訊</a>
                                            <c:if test="${act.price >0}">
                                                <span id="checkout${s.index}" class=" mx-2 mb-1  btn btn-outline-secondary float-right">待付款</span>
                                            </c:if>
                                            <!-- <span class="btn btn-outline-primary float-right"><a href="myactivity/${act.actNameId}">預覽</a></span> -->
                                        </td>
                                        <td class="controllbtn text-center">
                                            <span class="deletebtn mx-2 mb-1  btn btn-outline-danger float-right">刪除行程</span>
                                            <span class="updatebtn mx-2 mb-1  btn btn-outline-warning float-right">修改行程</span>
                                        </td>
                                    </tr>
                                    <tr class="eventActivityList" style="display:none;">
                                        <th scope="row" class="text-center"><span>行程類別</span><br><span class="typeId"></span></th>
                                        <td class="text-center"><span>行程名稱</span><br><span class="name"></span></td>
                                        <td class="text-center"><span>行程時間</span><br><span class="actDate"></span></td>
                                        <td class="text-center"><span>金額</span><br><span class="price"></span></td>
                                        <td class="text-center"><br></td>
                                        <td class="text-center"><br></td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- back to top -->
                <div class="m-2 scrollby ">
                    <span>
                        <a href="# " class="btn btn-secondary shadow ">

                            <i class=" fa fa-2x fa-angle-up "></i>
                                            </a>
                                            </span>
                </div>
                <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
                    <script>
                        $(function() {
                            var dataArray = new Array();
                            $(".actNameList").each(function(i) {
                                var data = {};
                                data.actNameId = parseInt($("#act" + i).text().trim());
                                dataArray.push(data);
                            });
                            $.ajax({
                                headers: {
                                    Accept: "application/json",
                                    "Content-Type": "application/json",
                                },
                                url: "checkPayment",
                                type: "post",
                                dataType: "json",
                                data: JSON.stringify(dataArray),
                                success: function(res) {
                                    var status = res.status;
                                    for (var i = 0; i < status.length; i++) {
                                        if (status[i] == 1) {
                                            $("#checkout" + i).removeClass("btn-outline-secondary").addClass("btn-outline-success");
                                            $("#checkout" + i).text("已付款");
                                            $("#checkout" + i).closest("td").siblings(".controllbtn").find(".updatebtn").remove();
                                            $("#checkout" + i).closest("td").siblings(".controllbtn").find(".deletebtn").remove();
                                        } else if (status[i] == 3) {
                                            $("#checkout" + i).removeClass("btn-outline-secondary").addClass("btn-outline-warning").addClass("timeout");
                                            $("#checkout" + i).text("訂單逾時");
                                            $("#checkout" + i).closest("td").siblings(".controllbtn").find(".updatebtn").remove();
                                        } else {
                                            $("#checkout" + i).addClass("checkout");
                                        }

                                    }
                                }
                            });
                            $("tbody").on("mouseover", ".checkout", function() {
                                $(this).removeClass("btn-outline-secondary").addClass("btn-outline-primary");
                                $(this).text("去結帳");
                            });
                            $("tbody").on("mouseout", ".checkout", function() {
                                $(this).removeClass("btn-outline-primary").addClass("btn-outline-secondary")
                                $(this).text("待付款");
                            });
                            $("tbody").on("mouseover", ".timeout", function() {
                                $(this).removeClass("btn-outline-warning").addClass("btn-outline-secondary");
                                $(this).text("請重新下訂");
                            });
                            $("tbody").on("mouseout", ".timeout", function() {
                                $(this).removeClass("btn-outline-secondary").addClass("btn-outline-warning")
                                $(this).text("訂單逾時");
                            });


                            $("tbody").on("click", ".checkout", function() {
                                var checkForm = document.createElement("form");
                                checkForm.name = "checkForm";
                                checkForm.id = "checkForm";
                                checkForm.style = "display:none";
                                var actNameId = document.createElement("input");
                                actNameId.value = $(this).closest("td").siblings(".actNameId").text().trim();
                                actNameId.name = "actNameId";
                                actNameId.type = "text";
                                var name = document.createElement("input");
                                name.value = $(this).closest("td").siblings(".act-name").text().trim();
                                name.name = "name";
                                name.type = "text";
                                var orderTime = document.createElement("input");
                                orderTime.value = moment().format("yyyy/MM/DD HH:mm:ss");
                                orderTime.name = "orderTime";
                                orderTime.type = "text";
                                var price = document.createElement("input");
                                price.value = $(this).closest("td").siblings(".price").text().trim();
                                price.name = "price";
                                price.type = "text";
                                checkForm.appendChild(price);
                                checkForm.appendChild(orderTime);
                                checkForm.appendChild(name);
                                checkForm.appendChild(actNameId);
                                document.body.appendChild(checkForm);
                                checkForm.method = "POST";
                                checkForm.action = "activityOrder";
                                checkForm.submit();
                            });


                            $("tbody").on("click", ".info", function() {
                                $(this).attr("id", "enable");
                                $(this).closest("tr").next().css("display", "table-row");
                                var $t = $(this);
                                var actName = $t.closest("td").siblings(".act-name").text().trim();
                                var memberId = $("#memberId").val();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".typeId").empty();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".name").empty();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".actDate").empty();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".price").empty();
                                $.ajax({
                                    url: 'getActivity',
                                    type: 'post',
                                    data: {
                                        actName: actName,
                                        memberId: memberId
                                    },
                                    success: function(res) {
                                        var list = res.list;
                                        $.each(res.activity, function(i, obj) {
                                            var typeId = obj.typeId;
                                            if (typeId == 1) {
                                                $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("飯店<br/>");
                                                $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="sixsix.BookingHouseDetail.controller?homenum=' + list[i].Id + '">' + list[i].Name + "</a><br/>");
                                            }
                                            if (typeId == 2) {
                                                $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("租車<br/>");
                                                $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="BikeTypeUser">' + list[i].rbName + "<br/>");
                                            }
                                            if (typeId == 3) {
                                                $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("活動<br/>");
                                                $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="event/' + list[i].eventId + '">' + list[i].title + "<br/>");
                                            }
                                            if (typeId == 4) {
                                                $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("自行車道<br/>");
                                                $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="bikeIndexDetailEntry.controller?changeid=' +
                                                    list[i].id + '&name=' + list[i].name + '&begin=' + list[i].begin + '&goal=' + list[i].goal + '&city=' + list[i].city + '&town=' + list[i].town + '&maintain=' + list[i].maintain + '&m=' + list[i].m + '&latitude=' + list[i].latitude + '&longitude=' + list[i].longtitude + '">' + res.list[i].name + "<br/>");
                                            }
                                            if (typeId == 5) {
                                                $t.closest(".actNameList").next(".eventActivityList").find(".typeId").append("補給站<br/>");
                                                $t.closest(".actNameList").next(".eventActivityList").find(".name").append('<a target="_blank" href="RestAreaDetailEntry.controller?changeid=' +
                                                    list[i].id + '&name=' + list[i].name + '&city=' + list[i].city + '&town=' + list[i].town + '&address=' + list[i].address + '&tel=' + list[i].tel + '">' + list[i].name + "<br/>");
                                            }


                                            $t.closest(".actNameList").next(".eventActivityList").find(".actDate").append(obj.actDate + "<br/>");
                                            $t.closest(".actNameList").next(".eventActivityList").find(".price").append(obj.price + "<br/>");

                                        });
                                    }


                                });
                            });
                            $("tbody").on("click", "#enable", function() {
                                $(this).closest(".actNameList").next(".eventActivityList").find(".typeId").empty();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".name").empty();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".actDate").empty();
                                $(this).closest(".actNameList").next(".eventActivityList").find(".price").empty();
                                $(this).closest("tr").next().css("display", "none");
                                $(this).removeAttr("id");
                            });



                            // delete btn 

                            $("tbody").on("click", ".deletebtn", function() {
                                var $t = $(this);
                                Swal.fire({
                                    title: "確認刪除此行程嗎?",
                                    icon: "error",
                                    showCancelButton: true,
                                    closeOnConfirm: false,
                                    showLoaderOnConfirm: true,
                                    confirmButtonClass: "btn-danger",
                                    confirmButtonText: "刪除",
                                    cancelButtonText: "取消",
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        $.ajax({
                                            url: 'removeActivity',
                                            type: 'post',
                                            data: {
                                                actNameId: $(this).closest(".controllbtn").siblings(".actNameId").text().trim()
                                            },
                                            success: function(res) {
                                                if (res.result == true) {
                                                    Swal.fire({
                                                            title: "刪除成功",
                                                            icon: "success",
                                                            timer: 1500,
                                                            showConfirmButton: false,
                                                        })
                                                        .then(() => {
                                                            $t.closest("tr").next().remove();
                                                            $t.closest("tr").remove();
                                                        });

                                                }
                                            }
                                        });
                                    }
                                });
                            });
                            $("tbody").on("click", ".updatebtn", function() {
                                var $t = $(this);
                                var actNameId = $t.closest(".controllbtn").siblings(".actNameId").text().trim();
                                var name = $t.closest(".controllbtn").siblings(".act-name").text().trim();
                                var memberId = $("#memberId").val();
                                window.location.href = "myActivity/" + actNameId + "." + memberId + "." + name;

                            });
                        });
                    </script>
        </body>

        </html>