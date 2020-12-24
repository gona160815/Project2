<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>追風者｜門市總覽</title>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/rental-style.css"/>
<link rel="stylesheet" type="text/css" href="css/rental-slick.css"/>
<link rel="stylesheet" type="text/css" href="css/rental-theme.css"/>

<style>

.allpage{
	margin-top:120px;
}

.shop-lists-item {
	border: 2px solid #C2CFD6;
	padding: 20px;
	margin-bottom:20px;
}
 
.btn-ppl:hover {
 	color: #FFF; 
 	background-color: #5d5db4; 
 	text-decoration:none;
 } 

.btn-ppl {
	background: #7474bf;
	color: #FFF; 
	text-decoration: none; 
	border-radius: 50px;
	padding: .6rem 1.4rem;
	font-weight: bold;
	display: inline-block;
	font-family: '微軟正黑體', 'Microsoft JhengHei', 'PMingLiU', sans-serif;	
}

.btn-ppl-del {
	background: #f97f7b;
	color: #FFF; 
	text-decoration: none; 
	border-radius: 50px;
	padding: .6rem 1.4rem;
	font-weight: bold;
	display: inline-block;
	font-family: '微軟正黑體', 'Microsoft JhengHei', 'PMingLiU', sans-serif;	
}

.shop-lists-link{
	display: inline-flex;
}
.shop-lists-link li{
	margin-right: 10px;
}
.shop-lists-item{
	padding: 30px;
}
.shop-lists-link li .btn-ppl{
	padding-top: .3rem;
	padding-bottom: .3rem;
}

.ttl-01 {
    font-size: 2rem;
    font-weight: bold;
    padding-bottom: 0%;
    padding-top: 50px;
}

.container {
    width: 100%;
    padding-right: 30px;
    padding-left: 30px;
    margin-right: auto;
    margin-left: auto;
}

*, ::before, ::after {
    box-sizing: border-box;
}

#form5{
	position:relative; 
	margin-bottom:20px;	
}
#sbox5{	
	outline:0;	
	height:45px;
	padding:0 10px; 
	position:absolute; 
	left:230px;
	top:0; 
	width:360%;
	border-radius:2px;
	background:#ececec;
    border: 0 none;
}
#sbtn5{
	width:79px;
	height:45px;
	position:absolute; 
	left:465%; 
	top:0;
	border-radius:2px;
	background:#7474bf;
	color:#fff;
	font-weight:bold;
	font-size:16px;
	border:none;
}
#sbtn5:hover{
	background:#eee;
	color:#7474bf;
}

.select-box {
  cursor: pointer;
  position:absolute;
  left:0px;
  max-width:21em;
  margin:-70px auto;
  margin-buttom:10px;
  width: 20%;
}

.select,.label {
  color: #414141;
  display: block;
  font: 400 17px/2em 'Source Sans Pro', sans-serif;
}

.select {
  width: 100%;
  position:absolute;
  top: 0;
  padding: 5px 0;
  height: 45px;
  border: 0 ;
  background: #ececec;
}

nav.cp_navi *, nav.cp_navi *:after, nav.cp_navi *:before {
	-webkit-box-sizing: border-box;
	        box-sizing: border-box;
}
nav.cp_navi a {
	text-decoration: none;
}
nav.cp_navi {
	margin: 2em 0;
	text-align: center;
}
.cp_navi .cp_pagination {
	display: inline-block;
	margin-top: 2em;
	padding: 0 0.5em;
}

.cp_navi .cp_pagenum {
	font-size: 1em;
	line-height: 50px;
	display: block;
	float: left;
	transition: 400ms ease;
	letter-spacing: 0.1em;
	color: #37474F;
	border-radius: 0.3em;
	width: 50px;
	height: 50px;
	margin: auto .5em;
	border: 2px solid transparent;
}
.cp_navi .cp_pagenum:hover,
.cp_navi .cp_pagenum.current {
	color: #37474F;
	border: 2px solid #5d5db4;
	border-radius: 0.3em;
}
.cp_navi .cp_pagenum.prev,
.cp_navi .cp_pagenum.next {
	color: #ffffff;
	background-color: #5d5db4;
	border-radius: 0.3em;
	line-height: 45px;
}
.cp_navi .cp_pagenum.prev:hover,
.cp_navi .cp_pagenum.next:hover {
	color: #3F51B5;
	border: 2px solid transparent;
	background-color: #9FA8DA;
}
@media only screen and (max-width: 960px) {
	.cp_navi .cp_pagination {
		margin-top: 50px;
		padding: 0 10px;
	}
	.cp_navi .cp_pagenum {
	font-size: 0.8em;
	line-height: 25px;
	width: 45px;
	height: 25px;
	margin: auto .1em;
	}
	.cp_navi .cp_pagenum.prev,
	.cp_navi .cp_pagenum.next {
		padding: 0 25px 0 5px;
		line-height: 1.5em;
	}
}
@media only screen and (min-width: 120px) and (max-width: 767px) {
	.cp_navi .cp_pagenum {
	display: none;
	}
	.cp_navi .cp_pagenum:nth-of-type(2) {
	position: relative;
	padding-right: 20px;
	}
	.cp_navi .cp_pagenum:nth-of-type(2)::after {
	font-size: 1.2em;
	position: absolute;
	top: 0;
	left: 25px;
	content: '...';
	}
	.cp_navi .cp_pagenum:nth-child(-n+3),
	.cp_navi .cp_pagenum:nth-last-child(-n+3) {
		display: block;
	}
	.cp_navi .cp_pagenum:nth-last-child(-n+4) {
		padding: 0 5px;
	}
	.cp_navi .cp_pagenum:nth-last-child(-n+4)::after {
		content: none;
	}
}

.page{
	margin:0 auto;
}

 body {
    background-color: #f5f5f5;
    font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
    /*font-family: Meiryo, メイリオ, 'MS PGothic', arial, helvetica, sans-serif;*/
    color: #333333;
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

.navbar-brand{
 margin-left:-20px;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

	<div id="top-block">
        <div id="top-box">
             <h1 id="title" class="align-middle">門市總覽</h1>
        </div>
    </div>
    
<div class="section container">
<!-- 		<h2 class="ttl-01 text-center">門市總覽</h2> -->
		
		
		<form id="form5" action="bikeStoreSelect.controller">
		
            <div class="select-box">
                <select id="select-box1" class="select" name="area" >
                 ${SelectAreaSelect}   
                </select>               
                <input id="sbox5"  id="s" name="areaAdd" type="text" placeholder="搜尋市區、街道名稱" />
	        	<input type='hidden' name='pageNo' value=1>
	        	<input id="sbtn5" type="submit" value="搜尋" />     
            </div>		
		</form>
		
		<div class="allpage">
		<c:forEach var="StoreBean" items="${stores_DPP}" >
			<div class="shop-lists">
			<div class="shop-lists-item">
				<div class="row">
					<div class="col-md-8">
						<h3 class="shop-lists-name">
							<c:out value="${StoreBean.st_name} "/>
						</h3>
						<dl class="row">
							<dt class="col-4 col-lg-3">住址</dt>
							<dd class="col-8 col-lg-9"> <c:out value="${StoreBean.st_address} "/> </dd>
							<dt class="col-4 col-lg-3">營業時間</dt>
							<dd class="col-8 col-lg-9"> <c:out value="${StoreBean.st_bgtime} "/> ～ <c:out value="${StoreBean.st_edtime} "/> </dd>
							<dt class="col-4 col-lg-3">店休日</dt>
							<dd class="col-8 col-lg-9"> <c:out value="${StoreBean.st_holiday} "/> </dd>
							<dt class="col-4 col-lg-3">電話</dt>
							<dd class="col-8 col-lg-9"> <c:out value="${StoreBean.st_tel} "/> </dd>
							<dt class="col-4 col-lg-3">EMAIL</dt>
							<dd class="col-8 col-lg-9"> <c:out value="${StoreBean.st_mail} "/> </dd>
						</dl>
						<ul class="shop-lists-link list-unstyled">
							<li >
								<a href="<c:url value='/storeDetail?storeId=${StoreBean.store_id}'/>" class="btn-ppl">門市詳細資料</a>
							</li>
							<li >
								<a href="<c:url value='/bikeByStore?storeId=${StoreBean.store_id}'/>" class="btn-ppl">租賃車種一覽</a>
							</li>	
							<li >
								<a onclick="location.href='BikeTypeUser'"  class="btn-ppl" style="color:white">開始預約</a>
							</li>						

						</ul>
					</div>
							<div class="col-md-4">
								<img src="/storeImage/${StoreBean.st_imgFile1}" class="img-fluid d-none d-md-block" alt="${StoreBean.st_name}"/>
							</div>
							</div>
			</div>
		</div><!-- shop-lists -->
		</c:forEach>
		</div>
			
	</div>

<div>

</div>

<div>
	
</div>

<!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結 -->

<div class="page" id="paging">

 	<nav class="cp_navi">
        <div class="cp_pagination">
        
       	
               
              <a class="cp_pagenum prev" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=1"><<</a> <%-- 最初頁 --%>
 
        <c:choose>
        <c:when test="${pageNo > 1}">
            <a class="cp_pagenum prev" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo="${pageNo-1}><</a>   <%-- 上一頁 --%>
        </c:when>       
        <c:when test="${pageNo== 1}">
            <a class="cp_pagenum prev"><</a>   <%-- 上一頁 --%>
        </c:when>        
        </c:choose>       
        
  <!-- 如果總頁數大於10頁 -->
		<c:if test="${totalPages>10}">
		
			<!-- 如果當前頁面大於等於(1)&&小於等於(6) -->
			<c:if test="${(pageNo>=1)&&(pageNo<=6 )}">
				<c:forEach begin="1" end="10" var="n">
				 	<c:choose>
				    <c:when test="${n==pageNo}">  
 						<a class="cp_pagenum current" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:when>  
					<c:otherwise>  
						 <a class="cp_pagenum" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:otherwise>  
					</c:choose>       
				</c:forEach>
			</c:if>
			
			<!-- 如果當前數大於等於(總頁數-4)&&小於等於(總頁數) -->
			<c:if test="${(pageNo>=(totalPages-4))&&(pageNo<=totalPages) }">
				<c:forEach begin="${totalPages-9}" end="${totalPages}" var="n">
					<c:choose>
				    <c:when test="${n==pageNo}">  
 						<a class="cp_pagenum current" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:when>  
					<c:otherwise>  
						 <a class="cp_pagenum" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:otherwise>  
					</c:choose>     
				</c:forEach>
			</c:if>
			
			<!-- 如果當前數大於(6)&&小於總頁數-4) -->
			<c:if test="${(pageNo>6)&&(pageNo<(totalPages-4))}">
				<c:forEach begin="${ pageNo-5}" end="${pageNo+4 }" var="n">
					 <c:choose>
				    <c:when test="${n==pageNo}">  
 						<a class="cp_pagenum current" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:when>  
					<c:otherwise>  
						 <a class="cp_pagenum" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:otherwise>  
					</c:choose>     
				</c:forEach>
			</c:if>
		</c:if>
		
		<!-- 如果總頁數小於10頁 -->
		<c:if test="${totalPages<=10 }">
			<c:forEach begin="1" end="${totalPages}" var="n">
				<c:choose>
				    <c:when test="${n==pageNo}">  
 						<a class="cp_pagenum current" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:when>  
					<c:otherwise>  
						 <a class="cp_pagenum" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${n}">${n}</a>
					</c:otherwise>  
					</c:choose>     
			</c:forEach>
		</c:if>
  <!-- 如果總頁數大於10頁 -->  
        
        <c:choose>
        <c:when test="${pageNo != totalPages}">
            <a class="cp_pagenum next" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${pageNo+1}">></a>   <%-- 下一頁 --%>
        </c:when>       
        <c:when test="${pageNo == totalPages}">
            <a class="cp_pagenum prev">></a>   <%-- 下一頁 --%>
        </c:when>        
        </c:choose>

             <a class="cp_pagenum next" href="http://localhost:8080/EEIT124Team1FinalProject/bikeStorePre.controller?pageNo=${totalPages}">>></a> <%-- 最末頁 --%>
                      
        </div>
    </nav>
  </div>
  
  <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>

</body>

</html>