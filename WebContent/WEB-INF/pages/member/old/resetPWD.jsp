<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>更改密碼</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->

<style>
body {
	font-family: Microsoft JhengHei;
}
</style>
<script type="text/javascript">
//----------------------檢查密碼-------------------------------------------
function checkPwd() {
	let thePwdObj = document.getElementById("passwordcheck");
	let thePwdObjVal = thePwdObj.value;
	let thePwdObjValLen = thePwdObjVal.length;
	let sp = document.getElementById("Pwdspan");
	let flag1 = false;
	if (thePwdObjVal == "") {
		sp.innerHTML = "請輸入密碼";
		document.getElementById("basicButton").disabled = true;
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
				document.getElementById("basicButton").disabled = true;
		}
	} else {
		sp.innerHTML = "最少要有六個字元"
			document.getElementById("basicButton").disabled = true;
	}
}

//-------------------------檢查密碼是否一致--------------------
function checkPwd2() {
	let thePwdObj2 = document
			.getElementById("passwordcheck2").value;
	let thePwdObj = document
			.getElementById("passwordcheck").value;
	let sp = document.getElementById("Pwdspan2");
	let flag1 = false;

	if (thePwdObj != thePwdObj2) {
		sp.innerHTML = "密碼不一致！請重新輸入";
		document.getElementById("basicButton").disabled = true;
	} else if (thePwdObj2 == thePwdObj) {
		flag1 = true;
	}
	if (flag1) {
		sp.innerHTML = "正確";
		document.getElementById("basicButton").disabled = false;
	}
}

</script>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<body>

	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
		<form:form id="form-1" method="POST"
		modelAttribute="loginOK" enctype="multipart/form-data">
	<table class="table w-75 m-auto">
		<thead>
			<tr>
				<th scope="col"></th>
				<th class="h3" scope="col">變更密碼<p id="msg2"></p></th>
				<th scope="col"></th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class="text-muted text-decoration-none inline-text" href="infoPage"><svg
							width="1.6em" height="1.5em" viewBox="0 0 16 16"
							class="bi bi-gear" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
								d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
                    <path fill-rule="evenodd"
								d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
                  </svg>&nbsp&nbsp一般</a>
				</th>
				<td class=" border-left border-bottom-0 h5 p-3"><label path="password">輸入新密碼</label></td>
				<td><input type="password" class="form-control" name="password" id="passwordcheck" placeholder="密碼需大於六個字，同時包括英文與數字" onblur="checkPwd()" value="" path="password" autofocus /><span
						id="Pwdspan"></span></td>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class="text-muted text-decoration-none inline-text" href="resetPasswordPage"><svg
							width="1.5em" height="1.5em" viewBox="0 0 16 16"
							class="bi bi-lock" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
								d="M11.5 8h-7a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1zm-7-1a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-7zm0-3a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z" />
                  </svg>&nbsp&nbsp更改密碼</a>
				</th>
				<td class=" border-left border-bottom-0 h5 p-3"><label path="password2">確認密碼</label></td>
				<td><input type="text" class="form-control" onblur="checkPwd2()" id="passwordcheck2" placeholder="再次輸入密碼" name="password2" value="" /><span id="Pwdspan2"></span></td>
			</tr>
			
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class="text-muted text-decoration-none inline-text" href=""><svg
							width="1.5em" height="1.5em" viewBox="0 0 16 16"
							class="bi bi-suit-heart" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
								d="M8 6.236l.894-1.789c.222-.443.607-1.08 1.152-1.595C10.582 2.345 11.224 2 12 2c1.676 0 3 1.326 3 2.92 0 1.211-.554 2.066-1.868 3.37-.337.334-.721.695-1.146 1.093C10.878 10.423 9.5 11.717 8 13.447c-1.5-1.73-2.878-3.024-3.986-4.064-.425-.398-.81-.76-1.146-1.093C1.554 6.986 1 6.131 1 4.92 1 3.326 2.324 2 4 2c.776 0 1.418.345 1.954.852.545.515.93 1.152 1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                      </svg>&nbsp&nbsp我的最愛</a>
				</th>
			</tr>
			<tr>
				<th class="border-top border-bottom border-light " scope="row ">
					<a class="text-muted text-decoration-none inline-text" href=""><svg
							width="1.5em" height="1.h-50" viewBox="0 0 16 16"
							class="bi bi-file-text" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
								d="M4 0h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4z" />
                        <path fill-rule="evenodd"
								d="M4.5 10.5A.5.5 0 0 1 5 10h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z" />
                      </svg>&nbsp&nbsp訂單紀錄</a>
				</th>
			</tr>
			<tr>
				<th class="border-top  border-light " scope="row "></th> 
				<td class=" border-left ">
					<form:button class="btn btn-primary my-2 my-lg-3" id="basicButton" type="button">修改</form:button>
				</td>
				<td></td>

			</tr>
		</tbody>
		</table>
		</form:form>
		<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
	</body>

		
	<script>
		$(function(){
//-------------advanced----------------------------------------------
		 	$("#submit").click(function(){	
			 	
				var form = new FormData($('form')[1]);
			
			 		
				$.ajax({
					type:"POST",
					url:"advancedRegister.json",
					dataType:"json",
					/* contentType :"application/json;charset=UTF-8", */
					data:form,
					contentType: false, //required
				    processData: false, // required
					success:function(data){
					console.log(data.aaa);
					$("#msg").text(data.success);
					}
				});
			});  
//----------------basic--------------------------------------------------------------
			var basicInfo = {
				/* "email":$("#email").val(), */
				"name":$("#name").val(),
				"tel":$("#tel").val(),
				/* "gender":$("#gender").val(), */
				"areaId":$("#areaId").val(),
				"favorId":$("#favorId").val()
			}
			
			var str2 = $("#form-1").serialize();
			$("#basicButton").click(function(){
				
			var form1 = new FormData($('form')[0]);
			
				$.ajax({
					type:"POST",
					url:"updateBasicInfo.controller",
					dataType:"json",
					data:form1,
					contentType: false, //required
				    processData: false, // required
					success:function(data){
						/* result = JSON.parse(data); */
						$("#msg2").text(data.success);
					}
				});
			});
		})
	</script>
	</html>