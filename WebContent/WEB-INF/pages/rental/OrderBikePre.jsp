<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<title>追風者｜自行車租賃系統</title>
<meta name="viewpt"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1.0, user-scalable=0" />

<!-- 彈跳視窗 -->
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/cart-ionicons.min.css">
<link rel="stylesheet" href="css/cartStyle.css">
   
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="css/Rentslick.css" />
<link href="datePicker.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" href="css/searchIndex.css" />

<!-- 捷安特 -->
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<link rel="stylesheet" href="css/bikeSearchbase.css" media="all">
<link rel="stylesheet" href="css/bikeSearchstyle.css" media="all">
<link rel="stylesheet" href="css/bikeSearchsys_style.css" media="all">
<link rel="stylesheet" href="css/bikeSearchsys_res.css" media="all">
<link rel="stylesheet" href="css/bikeSearchmagnific-popup.css" media="all">
<script src="moment.js"></script>



<!-- <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet"> -->

<style>
.display_none {
	display: none;
}

.display_flex {
	display: flex;
}

#ui-datepicker-div{
	top:200px !important;
}


body {
    padding-right: 0px !important; 
}
 	
*.modal-open {
	overflow-y: scroll;
	padding-right: 0 !important;
}

header{
	content:none;
	z-index:999;
}

.navbar>.container, .navbar>.container-fluid {
    display: -ms-flexbox;
    display:block;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
}
.navbar{
	height:70px
}

.navbar-brand{
 margin-top:5px;
}

</style>


</head>

<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
    
<div class="container" style="margin:80px 190px 0px 190px;max-width:1000px">
    <form action="orderSearchPre" novalidate="novalidate" id="ReSearch" class="form" method="post" accept-charset="utf-8">
        <div class="serach-box" style="margin:1 auto">
        <p class="c_title" style="text-align: center;"><span>單車租借服務</span></p>
    <br>
    <div class="sel-date-shop dep-box">

        <div class="sel-dep" style="position: relative;padding: 5px;">
          <dl class="model_info_show">
				<dt>取車日期</dt>
				<dd id="datepicker">
					<input name="bgDate" id="CondDep" class="input-group date" type="text" readonly="readonly" />
				</dd>
		</dl>
        </div>
        
        <div class="sel-dep" style="position: relative;padding: 5px;">
            <dl class="model_info_show">
                <dt>租車時間</dt>
                <dd> 
                	<select name="selectBgTime" class="form-app" id="selectBgTime" style="width:100%">
                        <option value="">------請選擇時間------</option>
						<option value="8:00">8:00</option>
						<option value="9:00">9:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
						<option value="19:00">19:00</option>
						<option value="20:00">20:00</option>
                    </select>	
                 </dd>
            </dl>    
        </div>

        <div class="sel-shop" style="position: relative;padding: 5px;">
            <dl class="model_info_show">
                <dt>出發門市</dt>
                <dd>
                    <select name="bgStore" class="form-app" id="CondDepOfficeId">
                       ${storeSelect}
                    </select>				
                </dd>
            </dl>
        </div>
    </div><!-- sel-date-shop -->
    
    <div class="sel-date-shop dep-box" style="float:right;">
        <div class="sel-dep" style="position: relative;padding: 5px;">
             <dl class="model_info_show">
				<dt>還車日期</dt>
				<dd id="datepicker">
						<input name="edDate" id="CondArv"  class="input-group date" type="text" readonly="readonly"/>
						<input type="hidden" name="data[Cond][lang]" value="cnh" id="CondLang"/>	
				</dd>
			</dl>   
        </div>
        
            <div class="sel-dep" style="position: relative;padding: 5px;">
            <dl class="model_info_show">
                <dt>還車時間</dt>
                <dd> 
                	<select name="selectEdTime" class="form-app" id="selectEdTime" style="width:100%">
                        <option value="">------請選擇時間------</option>
						<option value="8:00">8:00</option>
						<option value="9:00">9:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
						<option value="19:00">19:00</option>
						<option value="20:00">20:00</option>
                    </select>	
                 </dd>
            </dl>    
        </div>

        <div class="sel-shop" style="position: relative;padding: 5px;">
            <dl class="model_info_show">
                <dt>歸還門市</dt>
                <dd id="jsArvOffice">	
                    <select name="edStore" class="form-app" id="CondDepOfficeId">
                       ${storeSelect}
                    </select>
                </dd>
            </dl>
        </div>
    </div><!-- sel-date-shop -->
        
    <div class="search-btn"><button type="button" class="allbtn_5 reg_btn" id="reSearchBtn">重新搜尋</button></div>
</div><!-- serach-box -->

</form>

</div>


	<div class="max-wid" style="margin-top:0;">
	
		<section class="rent_main" >
			<div id="model_info_box">
				<div class="model_info_show">
					<div class="show_title min100">取車日期</div>
					<div class="show_text" name="bgDate">${bgDate}</div>
					
				</div>
				<div class="model_info_show">
					<div class="show_title min100">取車時間</div>
					<div class="show_text" name="selectBgTime">${selectBgTime}</div>
				</div>
				<div class="model_info_show">
					<div class="show_title min100">取車門市</div>
					<div class="show_text" >${bgStore.st_name}</div>
					<div name="bgStore" style="display:none">${bgStore}</div>
				</div>
				<div class="model_info_show">
					<div class="show_title min100">還車日期</div>
					<div class="show_text" name="edDate">${edDate}</div>
					<input type="hidden" name="edDateStr" value="${edDate}">
				</div>
				<div class="model_info_show">
					<div class="show_title min100">還車時間</div>
					<div class="show_text" name="selectEdTime">${selectEdTime}</div>
				</div>
				<div class="model_info_show">
					<div class="show_title min100">還車門市</div>
					<div class="show_text">${edStore.st_name}</div>
					<div name="edStore" style="display:none">${edStore}</div>
				</div>
				
				<c:choose>
				<c:when test="${totalDate  != 0 }">
				<div class="model_info_show">
					<div class="show_title min100">租用天數</div>
					<div class="show_text" name="totalDate">${totalDate}天</div>
				</div>
				</c:when>
				<c:otherwise>
				<div class="model_info_show">
					<div class="show_title min100">租用時數</div>
					<div class="show_text" name="totalTime">${totalTime}小時</div>
				</div>
				</c:otherwise>
				</c:choose>
				
			</div>
		</section>

		<section class="rent_main" id="status1">
			<div class="main_title" style="justify-content: flex-start;">
				符合您搜尋的條件車型 </div> 
			<div id="slider_num">
				<span id="cur_slide">1</span> / <span id="totle_slide">1</span> 筆
			</div>
			<div class="scrollbox">
				<div class="cars_boxes">
					<ul class="slider" style="width: 100%;">
					
<!-- ===============================一個腳踏車資料循環的開始===============================-->
      
      <c:forEach var="bikeBean" items="${rentalBike}">
						<li class="rentcar_box car_shadow">
							<div class="c_img A02">
                                <div class="levelA01">
                                    <img
                                        src="/bikeImage/${bikeBean.simBike.rbImg}" class="carimgs" style="padding:25px;background-color: white;"/>
                                </div>
                            </div>

                            <div class="plan-list-dtl" style="padding: 20px 40px 20px 20px;">
                                <div class="plan-list-title">
                                    <p class="ttl"><span class="highlighter">${bikeBean.simBike.rbName}</span><span class="ttl-size icon-${bikeBean.rbSize.rbSize}">${bikeBean.rbSize.rbSize}</span></p>
                                </div>
                                <dl class="plan-list-details">
                                    <dt>車種選擇</dt><dd>${bikeBean.simBike.rbType.typeName}</dd>
                                    <dt>尺寸選擇</dt><dd>${bikeBean.rbSize.rbSize}</dd>
                                    <dt>建議身高</dt><dd>${bikeBean.rbSize.sizeDetail}</dd>
                                </dl>
                            </div>

								<div class="plan-list-prc" style="padding:50px;margin:0px -35px;">
								
								<c:choose>
								<c:when test="${totalDate  != 0 }">
									<p class="prc-apl">
									總計租借${totalDate}天
									</p>
								</c:when>
								<c:otherwise>
									<p class="prc-apl">
									當天借還 (使用時間${totalTime}小時)
									</p>
								</c:otherwise>
								</c:choose>
									
									<p class="plan-price" style="padding:10px">
										<span class="unit">$</span>
										
										<span id="totalMoney">
								<c:choose>
										<c:when test="${totalDate  != 0 && totalDate <=7}">
										<c:out value="${bikeBean.simBike.rbType.dayPrice*totalDate}"/>
										<span class="unit">
										</c:when>
										<c:when test="${totalDate== 0 }">  
										<c:out value="${bikeBean.simBike.rbType.hrPrice*totalTime}"/>
										<span class="unit">
										</c:when>
										<c:when test="${totalDate > 7}">
										<fmt:formatNumber maxFractionDigits="0">
										<c:out  value="${(bikeBean.simBike.rbType.weekPrice*(totalDate/7))+(bikeBean.simBike.rbType.dayPrice*(totalDate%7))}"/>
										</fmt:formatNumber>
										</c:when>
								</c:choose>
										</span></p>
										
										<form id="addCart">
										<input type="hidden" value="${bikeBean.simBike.rbName}"  name="rbName">
										<input type="hidden" value="${bikeBean.simBike.rbType.typeName}"  name="rbType">
										<input type="hidden" value="${bikeBean.rbSize.rbSize}"  name="rbSize">		
										<input type="hidden" value="${bikeBean.rbSize.sizeDetail}"  name="rbSizeDetail">
										<input type="hidden" value="${bikeBean.rbSize.rbSize}"  name="rbSize">
										<input type="hidden" value="${bikeBean.simBike.rbImg}"  name="rbImg">
										<input type="hidden" value="${bikeBean.rbId}"  name="rbId">
										<input type="hidden" value="${bgStore.store_id}" name="storeId">
										<input type="hidden" name="bgDateStr" value="${bgDate}" id="bggDate">
										<input type="hidden" name="edDateStr" value="${edDate}" id="eddDate">
										
										<button  type="button" class="pick_btn allbtn_6" id="addBike" name="addBike"style="padding: 15px;width: 150%;margin:-20px 0">
										加入預約清單
										</button>
										
										</form>
								</div>
                        </li>
      </c:forEach> 
<!-- ===============================一個腳踏車資料循環的結束===============================-->
					</ul>
				</div>
			</div>

			<div class="double_btn" style="flex-wrap: wrap-reverse;">
				<div class="allbtn_5 reg_btn" id="checkCart" data-toggle="modal" data-target="#myModal">查看預約清單</div>
				<input type="button" class="btn_disable reg_btn"
					id="rentalInfoSubmit" onclick="sendOrder()" value="下一步 填寫租車資料" />
			</div>
			
<!-- 			一個隱藏的表單 -->
			<form  action="sendOrder" method="post" id="orderForm">
			<input type="hidden" name="bgStoreId" id="bgStoreId" value="${bgStore.store_id}">
			<input type="hidden" name="edStoreId" value="${edStore.store_id}">
			<input type="hidden" name="bgDate" value="${bgDate}">
			<input type="hidden" name="edDate" value="${edDate}">
			<input type="hidden" name="selectBgTime" value="${selectBgTime}">
			<input type="hidden" name="selectEdTime" value="${selectEdTime}">
			<input type="hidden" name="totalDate" value="${totalDate}">
			<input type="hidden" name="totalTime" value="${totalTime}">
			</form>
<!-- ===============================購物清單的彈跳視窗開始=============================== -->

 <c:forEach  var="anEntry" items="${ShoppingCart.content}">
 	<input type="hidden" id="checkButton" value="${anEntry.value.rbId}"> 
 </c:forEach>

 <!-- 彈跳視窗新版本 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  



<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog" style=" width:100%;max-width:900px" >
			
			<div class="modal-content" style="background-color:white">

    				<div class="cart-list"  style="margin-top:20px;border-radius:20px">
	    				<table class="table" style="font-weight: 900;font-family:Microsoft JhengHei; ">
						    <thead class="thead-primary">
						      <tr class="text-center" style="font-size:15px; ">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>商品名稱</th>
						        <th>尺寸</th>
						        <th>數量</th>
						        <th style="padding-right:50px">金額</th>
						      </tr>
						    </thead>
						    <tbody id="cartList">
						      
<!-- ===================== 商品輪迴開始(Ajax)================================= -->
<%-- 						     <c:forEach  var="anEntry" items="${ShoppingCart.content}"> --%>
<!-- 						      <tr class="text-center"> -->
						      
<!-- 						        <td class="product-remove"><a href="#"><span>x</span></a></td> -->
						        
<!-- 						        <td class="image-prod" > <img src=" https://giant-store-rental.jp/img/front/car_type_img/d53d30a9f7bacc251bcdf8ccdb7e65cd171124162420.jpg" class="carimgs" style="height:auto"/></td> -->
						       
<!-- 						        <td class="product-name"> -->
<%-- 						        	<h3>${anEntry.value.rbId}</h3> --%>
<!-- 						        	<p>腳踏車名字</p> -->
<!-- 						        </td> -->
						        
<!-- 						        <td class="price" style="width:10%;max-width:5px">尺寸</td>	 -->
						        
<!-- 						        <td class="quantity"> -->
<!-- 						        	<div class="input-group mb-3" style="margin: 0 auto"> -->
<!-- 					             	<input type="number" name="quantity" class="quantity form-control input-number" value="1" readonly> -->
<!-- 					          	</div>				         -->
						    
<!-- 						        <td class="total" style="padding-right:50px">$4.90</td> -->
						        
						        
<!-- 					          </td>         -->
						        
<!-- 						      </tr> -->
<%-- 						</c:forEach> --%>
<!-- ===================== 商品輪迴結束(Ajax)================================= -->		
						     
							
							</tbody>
						  </table>
						  
						  <hr>
						  <span id="totalPrice" name="totalPrice" style="font-size:30px;padding:5px;padding-right:25px;float:right;font-weight:bold"></span>
						 
					
		</div>
	</div><!-- /.modal -->
	
</div>
</div>
<!-- ===============================購物清單的彈跳視窗結束=============================== -->
    
    
</body>

	<script src="js/hotel/jquery-3.3.1.min.js"></script>
	<script src="js/rental/ajaxQuery.js"></script>
	<script src="js/rental/blockUI.js"></script>
	<script src="js/core/popper.min.js"></script>
		
	 <!-- 彈跳視窗舊版本(拔掉上面會掛掉呵呵呵呵) -->
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
	<script type="text/javascript" src="js/rental/moment.js"></script>
	<script type="text/javascript" src="js/rental/slick.min.js"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script type="text/javascript" src="js/rental/jquery-ui.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	

	
	<script type="text/javascript">	
	
//<![CDATA[
$(function() {
	var now = new Date();
	var target_date = new Date();
	if(now.getHours() < 15){
		add_day = 2;
	} else {
		add_day = 3;
	}
	target_date.setDate(now.getDate() + add_day);
	var Ymd = target_date.getFullYear() + '-' + ("0"+(target_date.getMonth() + 1)).slice(-2) + '-' + ("0"+target_date.getDate()).slice(-2);
		$("#CondDep, #CondArv").val(Ymd);
		$('#CondDep').datepicker({
		dateFormat: 'yy-mm-dd',
		minDate: add_day + 'd',
		onSelect: function(dateText, inst) {
			sd = $(this).val();
			var sdDate = moment($(this).val());
			var edDate = $('#CondArv').val();
			if(sdDate.isAfter(edDate) == true) {
				$('#CondArv').val(sd);
				$('#CondArv').datepicker('setDate', sd);
			}
		},
		beforeShow: function(input, inst) { 
			setTimeout(function() {
			inst.dpDiv.css({
			'top' : '128.583px'
			});
			}, 10) // 10msec
		}
	});
	$('#CondArv').datepicker({
		dateFormat: 'yy-mm-dd',
		minDate: add_day + 'd',
		onSelect: function(dateText, inst) {
			ed = $(this).val();
			var edDate = moment($(this).val());
			var sdDate = $('#CondDep').val();
			if(edDate.isAfter(sdDate) == false) {
				$('#CondDep').val(ed);
				$('#CondDep').datepicker('setDate', ed);
			}
		},
		beforeShow: function(input, inst) { 
			setTimeout(function() {
				inst.dpDiv.css({
					'top' : '289.983px'
				});
			}, 10) // 10msec
		}
	});
	$.datepicker.setDefaults( $.datepicker.regional[ "cnh" ] );
});

//]]>
</script>

<script type="text/javascript">
//<![CDATA[
$(function() {
	FncChangeArvOffice('first_view');
	$('#CondDepOfficeId').change(function() {
		FncChangeArvOffice();
	});
	function FncChangeArvOffice(chk_timing) {
		if(chk_timing) {
			url_addr = "/tops/js_list_arv_office/first_view/";
		} else {
			url_addr = "/tops/js_list_arv_office/";
		}
		$.ajax({
			async:true,
			data:$("#CondDepOfficeId").closest("form").serialize(),
			dataType:"html",
			success:function (data, textStatus) {$("#jsArvOffice").html(data);},
			type:"post",
			url: url_addr
		});
		return false;
	}
});

//]]>
</script>

<!-- 按下按鈕新增到購物清單 -->
<script>

$(function(){

	if ($("#checkButton").length > 0) {
		$("#rentalInfoSubmit").removeClass("btn_disable");
		 $("#rentalInfoSubmit").addClass("allbtn_4");
	}
	
})


$('button[name=addBike]').on("click",function(){
	var totalMoneyStr = $(this).parent().prev().text(); //價錢
	var totalMoney = totalMoneyStr.replace(/[^0-9]/ig,""); // 價錢 把那串字串只取得數字
	var rbSize =  $(this).prev().val();
	var rbName =  $(this).prevAll("input[name=rbName]").val();
	var rbType =  $(this).prevAll("input[name=rbType]").val();
	var sizeDetail = $(this).prevAll("input[name=rbSizeDetail]").val();
	var rbSize = $(this).prevAll("input[name=rbSize]").val();
	var rbId = $(this).prevAll("input[name=rbId]").val();
	var rbImg = $(this).prevAll("input[name=rbImg]").val();
	var storeId = $(this).prevAll("input[name=storeId]").val();
	var bgDate =  $(this).prevAll("input[name=bgDateStr]").val();
	var edDate =  $(this).prevAll("input[name=edDateStr]").val();
	var rbStockInt = 0;
//------------------------------------
	$.ajax({
 		url:'selectStock',
 		type:'post',
 		async:false,
 		data:{rbId:rbId,
 			  storeId:storeId,
 			  bgDate:bgDate,
 			  edDate:edDate 			  
	 		},
 		dataType: 'json',
 		success:function(res){
 			rbStockInt = res.rbStockInt;
 	  }	
  });
//-------------------------------------	
	
	Swal.fire({ 
		  title: "加入預約清單嗎？",
		  html: "<div style='margin:0 auto;text-align: center;font-weight:bold;font-family:Microsoft JhengHei;'>"+
		  		"<br>單車名稱："+rbName+"<br><hr>"+
		  		"單車類別："+rbType+"<br><hr>"+
		  		"單車尺寸："+rbSize+"<br><hr>"+
		  		"尺寸說明："+sizeDetail+"<br><hr>"+
		  		"總金額："+totalMoney+"<br><hr>"+
		  		"剩餘庫存：<span style='color:red'>&nbsp"+rbStockInt+"</span><br><br>"+
		  		"預約數量：",
		  input:"number",
		  inputAttributes:{
		       min:1,
		       max:rbStockInt },
		  inputValidator: (value) => {
		        if (value > rbStockInt) {
		         return '不可以超過剩餘庫存'
		    }else if(value < 1 || value % 1 != 0){
		    	return '請輸入正整數'
		    } },  
		  
		  confirmButtonText: "加入清單",
		  confirmButtonColor:"#DD6B55",
		  showCancelButton: true, 
		  cancelButtonText: "取消"		  
		}).then((result)=>{
			if(result.isConfirmed){
			var count = result.value; //獲得使用者輸入的數量
// ajax--------------
			 	$.ajax({
		 		url:'addToCart',
		 		type:'post',
		 		data:{rbId:rbId,
			 		  count:count,
			 		  totalMoney:totalMoney,
			 		  rbName:rbName,
			 		  rbType:rbType,
			 		  rbSize:rbSize,
			 		  rbImg:rbImg
			 		},
		 		dataType: 'text',
		 		success:function(res){
		 			console.log("增加成功");
		 	  }	
		  })
// ajax----------------
		  Swal.fire(
			      '成功！',
			      '已成功加入預約清單',
			      'success'
    		)
    		
    		 $("#rentalInfoSubmit").removeClass("btn_disable");
			 $("#rentalInfoSubmit").addClass("allbtn_4");
    	}
	});

	
})

</script>

<!-- ==========================查看預約清單========================== -->
<script>

function checkCart(cartList){
	var cartList = 
	'<tr class="text-center">'+
	'<td class="product-remove"><a style="text-decoration:none" name="id" >'+
	'<span>x</span></a>'+
	'<input type="hidden" id="id"name="rbId" value="'+cartList.rbId+'">'+
	'</td>'+
	'<td class="image-prod" > <img src="/bikeImage/'+cartList.rbImg+'" class="carimgs" style="height:auto"/></td>'+
	'<td class="product-name">'+
	'<h3>'+cartList.rbName+'</h3>'+
	'<p>'+cartList.rbType+'</p></td>'+
	'<td class="price" style="width:10%;max-width:5px">'+cartList.rbSize+'</td>	'+
	'<td class="quantity">'+
	'<div class="input-group mb-3" style="margin: 0 auto">'+
	'<input type="number" name="quantity" class="quantity form-control input-number" value="'+cartList.count+'">'+
	'<input type="hidden" name="rbId2" value="'+cartList.rbId+'">'+
	'</div><td class="total" style="padding-right:50px">$'+cartList.money*cartList.count+'</td></td></tr>'
	return cartList;
}
	$('#checkCart').on("click",function(){
	$.ajax({
		url:'checkCart',
		type:'post',
		async:true,
		data:{},
		dataType: 'json',
		success:function(res){
			var cart = res.cart;
			$("#cartList").empty();
			$.each(cart,function(i,cart){
			$("#cartList").append(checkCart(cart));	
		});
	}	
		
  });
	  
	<!-- ==========================每次開啟就先計算購物車總金額========================== -->	  
	$.ajax({
		url:'totalPrice',
		type:'post',
		data:{},
		dataType:'text',
		success:function(res){
			var totalPrice = parseInt(res);
			if(totalPrice != 0){
			$('#totalPrice').empty();
			$('#totalPrice').append("總金額：$"+res);
		}if(totalPrice == 0){
			$('#totalPrice').empty();
			$('#totalPrice').append("總金額：$0");
			$("#rentalInfoSubmit").removeClass("allbtn_4");
			$("#rentalInfoSubmit").addClass("btn_disable");
		}		
		}
	})

});
</script>
<!-- ==========================刪除此筆資料========================== -->
<script>
$(document).on('click','a[name=id]', function(){
	var rbId = $(this).next().val();

	Swal.fire({
		  title: '確定要移除嗎?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確定',
		  cancelButtonText: '取消',
		}).then((result) => {
		  if (result.isConfirmed) {

			$.ajax({
				url:'deleteFromCart',
				type:'post',
				async:true,
				data:{rbId:rbId},
				dataType:'text',
				success:function(res){
			//-----------------------------------------------------
					$.ajax({
						url:'checkCart',
						type:'post',
						async:true,
						data:{},
						dataType: 'json',
						success:function(res){
						var cart = res.cart;
						$("#cartList").empty();
						$.each(cart,function(i,cart){
						$("#cartList").append(checkCart(cart));	
						})
	//-----------------------------------------------------------------------------------
							 $.ajax({
		   						url:'totalPrice',
								type:'post',
								data:{},
								dataType:'text',
								success:function(res){
								var totalPrice = parseInt(res);
								if(totalPrice != 0){
								$('#totalPrice').empty();
								$('#totalPrice').append("總金額：$"+res);
								}if(totalPrice == 0){
								$('#totalPrice').empty();
								$('#totalPrice').append("總金額：$0");
								$("#rentalInfoSubmit").removeClass("allbtn_4");
								$("#rentalInfoSubmit").addClass("btn_disable");
							}		
						}
					
	//----------------------------------------------------------------------------------
							
					});
				}	
							
			});
   	//----------------------------------------------------------------------------------
				}
			})

		    Swal.fire(
		      '已移除'
		    )
		  }
		})	
});

</script>
<!-- ======================================更新數量=========================================== -->
<script>
$(document).on('click','input[name=quantity]', function(){
	var selectCount = $(this).val();
	var rbId = $(this).next().val();
	var storeId = $("#bgStoreId").val();
	var bgDate =  $("#bggDate").val();
	var edDate =  $("#eddDate").val();
	
	var rbStockInt = 0;
//------------------------------------
//搜索庫存
	$.ajax({
 		url:'selectStock',
 		type:'post',
 		async:false,
 		data:{rbId:rbId,
 			  storeId:storeId,
 			  bgDate:bgDate,
 			  edDate:edDate 			  
	 		},
 		dataType: 'json',
 		success:function(res){
 			rbStockInt = res.rbStockInt;
 	  }	
  });
//-------------------------------------	

	Swal.fire({ 
		  title: "更改數量",
		  html: "<div style='margin:0 auto;text-align: center;font-weight:bold;font-family:Microsoft JhengHei;'>"+
		  		"剩餘庫存：<span style='color:red'>&nbsp"+rbStockInt+"</span><br><br>"+
		  		"原先預約數量："+selectCount,
		  input:"number",
		  inputAttributes:{
		       min:1,
		       max:rbStockInt},
		  inputValidator: (value) => {
		        if (value > rbStockInt) {
		         return '不可以超過剩餘庫存'
		    }else if(value < 1 || value % 1 != 0){
		    	return '請輸入正整數'
		    }},  
		  
		  confirmButtonText: "確認",
		  confirmButtonColor:"#DD6B55",
		  showCancelButton: true, 
		  cancelButtonText: "取消"		  
		}).then((result)=>{
			if(result.isConfirmed){
			var count = result.value; //獲得使用者輸入的數量
//ajax--------------
			 	$.ajax({
		 		url:'modifyCartCart',
		 		type:'post',
		 		data:{rbId:rbId,
			 		  count:count,
			 		},
		 		dataType: 'text',
		 		success:function(res){
	//-----------------------------------------------------
					$.ajax({ 
						url:'checkCart',
						type:'post',
						async:true,
						data:{},
						dataType: 'json',
						success:function(res){
						var cart = res.cart;
						$("#cartList").empty();
						$.each(cart,function(i,cart){
						$("#cartList").append(checkCart(cart));	
						});
	//-----------------------------------------------------------------------------------
							 $.ajax({
		   						url:'totalPrice',
								type:'post',
								data:{},
								dataType:'text',
								success:function(res){
								var totalPrice = parseInt(res);
								if(totalPrice != 0){
								$('#totalPrice').empty();
								$('#totalPrice').append("總金額：$"+res);
								}if(totalPrice == 0){
								$('#totalPrice').empty();
								$('#totalPrice').append("總金額：$0");
								$("#rentalInfoSubmit").removeClass("allbtn_4");
								$("#rentalInfoSubmit").addClass("btn_disable");
							}		
						}
					})
	//----------------------------------------------------------------------------------
				}	
							
			});
   	//----------------------------------------------------------------------------------
		 		
		 	  }	
		  })
//ajax----------------
		  Swal.fire( '已成功更改數量')
  	}
		  	
	});
	
})

</script>
<!-- ======================================重新查詢=========================================== -->
<script>

	$("#reSearchBtn").click(function(){
		 var checkSubmit = true;
		 if($("select[id=CondDepOfficeId]").children(':selected').val() == ""){
				Swal.fire("請選擇店鋪");
			 	checkSubmit = false;
		}else if($("select[id=selectBgTime]").children(':selected').val() == ""){
			Swal.fire("請選擇取車時間");
		  		checkSubmit = false;
		}else if($("select[id=selectBgTime]").children(':selected').val() == ""){
			Swal.fire("請選擇取車時間");
				checkSubmit = false;
		}else if($("select[id=selectEdTime]").children(':selected').val() == ""){
			Swal.fire("請選擇還車時間");
				checkSubmit = false;
		}else{
				$("#ReSearch").submit();
		}
	})		
</script>

<script>
//送表單
function sendOrder(){
	 $("#orderForm").submit();
}
</script>

</body>
</html>
