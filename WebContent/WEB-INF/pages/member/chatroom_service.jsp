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
			var toUser = data.id;
			$("#currentTalkerId").val(toUser);
			console.log($("#currentTalkerId").val());
			$("#"+toUser).addClass("active_chat"); 
			$("#"+toUser).siblings().removeClass("active_chat");
			var remember = $("input[name='"+toUser+"']").val();
			$("#msg_history").html(remember); 
			
		}
            $(function() {
			function coming(talkerMessage){
				var now = new Date();
				var getTime = now.toTimeString();
				var timeArray = getTime.split(" ");
				var time = timeArray[0];
				var msg = ` <div class="incoming_msg">
                <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="received_msg">
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
                    	$("#chat_list").append('<div class=" chat_list active_chat" id="'+talkerId+'" onclick="chooseAdmin(this)"><div class="chat_people"><div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div><div class="chat_ib"><h5>'+name+'<span class="chat_date">'+date+'</span></h5><p>'+talkerMessage+'</p></div></div></div><input type="hidden"  name="'+talkerId+'"/>');
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
	                    $("#msg_history").append(coming(talkerMessage));//新增訊息
                       }
                   // }
	                   // var content = $("#msg_history").html();
	                    var content = coming(talkerMessage);
	                    $("input[name='"+talkerId+"']").val($("input[name='"+talkerId+"']").val()+content);//紀錄該組對話至欄位中
                };
                websocket.onerror = function(evnt) {};
                websocket.onclose = function(evnt) {
                	$("#result").html("憲哥離開啦!");
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

<body>
    <div class="container">


        <div class="messaging">
        	<div class="text-center mb-4">
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
                            <h4>會員列表</h4>
                        </div>
                        <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search-bar" placeholder="Search">
                            </div>
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
                            <input type="text" class="write_msg" id="message" placeholder="Type a message" />
                            <button class="msg_send_btn" type="button" id="send"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            <p id="tou"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<input type="hidden" id="userId" value="${loginOK.memberId}"/><!-- 我方ID -->
    	<input type="hidden" id="userName" value="${loginOK.name}"/><!-- 我方姓名 -->
    	<input type="hidden" id="toAdmin" value="${selectedAdmin.memberId}"/><!--  -->
    	<input type="hidden" id="currentTalkerId" value=""/><!-- 當前對話對象 -->
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>

</html>