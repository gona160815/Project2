<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>追風者｜會員註冊</title>

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
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function inputInfo() {
		document.getElementById("exampleInputEmail1").value = "eeit124group1test@gmail.com";
		document.getElementById("passwordcheck").value = "asd123";
		document.getElementById("passwordcheck2").value = "asd123";
		document.getElementById("exampleInputPassword1").value = "新同學";
		document.getElementById("exampleInputPassword2").value = "09876543210";

		document.getElementById("Pwdspan").style.color = 'green';
		document.getElementById("Pwdspan2").style.color = 'green';
		document.getElementById("Pwdspan").innerHTML = "<i class='fa fa-check' aria-hidden='true'></i>";
		document.getElementById("Pwdspan2").innerHTML = "<i class='fa fa-check' aria-hidden='true'></i>";
		document.getElementById("regist").disabled = false;
		$("#emailExist").html("");
	}

	function inputExist() {
		document.getElementById("exampleInputEmail1").value = "eeit124group1Admin@gmail.com";
		document.getElementById("passwordcheck").value = "asd123";
		document.getElementById("passwordcheck2").value = "asd123";
		document.getElementById("exampleInputPassword1").value = "新同學";
		document.getElementById("exampleInputPassword2").value = "09876543210";

		document.getElementById("Pwdspan").style.color = 'green';
		document.getElementById("Pwdspan2").style.color = 'green';
		document.getElementById("Pwdspan").innerHTML = "<i class='fa fa-check' aria-hidden='true'></i>";
		document.getElementById("Pwdspan2").innerHTML = "<i class='fa fa-check' aria-hidden='true'></i>";
		document.getElementById("regist").disabled = false;
		
		
	}
	
	
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div class="card m-auto " style="top: 80px; width: 600px;" onkeyup = "checkLogin()">
		<form class="form-signin" action="basicRegister.controller"
			method="post">
			<div class="text-center mb-4">
				<h1 class="h3 mb-3 font-weight-normal">會員註冊</h1>
				<!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
				<P style='color:red'>*以下欄位皆為必填</P>				
			</div>
			
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="validationTooltip02">電子信箱：</label> <input type="text"
						class="form-control" id="exampleInputEmail1" name="email" placeholder="此信箱即為您的帳號，請確實填寫。" required />
					<span style='color:red' id=emailExist></span>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="validationTooltip04">密碼：</label> <input type="password"
						class="form-control" id="passwordcheck" name="password"
						placeholder="密碼需大於六個字，同時包括英文與數字。" onkeyup="checkPwd()" required /> <span
						style='color:red' id="Pwdspan"></span>
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
						sp.style.color = 'red';
						sp.innerHTML = "<i class='fa fa-times' aria-hidden='true'>請輸入密碼</i>";
					} else if (thePwdObjValLen >= 6) {
						let reg = new RegExp(/[A-Za-z]+[0-9_]/);
						let reg2 = new RegExp(/[0-9_]+[A-Za-z]/);
						if (thePwdObjVal.match(reg)) {
							flag1 = true;
						} else if (thePwdObjVal.match(reg2)) {
							flag1 = true;
						}

						if (flag1) {
							sp.style.color = 'green';
							sp.innerHTML = "<i class='fa fa-check' aria-hidden='true'></i>";
							pws1 = true;
							console.log(pws1)
						} else {
							sp.style.color = 'red';
							sp.innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>密碼格式輸入錯誤，需含英文與數字"
						}
					} else {
						sp.style.color = 'red';
						sp.innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>最少要有六個字元"
					}
					var Pwdspan = $('#Pwdspan').html();
					console.log(Pwdspan)
					if(Pwdspan == "<i class='fa fa-check' aria-hidden='true'></i>"){
						document.getElementById("regist").disabled = false;
					}
				}
			</script>

			<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="validationTooltip04">再次輸入密碼：</label> <input type="password"
						class="form-control" id="passwordcheck2" placeholder="請再次輸入密碼"
						onkeyup="checkPwd2()" required /> <span style='color:red' id="Pwdspan2"></span>
				</div>
				<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->

				<script>
				var pws1 = false;
				var pws2 = false;
					function checkPwd2() {
						let thePwdObj2 = document
								.getElementById("passwordcheck2").value;
						let thePwdObj = document
								.getElementById("passwordcheck").value;
						let sp = document.getElementById("Pwdspan2");
						let flag1 = false;

						if (thePwdObj != thePwdObj2) {
							sp.style.color = 'red';
							sp.innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>密碼不一致！請重新輸入";
							document.getElementById("regist").disabled = true;
						} else if (thePwdObj2 == thePwdObj && thePwdObj2 != "") {
							flag1 = true;
						} else if (thePwdObj2 == thePwdObj && thePwdObj2 == "") {
							sp.style.color = 'red';
							sp.innerHTML = "<i class='fa fa-times' aria-hidden='true'></i>密碼不可為空！請重新輸入";
							document.getElementById("regist").disabled = true;
						}
						if (flag1) {
							sp.style.color = 'green';
							sp.innerHTML = "<i class='fa fa-check' aria-hidden='true'></i>";
							pws2 = true;
							console.log(pws2)
							document.getElementById("regist").disabled = false;
							
						}
					}

					function checkLogin(){
						console.log('111111111111111111111')
						if(pws1==true && pws2==true){
							$('#regist').disabled=false;	
						}
					}
				</script>
				<!--------------------------------------------------------------------------------------------------------------------------------------------------------------->
			</div>
			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label for="validationTooltip04">姓名：</label> <input type="text"
					 id="exampleInputPassword1"	class="form-control" name="name" required />

				</div>
				<div class="col-md-6 mb-3">
					<label for="validationTooltip04">電話：</label> <input type="text"
					 id="exampleInputPassword2"	class="form-control" name="tel" placeholder="0987-654-321" required />

				</div>

			</div>
			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label for="inputState">性別：</label> <select id="inputState"
						name="gender" class="form-control">
						<option value="Male">男</option>
						<option value="Female">女</option>
						<option value="Other">其他</option>
					</select>
				</div>
				<div class="col-md-6 mb-3">
					<label for="inputState">居住地區：</label> <select id="inputState1"
						name="area" class="form-control">
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
					</select>


				</div>
			</div>
			<div class="form-row">
				<div class="col-md-12 mb-3">
					<label for="inputState">自行車偏好：</label> <select id="inputState2"
						name="favor" class="form-control">
						<option value="1">公路車</option>
						<option value="2">登山車</option>
						<option value="3">極限單車</option>
						<option value="4">摺疊車</option>
						<option value="5">淑女車</option>
						<option value="6">單速車</option>
						<option value="7">電動單車</option>
						<option value="8">斜躺車</option>
					</select>
				</div>
			</div>
			<hr>
			<button class="btn btn-outline-success my-2 my-lg-3" id="regist" type="button" disabled="disabled">註冊</button>
			<button class="btn btn-outline-danger my-2 my-lg-3 mx-2" type="reset">清空</button>
			<a class="btn btn-outline-primary my-2 my-sm-0  " href="#">返回</a> <br>
			<button type="button" class="btn btn-primary" id="input"
				onclick="inputInfo()">一鍵註冊</button>
			<button type="button" class="btn btn-primary" id="exist"
				onclick="inputExist()">重複註冊</button>
		</form>

	</div>
	
	
		<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
		<script>
		$(function(){
			$("#regist").click(function(){
				var info = {
					"email":$("#exampleInputEmail1").val(),
					"password":$("#passwordcheck").val(),
					"name":$("#exampleInputPassword1").val(),
					"tel":$("#exampleInputPassword2").val(),
					"gender":$("#inputState").val(),
					"area":$("#inputState1").val(),
					"favor":$("#inputState2").val()
				};
				Swal.fire({
                    title: "請確認資料無誤",
                    text: "若信箱錯誤將無法進行驗證",
                    icon: 'info',
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "確認",
                    cancelButtonText: "取消",

                }).then((result) => {
                    if (result.isConfirmed) {
				
				
				$.ajax({
					type:"post",
					url:"basicRegister.controller",
					dataType:"json",
					data:info,
					success:function(data){
						if(data.registSuccess){
						//跳轉驗證
							Swal.fire({
                                          	title:'已寄出驗證信',
                                            text: '導向驗證頁...',
                                            icon: 'success',
                                            timer: 2000,
                                            showConfirmButton: false,
                                        })

                                        .then(() => {
                                        	$(window).attr('location','checkEmailPage');
                                        })
								
								}
								if(data.accountExist){
									$("#emailExist").html("<i class='fa fa-times' aria-hidden='true'>"+data.accountExist+"</i>");
								}
							
							}
						});
                	}
                });	
			});
			
			

		})
	</script>
</body>

</html>