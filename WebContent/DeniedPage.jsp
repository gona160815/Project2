<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

<title>Oops!無法造訪此網頁!</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
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
<!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6LdL6eQZAAAAAJ-U7FECqP6agndtDxtrrop-aZtc"></script>
<body>
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div class="card m-auto " style="top: 100px; width: 600px;">
			<div class="text-center mb-4">
				<img class="p-2 mb-4" src="img/bicycle.png" alt="" width="100"
					height="100">
				<h1 class="h3 mb-3 font-weight-normal">Oops!</h1>
				<h1 class="h3 mb-3 font-weight-normal">您沒有足夠權限，造訪此網頁!</h1>
				<p id="result"></p>
        	<a class="w-50 align-items-center btn-warning btn-lg btn-inline" href="homepage" type="button" id="btnSignIn">返回首頁</a>
			</div>
        	<div class="my-2 mb-2">
        	
        	</div>
			
			<p class="my-3 text-muted text-center inline-text">
				<a class="m-4  text-decoration-none inline-text" href="registPage">加入會員</a>
				<a class="m-4  text-decoration-none inline-text" href="forgetPasswordPage">忘記密碼</a> <a
					class="m-4  text-decoration-none inline-text" href="#">聯絡我們</a>
			</p>




    <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
	</div>


		
</body>

</html>