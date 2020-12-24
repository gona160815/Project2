<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>追風者｜立即重新設定您的密碼</title>

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
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>

	<div class="card m-auto " style="top: 80px; width: 600px;">
		<form class="form-signin" action="basicRegister.controller"
			method="post">
			<div class="text-center mb-4">
				<h1 class="h3 mb-3 font-weight-normal">重新設定您的密碼</h1>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
			</div>
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="validationTooltip04">密碼：</label> <input type="password"
						class="form-control" id="passwordcheck" name="password"
						placeholder="密碼需大於六個字，同時包括英文與數字" onblur="checkPwd()" required /> <span
						id="Pwdspan"></span>
				</div>

			</div>
			<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->

			<script>
				function checkPwd() {
					let thePwdObj = document.getElementById("passwordcheck");
					let thePwdObjVal = thePwdObj.value;
					let thePwdObjValLen = thePwdObjVal.length;
					let sp = document.getElementById("Pwdspan");
					let flag1 = false;

					if (thePwdObjVal == "") {
						sp.innerHTML = "請輸入密碼";
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
						}
					} else {
						sp.innerHTML = "最少要有六個字元"
					}
				}
			</script>

			<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="validationTooltip04">再次輸入密碼：</label> <input type="text"
						class="form-control" id="passwordcheck2" placeholer="請再次輸入密碼"
						onblur="checkPwd2()" required /> <span id="Pwdspan2"></span>
				</div>
				<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->

				<script>
					function checkPwd2() {
						let thePwdObj2 = document
								.getElementById("passwordcheck2").value;
						let thePwdObj = document
								.getElementById("passwordcheck").value;
						let sp = document.getElementById("Pwdspan2");
						let flag1 = false;

						if (thePwdObj != thePwdObj2) {
							sp.innerHTML = "密碼不一致！請重新輸入";
							document.getElementById("submit").disabled = true;
						} else if (thePwdObj2 == thePwdObj) {
							flag1 = true;
						}
						if (flag1) {
							sp.innerHTML = "正確";
						}
					}
				</script>
				<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->
			</div>
			<hr>
			<button class="btn btn-outline-success my-2 my-lg-3" id="regist" type="button">重新設定</button>
		</form>

	</div>
	<script>
		$(function(){
			$("#regist").click(function(){
				var password = $("#passwordcheck").val();
				$.ajax({
					type:"post",
					url:"resetPassword.controller",
					dataType:"json",
					data:{password:password},
					success:function(data){
						if(data.success){
							 Swal.fire({
                                 title: '更改成功',
                                 //text: '導向驗證頁...',
                                 icon: 'success',
                                 timer: 1000,
                                 showConfirmButton: false,
                             })
						//跳轉loginpage
							$(window).attr('location','login2Page');
						}
						if(data.error){
							alert(data.error);
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
</body>

</html>