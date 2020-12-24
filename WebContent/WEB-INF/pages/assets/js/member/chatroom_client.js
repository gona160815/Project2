/**
 * 
 */
$(document).ready(function() {

	$(".chat_on").click(function() {
		$(".Layout").toggle();
		//$(".chat_on").hide(300);
		$("#messageNum").text(0);
	});

	$(".chat_close_icon").click(function() {
		$(".Layout").hide();
		$(".chat_on").show(300);
		$("#messageNum").text(0);
	});
	var message = $("#allMessage").val();
	console.log("message" + message);
	if (message != null && message != "") {
		var allMessageArray = message.split('*');
		var user = allMessageArray[0];
		var content = allMessageArray[1];
		//$("input[name='"+user+"']").val(content);
		$("#msg_history").html(content);
	}

});

function chooseAdmin(data) {
	var toAdmin2 = data.id;
	$("#toAdmin").val(toAdmin2);
	console.log($("#toAdmin").val());
	$("#" + toAdmin2).addClass("active_chat");
	$("#" + toAdmin2).siblings().removeClass("active_chat");
	var remember = $("input[name='" + toAdmin2 + "']").val();
	$("#msg_history").html(remember);

}
$(function() {
	function coming(comemsg) {
		var now = new Date();
		var getTime = now.toTimeString();
		var timeArray = getTime.split(" ");
		var time = timeArray[0];
		var msg = ` <div class='incoming_msg'>
                <div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>
                <div class='received_msg'>
                    <div class='received_withd_msg'>
                        <p>`+ comemsg +
			`</p>
                        <span class='time_date'>`+ time + `</span></div>
                </div>
            </div>`;
		return msg;
	}

	function going(gomsg) {
		var now = new Date();
		var getTime = now.toTimeString();
		var timeArray = getTime.split(" ");
		var time = timeArray[0];
		var msg = `<div class='outgoing_msg'>
                	<div class='sent_msg'>
                	<p>`+ $("#message").val(); +
			`</p><span class='time_date'>` + time + `</span> </div></div>`;
		return msg;
	}

	var userId = $("#userId").val();
	console.log(userId);
	var websocket;
	var messageNum = 0;
	$(".chat_on").click(function() {
		messageNum = 0;
	});
	$(".chat_close_icon").click(function() {
		messageNum = 0;
	});
	$(".ui-dialog-buttonset").click(function(){
		messageNum = 0;
		$("#messageNum").text(0);
	});
	if ('WebSocket' in window) {
		console.log("此瀏覽器支援websocket");
		websocket = new WebSocket("ws://127.0.0.1:8080/EEIT124Team1FinalProject/chat/" + userId);
	} else if ('MozWebSocket' in window) {
		alert("此瀏覽器只支援MozWebSocket");
	} else {
		alert("此瀏覽器只支援SockJS");
	}
	websocket.onopen = function(evnt) {
		// $("#result").html("憲上客服來啦!")
	};
	websocket.onmessage = function(evnt) {
		messageNum = messageNum + 1;
		var comemsg = event.data;
		$("#msg_history").append(coming(comemsg));
		var getInputVal = $("#toAdmin").val();
		var content = $('#msg_history').html();
		console.log(content);
		$("input[name='" + getInputVal + "']").val(content);
		$("#messageNum").text(messageNum);
		$.ajax({
			type: 'post',
			url: 'processMessage',
			data: { message: content },
			success: function() {
				console.log(getInputVal + ',' + content);
			}
		});
	};
	websocket.onerror = function(evnt) { };
	websocket.onclose = function(evnt) {
		// $("#result").html("憲哥離開啦!");
	};



	$('#send').click(function() {
		send();
		var getInputVal = $("#toAdmin").val();
		var content = $('#msg_history').html();
		console.log(content);
		$("input[name='" + getInputVal + "']").val(content);
		$.ajax({
			type: 'post',
			url: 'processMessage',
			data: { message: content },
			success: function() {
				console.log(getInputVal + ',' + content);
			}
		});
	});

	function send() {

		if (websocket != null) {
			var toAdmin = $("#toAdmin").val();
			var name = $("#userName").val();
			var id = name + ":" + $("#userId").val();
			var message = document.getElementById('message').value;
			var sendMessage = {
				message: message,
				Id: userId
			}
			var gomsg = id + ":" + message;
			/*var sign = `$("#chat_list").append('"<div class=" chat_list active_chat" id="${rg.memberId }" onclick="chooseAdmin(this)"><div class="chat_people"><div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div><div class="chat_ib"><h5>${rg.name } <span class="chat_date">Dec 25</span></h5><p>有任何疑問嗎? 讓我來幫您解決。</p></div></div></div>')`;*/
			$.ajax({
				type: "get",
				url: "message/TestWS?userId=" + toAdmin + "&message=" + id + ":" + message,
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


