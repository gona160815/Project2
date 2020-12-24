<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
<div class="mx-auto w-75 p-3">
    <form class="w-25 p-3" action="<c:url value='/ForgetPassword'/>" method="post">
    	<div class="form-group">
            <label for="exampleInputEmail1">請輸入註冊信箱</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
            value="" placeholder="Enter email" name="account">
            <small id="emailHelp" class="form-text text-muted">我們會將密碼重新設定鏈結寄至您的註冊信箱，請立即查收並更改密碼!</small>
        </div>
        <button type="submit" id='submit' class="btn btn-primary">確認</button>
    </form>
</div>

<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>
</html>