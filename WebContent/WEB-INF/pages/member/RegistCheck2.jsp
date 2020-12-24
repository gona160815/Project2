<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>追風者｜信箱驗證</title>

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
</head>

<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div class="card m-auto " style="top: 100px; width: 600px;">
		<form class="form-signin" action="checkCAPTCHA.controller"
			method="post">
			<div class="text-center mb-4">
				<img class="p-2 mb-4" src="img/bicycle.png" alt="" width="100"
					height="100">
				<h1 class="h3 mb-3 font-weight-normal">開通您的帳號，得到更完整的服務!</h1>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
			</div>

			<div class="form-label-group ">
				<input type="text" id="inputEmail" class="form-control "
					placeholder="Email" value=""
					name="check" required="" autofocus=""> <label
					for="inputEmail">請輸入驗證碼</label>
					<small id="emailHelp" class="form-text text-muted" class="text-danger">離開後將無法再次回到此頁面</small>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">驗證</button>
			<p class="mt-5 mb-3 text-muted text-center inline-text">
				<a class="m-4  text-decoration-none inline-text" href="registPage">加入會員</a>
				<a class="m-4  text-decoration-none inline-text" href="forgetPasswordPage">忘記密碼</a> <a
					class="m-4  text-decoration-none inline-text" href="#">會員中心</a>
			</p>



		</form>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
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