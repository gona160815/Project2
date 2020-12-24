<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<title>JSP TRY</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap.min.css">
	
<style>

        td,th{
            border:2px solid rgb(47, 238, 88);
        }
        img {
        	width: 200px;
        	height: 200px;
        }
        
        body{
            background-image:url(https://i2.kknews.cc/SIG=rctd06/ctp-vzntr/E8G3qZ7PQlJnO9.jpg);
            background-repeat: no-repeat;
            background-size:100%;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div align="center">
	<img src="https://2.bp.blogspot.com/-lBnsbmRqy78/WUh8MqMpanI/AAAAAAAIRoo/zHxXPTbZ0RkayAM7uZqo1Qe8ZlxeuvIPACLcBGAs/s1600/AS002732_08.gif">

	<form action="sixsix.selectData.controller" method="POST">
<!-- 		<label size="5">搜尋區域</label> -->
        <select name="place" size="1" onChange="change()" class="btn btn-success dropdown-toggle">
		
		<option value="1">依地區查詢</option>
		<option value="2">依飯店名稱查詢</option>
		<option value="3">飯店是否含自行車位查詢</option>
		
		
		</select>
		
		<input type="text" name="inputAdd" value="">
		<input type="hidden" name="inputPage" value="1">
		<input type="submit" value="送出">
		<input type="reset" value="取消">
		
	</form>
	</div>
	
	<hr>
	
	
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<!--     <li class="page-item disabled"> -->
<!--       <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a> -->
<!--     </li> -->
    
    
    <c:choose>
    	<c:when test="${NowPage<10}">
    		<c:forEach var="page" begin="1" end="10" step="1">
			<form action="sixsix.selectData.controller" method="POST">
			<input type="hidden" name="place" value="${PLANUM}">
			<input type="hidden" name="inputAdd" value="${PLACE}">
    		<li class="page-item"><button class="page-link" type="sumit" name="inputPage" value="${page}">${page}</button></li>
			</form>
    		</c:forEach>
    	</c:when>
    	<c:when test="${NowPage>10}">
    		<c:forEach var="page" begin="${NowPage-4}" end="${NowPage+6}" step="1">
			<form action="sixsix.selectData.controller" method="POST">
			<input type="hidden" name="place" value="${PLANUM}">
			<input type="hidden" name="inputAdd" value="${PLACE}">
    		<li class="page-item"><button class="page-link" type="sumit" name="inputPage" value="${page}">${page}</button></li>
			</form>
    		</c:forEach>	
    	</c:when>
    
    </c:choose>
    
<!--         <li class="page-item"> -->
<!--       <a class="page-link" href="#">Next</a> -->
<!--     </li> -->
    
     </ul>
</nav>
    
    
<%--     <c:forEach var="page" begin="1" end="${PAGENUM}" step="1"> --%>
<%-- 	<form action="<c:url value="/Registdata"  />" method="POST"> --%>
<%-- 	<input type="hidden" name="place" value="${PLANUM}"> --%>
<%-- 	<input type="hidden" name="inputAdd" value="${PLACE}"> --%>
<%--     <li class="page-item"><button class="page-link" type="sumit" name="inputPage" value="${page}">${page}</button></li> --%>
<!-- 	</form> -->
<%--     </c:forEach> --%>
    
    
<!--     <li class="page-item"> -->
<!--       <a class="page-link" href="#">Next</a> -->
<!--     </li> -->
 
	
	
        
        
	<div style="height:400px">
	
	
	<div class="row row-cols-1 row-cols-md-3" align="center" >
<c:forEach var="x" items="${ADDD}" varStatus="status">
        
        
        <form action="sixsix.checkDataUpdate.controller" method="POST">
  <div class="card w-75" align="left">
  
  <div class="col mb-4">
    <div class="card bg-light mb-3">
      <c:choose>    
     <c:when test="${empty x.picturel || x.picturel=='null'}">
<!--      <img src="https://imgur.dcard.tw/qNU5LUj.gif" class="card-img-top" alt="..."> -->
     <img src="/hotelImage/795462.png" class="card-img-top" alt="...">
     </c:when> 
   <c:otherwise>
    <img src="/hotelImage/${x.picturel}" class="card-img-top" alt="...">
    </c:otherwise> 
     </c:choose>
      <div class="card-body text-info">
        <h1 class="card-title alert-link" align="center">${x.name}</h1>
      </div>
        <p class="card-text"><span class="badge badge-secondary">住宿地址:</span>${x.add}</p>
        <p class="card-text"><span class="badge badge-secondary">住宿電話:</span>${x.tellphone}</p>
        <p class="card-text"><span class="badge badge-secondary">住宿縣市:</span>${x.region}</p>
        <p class="card-text"><span class="badge badge-secondary">住宿簡介:</span>${x.description}</p>
        <p class="card-text"><span class="badge badge-secondary">住宿服務:</span>${x.serviceinfo}</p>
        <p class="card-text"><span class="badge badge-secondary">住宿車位:</span>${x.parkinginfo}</p>
    </div>
  </div>
  <div align="center">
  <input type="hidden" name="homenum" value="${x.id}">
  <input type="submit" value="修改" class="btn btn-info">
  </div>
  </div>
  
  </form>
			
 </c:forEach>
 </div>
	
	</div>
	
	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>
</html>