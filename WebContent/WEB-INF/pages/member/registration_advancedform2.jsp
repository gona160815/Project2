<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>追風者｜會員資訊</title>
                    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--                     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
                    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css" />
                    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
                    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet">
                    <style>
                        body {
                            font-family: Microsoft JhengHei;
                            background-color: #f5f5f5;
                            font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                            color: #333333;
                        }
                        
                        #div-1 {
                            padding-right: 0px;
                            padding-left: 0px;
                        }
                        
                        #form-1,
                        #memberInfo,
                        #blockquote,
                        #blockquote2,
                        #row2 {
                            background-color: #fff;
                            border-radius: 10px;
                            border: 0px;
                        }
                        
                        #form-1,
                        #row2,
                        #memberInfo {
                            padding: 10px;
                        }
                        
                        #row2 {
                            margin-right: 0px;
                            margin-left: 0px;
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
                            background-image: url("img/member/member01.jpg");
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
                            background: rgba(0, 0, 0, 0.418);
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

                        
                        #main-nav{
                        	margin-left:30px;	
                        }
                        
                        #main-nav a{
                        	color:white;
                        }
         
                        /*  */
						.messaging {
						    /* padding: 0 0 50px 0; */
						    height: 450px;
						}
						
                        .inbox_msg {
						    border: 1px solid #ddd;
						    clear: both;
						    overflow: hidden;
						    height: 400px;
						  }
                         .mesgs {
						    float: left;
						    padding: 30px 15px 0 25px;
						    width: 70%;
						    height: 360px;
						}
						
						.msg_history {
						    height: 270px;
						    overflow-y: auto;
						}
						
						.inbox_people {
						    background: #fff;
						    float: left;
						    overflow: hidden;
						    width: 30%;
						    border-right: 1px solid #ddd;
						    height: 410px;
						}
						.type_msg {
						    border-top: 1px solid #c4c4c4;
						    position: relative;
						    top: -10px;
						    background-color: #fff;
						}
						
						
>>>>>>> 6f3800af47b2ef94de9b412480330d3b212aa7b1
                    </style>

            </head>
            <!--  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script> -->
            <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            <script type="text/javascript">
                /*$.ajax({
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    type: "post",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    url: "memberLevel.controller",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    success: function() {

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                });*/
                $(function() {
                    checkLevel();
                })

                function checkLevel() {
                    var level = $("#memberLevel").text();
                    console.log(level);
                    if (level == "新手騎士") {
                        $("#memberLevel").prepend('<i class="fas fa-baby" style="color:#FF79BC"></i>&nbsp&nbsp')
                    }
                    if (level == "見習騎士") {
                        $("#memberLevel").prepend('<i class="fas fa-graduation-cap" style="color:#00A600"></i>&nbsp&nbsp')
                    }
                    if (level == "業餘騎士") {
                        $("#memberLevel").prepend('<i class="fas fa-gem" style="color:#46A3FF"></i>&nbsp&nbsp')
                    }
                    if (level == "職業騎士") {
                        $("#memberLevel").prepend('<i class="fas fa-crown" style="color:orange"></i>&nbsp&nbsp')
                    }
                }

                //----------------------檢查密碼-------------------------------------------
                function checkPwd() {
                    let thePwdObj = document.getElementById("passwordcheck");
                    let thePwdObjVal = thePwdObj.value;
                    let thePwdObjValLen = thePwdObjVal.length;
                    let sp = document.getElementById("Pwdspan");
                    let flag1 = false;
                    if (thePwdObjVal == "") {
                        sp.innerHTML = "請輸入密碼";
                        document.getElementById("basicButton2").disabled = true;
                    } else if (thePwdObjValLen >= 6) {
                        let reg = new RegExp(/[A-Za-z]+[0-9_]/);
                        let reg2 = new RegExp(/[0-9_]+[A-Za-z]/);
                        if (thePwdObjVal.match(reg)) {
                            flag1 = true;
                        } else if (thePwdObjVal.match(reg2)) {
                            flag1 = true;
                        }

                        if (flag1) {
                            sp.innerHTML = "正確";
                        } else {
                            sp.innerHTML = "密碼格式輸入錯誤，需含英文與數字"
                            document.getElementById("basicButton2").disabled = true;
                        }
                    } else {
                        sp.innerHTML = "最少要有六個字元"
                        document.getElementById("basicButton2").disabled = true;
                    }
                }

                //-------------------------檢查密碼是否一致--------------------
                function checkPwd2() {
                    let thePwdObj2 = document
                        .getElementById("passwordcheck2").value;
                    let thePwdObj = document
                        .getElementById("passwordcheck").value;
                    let sp = document.getElementById("Pwdspan2");
                    let flag1 = false;

                    if (thePwdObj != thePwdObj2) {
                        sp.innerHTML = "密碼不一致！請重新輸入";
                        document.getElementById("basicButton2").disabled = true;
                    } else if (thePwdObj2 == thePwdObj) {
                        flag1 = true;
                    }
                    if (flag1) {
                        sp.innerHTML = "正確";
                        document.getElementById("basicButton2").disabled = false;
                    }

                }

                // function myFavListBodyover(i,favlist,evelist,typelist){

                // 	var list = '<tr id="favobj"><th scope="row"><a target="_blank" href="event/'+evelist[i].eventId+'">'+evelist[i].title+'</th><td class="par">'+typelist[i]+'</td><td>'+favlist[i].addTime+'</td><td><i class="btn fa fa-trash" aria-hidden="true" title="'+ favlist[i].infoId+ '" id="'+favlist[i].typeId+'"  onclick="confirmListDelete(this)"></i></td></tr>'
                // 	return list;
                // }		

                var option = {
                    "lengthMenu": [5, 10, 20],
                    "bScrollCollapse": true, //是否開啟DataTables的高度自適應，當資料條數不夠分頁資料條數
                    "language": {
                        "processing": "處理中...",
                        "loadingRecords": "載入中...",
                        "lengthMenu": "顯示 _MENU_ 項結果",
                        "zeroRecords": "沒有符合的結果",
                        "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                        "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                        "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                        "infoPostFix": "",
                        "search": "搜尋:",
                        "paginate": {
                            "first": "第一頁",
                            "previous": "上一頁",
                            "next": "下一頁",
                            "last": "最後一頁"
                        },
                        "aria": {
                            "sortAscending": ": 升冪排列",
                            "sortDescending": ": 降冪排列"
                        },
                    }
                };

                function myFavListHead() {
                    var list = '<div ><table class="table" id="table1"><thead class="thead-light"><tr>' +
                        '<th scope="col">項目名稱</th><th scope="col">活動類別</th><th scope="col">加入日期</th><th></th></tr></thead><tbody id="tbody"></tbody></table>'
                    return list;
                }

                function confirmListDelete(data) {
                    var infoId = data.title;
                    console.log("infoId:" + infoId);
                    var typeId = data.id;
                    var memberId = $("#memberId").val();
                    $.ajax({
                        type: "POST",
                        url: "deleteMyFavorite",
                        dataType: "json",
                        data: {
                            infoId: infoId,
                            typeId: typeId,
                            memberId: memberId
                        },
                        success: function(aaa) {
                            if (aaa.result) {
                                $("#table1").DataTable().destroy();
                                $("#table1").DataTable().clear();
                                $("#favobj").remove();
                                $("#div1-1").empty();
                                $("#div2").remove();
                                $("#title1").text("我的最愛");
                                $.ajax({
                                    type: "post",
                                    url: "selectByAddTime",
                                    dataType: "json",
                                    data: {
                                        "memberId": $("#memberId").val()
                                    },
                                    success: function(data) {
                                        var favlist = data.favorites;
                                        var evelist = data.events;
                                        var typelist = data.types;
                                        console.log(data);

                                        $("#div1-1").append(myFavListHead());
                                        var j = 1;
                                        for (var i = 0; i < data.favorites.length; i++) {
                                            $("#tbody").append(myFavListBodyover(i, favlist, evelist, typelist));
                                        }
                                        $("#table1").DataTable({
                                            "lengthMenu": [5, 10, 20],
                                            "bScrollCollapse": true, //是否開啟DataTables的高度自適應，當資料條數不夠分頁資料條數
                                            "language": {
                                                "processing": "處理中...",
                                                "loadingRecords": "載入中...",
                                                "lengthMenu": "顯示 _MENU_ 項結果",
                                                "zeroRecords": "沒有符合的結果",
                                                "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                                "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                                "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                                                "infoPostFix": "",
                                                "search": "搜尋:",
                                                "paginate": {
                                                    "first": "第一頁",
                                                    "previous": "上一頁",
                                                    "next": "下一頁",
                                                    "last": "最後一頁"
                                                },
                                                "aria": {
                                                    "sortAscending": ": 升冪排列",
                                                    "sortDescending": ": 降冪排列"
                                                },
                                            }
                                        });
                                    }
                                });
                            }
                        }
                    });

                }
            </script>

            <body>

                <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
                    <div id="top-block">
                        <div id="top-box">
                            <h1 id="title" class="align-middle">會員中心</h1>
                        </div>
                    </div>
                    <div class="container" id="div1">
                        <div id="blockquote">
                            <hr>
                            <blockquote class="blockquote text-center">
                                <h1 id="title1"><i class="fas fa-user-edit"></i>&nbsp會員資料</h1>
                                <h4 id="msg2"></h4>
                            </blockquote>
                            <hr>
                        </div>
                        <div class="row">
                            <div class="list-group col-md-3" style="display:flex;align-items:center;justify-content:center;">
                                <div data-toggle="list">
                                    <div id="memberInfo">
                                        <c:if test="${! empty loginOK.memberAdvanced.icon}">
                                            <img id="icon" src="<c:url value='/showMemberIcon?id=${loginOK.memberId}'/>" height='220px' width='220px' alt="Avatar" style="border-radius:50% ;display:flex;align-items:center;justify-content:center;">
                                        </c:if>
                                        <c:if test="${ empty loginOK.memberAdvanced.icon}">
                                            <c:if test="${ empty pictureUrl}">
                                                <img id="icon" src="<c:url value='/img/mike.jpg'/>" height='220px' width='220px' alt="Avatar" style="border-radius:50% ;display:flex;align-items:center;justify-content:center;">
                                            </c:if>
                                            <c:if test="${! empty pictureUrl}">
                                                <img id="icon" src="${pictureUrl}" height='220px' width='220px' alt="Avatar" style="border-radius:50% ;display:flex;align-items:center;justify-content:center;">
                                            </c:if>
                                        </c:if>
                                        <h3 style="text-align:center;line-height:50px;color:navy;margin-top:10px"><i class="far fa-user"></i><span>&nbsp&nbsp${loginOK.name}</span></h3>
                                        <h4 style="text-align:center;line-height:50px;font-size:20px;margin-bottom:0px;color:navy" id="memberLevel">${loginOK.memberAuth.memberLevel.mLevel}</h4>
                                    </div>
                                    <span id="info" onclick="choose(this)" class="border-0 btn list-group-item list-group-item-action active" data-toggle="list"><i class="fa fa-cog fa-2" aria-hidden="true"><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp一般設定</span></i>
                                    </span>
                                    <span id="psw" onclick="choose(this)" class="border-0 btn list-group-item list-group-item-action " data-toggle="list"><i class="fa fa-lock" aria-hidden="true"><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp更改密碼</span></i>
                                    </span>
                                    <span id="fav" onclick="choose(this)" class="border-0 btn list-group-item list-group-item-action" data-toggle="list"><i class="fa fa-heart" aria-hidden="true"><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp我的最愛</span></i>
                                    </span>
                                    <span id="order" onclick="choose(this)" class="border-0 btn list-group-item list-group-item-action" data-toggle="list"><i class="fas fa-h-square"><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp住宿訂單</span></i>
                                    </span>
                                    <span id="rbOrder" onclick="choose(this)" class="border-0 rounded btn list-group-item list-group-item-action" data-toggle="list"><i class="fa fa-bicycle" aria-hidden="true"><span>&nbsp&nbsp&nbsp&nbsp&nbsp租車訂單</span></i>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-9" id="div1-1">
                                <form:form id="form-1" method="POST" modelAttribute="loginOK" enctype="multipart/form-data">
                                    <div class="form-group row">
                                        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="email">電子信箱</form:label>
                                        <div class="col-sm-10">
                                            <form:input type="text" readonly="true" class="form-control form-control-lg" name="email" id="staticEmail" value="" path="email" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="name">姓名</form:label>
                                        <div class="col-sm-10">
                                            <form:input type="text" class="form-control form-control-lg" placeholder="陳齦滑" name="name" value="" path="name" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="tel">電話</form:label>
                                        <div class="col-sm-10">
                                            <form:input type="text" class="form-control form-control-lg" placeholder="" name="tel" value="" path="tel" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="areaIdStr">居住地區</form:label>
                                        <div class="col-sm-10">
                                            <form:select id="inputState" class="form-control form-control-lg" path="areaIdStr">
                                                <form:option value="1">台北市</form:option>
                                                <form:option value="2">新北市</form:option>
                                                <form:option value="3">基隆市</form:option>
                                                <form:option value="4">宜蘭縣</form:option>
                                                <form:option value="5">桃園市</form:option>
                                                <form:option value="6">新竹市</form:option>
                                                <form:option value="7">新竹縣</form:option>
                                                <form:option value="8">苗栗縣</form:option>
                                                <form:option value="9">台中市</form:option>
                                                <form:option value="10">彰化縣</form:option>
                                                <form:option value="11">南投縣</form:option>
                                                <form:option value="12">雲林縣</form:option>
                                                <form:option value="13">嘉義市</form:option>
                                                <form:option value="14">嘉義縣</form:option>
                                                <form:option value="15">台南市</form:option>
                                                <form:option value="16">高雄市</form:option>
                                                <form:option value="17">屏東縣</form:option>
                                                <form:option value="18">台東縣</form:option>
                                                <form:option value="19">花蓮縣</form:option>
                                                <form:option value="20">澎湖縣</form:option>
                                                <form:option value="21">金門縣</form:option>
                                                <form:option value="22">連江縣</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="gender">性別</form:label>
                                        <div class="col-sm-10">
                                            <form:input type="text" class="form-control form-control-lg" name="gender" value="" path="gender" readonly="true" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="favorIdStr">自行車偏好</form:label>
                                        <div class="col-sm-10">
                                            <form:select id="inputState2" name="favor" class="form-control form-control-lg" path="favorIdStr">
                                                <option value="1">公路車</option>
                                                <option value="2">登山車</option>
                                                <option value="3">極限單車</option>
                                                <option value="4">摺疊車</option>
                                                <option value="5">淑女車</option>
                                                <option value="6">單速車</option>
                                                <option value="7">電動單車</option>
                                                <option value="8">斜躺車</option>
                                            </form:select>
                                        </div>
                                    </div>

                                    <form:button class="btn btn-primary my-2 my-lg-3" id="basicButton" type="button">修改</form:button>
                                </form:form>
                            </div>


                        </div>
                    </div>
                    <c:if test="${! empty MemberAdvanced}">
                        <div class="container" id="div2" style="margin-top: 0px;">
                            <div class="rounded border-0" id="blockquote2">
                                <hr>
                                <blockquote class=" blockquote text-center">
                                    <h1><i class="fas fa-address-card"></i>&nbsp詳細資料</h1>
                                </blockquote>
                                <hr>
                            </div>
                            <div class="row" id="row2">
                                <div class="list-group col-md-3">
                                </div>
                                <div class="col-md-9">
                                    <form:form method="POST" modelAttribute="MemberAdvanced" id="form-2" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <form:label path="nickName" class="col-sm-2 col-form-label col-form-label-lg">暱稱</form:label>
                                            <div class="col-sm-10">
                                                <form:input type="text" id="nickName" class="form-control form-control-lg" path="nickName" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <form:label path="address" class="col-sm-2 col-form-label col-form-label-lg">地址</form:label>
                                            <div class="col-sm-10">
                                                <form:input type="text" class="form-control form-control-lg" id="staticAdress" value="" path="address" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <form:label path="birthStr" class="col-sm-2 col-form-label col-form-label-lg">生日</form:label>
                                            <div class="col-sm-10">
                                                <form:input type="date" placeholder="2014-09-18" id="birth" class="form-control form-control-lg" path="birthStr" value="${loginOK.memberAdvanced.birthday}"></form:input>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <form:label path="mFile" class="col-sm-2 col-form-label col-form-label-lg">大頭貼</form:label>
                                            <div class="col-sm-10">
                                                <form:input onchange="loadFile(event)" type="file" class="custom-file-input form-control-lg" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" path="mFile"></form:input>
                                                <form:label class="custom-file-label" for="inputGroupFile04" path="mFile">請選擇檔案</form:label>
                                            </div>
                                        </div>
                                        <script>
                                            var loadFile = function(event) {
                                                var icon = document.getElementById("icon");
                                                icon.src = URL.createObjectURL(event.target.files[0]);
                                                icon.onload = function() {
                                                    URL.revokeObjectURL($("#icon").src);
                                                }
                                            };
                                        </script>
                                        <div class="form-group row">
                                            <form:label path="intro" class="col-sm-2 col-form-label col-form-label-lg">個人簡介</form:label>
                                            <div class="col-sm-10">
                                                <form:textarea class="form-control form-control-lg" id="intro" rows="3" required="" path="intro"></form:textarea>
                                            </div>
                                        </div>
                                        <form:button class="btn btn-success my-2 my-lg-3" value="Send" type="button" id="submit">送出</form:button>
                                        <button class="btn btn-success my-2 my-lg-3" type="button" id="input">一鍵填滿</button>
                                    </form:form>
                                </div>


                            </div>
                        </div>
                    </c:if>
                    <%@ include file="/WEB-INF/pages/member/chatroom_client.jsp" %>
                        <input type="hidden" id="memberId" value="${loginOK.memberId}" />
                        <input type="hidden" id="favor" value="${loginOK.favor.favorId}" />
                        <input type="hidden" id="area" value="${loginOK.memberArea.areaId}" />
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
                        <script>
                        	function choose(data){
								var id = data.id;
								$("#"+id).siblings().removeClass("active");
                            }
                            $(function() {

                                $("#dialog_div").dialog({
                                    height: 600,
                                    maxHeight:800,
                                    width: 800,
                                    autoOpen: false,
                                    closeOnEscape: false,
                                    resizable: true,
                                    show: "scale",
                                    draggable: true,
                                    hide: "explode",
                                    dialogClass: 'service',
                                    position: {
	                                      my: "top right",
	                                      at: "right center",
	                                      of: $("#div1")
	                                  },
                                    create: function(event, ui) {
                                        $(event.target).parent().css('position', 'fixed');
                                    },
                                    buttons: {
                                        //"Ok": function() { $(this).dialog("close"); },
                                        "離開": function() {
                                            $(this).dialog("close");
                                        }
                                    }

                                });

                                $("#service").click(function() {
                                    $("#dialog_div").dialog("open");
                                    return false;
                                });

                                $.ajax({
                                    type: 'post',
                                    url: 'getAdmins',
                                    data: {
                                        authority: 2
                                    },
                                    success: function() {}
                                })

                            })

                            $(function() {





                                function resetpsw() {
                                    var list = '<form id="form-1">' + '<div class="form-group row"><label  class="col-sm-2 col-form-label col-form-label-lg">原始密碼</label>' +
                                        '<div class="col-sm-10"><input type="password" class="form-control form-control-lg" name="origin" id="origin" placeholder="輸入原始密碼" value=""' +
                                        'autofocus /><span id="originspan"></span></div></div>' +
                                        '<div class="form-group row"><label  class="col-sm-2 col-form-label col-form-label-lg">' +
                                        '輸入新密碼</label><div class="col-sm-10"><input type="password" class="form-control form-control-lg"' +
                                        'name="password" id="passwordcheck" placeholder="密碼需大於六個字，同時包括英文與數字" onblur="checkPwd()"' +
                                        'value=""  autofocus /><span id="Pwdspan"></span></div></div><div class="form-group row"><label ' +
                                        'class="col-sm-2 col-form-label col-form-label-lg">確認密碼</label><div class="col-sm-10"><input type="text"' +
                                        'class="form-control form-control-lg" onblur="checkPwd2()" id="passwordcheck2" placeholder="再次輸入密碼"' +
                                        'name="password2" value="" /><span id="Pwdspan2"></span></div></div><button class="btn btn-primary my-2 my-lg-3" id="basicButton2"' +
                                        'type="button">變更密碼 </button></form>';


                                    return list;
                                }
                                $("#info").click(function() {
                                    window.location.reload();
                                })
                                $("#psw").on("click", function() {
                                    $("#div1-1").empty();
                                    $("#div2").remove();
                                    $("#title1").text("更改密碼");
                                    $("#div1-1").append(resetpsw());
                                })




                                function myFavListHead() {
                                    var list = '<div ><table class="table" id="table1"><thead class="thead-light"><tr>' +
                                        '<th scope="col">項目名稱</th><th scope="col">活動類別</th><th scope="col">加入日期</th><th></th></tr></thead><tbody id="tbody"></tbody></table>'
                                    return list;
                                }
                                /*function myFavListBody(data,i){
                                	var list = '<td>'+data[i].favoriteId+'</td><td>'+data[i].typeId+'</td><td>'+data[i].addTime+'</td>';
                                    return list;
                                }*/
                                function myFavListBodyover(i, favlist, list, typelist) {
                                    var typeId = favlist[i].typeId;
                                    var table;
                                    if (typeId == 1) {
                                        table = '<tr id="favobj"><th scope="row"><a target="_blank" href="sixsix.BookingHouseDetail.controller?homenum=' + list[i].Id + '">' +
                                            favlist[i].favName + '</th><td class="par">' + typelist[i] + '</td><td>' + favlist[i].addTime +
                                            '</td><td><i class="btn fa fa-trash" aria-hidden="true" title="' + favlist[i].infoId + '" id="' +
                                            favlist[i].typeId +
                                            '"  onclick="confirmListDelete(this)"></i></td></tr>';
                                    }
                                    if (typeId == 2) {
                                        table = '<tr id="favobj"><th scope="row"><a target="_blank" href="BikeTypeUser">' +
                                            favlist[i].favName + '</th><td class="par">' + typelist[i] + '</td><td>' + favlist[i].addTime +
                                            '</td><td><i class="btn fa fa-trash" aria-hidden="true" title="' + favlist[i].infoId + '" id="' +
                                            favlist[i].typeId +
                                            '"  onclick="confirmListDelete(this)"></i></td></tr>';
                                    }
                                    if (typeId == 3) {
                                        table = '<tr id="favobj"><th scope="row"><a target="_blank" href="event/' + list[i].eventId + '">' +
                                            favlist[i].favName + '</th><td class="par">' + typelist[i] + '</td><td>' + favlist[i].addTime +
                                            '</td><td><i class="btn fa fa-trash" aria-hidden="true" title="' + favlist[i].infoId + '" id="' +
                                            favlist[i].typeId +
                                            '"  onclick="confirmListDelete(this)"></i></td></tr>';
                                    }
                                    if (typeId == 4) {
                                        table = '<tr id="favobj"><th scope="row"><a target="_blank" href="bikeIndexDetailEntry.controller?changeid=' +
                                            list[i].id + '&name=' + list[i].name + '&begin=' + list[i].begin + '&goal=' + list[i].goal + '&city=' + list[i].city + '&town=' + list[i].town + '&maintain=' + list[i].maintain + '&m=' + list[i].m + '&latitude=' + list[i].latitude + '&longitude=' + list[i].longtitude + '">' +
                                            favlist[i].favName + '</th><td class="par">' + typelist[i] + '</td><td>' + favlist[i].addTime +
                                            '</td><td><i class="btn fa fa-trash" aria-hidden="true" title="' + favlist[i].infoId + '" id="' +
                                            favlist[i].typeId +
                                            '"  onclick="confirmListDelete(this)"></i></td></tr>';
                                    }
                                    if (typeId == 5) {
                                        table = '<tr id="favobj"><th scope="row"><a target="_blank" href="RestAreaDetailEntry.controller?changeid=' +
                                            list[i].id + '&name=' + list[i].name + '&city=' + list[i].city + '&town=' + list[i].town + '&address=' + list[i].address + '&tel=' + list[i].tel + '">' +
                                            favlist[i].favName + '</th><td class="par">' + typelist[i] + '</td><td>' + favlist[i].addTime +
                                            '</td><td><i class="btn fa fa-trash" aria-hidden="true" title="' + favlist[i].infoId + '" id="' +
                                            favlist[i].typeId +
                                            '"  onclick="confirmListDelete(this)"></i></td></tr>';
                                    }

                                    return table;
                                }

                                $("#fav").on("click", function() {
                                    $("#div1-1").empty();
                                    $("#div2").remove();
                                    $("#title1").text("我的最愛");
                                    $.ajax({
                                        type: "post",
                                        url: "selectByAddTime",
                                        dataType: "json",
                                        data: {
                                            "memberId": $("#memberId").val()
                                        },
                                        success: function(data) {
                                            var favlist = data.favorites;
                                            var list = data.list;
                                            var typelist = data.types;
                                            console.log(data);

                                            $("#div1-1").append(myFavListHead());
                                            var j = 1;
                                            for (var i = 0; i < data.favorites.length; i++) {
                                                $("#tbody").append(myFavListBodyover(i, favlist, list, typelist));
                                            }
                                            $("#table1").DataTable({
                                                "lengthMenu": [5, 10, 20],
                                                "bScrollCollapse": true, //是否開啟DataTables的高度自適應，當資料條數不夠分頁資料條數
                                                "language": {
                                                    "processing": "處理中...",
                                                    "loadingRecords": "載入中...",
                                                    "lengthMenu": "顯示 _MENU_ 項結果",
                                                    "zeroRecords": "沒有符合的結果",
                                                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                                                    "infoPostFix": "",
                                                    "search": "搜尋:",
                                                    "paginate": {
                                                        "first": "第一頁",
                                                        "previous": "上一頁",
                                                        "next": "下一頁",
                                                        "last": "最後一頁"
                                                    },
                                                    "aria": {
                                                        "sortAscending": ": 升冪排列",
                                                        "sortDescending": ": 降冪排列"
                                                    },
                                                }
                                            });
                                        }
                                    });
                                });

                                function myOdrListHead() {
                                    var list = '<div ><table class="table" id="table1"><thead class="thead-light"><tr>' +
                                        '<th scope="col">訂單名稱</th><th scope="col">訂單編號</th><th scope="col">下訂日期</th><th></th></tr></thead><tbody id="tbody"></tbody></table>'
                                    return list;
                                }

                                function myOdrListBodyover(i, orderList, nameList, idList, dateList) {

                                    var list = '<tr id="favobj"><th scope="row">' + nameList[i] + '</th><td class="par">' + orderList[i].id + '</td><td>' + dateList[i] + '</td><td><a target="_blank" href="sixsix.BookingHouseDetail.controller?homenum=' + idList[i] + '">' + "詳細資訊" + '</a></td></tr>';
                                    return list;
                                }

                                $("#order").on("click", function() {
                                    $("#div1-1").empty();
                                    $("#div2").remove();
                                    $("#title1").text("訂單紀錄");
                                    $("#div1-1").append(myOdrListHead());
                                    $.ajax({
                                        type: "get",
                                        url: "sixsix.member.booking",
                                        success: function(data) {
                                            console.log(data)
                                            var orderList = data.orderList;
                                            var nameList = data.nameList;
                                            var idList = data.idList;
                                            var dateList = data.dateList;
                                            for (var i = 0; i < data.orderList.length; i++) {
                                                $("#tbody").append(myOdrListBodyover(i, orderList, nameList, idList, dateList));
                                                //
                                            }
                                            //
                                            $("#table1").DataTable({
                                                "lengthMenu": [5, 10, 20],
                                                "bScrollCollapse": true, //是否開啟DataTables的高度自適應，當資料條數不夠分頁資料條數
                                                "language": {
                                                    "processing": "處理中...",
                                                    "loadingRecords": "載入中...",
                                                    "lengthMenu": "顯示 _MENU_ 項結果",
                                                    "zeroRecords": "沒有符合的結果",
                                                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                                                    "infoPostFix": "",
                                                    "search": "搜尋:",
                                                    "paginate": {
                                                        "first": "第一頁",
                                                        "previous": "上一頁",
                                                        "next": "下一頁",
                                                        "last": "最後一頁"
                                                    },
                                                    "aria": {
                                                        "sortAscending": ": 升冪排列",
                                                        "sortDescending": ": 降冪排列"
                                                    },
                                                }
                                            });
                                        }
                                    });

                                });

                                //-----------租車訂單------------------------------------------------

                                function rbOdrListHead() {
                                    var list = '<div ><table class="table" id="table1"><thead class="thead-light"><tr>' +
                                        '<th scope="col">訂單編號</th><th scope="col">預約者</th><th scope="col">下訂日期</th><th></th></tr></thead><tbody id="tbody"></tbody></table>'
                                    return list;
                                }

                                function rbOdrListBodyover(orderList) {
                                    var list = '<tr id="favobj"><th scope="row">' + orderId + '</th><td class="par">' + bgStore + '</td><td>' + orderTime + '</td><td><a target="_blank" href="test">' + "詳細資訊" + '</a></td></tr>';
                                    return list;
                                }

                                $("#rbOrder").on("click", function() {
                                    $("#div1-1").empty();
                                    $("#div2").remove();
                                    $("#title1").text("租車訂單");
                                    $("#div1-1").append(rbOdrListHead());
                                    $.ajax({
                                        type: "post",
                                        url: "orderByMember",
                                        dataType: 'json',
                                        success: function(data) {
                                            var orderList = data.orderList;
                                            $.each(orderList, function(i, orderList) {
                                                $("#tbody").append(rbOdrListBodyover(orderList));
                                            });
                                            //

                                            $("#table1").DataTable({
                                                "lengthMenu": [5, 10, 20],
                                                "bScrollCollapse": true, //是否開啟DataTables的高度自適應，當資料條數不夠分頁資料條數
                                                "language": {
                                                    "processing": "處理中...",
                                                    "loadingRecords": "載入中...",
                                                    "lengthMenu": "顯示 _MENU_ 項結果",
                                                    "zeroRecords": "沒有符合的結果",
                                                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                                                    "infoPostFix": "",
                                                    "search": "搜尋:",
                                                    "paginate": {
                                                        "first": "第一頁",
                                                        "previous": "上一頁",
                                                        "next": "下一頁",
                                                        "last": "最後一頁"
                                                    },
                                                    "aria": {
                                                        "sortAscending": ": 升冪排列",
                                                        "sortDescending": ": 降冪排列"
                                                    },
                                                }
                                            });
                                        }
                                    });

                                });




                                //-------------selected----------------------------------------------
                                var favor = $("#favor").val() - 1;
                                var area = $("#area") - 1;

                                $("#inputState")[0].selectedIndex = area;
                                $("#inputState2")[0].selectedIndex = favor;

                                //-------------advanced----------------------------------------------
								$("#mesinput").on("click",function() {
					                console.log("aaa");
					                $("#message").val("請問為何把我停權?");
					            });
                                $("#input").click(function() {
                                    $("#nickName").val("小可愛");
                                    $("#staticAdress").val("台北市大安區辛亥路三段330號");
                                    $("#birth").val("1999-01-01");
                                    $("#intro").val("我愛追風，超酷的。");
                                });

                                $("#submit").click(function() {

                                    var form = new FormData($('form')[1]);


                                    $.ajax({
                                        type: "POST",
                                        url: "advancedRegister.json",
                                        dataType: "json",
                                        /* contentType :"application/json;charset=UTF-8", */
                                        data: form,
                                        contentType: false, //required
                                        processData: false, // required
                                        success: function(data) {
                                            console.log(data.aaa);
                                            //$("#msg").text(data.success);
                                            Swal.fire({
                                                    title: '更新成功',
                                                    //text: '導向驗證頁...',
                                                    icon: 'success',
                                                    timer: 1000,
                                                    showConfirmButton: false,
                                                })
                                                .then(() => {
                                                    window.location.reload();
                                                })
                                        }
                                    });
                                });
                                //----------------basic--------------------------------------------------------------
                                var basicInfo = {
                                    /* "email":$("#email").val(), */
                                    "name": $("#name").val(),
                                    "tel": $("#tel").val(),
                                    /* "gender":$("#gender").val(), */
                                    "areaId": $("#areaId").val(),
                                    "favorId": $("#favorId").val()
                                }

                                var str2 = $("#form-1").serialize();


                                $("#basicButton").on("click", function() {

                                    var form1 = new FormData($('form')[0]);

                                    $.ajax({
                                        type: "POST",
                                        url: "updateBasicInfo.controller",
                                        dataType: "json",
                                        data: form1,
                                        contentType: false, //required
                                        processData: false, // required
                                        success: function(data) {
                                            //$("#msg2").text(data.success);
                                            Swal.fire({
                                                title: '更新成功',
                                                //text: '導向驗證頁...',
                                                icon: 'success',
                                                timer: 1000,
                                                showConfirmButton: false,
                                            })

                                            /*.then(() => {
                                            	$(window).attr('location','checkEmailPage');
                                            })*/
                                        }
                                    });
                                });




                            })


                            $("#div1-1").on("click", "#basicButton2", function() {
                                var password = $("#passwordcheck").val();
                                var origin = $("#origin").val();
                                var form1 = new FormData($('form')[0]);

                                $.ajax({
                                    type: "POST",
                                    url: "updatePassword.controller",
                                    dataType: "json",
                                    /*data:form1,
				contentType: false, //required
			    processData: false, // required*/
                                    data: {
                                        password: password,
                                        origin: origin
                                    },
                                    success: function(data) {
                                        if (data.success) {
                                            //$("#msg2").text(data.success);
                                            Swal.fire({
                                                title: '更新成功',
                                                //text: '導向驗證頁...',
                                                icon: 'success',
                                                timer: 1000,
                                                showConfirmButton: false,
                                            })
                                        } else {
                                            //$("#originspan").text(data.error);
                                            Swal.fire({
                                                icon: 'error',
                                                title: "原始" + data.error,
                                            })
                                        }
                                    }
                                });
                            });
                        </script>
            </body>

            </html>