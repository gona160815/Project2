<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->


<style>
/* 	.container{ */
/* 		width:200px; */
/* 		height:200px; */

/*         position:absolute; */
/*         left: 50%; */
/*         top:50%; */

/* 		margin-left:-100px; */
/* 		margin-top:-100px; */

/* 	} */
.body {
	padding: 100px;
	border: 5px green solid;
	font-family:cursive;
	font-size:20px;
	font-weight:bolder;
}

.butttt {
	margin: 16px;
}

.choosebt {
	width: 100px;
	height: 50px;
	border-radius:10px;
}

.formoutsideline{
	background-color:white;
	display:inline-block;
/*     background-color:#eee; */
    box-shadow:0px 0px 9px green;
    border-radius:10px;
    padding:50px;
}

.formoutsideline:hover{
	box-shadow:0px 0px 15px red;
	padding:5px;
}


</style>


</head>
<body style="background-color:rgb(231, 230, 230);">
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
	
	
	
	
	

	<div class="container-fluid body">
		<div class="row">
			<div class="col-8 formoutsideline">
				客房：
				<dow class="row justify-content-around  butttt">
				<div class="col-4">
					<label>姓氏：</label> <input type="text" class="form-control"
						placeholder="Username" />
				</div>
				<div class="col-4">
					<label>名字：</label> <input type="text" class="form-control"
						placeholder="Username" />
				</div>
				</dow>
				<dow class="row justify-content-around  butttt">
				<div class="col-4">
					<label>行動電話號碼：</label> <input type="text" class="form-control"
						placeholder="Phone" />
				</div>
				<div class="col-4">
					
				</div>
				</dow>
			</div>
			<div class="col-4 formoutsideline">
			飯店圖片
				<c:choose>
								
								<c:when test="${chg.picturel != null }">
									<img src="${chg.picturel }" class="card-img-top" width="200" height="270" 
										alt="飯店照片" data-target="image-preview">
								</c:when>
								<c:otherwise>
									<img src="/hotelImage/795462.png" class="card-img-top" width="200" height="270" 
										alt="飯店照片" data-target="image-preview">
								</c:otherwise>
								</c:choose>
				
			</div>
		</div>
		<div class="row">
			<div class="col-8 formoutsideline">
				信用卡資料：
				<div class=" row justify-content-around butttt">
					<div class="col-6 ">

						<img
							src="https://a.travel-assets.com/dms-svg/payments/cards-cc_master_card.svg">

						<img
							src="https://a.travel-assets.com/dms-svg/payments/cards-cc_american_express.svg">

						<img
							src="https://a.travel-assets.com/dms-svg/payments/cards-cc_china_union_pay.svg">

						<img
							src="https://a.travel-assets.com/dms-svg/payments/cards-cc_diners_club.svg">

						<img
							src="https://a.travel-assets.com/dms-svg/payments/cards-cc_jcb.svg">

						<img
							src="https://a.travel-assets.com/dms-svg/payments/cards-cc_visa.svg">

					</div>
					<div class="col-2"></div>
				</div>

				<div class="row justify-content-around  butttt">
					<div class="col-6">
						<label>持卡人姓名：</label> <input type="text" class="form-control"
							placeholder="" />
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row justify-content-around  butttt">
					<div class="col-4">
						<label>金融卡/信用卡號碼*：</label> <input type="text" class="form-control"
							placeholder="" />
					</div>
					<div class="col-4"></div>
				</div>
				<div class="row justify-content-around  butttt">
					<div class="col-6">
						<select class="choosebt" name="item">
							<option value="1">a</option>
							<option value="2">b</option>
							<option value="3">c</option>
						</select> <select class="choosebt" name="item">
							<option value="1">a</option>
							<option value="2">b</option>
							<option value="3">c</option>

						</select>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row justify-content-around  butttt">
				<div class="col-3">
					<label>安全碼：</label> <input type="text" class="form-control"
							placeholder="" />
				</div>
				<div class="col-5">
				
				</div>
				</div>

			</div>
			<div class="col-4 formoutsideline">
			飯店詳情：
				<label>飯店名稱</label>
				<p>房型：${houseTypeName }</p>
				<p>飯店評價</p>
				<p>入住日期：${startDate }</p>
				<p>退房日期：${endDate }</p>
				<p>共住           <span style="font-size:50px">${daysize }</span>  晚</p>
			
			</div>
		</div>
		<div class="row">
			<div class="col-8 formoutsideline">
			<div class=" row justify-content-around butttt">
				<div class="col-6">
						<label>電子郵件地址*：</label> <input type="text" class="form-control"
							placeholder="" />
					</div>
					<div class="col-2">
						
					</div>
				
				</div>
				<div class="row justify-content-around  butttt">
					<div class="col-4">
						
						<c:choose>
							<c:when test="${daysize==0 }">
								<a href="sixsix.BookingHouseDetail.controller?homenum=<c:out value="${houseid }"/>"
										class="btn btn-danger">請重新輸入日期區間(不可為0天)</a>
							</c:when>
							<c:when test="${daysize!=0 }">
						<form action="sixsix.HotelCheckingOK.controller" method="post" id="sendOK">
						
							<input type="hidden" name="houseType" value="${houseType }" />
							<input type="hidden" name="daySize" value="${daysize }" />
							<input type="hidden" name="totalMoney" value="${totalMoney }" />
							<input type="hidden" name="memberTotalDays" value="${memberTotalDays }" />
							<input type="hidden" name="houseid" value="${houseid }" />
							
							<button type="button" class="btn btn-info" id="checkOKBooking">確認下訂</button>
						
						</form>
						
						</c:when>
						</c:choose>
					</div>
					
					<div class="col-4">
						
					</div>
				
				</div>
					
					
			</div>
			
			<div class="col-4 formoutsideline">
				<label>價格詳情</label>
				<p>${daysize } 晚    ${totalMoneyNotTax }</p>
				<p>稅金費用：${tax }</p>
				<hr>
				<p>總計: <fmt:formatNumber type="number" value="${totalMoney }" maxFractionDigits="2"/> 元</p>
			</div>
		
		</div>
	</div>

	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
	
	

	<script>
	$(function(){
		$("#checkOKBooking").click(function(){
			
			const swalWithBootstrapButtons = Swal.mixin({
				  customClass: {
				    confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				  },
				  buttonsStyling: false
				})
			
			swalWithBootstrapButtons.fire({
				  title: "確定下訂？",
				  text: "下訂後將無法取消！",
				  imageUrl: "https://mypaper.pchome.com.tw/show/article/rxfj7vljph/A1378224089",
				  showCancelButton: true,
				  confirmButtonColor: "#3cb371",
				  confirmButtonText: "确定！",
				  cancelButtonText: "取消！",
				  closeOnConfirm: false,
				  closeOnCancel: false,
				}).then((result) => {
					if(result.isConfirmed){
						swalWithBootstrapButtons.fire('下訂成功！', '', 'success').then((result1) =>{
							if(result1.isConfirmed){
								$("#sendOK").submit();
							}
						})
					}	else if (result.dismiss === Swal.DismissReason.cancel){
						swalWithBootstrapButtons.fire('取消下訂！", "請再參考看看！', '', 'info','#3cb371')
					}
				})
				
			
		});
	});
	
	
	
	</script>

	

</body>
</html>