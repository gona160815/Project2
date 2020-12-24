<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<meta charset="UTF-8">
<title>追風者｜預約成功</title>
</head>
<body>
${form}
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
<div style="margin:100px auto;text-align:center">
<img src="img/bike.gif" alt="預約成功" style="max-height:180px"><br>
<p style="font-size:25px">預約成功！<br>
將會發送訂單明細至您的MAIL<br>
也可以至會員中心查看訂單詳情</p><br>
<button type="button"class="btn btn-lg btn-primary" onclick="location.href='rbOrderDetail' ">查看訂單詳情</button>
</div>

</body>
</html>