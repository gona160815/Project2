<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>追風者｜忘記密碼</title>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/floating-labels/">

<!-- Bootstrap core CSS -->

<!-- Custom styles for this template -->
<link href="css/floating-labels.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap"
	rel="stylesheet">
</head>

<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div class="card m-auto " style="top: 100px; width: 600px;">
		<form class="form-signin" action="forgetPassword.controller"
			method="post">
			<div class="text-center mb-4">
				<img class="p-2 mb-4" src="img/bicycle.png" alt="" width="100"
					height="100">
				<h1 class="h3 mb-3 font-weight-normal">找回您的密碼</h1>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
			</div>

			<div class="form-label-group ">
				<input type="email" id="inputEmail" class="form-control "
					placeholder="Email" value=""
					name="account" required="" autofocus=""> <label
					for="inputEmail">請輸入註冊信箱</label>
					<small id="emailHelp" class="form-text text-muted" class="text-danger">我們會將密碼寄至您的註冊信箱，請在登入後立即更改密碼!</small>
			</div>
			<button id="send" class="btn btn-lg btn-success btn-block" type="submit">送出</button>
			<p class="mt-5 mb-3 text-muted text-center inline-text">
				<a class="m-4  text-decoration-none inline-text" href="registPage">加入會員</a>
				<a class="m-4  text-decoration-none inline-text" href="forgetPasswordPage">忘記密碼</a> <a
					class="m-4  text-decoration-none inline-text" href="#">會員中心</a>
			</p>



		</form>

	</div>
	<script>
		$("#send").click(function(){
			 Swal.fire({
                 title: '信件已寄出',
                 //text: '導向驗證頁...',
                 icon: 'success',
                 timer: 500,
                 showConfirmButton: false,
             })
		})
	</script>
<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>
</html>