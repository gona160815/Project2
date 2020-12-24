	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
		<header class="header-area overlay">
		    <nav class="navbar navbar-expand-md navbar-dark">
		    <div class="container" style="margin-top:0px">
		    <div style="position:static;margin-left:-150px;margin-top:2px;">
		      <a href="http://localhost:8080/EEIT124Team1FinalProject/" class="navbar-brand" ><img src="<c:url value="/img/index/title.png"/>"></a>
		      </div>
		      <div id="main-nav" class="collapse navbar-collapse" style="position:absolute;left:180px">
		        <ul class="navbar-nav ml-auto">
		          <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">自行車道</a>
		            <div class="dropdown-menu">
		              <a class="dropdown-item" href="<c:url value='/newBikeIndexEntry.controller?pageNo=1'/>">自行車道</a>
                      <a class="dropdown-item" href="<c:url value='/REEntry.controller?pageNo=1'/>">補給車站</a>
                      <a class="dropdown-item" href="<c:url value='/bikeMapEntry.controller'/>">地圖規劃</a>
		            </div>
		          </li>
		          
		          <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">預約租車</a>
		            <div class="dropdown-menu">
		               <a class="dropdown-item" href="<c:url value='/bikeStorePre.controller?pageNo=1' />">門市資訊</a>
                       <a class="dropdown-item" href="<c:url value='/BikeTypeUser' />">預約租車</a>
		            </div>
		          </li>
		          
		         <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">住宿訂房</a>
		            <div class="dropdown-menu">
		              <a class="dropdown-item" href="<c:url value='/sixsix.Search.controller'/>">訂房查詢</a>
		            </div>
		          </li>
		          
		          <li class="dropdown">
		            <a href="#" class="nav-item nav-link" data-toggle="dropdown">活動資訊</a>
		            <div class="dropdown-menu">
		              	<a class="dropdown-item" href="<c:url value='/event'/>">活動首頁</a>
                        <a class="dropdown-item" href="<c:url value='/event.query'/>">活動搜尋</a>
                        <c:if test="${ !empty loginOK }"> 
	                        <a class="dropdown-item" href="<c:url value='/eventActivity'/>">規劃行程</a>
	                        <a class="dropdown-item" href="<c:url value='/myActivity'/>">個人行程表</a>
                        </c:if>
                        <c:if test="${ empty loginOK }"> 
                      		<a class="dropdown-item" href="<c:url value='/loginPage'/>">規劃行程</a>
	                        <a class="dropdown-item" href="<c:url value='/loginPage'/>">個人行程表</a>
                        </c:if>
		            </div>
		          </li>
		          
		           <!-- 會員登入(未登入) 開始--> 
			        <c:if test="${ empty loginOK }"> 
			            <li style="padding-left:650px"><a class="nav-item nav-link" href="/EEIT124Team1FinalProject/loginPage">
			                    <i class="fa fa-sign-in" style="color:white;font-size:25px;">
			                      </i>
			                    <span style="font-size:6px;text-decoration: none;">登入</span>
			                </a>
			            </li>  
			            
			            <li><a class="nav-item nav-link" href="/EEIT124Team1FinalProject/registPage">
			                    <i class="fa fa-users" style="color:white;font-size:25px;">
			                      </i>
			                    <span style="font-size:6px;text-decoration: none;">註冊</span>
			                </a>
			            </li>
			        </c:if>
			       <!-- 會員登入(未登入) 結束-->
			       
			        <!-- 會員登入(有登入) 開始-->
		            <c:if test="${! empty loginOK }"> 
			            <c:if test="${! empty loginOK.memberAdvanced.icon}">
						    <img height='50px' width='50px' style="border-radius:50%;position:absolute;left:1200px;top:10px"
							src="<c:url value='/showMemberIcon?id=${loginOK.memberId}'/>">
						</c:if>
						<c:if test="${ empty loginOK.memberAdvanced.icon}">
							<c:if test="${ empty pictureUrl}">
								<img src="<c:url value='/img/mike.jpg'/>" height='50px' width='50px'alt="Avatar" style="border-radius:50%;position:absolute;;left:1200px;top:10px">
							</c:if>	
							<c:if test="${! empty pictureUrl}">
								<img src="${pictureUrl}" height='50px' width='50px' alt="Avatar" style="border-radius:50%;position:absolute;;left:1200px;top:10px">
							</c:if>						
						</c:if>	
		            <li class="dropdown"id="membername"  style="osition:absolute;left:680px">
		            <a href="#" class="nav-item nav-link"  data-toggle="dropdown">${loginOK.name}</a>
		            <div class="dropdown-menu">
		               <a class="dropdown-item" href="<c:url value='/infoPage'/>"><i class="fa fa-user-o"></i> 會員中心</a>
	                   <a class="dropdown-item" id="logout" href="<c:url value='/memberLogout.controller'/>"><i class="fa fa-sign-out"></i> 登出</a>
		            </div>
		           </li>      
				</c:if>
<!--              		會員登入(有登入) 結束   -->
             		
		          
		        </ul>
		      </div>
		    </div>
		  </nav>
	</header>
		
		
		      <script>
        jQuery(function($) {
            $(window).on('scroll', function() {
        		if ($(this).scrollTop() >= 200) {
        			$('.navbar').addClass('fixed-top');
        		} else if ($(this).scrollTop() == 0) {
        			$('.navbar').removeClass('fixed-top');
        		}
        	});
        	
        	function adjustNav() {
        		var winWidth = $(window).width(),
        			dropdown = $('.dropdown'),
        			dropdownMenu = $('.dropdown-menu');
        		
        		if (winWidth >= 768) {
        			dropdown.on('mouseenter', function() {
        				$(this).addClass('show')
        					.children(dropdownMenu).addClass('show');
        			});
        			
        			dropdown.on('mouseleave', function() {
        				$(this).removeClass('show')
        					.children(dropdownMenu).removeClass('show');
        			});
        		} else {
        			dropdown.off('mouseenter mouseleave');
        		}
        	}
        	
        	$(window).on('resize', adjustNav);
        	
        	adjustNav();
        });
        </script>
	