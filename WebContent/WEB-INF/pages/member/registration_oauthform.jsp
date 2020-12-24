<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>追風者｜完整您的資料</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/floating-labels/">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="css/floating-labels.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap"
	rel="stylesheet">
<style>
.card {
	background-color: rgba(244, 250, 248, 0.897);
}
</style>
<script type="text/javascript">
	function inputInfo() {
		document.getElementById("exampleInputEmail1").value = "eeit124group1@gmail.com";
		document.getElementById("passwordcheck").value = "asd123";
		document.getElementById("passwordcheck2").value = "asd123";
		document.getElementById("exampleInputPassword1").value = "第一組";
		document.getElementById("exampleInputPassword2").value = "09876543210";
	}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

		<form:form class="form-signin" modelAttribute="loginOK" enctype="multipart/form-data"
			method="post">
	<div class="card m-auto " style="top: 80px; width: 600px;padding:10px;">
			<div class="text-center mb-4">
				<h1 class="h3 mb-3 font-weight-normal">完整您的資料</h1>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
			</div>
			
			 <div class="form-row">
				<!--<div class="col-md-6 mb-3">
					<label for="validationTooltip04">姓名：</label> <input type="text"
					 id="exampleInputPassword1"	class="form-control" name="name" required />

				</div> -->
				<div class="col-md-3 mb-3">
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="tel">電話：</form:label> 
					 <form:input type="text" class="form-control" placeholder="02-1234567"
					name="tel" value="" path="tel" />

				</div>

			</div>
			<div class="form-row">
			<div class="col-md-3 mb-3">
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="gender">性別：</form:label> <form:select id="inputState"  class="form-control" path="gender">
						<option value="Male">男</option>
						<option value="Female">女</option>
						<option value="Other">其他</option>
					</form:select>
				</div>
			</div>
			<div class="form-row">
			<div class="col-md-3 mb-3">
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="areaIdStr">居住地區：</form:label> <form:select id="inputState"  class="form-control" path="areaIdStr">
						<option value="1">台北市</option>
						<option value="2">新北市</option>
						<option value="3">基隆市</option>
						<option value="4">宜蘭縣</option>
						<option value="5">桃園市</option>
						<option value="6">新竹市</option>
						<option value="7">新竹縣</option>
						<option value="8">苗栗縣</option>
						<option value="9">台中市</option>
						<option value="10">彰化縣</option>
						<option value="11">南投縣</option>
						<option value="12">雲林縣</option>
						<option value="13">嘉義市</option>
						<option value="14">嘉義縣</option>
						<option value="15">台南市</option>
						<option value="16">高雄市</option>
						<option value="17">屏東縣</option>
						<option value="18">台東縣</option>
						<option value="19">花蓮縣</option>
						<option value="20">澎湖縣</option>
						<option value="21">金門縣</option>
						<option value="22">連江縣</option>
					</form:select>


				</div>
			
			</div>
			<div class="form-row">
			<div class="col-md-3 mb-3">
				</div>
				<div class="col-md-6 mb-3">
					<form:label path="favorIdStr">自行車偏好：</form:label> <form:select id="inputState2"
						name="favor" class="form-control" path="favorIdStr">
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
			<hr>
			<button class="btn btn-outline-success  my-2 my-lg-3" id="regist" type="button">送出</button>

	</div>
		</form:form>
		<input id="url" value="${url}" type="hidden"/>
	<script>
		$(function(){
/* 			$("#regist").click(function(){
				var info = {
					"email":$("#exampleInputEmail1").val(),
					"password":$("#passwordcheck").val(),
					"name":$("#exampleInputPassword1").val(), 
					"tel":$("#exampleInputPassword2").val(),
					"gender":$("#inputState").val(),
					"area":$("#inputState1").val(),
					"favor":$("#inputState2").val()
				}

				$.ajax({
					type:"post",
					url:"basicRegister.controller",
					dataType:"json",
					data:info,
					success:function(data){
						if(data.registSuccess){
						//跳轉驗證
							$(window).attr('location','checkEmailPage');
						}
						if(data.accountExist){
							$("#emailExist").text(data.accountExist);
						}
						
					}
				});	
			}); */
			var page = $("#url").val();
			$("#regist").click(function(){
				
				var form1 = new FormData($('form')[0]);
				
					$.ajax({
						type:"POST",
						url:"updateBasicInfoByGoogle.controller",
						dataType:"json",
						data:form1,
						contentType: false, //required
					    processData: false, // required
						success:function(data){
							if(data.success){
								$(window).attr('location',page);
							}
						}
					});
				});

		})
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
		<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>

</html>