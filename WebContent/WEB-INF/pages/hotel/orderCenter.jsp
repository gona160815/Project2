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
<img src="img/hotel_image/hotelTest1.gif" alt="預約成功" style="max-height:180px"><br>
<p style="font-size:25px;"><span style="font-size:30px;font-weight:700;">預約成功！</span><br>
將會發送訂單明細至您的MAIL<br>
也可以至會員中心查看訂單詳情</p><br>
<a href="sixsix.success.booking">查看訂單詳情</a>
</div>

</body>
</html>