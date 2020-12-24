<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" href="img/favicon.png">
<title>EEIT124Team1</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="css/black-dashboard.css" rel="stylesheet" />
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
<!-- 	crossorigin="anonymous"> -->


</head>

<body class="white-content">
	<div class="wrapper">
		<div class="sidebar" data="blue">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="javascript:void(0)" class="simple-text logo-mini"> III
					</a> <a href="javascript:void(0)" class="simple-text logo-normal">
						EEIT124Team1 </a>
				</div>
				<ul class="nav">
					<li><a href="./dashboard.html"> <i
							class="tim-icons icon-chart-pie-36"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="./member.html"> <i
							class="tim-icons icon-single-02"></i>
							<p>會員</p>
					</a></li>
					<li><a href="./rental.html "> <i
							class="tim-icons icon-cart "></i>
							<p>租車</p>
					</a></li>
					<!-- active放在自己的表格裡 -->
					<li class="active"><a href="./event.html"> <i
							class="tim-icons icon-calendar-60"></i>
							<p>活動</p>
					</a></li>
					<li><a href="./bike.html"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-bicycle" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                              </svg></i>
							<p class="p-1">自行車</p>
					</a></li>
					<li><a href="./homestay.html"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-house-fill" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                <path fill-rule="evenodd"
										d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                              </svg></i>
							<p class="p-1">住宿</p>
					</a></li>
					<li><a href="./setting.html"> <i
							class="tim-icons icon-settings-gear-63"></i>
							<p>設定</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle d-inline">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse" id="navigation">
					</div>
				</div>
			</nav>
			<div class="modal modal-search fade" id="searchModal" tabindex="-1"
				role="dialog" aria-labelledby="searchModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<input type="text" class="form-control" id="inlineFormInputGroup"
								placeholder="SEARCH">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<i class="tim-icons icon-simple-remove"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- End Navbar -->

			<div class="content">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" >
					<!-- TABLE名稱 -->
					<h1 class="h2">${store.st_name}-庫存管理</h1>

				</div>
				<div class="row">
				
<!-- 		========表單開始始始始始===== -->

						<form class="needs-validation w-75 m-auto"  action="insertBikeStock" method="post"
						   	  onsubmit="return confirm('確定要新增嗎？')">
						<div class="form-row">
						<input type="hidden" name="storeId" value="<c:out value="${store.store_id}"/>">
							
							<div class="col-md-3 mb-3">
								<label for="validationTooltip04">單車種類</label> 
									<select id="rbType" class="form-control" name="rbType">
									<option value=null>--請選擇單車種類--</option>
										${bikeTypeSelect}
									</select>
							</div>											
				
							<div class="col-md-3 mb-3">
								<label for="validationTooltip04">單車型號</label>
									 <select id="rbId" class="form-control" name="rbId">
								</select>
							</div>		
							
							<div class="col-md-3 mb-3">
								<label for="validationTooltip04">尺寸</label>
								 	<select id="rbSize" class="form-control" name="rbSize">
								</select>
							</div>											
						
							<div class="col-md-3 mb-3">
								<label for="validationTooltip05">庫存</label>
								 <input type="number" class="form-control" name="stock" required />
							</div>
						</div>
						
				<hr>
				<button class="btn btn-outline-success my-2 my-lg-3" type="submit">送出</button>
						<button class="btn btn-outline-danger my-2 my-lg-3 mx-2"
							type="reset">清空</button>
						<a class="btn btn-outline-primary my-2 my-sm-0  " href="#">返回</a>
						<br>
			</form>
<!-- 		========表單結束束束束===== -->

			</div>

		</div>
	</div>
	</div>
	</div>

	<!--   Core JS Files   -->
	<script src="js/core/jquery.min.js"></script>
	<script src="js/core/popper.min.js"></script>
	<script src="js/core/bootstrap.min.js"></script>
	<script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Chart JS -->
	<script src="js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="js/black-dashboard.min.js?v=1.0.0"></script>	
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
	
	
	<script>

	//動態選單種類->型號
	function bikeSelect(sList){
		var listObj =
		'<option value='+sList.simRbId+'>'+sList.rbName+'</option>\n\t\t';
		return listObj;
	};

	

	$("#rbType").on("change",function(){
		var typeId = $("#rbType").val();
		$.ajax({
			url:'rentalbikeByType.json',
		 	type: 'get',
		 	data: {typeId:typeId},
		 	dataType: 'json',
		 	success:function(res){
		 		var listObj = res.sList;
		 		console.log("???");
		 		$("#rbId").empty();
		 		$("#rbId").append("<option value=null>--請選擇單車型號--</option>");
		 		$.each(listObj,function(i,sList){
		 		$("#rbId").append(bikeSelect(sList));
			});
		}
			
	  });
	
	})
	
	//動態選單型號->尺寸
	function sizeSelect(rbList){
		var listObj =
		'<option value='+rbList.rbId+'>'+rbList.rbSize.rbSize+'</option>\n\t\t';
		return listObj;
	};
	
	
	$("#rbId").on("change",function(){
		var rbId = $("#rbId").val();
		$.ajax({
			url:'sizeByRb.json',
		 	type: 'get',
		 	data: {rbId:rbId},
		 	dataType: 'json',
		 	success:function(res){
		 		var listObj = res.rbList;
		 		$("#rbSize").empty();
		 		$("#rbSize").append("<option value=null>--請選擇單車尺寸--</option>");
		 		$.each(listObj,function(i,rbList){
		 		$("#rbSize").append(sizeSelect(rbList));
			});
		}
			
	  });
	
	})
			
	</script>
</body>

</html>