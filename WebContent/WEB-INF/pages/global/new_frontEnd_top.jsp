<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!------ Include the above in your HEAD tag ---------->

<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="<c:url value='/homepage'/>"><img height="45px" src="img/title.png" ></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

<!-- 自行車資訊 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <svg width="3.2em" height="3.2em" viewBox="0 0 16 16" class="bi bi-bicycle" fill="#E0E0E0" xmlns="http://www.w3.org/2000/svg">
               <path fill-rule="evenodd" d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
          </svg>
        </a>
        <div class="dropdown-menu" aria-labelledby="bikeDropdown">
			<a class="dropdown-item" href="<c:url value='/newBikeIndexEntry.controller?pageNo=1'/>">自行車道</a>
			<a class="dropdown-item" href="<c:url value='/REEntry.controller?pageNo=1'/>">補給站點</a>
			<a class="dropdown-item" href="<c:url value='/bikeMapEntry.controller'/>">地圖規劃</a>
		</div>
      </li>
      
<!-- 租車 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <svg width="2.8em" height="2.8em" viewBox="0 0 16 16" class="bi bi-shop-window" fill="#E0E0E0" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z"/>
		 </svg>
        </a>
        <div class="dropdown-menu" aria-labelledby="rentalDropdown">
			<a class="dropdown-item" href="<c:url value='/bikeStorePre.controller?pageNo=1' />">門市資訊</a>
			<%-- <a class="dropdown-item" href="<c:url value='/maintainStorePre.controller?pageNo=1'/>">管理頁面</a> --%>
			<a class="dropdown-item" href="<c:url value='/BikeTypeUser' />">單車租借</a>
		</div>
      </li>
      
<!-- 活動 -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	  <svg width="2.8em" height="2.8em" viewBox="0 0 16 16" class="bi bi-calendar-date" fill="#E0E0E0" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
            <path d="M6.445 11.688V6.354h-.633A12.6 12.6 0 0 0 4.5 7.16v.695c.375-.257.969-.62 1.258-.777h.012v4.61h.675zm1.188-1.305c.047.64.594 1.406 1.703 1.406 1.258 0 2-1.066 2-2.871 0-1.934-.781-2.668-1.953-2.668-.926 0-1.797.672-1.797 1.809 0 1.16.824 1.77 1.676 1.77.746 0 1.23-.376 1.383-.79h.027c-.004 1.316-.461 2.164-1.305 2.164-.664 0-1.008-.45-1.05-.82h-.684zm2.953-2.317c0 .696-.559 1.18-1.184 1.18-.601 0-1.144-.383-1.144-1.2 0-.823.582-1.21 1.168-1.21.633 0 1.16.398 1.16 1.23z" />
         </svg>
        </a>
       <div class="dropdown-menu" aria-labelledby="eventDropdown">
			<a class="dropdown-item" href="<c:url value='/event'/>">活動首頁</a>
			<a class="dropdown-item" href="<c:url value='/event.query'/>">活動搜尋</a>
			<!-- <a class="dropdown-item" href="eventDashboard">管理者</a> -->
		</div>
      </li>

<!--住宿-->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	  <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-house" fill="#E0E0E0" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
              <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
           </svg>
        </a>
      <div class="dropdown-menu" aria-labelledby="homestayDropdown">
			<%-- <a class="dropdown-item" href="<c:url value='/sixsix.Home.controller'/>">友善住宿</a>
			<a class="dropdown-item" href="<c:url value='/sixsix.toInsertPage.controller'/>">新增民宿資料</a> --%>
			<a class="dropdown-item" href="<c:url value='/sixsix.Search.controller'/>">訂房查詢</a>
			<!-- <a class="dropdown-item" href="trytryone1">測試專用</a> -->
	  </div>
      </li>
      
           
    </ul>
    
<!-- 右邊欄位開始 -->
    <ul class="navbar-nav ">
    
  <!-- 會員登入(有登入) 開始-->
	<c:if test="${! empty loginOK }"> 
	   
      <!--購物車 -->
       <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-shopping-cart" style="font-size:35px">
            <span  class="badge badge-danger">11</span>
          </i>
        </a>
      </li>
      
      <!-- 客服 -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-comments" style="font-size:35px">
            <span class="badge badge-primary">11</span>
          </i>
        </a>
      </li>
    
	<!-- 會員資料 -->
      <li class="dropdown" style="margin:5px;margin-top:12px">
				<a href="#" data-toggle="dropdown" class="dropdown-toggle user-action" style="margin:4px;color:white;font-family:Microsoft JhengHei;font-weight:bold">
				<img src="img/mike.jpg" height='50px' width='50px' class="avatar" alt="Avatar" style="border-radius:50%;margin-right:10px">${loginOK.name} </a>
				<ul class="dropdown-menu">
					<li><a  href="infoPage"><i class="fa fa-user-o"></i> Profile</a></li>
					<li><a href="#"><i class="fa fa-calendar-o"></i> Calendar</a></li>
					<li><a href="#"><i class="fa fa-sliders"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="<c:url value='/memberLogout.controller'/>"><i class="fa fa-sign-out"></i> Logout</a></li>
				</ul>
		</li>
	</c:if>
	 <!-- 會員登入(有登入) 結束-->
	 
	 <!-- 會員登入(未登入) 開始-->		
	<c:if test="${ empty loginOK }"> 
	
    <li class="nav-item">
        <a class="nav-link" href="loginPage">
          <i class="fa fa-sign-in" style="color:#E0E0E0">
          </i>
         	 登入
        </a>
    </li>
    
    <li class="nav-item">
        <a class="nav-link" href="<c:url value='/registPage'/>">
          <i class="fa fa-users" style="color:#E0E0E0">
          </i>
         	 註冊
        </a>
      </li>
      
    </c:if>	
    <!-- 會員登入(未登入) 結束-->		
    </ul>
<!-- 右邊欄位開結束 -->    
  </div>
</nav>
