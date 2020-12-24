<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>自行車租賃服務</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/rental-common.css"/>
<link rel="stylesheet" type="text/css" href="css/rental-style.css"/>   
<link rel="stylesheet" type="text/css" href="css/rental-slick.css"/>
<link rel="stylesheet" type="text/css" href="css/rental-theme.css"/>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">

<script>
window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'UA-107071717-2',{
	'linker': {
		'domains': ['bicyclerental.jp', 'giant-store-rental.jp']
	}
});
</script>

<style>
html{
	font-size:15px;
}
.container {
    max-width: 1200px;
    margin-top: 0px;
}

</style>

</head>

<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
<!-- ===========================預約欄開始=========================== -->

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v3.1&appId=136570333133508&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<header id="header">
	
	
<div class="search-content" id="header-search" >
<input id="memberId" value="${loginOK.memberId}" type="hidden" >
	<div class="serach-box-ttl-wrap">
		<h2 class="serach-box-ttl">追風者｜自行車租賃服務<span></span></h2>
	</div>
	<form action="orderSearchPre" id="SearchForm" name="SearchForm"  class="form-inline" accept-charset="utf-8" novalidate="novalidate" method="post" >
	<div style="display:none;"><input type="hidden" name="_method" value="POST"/></div>		
	<div style="display:none;"><input type="hidden" name="_method" value="POST"></div>
		<div class="serach-box container-fluid">
		
			<div class="serach-arv-box col-md-12" >
				<div class="serach-arv" >
					<dl>
						<dt>取車日期</dt>
						<dd id="datepicker">
							<input name="bgDate" id="CondDep" class="calendar form-app" type="text" readonly="readonly"/>
						</dd>
					</dl>
					
					<dl>
						<dt>取車時間</dt>
						<dd>
						<div>
								<select name="selectBgTime" class="form-app" id="selectBgTime">
								<option value="">請選擇時間</option>
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
								<option value="18:00">19:00</option>
								<option value="18:00">20:00</option>
								</select>							
							</div>
						</dd>
					</dl>
					
					<dl>
						<dt>租車門市</dt>
						<dd>
						<div>
								<select name="bgStore" class="form-app" id="CondDepOfficeId" >
								<option value="">請選擇店鋪</option>
								${storeSelect}
								</select>							
							</div>
						</dd>
					</dl>
					
					<hr>
						
						<dl>
							<dt>還車日期</dt>
							<dd id="datepicker">
								<input name="edDate" id="CondArv" class="calendar form-app" type="text" readonly="readonly"/>
								<input type="hidden" name="data[Cond][lang]" value="cnh" id="CondLang"/>	
							</dd>
						</dl>
						
						<dl>
						<dt>還車時間</dt>
							<dd>
							<div>
									<select name="selectEdTime" class="form-app" id="selectEdTime">
									<option value="">請選擇時間</option>
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
									<option value="18:00">19:00</option>
									<option value="18:00">20:00</option>
									</select>							
								</div>
							</dd>
						</dl>
						
						<dl>
						<dt>還車門市</dt>
						<dd>
						<div>
								<select name="edStore" class="form-app" id="CondDepOfficeId">
								<option value="">請選擇店鋪</option>
								${storeSelect}
								</select>							
							</div>
						</dd>						
					</dl>
				</div>
			</div><!-- serach-arv-box -->
			
			<div class="serach-type-size col-md-12">
				<div class="row">
					<div class="serach-type col-md-12">
						
					</div>
				</div>
			</div><!-- sel-type-size -->
			<div class="search-btn col-md-12">
				<button id="goSearch" class="btn btn-ppl icn-search" name="go_search" type="button">搜尋</button></div>
						
		</div><!-- serach-box -->
	</form></div>
	
<!-- ===========================預約欄結束=========================== -->
</header>

<main id="lineup">

	<div id="child-head">
		<div class="container">
			<h1 class="child-head-ttl" style="font-size:40px;">租賃車種及費用</h1>
			<ol class="breadcrumb row mb-0" itemscope itemtype="http://schema.org/BreadcrumbList">
				<div class="head-rsv ml-3">
                    <button type="button" id="search-open" class="btn btn-ppl" style="width: 150%;height:100%;font-size:20px;">預約</button>
                </div>
			</ol>
		</div>
	</div>

	<div class="section lineup-navi container">
		<h2 class="ttl-01 text-center">車種一覽</h2>
		<ul class="lineup-navi-list row list-unstyled">
		
		
<!-- ===============================上方車種空格開始=============================== -->

	<c:forEach var="TypeBean" items="${type_DPP}">
		    <li class="lineup-navi-item">
				<a href="#section${TypeBean.typeId}" class="matchHeight" style="height: 197.4px;>
					<p class="lineup-navi-img">
						<img src=<c:url value='getImg?typeId=${TypeBean.typeId}'/> alt=${TypeBean.typeName} class="w-100"/> </p>
					<p class="lineup-navi-sub mb-0">${TypeBean.shortDes}</p>
					<p class="lineup-navi-ttl">${TypeBean.typeName}</p>
				</a>
			</li>
	</c:forEach>
	
<!-- ===============================上方車種空格結束=============================== -->
		</ul>
	</div>
	
<!-- ===============================一種腳踏車資訊開始=============================== -->
<input id="bikeId" type="hidden" >
<input id="price" type="hidden" >
<c:forEach var="TypeBean" items="${type_DPP}">

		<div id="section${TypeBean.typeId}" class="section lineup-detail container">
		<h3 class="ttl-02 text-center mb-5">${TypeBean.typeName}</h3>
		<div class="row">
			<div class="lineup-detail-img col-lg-4">
				<img src=<c:url value='getImg?typeId=${TypeBean.typeId}'/> alt=${TypeBean.typeName}/></div>
			<div class="lineup-detail-text col-lg-8">
							<p>${TypeBean.typeDes}</p>
							<table class="table table-bordered lineup-price-table text-center mb-1">
					<thead>
						<tr>
							<th>一小時計價</th>
							<th>一天(十二小時以上)</th>
							<th>一週計價</th>
							<th class="th01">超時收費/ 日</th>
												</tr>
					</thead>
					<tbody>
						<tr>
							<td>$${TypeBean.hrPrice}</td>
							<td>$${TypeBean.dayPrice}</td>
							<td>$${TypeBean.weekPrice}</td>
							<td>$${TypeBean.latePrice}</td>
						</tr>
					</tbody>
				</table>
			</div><!-- /lineup-detail-text -->
		</div>
			
		<div class="lineup-detail-list pt-5">
			<h4 class="ttl-03 text-center mb-5">${TypeBean.typeName}</h4>
			<div class="slick-box list-unstyled row text-center">	
			
<!-- ===============================一個腳踏車資料循環的開始===============================-->
		
		<c:forEach var="bikeBean" items="${TypeBean.simpleBike}" varStatus="s">
			<div class="lineup-detail-list-item slick-slide"  >
			
<!-- Ajax按下這個單車執行動作 -->
					
					
					<img src="/bikeImage/${bikeBean.rbImg}" alt="${bikeBean.rbName}" class="img-fluid" /></p>
					<p class="lineup-detail-list-ttl">${bikeBean.rbName}</p>
					<p class="btn-wrap">
							<span id="addAct"  class="addAct btn btn-sm btn-info float-left" data-toggle="modal" data-target="#sideModalTR">
                                	<i class="fas fa-plus"></i> 行程
                              </span>
						<span class="btn btn-sm btn-ppl arrow-l"><a role="button" name="getData" class="text-light modal-open" data-toggle="modal" data-target="#lineupShopModal19"  >門市搜尋</a></span>
						<span id="favorite${s.index}" class="rental-favorite btn btn-sm float-right "><i class="text-secondary far fa-heart"></i></span>
                        <input class="favcounter" type="hidden" value="0">
					</p>
					
<!-- Ajax隱藏表單傳值 -->
					<input class="simBikeId" type="hidden" id="eid${s.index}" value="<c:out value="${bikeBean.simRbId}"/>">
					<input class="dayprice" type="hidden"  value="${TypeBean.dayPrice}">
			</div>
		</c:forEach>
		
<!-- ===============================一個腳踏車資料循環的結束===============================-->
		
			</div>
		</div><!-- /lineup-detail-list -->
	</div><!-- /lineup-detail -->

<!-- Modal -->

<div class="modal fade" id="lineupShopModal19" tabindex="-1" role="dialog" aria-labelledby="lineupShopModal19Label" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" id ="rbName">
			</div>
			<div class="modal-body">
				<div class="row" id="storeDetail">
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->

</c:forEach>
<div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class=" modal-dialog modal-dialog-scrollable modal-side modal-top-right modal-info" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title w-100" id="myModalLabel">加入我的行程表</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                	<span aria-hidden="true">&times;</span>
                </button>
            </div>
         <div style="height: 500px;" class="modal-body">
         <div>
         <ul class="list-group list-group-flush">
             <li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>
         </ul>
         </div>
        </div>
        <div style="height: 200px; " class="modal-footer">
        <button id="reset" type="button" class="float-left btn btn-warning btn-md">重新選擇</button>
        <button id="cancel" type="button" class="btn btn-secondary btn-md" data-dismiss="modal">取消</button>
        <button id="addNewAct" type="button" class="btn btn-info btn-md">加入</button>
        </div>
        </div>
       </div>
</div>                              

<!-- =======================一種腳踏車資訊結束=============================== -->
</main>
<!-- Modal -->
<div class="pagetop">
	<p><a href="#"><i class="material-icons">arrow_upward</i></a></p>
</div>
<!-- Modal -->
<div class="modal fade modal-box" id="modalSize" tabindex="-1" role="dialog" aria-labelledby="modalSizeLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p class="modal-title" id="modalSizeLabel">自行車尺寸及合適身高對應表</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<img src="/img/site/icon_close.png" alt="閉じる">
					
				</button>
			</div>
			<div class="modal-body">
				<table class="size-table">
					<tr>
						<th>尺寸</th><th>建議身高</th><th>備註</th>
					</tr>
										<tr>
						<td><span class="ttl-size icon-JR">JR</span></td>
						<td>135cm～150cm</td>
						<td>&nbsp;</td>
					</tr>
										<tr>
						<td><span class="ttl-size icon-XXS">XXS</span></td>
						<td>145cm～157cm</td>
						<td>各車型尺寸差異<br />
公路車型(145公分~160公分)</td>
					</tr>
										<tr>
						<td><span class="ttl-size icon-XS">XS</span></td>
						<td>157cm～168cm</td>
						<td>各車型尺寸差異</td>
					</tr>
										<tr>
						<td><span class="ttl-size icon-S">S</span></td>
						<td>165cm～175cm</td>
						<td>各車型尺寸差異<br />
Escape RX車型(160公分~175公分)</td>
					</tr>
										<tr>
						<td><span class="ttl-size icon-M">M</span></td>
						<td>172cm～183cm</td>
						<td>各車型尺寸差異</td>
					</tr>
										<tr>
						<td><span class="ttl-size icon-ML">ML</span></td>
						<td>180cm～190cm</td>
						<td>各車型尺寸差異</td>
					</tr>
										<tr>
						<td><span class="ttl-size icon-L">L</span></td>
						<td>180cm～195cm</td>
						<td>各車型尺寸差異</td>
					</tr>
									</table>
			</div>
		</div>
	</div>
</div>
	
<!-- Modal -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->

	
<!-- 	<script type="text/javascript" src="js/core/bike.min.js"></script> -->
	<script type="text/javascript" src="js/rental/jquery-ui.min.js"></script>
<!-- 	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/i18n/jquery-ui-i18n.min.js"></script> -->
	<script type="text/javascript" src="js/rental/moment.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenMax.min.js"></script>
	<script type="text/javascript" src="js/rental/commom.js"></script>
	<script type="text/javascript" src="js/rental/jquery.matchHeight.js"></script>
	<script type="text/javascript" src="js/rental/slick.min.js"></script>
<!-- 	<script type="text/javascript" src="js/hotel/jquery.magnific-popup.min.js"></script> -->
	<script src="js/rental/rental.js"></script>

<script type="text/javascript">

//<![CDATA[
$(function(){
	$('.matchHeight').matchHeight();
});
$(function() {
	$('.slick-box').slick({
		dots: true,
		infinite: true,
		prevArrow: '<a href="#" class="slider-arrow prevbtn"><i class="material-icons">keyboard_arrow_left</i></a>',
		nextArrow: '<a href="#" class="slider-arrow nextbtn"><i class="material-icons">keyboard_arrow_right</i></a>',
		speed: 300,
		slidesToShow: 4,
		slidesToScroll: 1,
		responsive: [{
			breakpoint: 1024,settings: {
				slidesToShow: 3,
				slidesToScroll: 3,
			}
		},
		{
			breakpoint: 767,settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 576,settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		}
		]
	});
});

//]]>
</script>

<!-- <scriptsrc="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script> -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></link> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/moment.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.25/daterangepicker.min.css" rel="stylesheet"></link>


	<!--要選取日期的元素-->
	
<!-- 上方bar -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- 上方bar -->


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<script>
// 檢查預約有否遺漏輸入

	$("#goSearch").click(function(){
		 var checkSubmit = true;
		 if($("select[id=CondDepOfficeId]").children(':selected').val() == ""){
				swal("請選擇店鋪");
			 	checkSubmit = false;
		}else if($("select[id=selectBgTime]").children(':selected').val() == ""){
				swal("請選擇取車時間");
		  		checkSubmit = false;
		}else if($("select[id=selectBgTime]").children(':selected').val() == ""){
				swal("請選擇取車時間");
				checkSubmit = false;
		}else if($("select[id=selectEdTime]").children(':selected').val() == ""){
				swal("請選擇還車時間");
				checkSubmit = false;
		}else{
				$("#SearchForm").submit();
		}
	})
			
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
		
<script>

function bikeName(res){
	var bikeName = 
	'<h5 class="modal-title" id="lineupShopModal60Label">'+res.simBike.rbName+' </h5>';
	return bikeName;
}

function storeDetail(sList){
	var store =
	'<div class="col-md-6 shop-modal-item">'+
	'<p class="modal-shop-names">'+sList.st_name+'</p>'+
	'<div class="modal-shop-img float-lg-left">'+
	'<img src="/storeImage/'+sList.st_imgFile1+'" class="img-fluid"/></div>'+
	'<div class="modal-shop-size">'+
		'<p>地址：'+sList.st_address+'</p>'+
		'<p>電話：'+sList.st_tel+'</p>'+
		'<p>信箱：'+sList.st_mail+'</p>'+
	'</div><div class="modal-shop-book">'+
	'<form action="https://giant-store-rental.jp/cnh/rsv/" id="SearchList" accept-charset="utf-8" novalidate="novalidate" method="post">'+
	'<div style="display:none;">'+
	'<input type="hidden" name="_method" value="POST"/></div>'+							
    '<button class="btn btn-ppl arrow-l" name="go_search" >開始預約</button></form></div></div>';
	return store;
}


$('a[name=getData]').on("click",function(){
	var simRbId = $(this).closest("p").siblings(".simBikeId").val();
	console.log(simRbId);
	
	$.ajax({
		url:'bikeByStore.json',
		type:'post',
		data:{simRbId:simRbId},
		dataType: 'json',
		success:function(res){
			var store = res.sList;
			$("#storeDetail").empty();
			console.log(store);
			$.each(store,function(i,sList){
			$("#storeDetail").append(storeDetail(sList));	
		});
	}	
});

	$.ajax({
		url:'bikeBySimId.json',
		type:'post',
		data:{simRbId:simRbId},
		dataType: 'json',
		success:function(res){
			$("#rbName").empty();
			$("#rbName").append(bikeName(res));
		}	
	});
	
});

</script>

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
			}, 10) 
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

</body>
</html>

