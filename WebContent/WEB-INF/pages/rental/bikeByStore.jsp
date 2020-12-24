<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>追風者｜${store.st_name}</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >


	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
	<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
	<link rel="stylesheet" type="text/css" href="css/rental-common.css"/>
	<link rel="stylesheet" type="text/css" href="css/rental-style.css"/>   
	<link rel="stylesheet" type="text/css" href="css/rental-slick.css"/>
	<link rel="stylesheet" type="text/css" href="css/rental-theme.css"/>
<style>
.section {
	padding:0px;
}

 #top-block {
     height: 200px;
     width: 100%;
     background-color: #f5f5f5;
     top: 0;
     background-position: 50%;
     background-repeat: no-repeat;
     background-size: cover;
     overflow: hidden;
     position: relative;
     background-image: url("img/storetitle.jpg");
}
                    
#top-box {
    background-size: cover;
    overflow: hidden;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0px;
    display: block;
    background: rgba(0, 0, 0, 0.3);
    transition: opacity 0.5s ease-in-out;
    color: #FFF;
    text-align: center;
}
                    
#title {
    position: relative;
    text-align: center;
    top: 80px;
    font-family: "Material Icons";
    font-size: 40px;
    color: #fff;
}

#membername{
          margin-left:45px;
         }
        

</style>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-107071717-2"></script>
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
</head>

<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

<div id="top-block">
        <div id="top-box">
             <h1 id="title" class="align-middle">${store.st_name}</h1>
        </div>
</div>
    
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v3.1&appId=136570333133508&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<main id="shop-lineup">
<!-- ===============================一種腳踏車資訊開始=============================== -->
	<c:forEach var="bikeBean" items="${bikeBean}">
		<div id="sec5" class="section lineup-detail container">
		<h3 class="ttl-01 text-center mb-5">${bikeBean.typeName}</h3>
		<div class="lineup-detail-text col-lg-9 mx-auto">
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
							<td>$${bikeBean.hrPrice}</td>
							<td>$${bikeBean.dayPrice}</td>
							<td>$${bikeBean.weekPrice}</td>
							<td>$${bikeBean.latePrice}</td>
					</tr>
				</tbody>
			</table>
		</div><!-- /lineup-detail-text -->
		
		<div class="row bile-linup-shop mb-3">
		
<!--=======================一個腳踏車循環開始======================= -->
		<c:forEach var="sbBean" items="${bikeBean.simpleBike}" varStatus="s">
			<div class="col-6 col-md-3 bile-item">
				<div class=" bile-item-img">
					<p>${sbBean.rbName} </p>
					<img src="/bikeImage/${sbBean.rbImg}" alt="${sbBean.rbName}" class="img-fluid" />				</div>
				<div class="bile-item-size">
					<table class="table table-sm table-bordered bile-size-table">
						<thead>
							<tr>
								<th>尺寸</th>
								<th>適合的身高</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="sizeBean" items="${sbBean.rentalbike}" varStatus="s">
							<tr>
								<td>${sizeBean.rbSize.rbSize}</td>
								<td>${sizeBean.rbSize.sizeDetail}</td>		
							</tr>
						</c:forEach>
							
						</tbody>
						
					</table>
				</div>
			</div>
		</c:forEach>
<!--=======================一個腳踏車循環結束======================= -->
					
				</div>
				
		<div class="text-center shop-bike-booking">
			<button class="btn btn-ppl arrow-l" name="go_search"  onclick="location.href='BikeTypeUser'">預約 高階碳纖維公路車款</button>
		</div>
		</div>
	</c:forEach>	
<!-- ======================一個腳踏車資料循環的結束===============================-->
		
		

		
</main>
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
<div class="modal fade modal-box" id="modalType" tabindex="-1" role="dialog" aria-labelledby="modalTypeLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p class="modal-title" id="modalTypeLabel">車種一覽</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<img src="/img/site/icon_close.png" alt="關閉">
				</button>
			</div>
			<div class="modal-body">
				<ul class="list-unstyled">
					<li>
						<dl>
							<dt><img src="/img/site/type/linup_load_premium.jpg" alt="高階碳纖維公路車款" class="pc"></dt>
							<dt><span>高階</span>碳纖維公路車款</dt>
							<dd>超高性能極輕量化碳纖維公路車，推薦給追求完美高性能的騎士</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><img src="/img/site/type/linup_load_carbon.jpg" alt="碳纖維公路車款" class="pc"></dt>
							<dt>碳纖維公路車款</dt>
							<dd>高性能輕量化碳纖維公路車，推薦給追求高性能的騎士</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><img src="/img/site/type/linup_load_alumi.jpg?20191101" alt="鋁合金輕量公路車款" class="pc"></dt>
							<dt>鋁合金輕量公路車款</dt>
							<dd>碳纖維公路車並非唯一選項，鋁合金公路車的輕快及舒適也將讓你讚嘆及驚豔，若您之前尚未接觸過公路車，鋁合金公路車是我們推薦給您的第一選擇。</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><img src="/img/site/type/linup_cross.jpg?20191101" alt="運動型車款" class="pc"></dt>
							<dt>運動型車款</dt>
							<dd>自行車非您的拿手項目也沒關係，這些車種都能讓您輕鬆駕馭，同時享受舒適輕鬆騎乘。</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><img src="/img/site/type/linup_kids.jpg" alt="青少年車款" class="pc"></dt>
							<dt>青少年車款</dt>
							<dd>身高135cm以上的青少年即可騎乘，讓您全家可以一起自行車旅行。</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><img src="/img/site/type/linup_e-bike.jpg?20191101" alt="電動車" class="pc"></dt>
							<dt>電動車</dt>
							<dd>電動自行車於踩踏時提供助力，幫助您輕鬆克服長距離。</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- 	<script type="text/javascript" src="bootstrap.min.js"></script> -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/i18n/jquery-ui-i18n.min.js"></script>
	<script type="text/javascript" src="js/rental/moment.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenMax.min.js"></script>
	<script type="text/javascript" src="js/rental/commom.js"></script>
	<script type="text/javascript" src="js/rental/jquery.matchHeight.js"></script>
	<script type="text/javascript" src="js/rental/slick.min.js"></script>
	<script type="text/javascript" src="js/hotel/jquery.magnific-popup.min.js"></script>

//<![CDATA[
$(function(){
	$('.matchHeight').matchHeight();
});

//]]>
</script><script type="text/javascript">
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
			sd = $(this).val();//出発日
			var sdDate = moment($(this).val());//比較用出発日
			var edDate = $('#CondArv').val();//返却日
			if(sdDate.isAfter(edDate) == true) {//出発日が返却日を超えた場合
				$('#CondArv').val(sd);
				$('#CondArv').datepicker('setDate', sd);
			}
		},
		beforeShow: function(input, inst) { // カレンダーを必ず下側へ表示させるための表示位置計算function
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
			ed = $(this).val();//返却日
			var edDate = moment($(this).val());//比較用返却日
			var sdDate = $('#CondDep').val();//出発情報取得
			if(edDate.isAfter(sdDate) == false) {//返却日が出発日以前を選択した場合
				$('#CondDep').val(ed);
				$('#CondDep').datepicker('setDate', ed);
			}
		},
		beforeShow: function(input, inst) { // カレンダーを必ず下側へ表示させるための表示位置計算function
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
</script><script type="text/javascript">
//<![CDATA[
$(function(){
	$('#goSearch').click(function(){
		var checkSubmit = true;
		if($("select[id=CondDepOfficeId]").children(':selected').val() == ""){
			alert('請選擇店鋪');
			checkSubmit = false;
		}
		return checkSubmit;
	})
});

//]]>
</script><script type="text/javascript">
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
</script></body>
</html>

