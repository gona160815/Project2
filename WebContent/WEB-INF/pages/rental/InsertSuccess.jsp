<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成功新增</title>

<style>

.allPage{
	margin:5% auto;
}

.title{
  font-family: '微軟正黑體', 'Microsoft JhengHei', 'PMingLiU', sans-serif;	
}

.btn-ppl {
	background: #70a5e1;
	color: #FFF; 
	left:500%; 
	text-decoration: none; 
	decoration:none;
	border-radius: 50px;
	border:0 none;
	padding: .6rem 1.4rem;
	margin:10px;
	font-weight: bold;
	display: inline-block;
	font-family: '微軟正黑體', 'Microsoft JhengHei', 'PMingLiU', sans-serif;	
}

.btn-ppl:hover {
 	color: #FFF; 
 	background-color: #5d5db4; 
 	text-decoration:none;
 } 

</style>
</head>
<body>

<c:set var="funcNam
e" value="IND" scope="session"/>
<!-- 設定變數funcName的值為"IND", top.jsp會使用此變數-->
<%@ include file="/WEB-INF/pages/top.jsp" %>
<!-- 引入共同的頁首 -->

<div class="allPage text-center">

<h1 class="title">新增成功</h1>
<img src="<c:url value='/rental/795462.png' />"><br><br><br>

<a  class="btn-ppl" href="<c:url value='/storePreInsert' />">繼續新增</a>
<a  class="btn-ppl" href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">回管理頁面</a>
</div>


</body>
</html>