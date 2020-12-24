<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
	
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/dist/assets/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/dist/assets/owl.theme.default.css">
<link href="/css/mdb.min.css" rel="stylesheet">
<link href="/styles/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/list.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">

 <style>
        .outsideborder {
            /* border: 3px rgb(99, 102, 99) solid ;
        border-radius: 5px; */
            box-shadow: 4px 4px 6px 7px #cccccc;
            padding: 20px;
        }

        .insideborder {
            /* border: 3px rgb(76, 241, 76) solid ; */
            border-radius: 5px;
        }


        .everyborder {
            margin: 10px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 1px 1px 3px 4px #cccccc;
        }
        .everyborder:hover {
            margin: 10px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 3px 3px 5px 6px #cccccc;
        }

        .imgimg {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .insidesmalltext {
            font-size: small;
        }

        .insidetext {
            /* text-align: center; */
            font-weight: 900;
            color: #001959;
        }

        .insidetextleft {
            text-align: left;
            /* font-weight: 900; */
            color: #001959;
        }

        .insidetextright {
            text-align: right;
            /* font-weight: 900; */
            color: #001959;
        }

        p {
            color: #001959;
        }

        p:hover{
            color: #001959;
            font-weight: bold;
        }

        .tabletitle {
            font-weight: 900;
            font-size: large;
            text-align: center;
            border-radius: 5px;
            background-color: #f5f6fa;

        }
    </style>


<style type="text/css">
body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: left;
    background-color: #fff;
}

* {
    font-family: adiHausBold,Arial,Helvetica,Verdana,microsoft jhenghei,sans-serif;
}

*, ::after, ::before {
    box-sizing: border-box;
}

div {
    display: block;
}

.member-form {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 3%;
    margin: 1% 0;
    margin-bottom: 5%;
}

.row.no-gutter {
    margin-left: 0;
    margin-right: 0;
}

.location-table {
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
    margin-top: -1px;
}

.text-center {
    text-align: center!important;
}

.row {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.row.no-gutter>[class*=col-] {
    padding-right: 0;
    padding-left: 0;
}

@media (min-width: 992px)
.col-md-2 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 16.666667%;
    flex: 0 0 16.666667%;
    max-width: 16.666667%;
}

@media (min-width: 768px)
.col-sm-6 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%;
}

.location-table dl {
    border-right: 1px solid #ccc;
    padding: 0;
    margin: 0;
}
.table-set .location-table dt {
    display: none;
    background: #f1f1f1;
}

.location-table dt, .location-table dd {
    border-bottom: 1px solid #ccc;
    padding: 5px 0;
    word-break: break-all!important;
}

.location-table dd {
    min-height: 60px;
    margin-bottom: 0;
    word-break: break-all!important;
}

dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
*, ::after, ::before {
    box-sizing: border-box;
}

dt {
    font-weight: 700;
}

.table-set .location-table:first-child dt {
    display: block;
}
.justify {
    display: flex;
    justify-content: center;
    align-items: Center;
}
dd {
    margin-bottom: .5rem;
    margin-left: 0;
}

.location-table.row.text-center.no-gutter:hover{
	background-color:#f1f1f1;
}

/* #orderdetail1{ */
/* 	display: block; */
/* } */

/* #orderdetail2{ */
/* 	display: none; */
/* } */

</style>


</head>
<body>
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>


	<div class="col-sm-12 col-md-10" style="margin:0 auto">
		<div class="user-key">
			<h1>訂單記錄</h1>
		</div>
		<div class="member-form">
			<div class="table-set">
			
			<c:forEach var="totalOrder" items="${thisMemberOrder}"
				varStatus="status">
				
				<div class="location-table row text-center no-gutter outsideData">
					<div class="col-xs-6 col-sm-6  col-md-2">
						<dl>
							<dt>訂單編號</dt>
							<dd class="justify">${totalOrder.id }</dd>
						</dl>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-2">
						<dl>
							<dt>購買日期</dt>
							<dd class="justify">${totalOrder.orderdate }</dd>
						</dl>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-2">
						<dl>
							<dt>訂單狀態</dt>
							<dd class="justify">已確認</dd>
							<dd class="justify" style="display: none;">已合併</dd>
						</dl>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-2">
						<dl>
							<dt>訂單金額</dt>
							<dd class="justify">$ ${totalOrder.money } 元</dd>
						</dl>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-2">
						<dl>
							<dt>付款狀態</dt>
							<dd class="justify">已付款</dd>
							<dd class="justify" style="display: none;">已合併</dd>
						</dl>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2">
						<dl>
							<dt>訂單明細</dt>
							<dd class="justify">
								<a name="orderdetail" href="#">查看明細</a>
								<input type="hidden" value="${totalOrder.id }" />
							</dd>
						</dl>
					</div>
				</div>
				<div class="location-table row text-center no-gutter orderfollow insideData" name="orderfollow" id="orderfollow" style="border-right: 1px solid #ccc;border-bottom: 1px solid #ccc; text-align: center;">
					
				</div>
				
				</c:forEach>
				
				
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>		
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
				
	<script>
		$("a[name='orderdetail']").on("click",function(){
			var dataDetail = $(this).next().val();
			var deleteData = $(this).closest(".outsideData").next(".insideData");
			console.log(dataDetail);
		
			
			
			
			$.ajax({
				url:'sixsix.detaildata.json',
				type:'post',
				data:{dataDetailparam:dataDetail},
				dataType: 'json',
				success:function(res){
					
					$(".orderfollow").empty();
					console.log(res);
					deleteData.append(orderDetail(res));
					}
					
					
				 
				
			});
			

		});
		
		
		function orderDetail(res){
			console.log(res.thisOrder.id);
// 			console.log(res.thisHotel.id);
			var data =
				'<div class="container-fluid outsideborder">'
				+'<div class="row justify-content-around">'
				+'<div class="col-6 insideborder">'
				+'<div class="everyborder">'
				+'<div class="row justify-content-around">'
				+'<div class="col-6 insideborder">'
				+'<img class="imgimg" src="'+res.thisPic+'">'
				+'</div>'
				+'<div class="col-6 insideborder">'
				+'<div>'+res.thisName+'</div>'
				+'<div>'+res.thisTel+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="everyborder">'
				+'<div class="row justify-content-around">'
				+'<div class="col-12 insideborder">'
				+'<iframe class="imgimg" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+res.thisPy+','+res.thisPx+'(飯店位置)&z=16&output=embed&t="></iframe>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="col-6 insideborder">'
				+'<div class="everyborder">'
				+'<p class="tabletitle">價格和獎勵</p>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft insidetext">'
				+'客房價格(單日)'
				+'</div>'
				+'<div class="col-6 insidetextright insidetext">'
				+'NT$'+ res.thishotelonedayPrice+'元'
				+'</div>'
				+'</div>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft">'
				+res.thisstartDate+'~'+res.thisoverDate
				+'</div>'
				+'<div class="col-6 insidetextright">'
				+'NT$'+ res.thishotelonedayPrice+'元'
				+'</div>'
				+'</div>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft">'
				+'稅金和費用'
				+'</div>'
				+'<div class="col-6 insidetextright">'
				+'NT$ 249.88'
				+'</div>'
				+'</div>'
				+'<hr>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft">'
				+'小計'
				+'</div>'
				+'<div class="col-6 insidetextright">'
				+'NT$'+ res.thisOrder.money+'元'
				+'</div>'
				+'</div>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft">'
				+'已使用 優惠眷'
				+'</div>'
				+'<div class="col-6 insidetextright">'
				+'-NT$1,439'
				+'</div>'
				+'</div>'
				+'<hr>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft insidetext">'
				+'總價'
				+'</div>'
				+'<div class="col-6 insidetextright insidetext">'
				+'NT$'+ res.thisOrder.money+'元'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="row justify-content-around">'
				+'<div class="col-6 insideborder">'
				+'<div class="everyborder">'
				+'<div class="row justify-content-around">'
				+'<div class="col-6 insideborder">'
				+'<div class="row justify-content-between insidesmalltext">'
				+'<div class="col-6 insidetextleft">'
				+'入住'
				+'</div>'
				+'<div class="col-6 insidetextright">'
				+'退房'
				+'</div>'
				+'</div>'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft insidetext">'
				+res.thisstartDate
				+'</div>'
				+'<div class="col-6 insidetextright insidetext">'
				+res.thisoverDate
				+'</div>'
				+'</div>'
				+'<div class="row justify-content-between insidesmalltext">'
				+'<div class="col-6 insidetextleft">'
				+'15:00'
				+'</div>'
				+'<div class="col-6 insidetextright">'
				+'12:00'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="col-6 insideborder">'
				+'<p class="insidetext">入住規定</p>'
				+'<div class="insidesmalltext">'
				+'<p>入住登記開始時間： 15:00</p>'
				+'<p>入住登記結束時間 00:00</p>'
				+'<p>訂單下訂時間 '+res.thisOrder.orderdate+'</p>'
				+'<p>如果您計劃延遲入住，請直接與此住宿業者了解延遲入住的規定。</p>'
				+'<p class="insidetext">特別規定</p>'
				+'<p>此住宿恕不在營業時間以外提供入住登記服務。櫃台服務人員會接待旅客入住。</p>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="col-6 insideborder">'
				+'<div class="everyborder">'
				+'<div class="row justify-content-between">'
				+'<div class="col-6 insidetextleft">'
				+'<p class="insidetext">'+res.thishotelTypeName+'</p>'
				+'<div class="insidesmalltext">'
				+'<p>CHANGWEN-HSUAN，2 位成人</p>'
				+'<p class="insidetext">特殊要求</p>'
				+'<p>禁煙房</p>'
				+'<p>客房要求已經轉達飯店，但飯店無法確認並且需在入住時視實際情況供應。</p>'
				+'</div>'
				+'</div>'
				+'<div class="col-6 insideborder">'
				+'<div>'
				+'<img class="imgimg" src="img/hotel_image/threehouse.jpg">'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>';
				
				
				
				
				
				
				
				
// 				'<div class="container-fluid body">'
// 				+'<div>'+res.thisName+'</div><br>'
// 				+'<div>'+res.thisOrder.id+'</div><br>'
// 				+'<div>訂購日期：'+res.thisOrder.date+'</div>'
// 				+'<div>訂購總金額： $'+res.thisOrder.money+'</div>'
// 				+'<img src="img/hotel_image/d4940929.jpg"></img>'
// 				+'</div>';
				return data;
		}
	
	

	</script>




			
</body>
</html>