<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Info</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
 <jsp:include page="top.jsp" />
<div class="mx-auto w-75 p-3">
    <form class="w-25 p-3" action="<c:url value='/UpdateRegistration' />" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">帳號：</label>
            <input type="email" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ex:AAAAA@gmail.com" name="email" value="${loginOK.email}" readonly>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">密碼：</label>
            <input type="text" class="form-control " id="exampleInputPassword1" name="password" placeholder="Password" value="${loginOK.password}">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">姓名：</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="name" placeholder="ex:陳齦滑" value="${loginOK.name}">
        </div>
        
                <div class="form-group">
                    <label for="exampleInputPassword1">居住區域</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="ex:台北市" name="area" value="${loginOK.area}">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">自行車偏好</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="ex:公路車" name="favor" value="${loginOK.favor}">
                </div>
                
                <button type="submit" class="btn btn-primary">送出</button>
    </form>

   

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</div>

</body>
</html>