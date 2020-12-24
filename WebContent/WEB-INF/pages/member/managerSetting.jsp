<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <title>
        EEIT124Team1
    </title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="css/nucleo-icons.css" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="css/black-dashboard.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/member/chat.css">
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <link rel="stylesheet" type="text/css" href="css/member/chat.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	 
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
 	<style type="text/css">
 	body {
	font-family: Microsoft JhengHei;
	background-color: #f5f5f5;
	font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro",
		"ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
	color: #333333;
}
 	</style>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
function chooseAdmin(data){
	var toUser = data.id;
	$("#currentTalkerId").val(toUser);
	console.log($("#currentTalkerId").val());
	$("#"+toUser).addClass("active_chat"); 
	$("#"+toUser).siblings().removeClass("active_chat");
	var remember = $("input[name='"+toUser+"']").val();
	$("#msg_history").html(remember); 
	
}
    $(function() {
	function coming(talkerMessage,talkerId){
		var now = new Date();
		var getTime = now.toTimeString();
		var timeArray = getTime.split(" ");
		var time = timeArray[0];
		var msg = ` <div class="incoming_msg">
        <div class="incoming_msg_img"> `+'<img src="showMemberIcon?id='+talkerId+'" alt="sunil"> </div>'
        +`<div class="received_msg">
            <div class="received_withd_msg">
                <p>`+talkerMessage+
                `</p>
                <span class="time_date">`+time+`</span></div>
        </div>
    </div>`;
            return msg;
		}

	function going(message){
		var now = new Date();
		var getTime = now.toTimeString();
		var timeArray = getTime.split(" ");
		var time = timeArray[0];
		var msg = `<div class="outgoing_msg">
        	<div class="sent_msg">
        	<p>`+message+
        	`</p>
        	<span class="time_date"> `+time+`</span> </div>
			 	</div>`;
        return msg;
		}
		
        var userId = $("#userId").val();
        console.log(userId);
        var websocket;
        if('WebSocket' in window) {
                                console.log("瀏覽器支援websocket");
            websocket = new WebSocket("ws://127.0.0.1:8080/EEIT124Team1FinalProject/chat/"+userId);
        } else if('MozWebSocket' in window) {
            alert("此瀏覽器只支援MozWebSocket");
        } else {
            alert("此瀏覽器只支援SockJS");
        }
        websocket.onopen = function(evnt) {
        	//$("#result").html("憲哥離開啦!");
        };
        var userArray = [];//所有對話對象
        //接收對方訊息
        websocket.onmessage = function(evnt) {
			var now = new Date();
			console.log(now.toLocaleDateString());
			var date = now.toLocaleDateString('zh-TW');
        	var comemsg = event.data;
            console.log("內容:"+comemsg)
            var msgArray = comemsg.split(':');
            var talkerId = msgArray[1];//取得傳送訊息對象
            var length = msgArray.length;
            var talkerMessage = msgArray[2];//訊息內容
            var name = msgArray[0];
            console.log(msgArray[1]);
            //對象是否存在對話列表中
            if($.inArray(talkerId,userArray)==-1){//非存在對象產生新對話通知
            	userArray.push(talkerId);
            	$("#chat_list").append('<div class=" chat_list active_chat" id="'+talkerId+'" onclick="chooseAdmin(this)"><div class="chat_people"><div class="chat_img"> <img src="showMemberIcon?id='+talkerId+'" alt="sunil"> </div><div class="chat_ib"><h5>'+name+'<span class="chat_date">'+date+'</span></h5><p>'+talkerMessage+'</p></div></div></div><input type="hidden"  name="'+talkerId+'"/>');
            }else{
            	$("#"+talkerId).find("p").text(talkerMessage);
                }
            
            //if(count==1){
            	
            //    $("#msg_history").append(coming(comemsg));
           // }else{
           
        	var currentTalkerId = $("#currentTalkerId").val();
           console.log("currentTalkerId"+currentTalkerId);
           console.log("talkerId"+talkerId);
           if(currentTalkerId==talkerId){
                $("#msg_history").append(coming(talkerMessage,talkerId));//新增訊息
               }
           // }
               // var content = $("#msg_history").html();
                var content = coming(talkerMessage,talkerId);
                $("input[name='"+talkerId+"']").val($("input[name='"+talkerId+"']").val()+content);//紀錄該組對話至欄位中
        };
        websocket.onerror = function(evnt) {};
        websocket.onclose = function(evnt) {
        	//$("#result").html("憲哥離開啦!");
        };
        
        
        
        
        $('#send').click(function(){
        	send();
        });

        function send() {
            if(websocket != null) {
               // var toAdmin = $("#toAdmin").val();
                var toAdmin = $("#toAdmin").val();
               
                var id = $("#currentTalkerId").val();
                var message = document.getElementById('message').value;
                var name = $("#userName").val();
                var gomsg = id+":"+message;
                $.ajax({
                    type:"get",
                    url:"message/TestWS?userId="+id+"&message="+message,
                });
                $("#msg_history").append(going(message));
                var currentTalkerId = $("#currentTalkerId").val();
                var content = $("#msg_history").html();
                $("input[name='"+currentTalkerId+"']").val(content);
                $("#message").val("");
            } else {
                alert('未與伺服器連結.');
            }
        }
    })
</script>
	
</head>

<body class="white-content">
    <div class="wrapper">
        <div class="sidebar" data="blue">

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="javascript:void(0)" class="simple-text logo-mini">
                    III
                </a>
                    <a href="javascript:void(0)" class="simple-text logo-normal">
                        EEIT124Team1
                </a>
                </div>
                <ul class="nav">
                    <li>
                        <a href="dashboard">
                            <i class="tim-icons icon-chart-pie-36"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a href="adminPage.controller">
                            <i class="tim-icons icon-single-02"></i>
                            <p>會員</p>
                        </a>
                    </li>
                    <li>
                        <a href="maintainStorePre.controller?pageNo=1">
                            <i class="tim-icons icon-cart "></i>
                            <p>租車</p>
                        </a>
                    </li>
                    <li>
                        <a href="eventDashboard">
                            <i class="tim-icons icon-calendar-60"></i>
                            <p>活動</p>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>">
                            <i class="tim-icons"><svg width="1.5em" height="1.2em" viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z"/>
                              </svg></i>
                            <p class="p-1">自行車</p>
                        </a>
                    </li>
                    <li>
                        <a href="sixsix.Home.controller">
                            <i class="tim-icons"><svg width="1.5em" height="1.2em" viewBox="0 0 16 16" class="bi bi-house-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                              </svg></i>
                            <p class="p-1">住宿</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="./setting.html">
                            <i class="tim-icons icon-settings-gear-63"></i>
                            <p>設定</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
     <%--        <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle d-inline">
                            <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
                        </div>
                        <a class="navbar-brand" href="javascript:void(0)">Team Name :</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
                    <div class="collapse navbar-collapse" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="search-bar input-group">
                                <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" ></i>
                  <span class="d-lg-none d-md-block">Search</span>
                </button>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <div class="notification d-none d-lg-block d-xl-block"></div>
                                    <i class="tim-icons icon-sound-wave"></i>
                                    <p class="d-lg-none">
                                        Notifications
                                    </p>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right dropdown-navbar">
                                    <li class="nav-link"><a href="#" class="nav-item dropdown-item">Mike John responded to your email</a></li>
                                    <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">You have 5 more tasks</a></li>
                                    <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Your friend Michael is in town</a></li>
                                    <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Another notification</a></li>
                                    <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Another one</a></li>
                                </ul>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <div class="photo">
                                        <c:if test="${! empty memberAd.icon}">
                                        <img src="showMemberIcon?id=${loginOK.memberId}" alt="Profile Photo">
                                        </c:if>
                                    	<c:if test="${ empty memberAd.icon}">
                                        <img src="http://i.imgur.com/Qj9FXu6.jpg" alt="Profile Photo">
                                        </c:if>
                                    </div>
                                    <b class="caret d-none d-lg-block d-xl-block"></b>
                                    <p class="d-lg-none">
                                        Log out
                                    </p>
                                </a>
                                <ul class="dropdown-menu dropdown-navbar">
                                    <li class="nav-link"><a href="./user.html" class="nav-item dropdown-item">Profile</a></li>
                                    <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Settings</a></li>
                                    <li class="dropdown-divider"></li>
                                    <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Log out</a></li>
                                </ul>
                            </li>
                            <li class="separator d-lg-none"></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
                        </div>
                    </div>
                </div>
            </div> --%>
            <!-- End Navbar -->

            <div class="content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">設定</h1><h1 class="h2">${AdminNumber}位管理員</h1>

                </div>


                <div class="row">
                    <div class="col-md-12">

                        <div class="card ">
                            <div class="card-header">
                                <h3 class="card-title"><a href="event.html">管理員</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="btn" id="service" href="event_order.html">客服</span></h3><h3 id="success"></h3>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
	                                    <table class="table tablesorter " id="">
	                                        <thead class=" text-primary">
	                                            <tr>
	                                                <th>
	                                                    Email
	                                                </th>
	                                                <th>
	                                                   	姓名
	                                                </th>
	                                                <th id="thead">
	                                                   	手機
	                                                </th>
	
	                                                <th class="text-right">
	                                                    <button id="addmgr1" class="btn btn-primary my-2 my-sm-0" data-toggle="modal" data-target="#exampleModal" " href="#">新增</button>
	                                                </th>
	                                            </tr>
	                                        </thead>
	                                        <tbody id="tbody">
	                                         <c:forEach var="rg" items="${admin}">
	                                            <tr>
	                                                <td>
	                                                    ${rg.email}
	                                                </td>
	                                                <td>
	                                                    ${rg.name}
	                                                </td>
	                                                <td id="space">
	                                                    ${rg.tel}
	                                                </td>
	
	                                                <td class="text-right">
	                                                	<c:if test="${rg.memberId != loginOK.memberId}">
	                                                    	<button id="deletemgr" class="btn btn-danger my-2 my-sm-0" name="${rg.memberId}" onclick="deleteMGR(this)">移除權限</button>
														</c:if>                                                    
	                                                </td>
	                                            </tr>
	                                           </c:forEach>
	                                        </tbody>
	                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
          
        </div>
    </div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">新增管理員</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                  </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="form-group form-row">
                                                                            <div class="col-sm-12 ">
                                                                                <label for="email">Email</label>
                                                                                <input type="email" class="form-control" id="email" value="" name="email" required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-row">
                                                                            <div class="col-sm-12 ">
                                                                                <label for="password">密碼</label>
                                                                                <input type="text" class="form-control" id="password" name="password" required />
                                                                            </div>
                                                                        </div>
                                                                        <div id="uplaod-wrap" class="form-group form-row">
                                                                            <div class="col-sm-6 ">
                                                                                <label class="col-form-label" for="categoryId">姓名</label>
                                                                                <input type="text" class="form-control" id="name" name="name" required />
                                                                            </div>
 
                                                                            <div class="col-sm-6">
                                                                                <label class="col-form-label" for="tel">電話</label>
                                                                                <input type="text" class="form-control" id="tel" name="tel" required />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group form-row">
                                                                            <div class="col-sm-6">
                                                                                <label for="gender">性別</label>
                                                                                <select  class="form-control" id="gender" name="gender" required >
                                                                                	<option value="Male">男</option>
                                                                                	<option value="Female">女</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                                <label for="areaId">公司分部</label>
                                                                                <select  class="form-control" id="areaId" name="areaId">
                                                                                	<option value="1">台北分部</option>
                                                                                	<option value="5">桃園分部</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <button type="button" class="btn btn-info"  id="input">填滿</button>
                                                                        <button type="button" class="btn btn-primary" id="add">新增</button>
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
    <input type="hidden" id ="AdminId" value="${loginOK.memberId}"/>  
	<!-- 客服視窗 -->
	<div id="dialog_div" title="客服系統">
        <div class="messaging">
        	<div class="text-center mb-4">
				<h1 class="h3 mb-3 font-weight-normal"><i class="fas fa-headset"></i>&nbsp線上客服</h1>
				<p id="result"></p>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
			</div>
            <div class="inbox_msg">
                 <div class="inbox_people">
                    <div class="headind_srch">
                        <div class="recent_heading">
                            <h4>會員列表</h4>
                        </div>
                    </div>
                    <div class="inbox_chat scroll" id="chat_list">
       
                    </div>
                </div>
                <div class="mesgs">
                    <div class="msg_history" id="msg_history">
                
                    </div>
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <input type="text" class="write_msg" id="message" placeholder="輸入訊息..." />
                            <button class="msg_send_btn" type="button" id="send"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            <p id="tou"></p>
                        </div>
                        <button id="onekeyinput">一鍵輸入</button>
                    </div>
                </div>
            </div>
        </div>
		<input type="hidden" id="userId" value="${loginOK.memberId}"/><!-- 我方ID -->
    	<input type="hidden" id="userName" value="${loginOK.name}"/><!-- 我方姓名 -->
    	<input type="hidden" id="toAdmin" value="${selectedAdmin.memberId}"/><!--  -->
    	<input type="hidden" id="currentTalkerId" value=""/><!-- 當前對話對象 -->
	</div>
    <!--   Core JS Files   -->
    <!--<script src="js/core/jquery.min.js"></script>-->
    <script src="js/core/popper.min.js"></script>
    <script src="js/core/bootstrap.min.js"></script>
    <script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->

    <!-- Chart JS -->
    <script src="js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="js/black-dashboard.min.js?v=1.0.0"></script>

    <!-- MGR -->
    <script>
    $("#onekeyinput").click(function(){
		$("#message").val("抱歉我看錯人了!");
	})
    $(function(){

       // var name = $("#deletemgr").name();
        var AdminId = $("#AdminId").val();
        if(name==AdminId){
        	$("#deletemgr").disable();
        }
        function tbody() {
            var tbody =
                '<tr><td><input id="email" type="email" placeholder="請輸入Email"/></td>' +
                '<td><input id="name"/></td>' +
                '<td><input id="tel" /></td>' +
                '<td><input id="password" type="password"/></td>' +
                '<td class="text-right"><button id="registmgr"  class="btn btn-success my-2 my-sm-0">授權</button></td></tr>';
            return tbody;
        }
        
        $("#addmgr").on("click", function() {
            $("#thead").after('<th>密碼</th>');
            $("#space").after('<td></td>');
            $("#tbody").append(tbody());
            // $.ajax({

            // });
        });
        
  
        
        
		//$("#tbody").on("click","#registmgr",function() {
		$("#add").on("click",function(){
			console.log("123")
			var info = {
						"email":$("#email").val(),
						"name":$("#name").val(),
						"tel":$("#tel").val(),
						"password":$("#password").val(),
						"areaId":$("#areaId").val(),
						"gender":$("#gender").val()
					}
			  Swal.fire({
                  title: "確定新增管理員",
                  icon: "warning",
                  showCancelButton: true,
                  closeOnConfirm: false,
                  showLoaderOnConfirm: true,
                  confirmButtonClass: "btn-danger",
                  confirmButtonText: "新增管理員",
                  cancelButtonText: "取消",
              }).then((result) => {
            	  if (result.isConfirmed) {
            			$.ajax({
            				type:"post",
            				url:"addMGR.controllers",
            				dataType:"json",
            				data:info,
            				success:function(data){
            					 Swal.fire({
                                     title: '成功新增',
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
                  }
              })
   		
            	
		});
		$("#input").on("click",function(){
			$("#email").val("guanliyuang@gmail.com");
			$("#password").val("asd123");
			$("#name").val("管理員小哥");
			$("#tel").val("0956781657");
			$("#password").val("asd123");
			$("#areaId")[0].selectedIndex = 1;
		});

		$("#dialog_div").dialog({
			height: 800,
			width: 800,
	        autoOpen: false,
	        closeOnEscape: false,
	        resizable: true,
	        show: "scale",
	        draggable: true,
	        hide: "explode",
	 		position:{ my: "top", at: "right", of: window },
	        buttons: {
	            //"Ok": function() { $(this).dialog("close"); },
	            "離開": function() { $(this).dialog("close"); }
	        }
	 
	    });
	 
	    $("#service").click(function() {
	        $("#dialog_div").dialog("open");
	        return false;
	    });
    })
    </script>
	<script>
    function deleteMGR(obj){
        var memberId = obj.name;
 	

       //
        Swal.fire({
                  title: "確定移除管理員",
                  icon: "warning",
                  showCancelButton: true,
                  closeOnConfirm: false,
                  showLoaderOnConfirm: true,
                  confirmButtonClass: "btn-danger",
                  confirmButtonText: "移除管理員",
                  cancelButtonText: "取消",
              }).then((result) => {
            	  if (result.isConfirmed) {
            		   $.ajax({
           				type:"post",
           				url:"deleteMGR",
           				dataType:"json",
           				data:{memberId:memberId},
           				success:function(data){
           					if(data.success){
           					 Swal.fire({
                                 title: '成功移除',
                                 //text: '導向驗證頁...',
                                 icon: 'success',
                                 timer: 1000,
                                 showConfirmButton: false,
                             })
                             .then(() => {
                                 window.location.reload();
                             })
           					}
           					if(data.error){
           						alert(data.error);
           						window.location.reload();
           					}
           				}
                   });	
                  }
              })
       //
    }
	</script>
    <script>
        $(document).ready(function() {
            $().ready(function() {
                $sidebar = $('.sidebar');
                $navbar = $('.navbar');
                $main_panel = $('.main-panel');

                $full_page = $('.full-page');

                $sidebar_responsive = $('body > .navbar-collapse');
                sidebar_mini_active = true;
                white_color = false;

                window_width = $(window).width();

                fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



                $('.fixed-plugin a').click(function(event) {
                    if ($(this).hasClass('switch-trigger')) {
                        if (event.stopPropagation) {
                            event.stopPropagation();
                        } else if (window.event) {
                            window.event.cancelBubble = true;
                        }
                    }
                });

                $('.fixed-plugin .background-color span').click(function() {
                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');

                    var new_color = $(this).data('color');

                    if ($sidebar.length != 0) {
                        $sidebar.attr('data', new_color);
                    }

                    if ($main_panel.length != 0) {
                        $main_panel.attr('data', new_color);
                    }

                    if ($full_page.length != 0) {
                        $full_page.attr('filter-color', new_color);
                    }

                    if ($sidebar_responsive.length != 0) {
                        $sidebar_responsive.attr('data', new_color);
                    }
                });

                $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
                    var $btn = $(this);

                    if (sidebar_mini_active == true) {
                        $('body').removeClass('sidebar-mini');
                        sidebar_mini_active = false;
                        blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
                    } else {
                        $('body').addClass('sidebar-mini');
                        sidebar_mini_active = true;
                        blackDashboard.showSidebarMessage('Sidebar mini activated...');
                    }

                    // we simulate the window Resize so the charts will get updated in realtime.
                    var simulateWindowResize = setInterval(function() {
                        window.dispatchEvent(new Event('resize'));
                    }, 180);

                    // we stop the simulation of Window Resize after the animations are completed
                    setTimeout(function() {
                        clearInterval(simulateWindowResize);
                    }, 1000);
                });

                $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
                    var $btn = $(this);

                    if (white_color == true) {

                        $('body').addClass('change-background');
                        setTimeout(function() {
                            $('body').removeClass('change-background');
                            $('body').removeClass('white-content');
                        }, 900);
                        white_color = false;
                    } else {

                        $('body').addClass('change-background');
                        setTimeout(function() {
                            $('body').removeClass('change-background');
                            $('body').addClass('white-content');
                        }, 900);

                        white_color = true;
                    }


                });

                $('.light-badge').click(function() {
                    $('body').addClass('white-content');
                });

                $('.dark-badge').click(function() {
                    $('body').removeClass('white-content');
                });
            });
        });
    </script>

    <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
    <script>
        window.TrackJS &&
            TrackJS.install({
                token: "ee6fab19c5a04ac1a32a645abde4613a",
                application: "black-dashboard-free"
            });
    </script>
</body>

</html>