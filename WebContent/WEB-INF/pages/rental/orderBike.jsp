<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="shortcut icon" href="images/carplus.ico" type="image/ico" />
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1.0, user-scalable=0">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/Rentslick.css" />
<link rel="stylesheet" href="intl-tel-input/css/intlTelInput.css">
<link rel="stylesheet" href="css/orderBike.css" />
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>



<style>


.info_showbox {
    width: 300px;
    position: absolute;
    right:150px;

}

.display_none {
	display: none;
}

.display_flex {
	display: flex;
}
.rent_main .info_showbox {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    border-radius: 8px;
    background: #f3f3f4;
    padding: 10px 20px;
}

.navbar {
    position: absolute;
    height:70px;
}
#main-nav #main-nav img{
	padding-top:18px;
}

.navbar-brand{
 margin-top:5px;
}

</style>




<title>追風者｜自行車租賃系統</title>


</head>



<body>

<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div class="max-wid" style="padding:80px;margin-top:40px" >


		<section class="rent_main" id="status1">

			<form id="orderForm" action="comfirmOrder" name="orderForm"
                class="reserve_wrap" method="post">
                
				<div class="double_btn"
					style="margin-top: 50px; flex-wrap: wrap-reverse;">
					<div class="allbtn_5 reg_btn" id="back_btn"
						onclick="history.back();">返回 重選預約車型</div>
					<input type="button" class="btn_disable reg_btn" id="orderSubmit"
						value="下一步 確認訂單並付款" />
				</div>

				<div class="info_inputbox">
					<div class="red_box red_font" style="margin-bottom: 20px;">
						<p>1. 為保證您的權益，會在領車時核對承租人資料，因此請正確地輸入資料。</p>
						<p>2. 網路預約需先支付一半金額的訂金，如欲取消預約，請於取車日前三天完成取消，否則恕無法退回訂金。</p>
					</div>
			
					
					

					<div class="info_input_title" style="margin: 10px auto 0 auto;">
						<div class="flex_acenter">
							<img src="img/ic_form.svg" width="40px" />
							<div class="show_h1" style="width: 120px; margin: auto;">承租人資訊</div>
							<input type="checkbox" id="memberData">
							<label>&nbsp同會員資料</label>
						</div>
						<div class="h_line"
							style="width: calc(100% - 160px); margin-bottom: 0;"></div>
					</div>
					<div class="input_title" style="margin-top: 15px;">
						承租人姓名<label style="color: #d71e58;">*</label>
					</div>
					<input value="" type="text" class="input_tool"
						name="mbName" id="mbName" placeholder="請輸入姓名">
		

					<div class="error_text" id="name_er"></div>
					<div class="input_fix_wrap" id="form01">
						<div class="input_title">
							性別<label style="color: #d71e58;">*</label>
						</div>
						<select class="input_tool" id="gender" name="mbGender">
							<option value="" selected disabled>請選擇性別</option>
							<option value="Male">男</option>
							<option value="Female">女</option>
							<option value="Other">其他</option>
						</select>
						<div class="error_text" id="gender_er"></div>
					</div>
					<div class="input_fix_wrap" id="form02">
						<div class="input_title">
							身份證字號<label style="color: #d71e58;">*</label>
						</div>
						<input type="text" class="input_tool" name="idnum"
							id="idnum" placeholder="請輸入身份證字號"  />
						<div class="error_text" id="idnum_er"></div>
					</div>
				
					
					<div class="input_fix_wrap">
						<div class="input_title">
							聯絡電話<label style="color: #d71e58;">*</label>
						</div>
						<input value="" type="tel" class="input_tool"
							name="mbTel" id="mbTel" placeholder="請輸入聯絡電話"
							 />
						<div class="error_text" id="phone_er"></div>
					</div>

					<div class="input_fix_wrap">
						<div class="input_title"
							style="display: flex; justify-content: space-between;">
							<div>
								Email<label style="color: #d71e58;">*</label>
							</div>
						</div>
						<input value="" type="email" class="input_tool"
							name="mbMail" id="mbMail" placeholder="請輸入Email"
							onblur="email_check();" />
						<div class="error_text" id="email_er"></div>
                    </div>
                    
                    <div class="input_fix_wrap" style="width: 100%;">
						<div class="input_title"
							style="display: flex; justify-content: space-between; margin-top: 15px">
							<div>
								使用優惠劵
							</div>
							
						</div>
						<select class="input_tool" id="coupon" name="coupon">
							<option value="0">請選擇優惠劵</option>
							
						</select>
					</div>




					<div id="form08">
						<div class="input_title" style="margin-top: 15px;">備註事項</div>
						<textarea class="input_tool" style="border: solid 1px #d7d7d7;"
							name="rent_note" id="rent_note" rows="10" cols="120"></textarea>
					</div>


					
				<input type="hidden" id="hideName" value="${member.name}">
				<input type="hidden" id="hideGender" value="${member.gender}">
				<input type="hidden" id="hideTel" value="${member.tel}">
				<input type="hidden" id="hideMail" value="${member.email}">

				
					
					
				</div>
				<div class="info_showbox">
					<div class="show_h1">租車資訊</div>
					<div class="h_line"></div>
					<div class="info_show_li">
						<div class="show_title">取車門市</div>
						<div class="show_text">${bgStore.st_name}</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">還車門市</div>
						<div class="show_text">${edStore.st_name}</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">取車日期</div>
						<div id="rentalDate"
							class="show_text">${bgDate}</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">取車時間</div>
						<div id="rentalTime"
							class="show_text">${selectBgTime}</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">還車日期</div>
						<div id="returnDate"
							class="show_text">${edDate}</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">還車時間</div>
						<div id="returnTime"
							class="show_text">${selectEdTime}</div>
					</div>
					
					<c:choose>
					<c:when test="${totalDate  != 0 }">
					<div class="info_show_li">
						<div class="show_title">租用天數</div>
						<div class="show_text">${totalDate}天</div>
					</div>
					</c:when>
					<c:otherwise>
					<div class="info_show_li">
						<div class="show_title">租用時數</div>
						<div class="show_text">${totalTime}小時</div>
					</div>
					</c:otherwise>
					</c:choose>
					
					
					<div class="show_h1">租車費用</div>
					<div class="h_line"></div>
					<div class="info_show_li">
						<div class="show_title">租車費用</div>
						<div id="price" class="show_text">$${totalPrice}元</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">促銷優惠</div>
						<div id="disPrice" class="show_text">$0元</div>
					</div>
					<div class="info_show_li">
						<div class="show_title">本次優惠劵金額</div>
						<div id="coupon_price" class="show_text">$0元</div>
					</div>
					<div style="display:none;" id="couponEnd">0</div>
					<div class="h_line" style="margin-top: 20px;"></div>
					<div class="info_show_li">
						<div class="show_h2" style="margin-top: 0; width: auto;">應付金額</div>
						<div id="totalPrice" class="show_text" style="font-size: large;">$${totalPrice}元</div>
						<input
							type="hidden" name="old_totalPrice" id="old_totalPrice" value="5000" />
						<input type="hidden" name="oldPrice" id="oldPrice" value="0" /> 
						<input type="hidden" name="oldTotalPrice" id="oldTotalPrice" value="0" />
						<input type="hidden" name="couponPrice" id="couponPrice" value="0" />
						<input type="hidden" name="couponName" id="couponName" value="0" />
					</div>
				</div>
				
						<input type="hidden" name="bgStoreId" value="${bgStore.store_id}">
						<input type="hidden" name="edStoreId" value="${edStore.store_id}">
						<input type="hidden" name="bgDate" value="${bgDate}">
						<input type="hidden" name="edDate" value="${edDate}">
						<input type="hidden" name="selectBgTime" value="${selectBgTime}">
						<input type="hidden" name="selectEdTime" value="${selectEdTime}">
						<input type="hidden" name="totalDate" value="${totalDate}">
						<input type="hidden" name="totalTime" value="${totalTime}">
						<input type="hidden" name="totalPrice" value="${totalPrice}">	

			    </form>
	




                </div>
            </section>           
        </div>       

     <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>  
              
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="ajax/ajaxQuery.js"></script>
	<script src="/ajax/car_plus-34d01c705e407ef9e73d0d878121470d.js"></script>
	<script src="ajax/jquery.blockUI.js"></script>
	<script src="/js/rental-67643357f3dfd75faa113f19e037ce3b.js"></script>

	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script src="intl-tel-input/js/intlTelInput.js"></script>


	
<!--同會員資料 -->
        <script>

        $("#memberData").change(function() {
            if(this.checked) {
                var name = $("#hideName").val();
                var gender = $("#hideGender").val();
                var tel = $("#hideTel").val();
                var email = $("#hideMail").val();
                
               $("#mbName").val(name);
               $("#idnum").val("A123456789");
               $("#gender").val(gender);
               $("#mbTel").val(tel);
               $("#mbMail").val(email);               
            }else if(!$(this).is(':checked')){
            	 $("#mbName").val("");
                 $("#idnum").val("");
                 $("#gender").val("");
                 $("#mbTel").val("");
                 $("#mbMail").val("");    
            }
        });

</script>
<script>
$(function(){
		$("#orderSubmit").removeClass("btn_disable");
		$("#orderSubmit").addClass("allbtn_4");
})
</script>
<script>
$("#orderSubmit").click(function(){
	 var mbName = $("#mbName").val();
     var mbGender = $("#gender").val();
     var mbIdnum = $("#idnum").val();
     var mbTel = $("#mbTel").val();
     var mbMail = $("#mbMail").val();

     if(mbName==""){
    	 Swal.fire("請輸入姓名");
		 checkSubmit = false;
     }else if(mbGender==""){
    	 Swal.fire("請選擇性別");
		 checkSubmit == false;
     }else if(mbIdnum=""){
    	 Swal.fire("請輸入身分證字號");
		 checkSubmit == false;
     }else if(mbTel=""){
    	 Swal.fire("請輸入電話");
		 checkSubmit == false;
     }else if(mbMail==""){
    	 Swal.fire("請輸入信箱");
		 checkSubmit == false;
     }else{
         
    	 Swal.fire({
    		  title: '即將前往付款畫面',
    		  text: "確認繼續嗎?",
    		  icon: 'warning',
    		  showCancelButton: true,
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: '前往付款',
    		  cancelButtonText: '取消'
    		}).then((result) => {
    			if (result.isConfirmed) {
    			    $("#orderForm").submit();
    			}
    	})
 		
     }
	
})
</script>

</body>

</html>