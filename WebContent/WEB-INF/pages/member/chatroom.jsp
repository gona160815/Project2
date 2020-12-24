<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>追風者｜聯繫客服</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/member/chat.css">
    <style>
    	.chat_list{ cursor: pointer; }
    </style>
	     <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>    
	  <script type="text/javascript">
			
		function chooseAdmin(data){
			var toAdmin2 = data.id;
			$("#toAdmin").val(toAdmin2);
			console.log($("#toAdmin").val());
			$("#"+toAdmin2).addClass("active_chat"); 
			$("#"+toAdmin2).siblings().removeClass("active_chat");
			var remember = $("input[name='"+toAdmin2+"']").val();
			$("#msg_history").html(remember); 
			
		}
            $(function() {
			function coming(comemsg){
            		  var now = new Date();
      				var getTime = now.toTimeString();
      				var timeArray = getTime.split(" ");
      				var time = timeArray[0];
				var msg = ` <div class="incoming_msg">
                <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="received_msg">
                    <div class="received_withd_msg">
                        <p>`+comemsg+
                        `</p>
                        <span class="time_date">`+time+`</span></div>
                </div>
            </div>`;
		            return msg;
				}

			function going(gomsg){
				var now = new Date();
				var getTime = now.toTimeString();
				var timeArray = getTime.split(" ");
				var time = timeArray[0];
				var msg = `<div class="outgoing_msg">
                	<div class="sent_msg">
                	<p>`+$("#message").val();+
                	`</p><span class="time_date">` + time + `</span> </div></div>`;
		        return msg;
				}

                var userId = $("#userId").val();
                console.log(userId);
                var websocket;
                if('WebSocket' in window) {
                                        console.log("此瀏覽器支援websocket");
                    websocket = new WebSocket("ws://127.0.0.1:8080/EEIT124Team1FinalProject/chat/"+userId);
                } else if('MozWebSocket' in window) {
                    alert("此瀏覽器只支援MozWebSocket");
                } else {
                    alert("此瀏覽器只支援SockJS");
                }
                websocket.onopen = function(evnt) {
                   // $("#result").html("憲上客服來啦!")
                };
                websocket.onmessage = function(evnt) {
                    var comemsg = event.data;
                    $("#msg_history").append(coming(comemsg));
                    var getInputVal = $("#toAdmin").val();
                    var content = $('#msg_history').html();
                	console.log(content);
                	$("input[name='"+getInputVal+"']").val(content);
                    
                };
                websocket.onerror = function(evnt) {};
                websocket.onclose = function(evnt) {
                    $("#result").html("憲哥離開啦!");
                };
                
                
                
                $('#send').click(function(){
                	send();
                	var getInputVal = $("#toAdmin").val();
                	var content = $('#msg_history').html();
                	console.log(content);
                	$("input[name='"+getInputVal+"']").val(content);
                });

                function send() {
	
                    if(websocket != null) {
                        var toAdmin = $("#toAdmin").val();
                        var name = $("#userName").val();
                        var id = name+":"+ $("#userId").val();
                        var message = document.getElementById('message').value;
                        var sendMessage = {
									message:message,
									Id:userId									
                                }
                        var gomsg = id+":"+message;
                        var sign = `$("#chat_list").append('"<div class=" chat_list active_chat" id="${rg.memberId }" onclick="chooseAdmin(this)"><div class="chat_people"><div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div><div class="chat_ib"><h5>${rg.name } <span class="chat_date">Dec 25</span></h5><p>有任何疑問嗎? 讓我來幫您解決。</p></div></div></div>')`;
                        	$.ajax({
                            	type:"get",
                            	url:"message/TestWS?userId="+toAdmin+"&message="+ id+":"+message,
                        	});
                        $("#msg_history").append(going(message));
                        $("#message").val("");
                    } else {
                        alert('未與伺服器連結.');
                    }
                }
                var now = new Date();
				console.log(now.toLocaleDateString());
				var date = now.toLocaleDateString('zh-TW');
				$(".chat_date").text(date);
            })
        </script>   
</head>

<body>
    <div class="container">


        <div class="messaging">
        	<div class="text-center mb-4 Layout Layout-open Layout-expand Layout-right">
				<img class="p-2 mb-4" src="img/member/jackyWu.jpg" alt="" width="130"
					height="100">
				<h1 class="h3 mb-3 font-weight-normal">憲上客服</h1>
				<p id="result"></p>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
			</div>
            <div class="inbox_msg">
                 <div class="inbox_people">
                    <div class="headind_srch">
                        <div class="recent_heading">
                            <h4>目前在線管理員</h4>
                        </div>
                        <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search-bar" placeholder="Search">
                            </div>
                        </div>
                    </div>
                    <div class="inbox_chat scroll">
                    <c:forEach var="rg" items="${getAdmin}">
						<!--  <a class="dropdown-item" href="getAdmin?Id=${rg.memberId }">${rg.name }</a>-->
                        <div class=" chat_list" id="${rg.memberId }" onclick="chooseAdmin(this)">
                            <div class="chat_people">
                                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                <div class="chat_ib">
                                    <h5>${rg.name } <span class="chat_date"></span></h5>
                                    <p>有任何疑問嗎? 讓我來幫您解決。</p>
                                </div>
                            </div>
                        </div>
                        <input type="hidden"  name="${rg.memberId }"/>
					</c:forEach>
                  
                    </div>
                </div>
                <div class="mesgs">
                    <div class="msg_history" id="msg_history">
              
                    </div>
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <input type="text" class="write_msg" id="message" placeholder="Type a message" />
                            <button class="msg_send_btn" type="button" id="send"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            <p id="tou"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<input type="hidden" id="userId" value="${loginOK.memberId}"/><!-- 我方ID -->
    	<input type="hidden" id="userName" value="${loginOK.name}"/><!-- 我方名字 -->
    	<input type="hidden" id="toAdmin" value="${selectedAdmin.memberId}"/><!-- 當前對話管理員 -->
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>