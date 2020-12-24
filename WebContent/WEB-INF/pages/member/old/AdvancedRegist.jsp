<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>進階註冊</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<style>
</style>
</head>

<body>
	<div class="mx-auto w-75 p-3">

		<form class="w-25 p-3 " action="<c:url value='/進階註冊SERVLET' />"
			method="post" ENCTYPE="multipart/form-data">

			<div class="form-group">
				<label for="exampleInputPassword1">暱稱：</label> <input type="text"
					class="form-control" id="exampleInputPassword1" name="nickname"
					required>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">生日</label> <input type="date"
					class="form-control" id="exampleInputPassword1" name="birthday"
					placeholder="ex:YYYY/MM/DD" required>
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">地址：</label> <input type="text"
					class="form-control" id="exampleInputPassword1" name="address"
					placeholder="請輸入完整居住地址" required>
			</div>





			<label>照片：</label>
			<div class="custom-file">
				<input type="file" size="40" class="custom-file-input" name="file1"
					id="validatedCustomFile" required> <label
					class="custom-file-label" for="validatedCustomFile">選擇上傳頭像...</label>
			</div>
	
			<button type="submit" class="btn btn-primary">確認</button>
	
		</form>

		<div class="dropdown-menu">
			<form class="px-4 py-3">
				<div class="form-group">
					<label for="exampleDropdownFormEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleDropdownFormEmail1"
						placeholder="email@example.com">
				</div>
				<div class="form-group">
					<label for="exampleDropdownFormPassword1">Password</label> <input
						type="password" class="form-control"
						id="exampleDropdownFormPassword1" placeholder="Password">
				</div>
				<div class="form-group">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="dropdownCheck">
						<label class="form-check-label" for="dropdownCheck">
							Remember me </label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Sign in</button>
			</form>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="#">New around here? Sign up</a> <a
				class="dropdown-item" href="#">Forgot password?</a>
		</div>

		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
			integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
			integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
			crossorigin="anonymous"></script>
	</div>
</body>

</html>