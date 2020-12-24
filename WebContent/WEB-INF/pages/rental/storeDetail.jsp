<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS" />
<meta name="robots" content="index,follow" />
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<!-- <link rel="stylesheet" type="text/css" href="https://www.campjo.com/css/import.css"/> -->
<!-- <link rel="stylesheet" type="text/css" href="https://www.campjo.com/css/thickbox_siteimage.css"/> -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/store/storeDetail.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/store/storeDetail02.css'/>"/>

	<script type="text/javascript">
	
	</script>
	<style>
	.thisButton {
	  background-color: white;
	  border: none;
	  color: white;
	  padding: 16px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  border-radius:15px;
	}
	 .button3 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #00395c;
	}

	.button3:hover {
	  background-color: #00395c;
	  color: white;
	}
	
	#main-nav a{
       color:white;
       text-decoration:none;
    }
         
	</style>

<title>追風者｜${store.st_name}</title>
<!-- google tracking code -->
<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-3582078-2']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();

</script>

</head>
<body onload="JavaScript:initRollovers();JavaScript:BtnOutdoor();">
<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
<div id="container">
<!--head-->

<!--main-->
<!-- FB留言 -->
<div id="fb-root"></div> 
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v9.0" nonce="Zqzuck8p"></script>
<!-- FB分享 -->
<!-- <div id="fb-root"></div> -->
<!-- <script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v9.0" nonce="GwmrtU1g"></script> -->


<div id="area_main" style="margin-top:20px;">
	<div class="wrapper_main">
		<!--foot stamp-->
		<div id="commain">
			
			<div id="camp_head" >
				<div id="camp_head_tittle" style="padding-bottom:0px;">
                    
                    <h1 style="font-size:40px;color:#4F4F4F;font-weight:bold">${store.st_name}</h1><br>
				
		<!-- 分享 -->
				<div id="camp_head_tittle_btn">
 						<div class="line-it-button" style="display: none;" data-lang="zh_Hant" data-type="share-a" data-ver="3" data-url="http://localhost:8080/EEIT124Team1FinalProject/storeDetail?storeId=${store.store_id}" data-color="default" data-size="large" data-count="false"></div>
 						<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
						<div class="fb-share-button" data-href="http://localhost:8080/EEIT124Team1FinalProject/storeDetail?storeId=${store.store_id}" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8080%2FEEIT124Team1FinalProject%2FstoreDetail%3FstoreId%3D${store.store_id}&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">分享</a></div>
				</div>
			</div>
			<div id="camp_imgarea">
				<div id="camp_imgarea_left"> 
					<div id="mainimg">
						<img id="mainimg_img" src="/storeImage/${store.st_imgFile1}" width="460" height="345" alt="" title="">
					</div>
					
                    <div id="camp_slide">
                        <div id="slider-stage" style="width:1392px;">
                            <ul id="slider-list">
                                
                                    <li><a href="JavaScript:document.getElementById('mainimg_img').src='/storeImage/${store.st_imgFile1}';JavaScript:void(0);"><img class="camp_imgover" src="/storeImage/${store.st_imgFile1}" width="120" height="84" style="padding-right:10px"></a></li>
                                
                                    <li><a href="JavaScript:document.getElementById('mainimg_img').src='/storeImage/st_1606985954262.jpg';JavaScript:void(0);"><img class="camp_imgover" src="/storeImage/st_1606985954262.jpg" width="120" height="84" style="padding-right:10px"></a></li>
                                
                                    <li><a href="JavaScript:document.getElementById('mainimg_img').src='/storeImage/st_1606986151459.jpg';JavaScript:void(0);"><img class="camp_imgover" src="/storeImage/st_1606986151459.jpg" width="120" height="84" style="padding-right:10px"></a></li>
                                   
                                    <li><a href="JavaScript:document.getElementById('mainimg_img').src='/storeImage/st_1606987020437.jpg';JavaScript:void(0);"><img class="camp_imgover" src="/storeImage/st_1606987020437.jpg" width="120" height="84" style="padding-right:0px"></a></li>
                           
                            </ul>
                        </div>
                        <div id="camp_slide-buttons_back" style="display:none;">
                            <a href="javascript:void(0);" id="previous"><img class="imgover" src="https://www.campjo.com/images/top/btn_check_left.gif" width="21" height="47" alt="back" title="back"></a>
                        </div>
                        <div id="camp_slide-buttons_next" style="display:none;">
                            <a href="javascript:void(0);" id="next"><img class="imgover" src="https://www.campjo.com/images/top/btn_check_right.gif" width="21" height="47" alt="next" title="next"></a>
                        </div>
                        <script type="text/javascript">
                         set_recentslider(12,1392);      
                        </script>
                    </div>
                
					
				</div>
				<div id="camp_imgarea_right" style="margin-top:0px">
					<div id="copy">詳細資料</div>
					

                <div id="camp_detail" style="padding:1px 0px">
                    <div id="camp_detail_left" style="padding:1px 0px">
                        <div class="camp_detail_block" ><div class="th" >門市地址</div><div class="td">${store.st_address}</div></div>
                        <div class="camp_detail_block"><div class="th">營業時間</div><div class="td">${store.st_bgtime}~${store.st_edtime}</div></div>
                        <div class="camp_detail_block"><div class="th">休息日</div><div class="td">${store.st_holiday}</div></div>
                        <div class="camp_detail_block"><div class="th">連絡電話</div><div class="td">${store.st_tel}</div></div>
                        <div class="camp_detail_block"><div class="th">聯絡信箱</div><div class="td">${store.st_mail}</div></div>
                        <input type="button" class="thisButton button3" style="padding:15px 200px;margin-top:15px" value="前往預約" onclick="location.href='BikeTypeUser'">
                    </div>
                </div>
				</div>
            </div>



			<div id="camp_map_tle" style="margin-top:0px;padding-top:0px">
				<i class="fa fa-map-marker" aria-hidden="true" style="font-size:25px;color:	#4F4F4F"></i><span  style="font-size:25px;color:#4F4F4F" >&nbsp&nbsp地圖資訊</span>
			</div>
			<div style="float:left;width:490px;">
				<iframe width="980" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='${store.st_address}'&z=18&output=embed&t="></iframe>
			</div>
			<div id="camp_map_tle" style="margin-top:0px;padding-top:30px">
				<i class="fa fa-facebook-square" aria-hidden="true" style="font-size:25px;color:#4F4F4F"></i><span  style="font-size:25px;color:#4F4F4F" >&nbsp&nbspFB留言</span>
			</div>
			<div style="margin:0 auto" class="fb-comments" data-href="http://localhost:8080/EEIT124Team1FinalProject/storeDetail?storeId=${store.store_id}" data-width="940" data-numposts="5"></div>
		</div>
		
	</div>
	
</div>
<!--foot-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/btn_outdoor.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/pagescroller.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/jquery.cookie.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/recent.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/rollover.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/campimg_slide.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/main.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/pagetop.js"></script>
<script type="text/javascript" src="https://www.campjo.com/js/thickbox_siteimage.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?v=3.7&sensor=false"></script>

	</div>
</div>

</div>
  <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>
</html>
