<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head lang="en">
        <meta charset="UTF-8">
        <!-- <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script> -->
        <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>聯繫客服</title>
        <script type="text/javascript">
            $(function() {
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
                    $("#tou").html("連結伺服器成功!")
                };
                websocket.onmessage = function(evnt) {
                    $("#msg").html($("#msg").html()+ "<br/>"+evnt.data);
                };
                websocket.onerror = function(evnt) {};
                websocket.onclose = function(evnt) {
                    $("#tou").html("與伺服器斷開了連結!")
                };
                
                
                
                
                $('#send').click(function(){
                	send();
                });

                function send() {
                    if(websocket != null) {
                        var id = $("#memberId").val();
                        var message = "<span id='member' name=''>"+document.getElementById('message').value+"</span>";
                        var name = $("#userName").val();
                        $.ajax({
                            type:"get",
                            url:"message/TestWS?userId="+id+"&message="+"管理員:"+message,
                        	dataType:"text",
                        	success:function(){
                            }
                        });
                        $("#msg2").html($("#msg2").html()+ "<br/>"+$("#message").val());
                       // websocket.send(name+":"+message);
                    } else {
                        alert('未與伺服器連結.');
                    }
                }
            })
        </script>
    </head>

    <body>
    	<input type="hidden" id="userId" value="${loginOK.memberId}"/>
    	<input type="hidden" id="userName" value="${loginOK.name}"/>
        <div class="container">
            <div class="page-header" id="tou">
                	客服端
            </div>
            <div class="row">
				<div clas="well ">
                	<div class="float-right" id="msg"></div>
				</div>
				<h1 class="float-right" id="msg2"></h1>
            </div>
            <div class="col-lg">
                <div class="input-group mb-3 fixed-bottom">
                <input type="text" class="form-control" id="memberId" placeholder="傳送會員編號" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <input type="text" class="form-control" id="message" placeholder="傳送資訊..." aria-label="Recipient's username" aria-describedby="button-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-outline-secondary" type="button" id="send">傳送</button>
                    </div>
                  </div>
                  
            </div>
        </div>
    </body>
    </body>

</html>