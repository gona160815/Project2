<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>追風者｜租車訂單資訊</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- -------------------DataTable引入的CDN---------------------------------------------------------------------- -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
	<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
	
<style>

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
</head>

<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

<div id="top-block">
        <div id="top-box">
             <h1 id="title" class="align-middle">租車訂單資訊</h1>
        </div>
</div>

<div style="width:92%;padding-left:120px;padding-top:60px">
<table id="actFarmer" class="table table-striped table-bordered">
        <thead>
            <tr>
				<th>訂單編號</th>
				<th>預約人姓名</th>
				<th>預約起始日</th>
				<th>起始店家</th>
				<th>預約還車日</th>
				<th>還車店家</th>
				<th>總價格</th>
				<th>下訂時間</th>
				<th>訂單狀態</th>
			</tr>
        </thead>
        <tbody>
        <c:forEach var="orderBean" items="${orderBean}">
			<tr>
				<td>${orderBean.rbOrderId}</td>
				<td>${orderBean.rbBill. billName}</td>						
				<td>${orderBean.bgDate}</td>
				<td>${orderBean.bgStore.st_name}</td>
				<td>${orderBean.edDate}</td>
				<td>${orderBean.edStore.st_name}</td>
				<td>${orderBean.totlalMoney}</td>
				<td>${orderBean.orderTime}</td>
				
				<c:choose>
				
				<c:when test="${orderBean.rbBill.orderStatus == 1}">
				<td>已付款</td>
				</c:when>
				
				<c:when test="${orderBean.rbBill.orderStatus == 0}">
				<td>未付款</td>
				</c:when>	
				
				<c:when test="${orderBean.rbBill.orderStatus == 3}">
				<td>無法更改</td>
				</c:when>
				
				</c:choose>
	
			</tr>
			
		</c:forEach>
        </tbody>

    </table>
 </div>

<!-- -------------------DataTable引入的js---------------------------------------------------------------------- -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>	
<!-- -------------------DataTable的javascript---------------------------------------------------------------------- -->
	<script>
	$(document).ready(function() {
	    $('#actFarmer').DataTable({
	    	language: {
	    	    "lengthMenu": "顯示 _MENU_ 筆資料",
	    	    "sProcessing": "處理中...",
	    	    "sZeroRecords": "没有匹配结果",
	    	    "sInfo": "目前有 _MAX_ 筆資料",
	    	    "sInfoEmpty": "目前共有 0 筆紀錄",
	    	    "sInfoFiltered": " ",
	    	    "sInfoPostFix": "",
	    	    "sSearch": "搜尋:",
	    	    "sEmptyTable": "尚未有資料紀錄存在",
	    	    "oPaginate": {
	    	        "sFirst": "首頁",
	    	        "sPrevious": "上一頁",
	    	        "sNext": "下一頁",
	    	        "sLast": "末頁"
	    	    }
	    	}

		    });
	} );
	</script>
	
</body>

</html>

