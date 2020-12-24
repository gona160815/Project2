<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>追風者</title>
    <script src="https://kit.fontawesome.com/731d88c153.js" crossorigin="anonymous"></script>
    <!-- bootstrap-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- -->
    <link rel="stylesheet" href="css/index/all.css">
    <link rel="stylesheet" href="css/index/flickity.css">
    <link rel="stylesheet" href="css/index/flickity-global.css">
    <link rel="stylesheet" href="css/index/page-index.css">
    <link rel="stylesheet" href="css/index/instagram-photo-light-box.css">
    <link type="text/css" rel="stylesheet" charset="UTF-8" href="css/index/translateelement.css">
    <link type="text/css" rel="stylesheet" href="css/index/banner.css">
    <!-- -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index/common.css">

    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="/img/apple-touch-icon-precomposed.png">


    <style>
           .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        
        .l-header a:hover {
            text-decoration: none;
            color: #ebe7e7;
        }
        .l-header{
        	margin:0px;
        }
        
        .l-header a{
         	color:white;
         	text-decoration: none;
        }
        
        .l-header li{
         	list-style-type:none;
        }
        
        .l-global {
		    box-sizing: border-box;
		    font-weight: 500;
		    height: 65px;
		    padding: 0 20px;
		    position: absolute;
		    left:110px;
		    margin-top:15px;
		}
    </style>

</head>

<body style="position: relative; min-height: 100%; top: 0px;">

    <!-- ==================================nav =================================== -->
    <header id="header" class="l-header">
        <div class="l-header__logo">
            <a href="http://localhost:8080/EEIT124Team1FinalProject/">
                <picture>
                    <source media="(max-width: 640px)">
                    <img src="img/index/title.png" alt="" title="" class="op" style="padding-top:130px">
                </picture>
            </a>
        </div>
        <!-- -----------上方列左邊開始----------- -->
        <nav class="l-global">
            <ul class="l-global__list1">
                <li><a href="#" style="font-size: 18px;">自行車道</a>
                    <ul class="below" style="font-size: 16px;">
                        <li><a href="<c:url value='/newBikeIndexEntry.controller?pageNo=1'/>">自行車道</a></li>
                        <li><a href="<c:url value='/REEntry.controller?pageNo=1'/>">補給車站</a></li>
                        <li><a href="<c:url value='/bikeMapEntry.controller'/>">地圖規劃</a></li>
                    </ul>
                </li>
                <li><a href="#" style="font-size: 18px;">預約租車</a>
                    <ul class="below" style="font-size: 16px;">
                        <li><a href="<c:url value='/bikeStorePre.controller?pageNo=1' />">門市資訊</a></li>
                        <li><a href="<c:url value='/BikeTypeUser' />">預約租車</a></li>
                    </ul>
                </li>
                <li><a href="#" style="font-size: 18px;">住宿訂房</a>
                    <ul class="below" style="font-size: 16px;">
                        <li><a href="<c:url value='/sixsix.Search.controller'/>">訂房查詢</a></li>
                    </ul>
                </li>
                <li><a href="#" style="font-size: 18px;">活動資訊</a>
                    <ul class="below" style="font-size: 16px;">
                        <li><a href="<c:url value='/event'/>">活動首頁</a></li>
                        <li><a href="<c:url value='/event.query'/>">活動搜尋</a></li>
                        <c:if test="${ !empty loginOK }"> 
	                        <li><a href="<c:url value='/eventActivity'/>">規劃行程</a></li>
	                        <li><a href="<c:url value='/myActivity'/>">個人行程表</a></li>
                        </c:if>
                        <c:if test="${ empty loginOK }"> 
                      		<li><a href="<c:url value='/loginPage'/>">規劃行程</a></li>
	                        <li><a href="<c:url value='/loginPage'/>">個人行程表</a></li>
                        </c:if>
                    </ul>
                </li>
                
              <!-- 會員登入(有登入) 開始-->
              <c:if test="${! empty loginOK }">

             	 <c:if test="${! empty loginOK.memberAdvanced.icon}">
				    <img height='50px' width='50px' style="border-radius:50%;position:absolute;left:1050px"
					src="<c:url value='/showMemberIcon?id=${loginOK.memberId}'/>">
				</c:if>
				<c:if test="${ empty loginOK.memberAdvanced.icon}">
					<c:if test="${ empty pictureUrl}">
						<img src="<c:url value='/img/mike.jpg'/>" height='50px' width='50px'alt="Avatar" style="border-radius:50%;position:absolute;left:1050px">
					</c:if>	
					<c:if test="${! empty pictureUrl}">
						<img src="${pictureUrl}" height='50px' width='50px' alt="Avatar" style="border-radius:50%;position:absolute;left:1050px">
					</c:if>						
				</c:if>

                 	<li><a href="#" style="font-size: 18px;left:710px">${loginOK.name}</a>         
                    <ul class="below" style="font-size: 16px;left:750px">
	                       <li><a  href="<c:url value='/infoPage'/>"><i class="fa fa-user-o"></i> 會員中心</a></li>
	                       <li><a id="logout" href="<c:url value='/memberLogout.controller'/>"><i class="fa fa-sign-out"></i> 登出</a></li>
                    </ul>
                </li>
              </c:if>
             <!-- 會員登入(有登入) 結束-->  
                
            </ul>
            <!-- -----------上方列左邊結束----------- -->



        </nav>
        <!-- 會員登入(未登入) 開始-->
        <c:if test="${ empty loginOK }"> 
        <ul class="l-global__list1" style="padding:1rem;">
            <li style="padding:0.5rem;text-align:center;">
                <a href="/EEIT124Team1FinalProject/loginPage">
                    <i class="fa fa-sign-in" style="color:white;font-size:32px;">
                      </i><br>
                    <span style="font-size: 10px;text-decoration: none;">登入</span>
                </a>
            </li>
            <li style="padding:0.5rem;text-align:center;">
                <a href="/EEIT124Team1FinalProject/registPage">
                    <i class="fa fa-users" style="color:white;font-size:32px;">
                      </i><br>
                    <span style="font-size: 10px;text-decoration: none;">註冊</span>
                </a>
            </li>
        </ul>
        </c:if>
        <!-- 會員登入(未登入) 結束-->
        
        <button id="nav-switch" class="l-header__btn1" aria-label="menu"><div class="inbox"><span class="nav-switch-line01"></span><span class="nav-switch-line02"></span><span class="nav-switch-line03"></span></div></button>
    </header>

    <div class="main-container" style="padding-top:0px;margin-top: 0%;">

        <!--======================== 上方圖片輪播開始========================-->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" style="max-height: 650px">
                <div class="carousel-item active">
                    <img src="img/index/list01.jpg" class="d-block w-100" style="position:buttom">
                </div>
                <div class="carousel-item">
                    <img src="img/index/list01.jpg" class="d-block w-100" style="top:400px">
                </div>
                <div class="carousel-item">
                    <img src="img/index/list01.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- ========================上方圖片輪播結束======================== -->

        <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8">
            <h2 class="text-heavy fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">最新活動</h2>
            <p class="text-dark fz-15px fz-md-18px text-center mb-1 mb-md-4">一手掌握最新的旅遊訊息</p>
            <div class="row mx-0 mx-xl-n12px max-width-xl-with-padding">
                <section class="col-12 col-xl-6 px-0 pr-xl-12px mb-3 mb-md-5 mb-xl-0">
                    <div class="p-2 px-md-3 py-md-0 bg-white rounded">
                        <h2 class="text-heavy fz-24px font-weight-bold mb-1">最新活動<small class="ml-1">NEW</small></h2>
                        <ul class="mb-1">
                            <li class="border-top">
                                <a class="d-block d-md-flex align-items-center text-decoration-none py-1 py-md-2 hover-title position-relative" href="https://www.sunmoonlake.gov.tw/zh-tw/event/news/808" title="日月潭周邊步道實施管制說明">
                                    <div class="d-flex align-items-center flex-shrink-0 mb-1 mb-md-0 mr-md-2 text-heavy fz-15px">
                                        <small class="d-inline-flex align-items-center h-3 bg-light-blue px-1 mr-4px rounded">
                                            2020-06-03 </small> <small class="d-inline-flex align-items-center h-3 px-1 rounded"> 旅遊安全 </small>
                                    </div>
                                    <div class="title text-truncate text-heavy font-weight-bold fz-18px">日月潭周邊步道實施管制說明
                                    </div><i class="icon icon-flag w-2 h-2 text-secondary absolute-top-right" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="border-top">
                                <a class="d-block d-md-flex align-items-center text-decoration-none py-1 py-md-2 hover-title position-relative" href="https://www.sunmoonlake.gov.tw/zh-tw/event/news/803" title="防疫宣導、紓困相關資訊(持續更新)">
                                    <div class="d-flex align-items-center flex-shrink-0 mb-1 mb-md-0 mr-md-2 text-heavy fz-15px">
                                        <small class="d-inline-flex align-items-center h-3 bg-light-blue px-1 mr-4px rounded">
                                            2020-05-13 </small> <small class="d-inline-flex align-items-center h-3 px-1 rounded"> 其他公告 </small>
                                    </div>
                                    <div class="title text-truncate text-heavy font-weight-bold fz-18px">
                                        防疫宣導、紓困相關資訊(持續更新)</div><i class="icon icon-flag w-2 h-2 text-secondary absolute-top-right" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="border-top">
                                <a class="d-block d-md-flex align-items-center text-decoration-none py-1 py-md-2 hover-title position-relative" href="https://www.sunmoonlake.gov.tw/zh-tw/event/news/949" title="向山遊客中心第三展覽室、行政中心男廁暫時關閉公告">
                                    <div class="d-flex align-items-center flex-shrink-0 mb-1 mb-md-0 mr-md-2 text-heavy fz-15px">
                                        <small class="d-inline-flex align-items-center h-3 bg-light-blue px-1 mr-4px rounded">
                                            2020-12-15 </small> <small class="d-inline-flex align-items-center h-3 px-1 rounded"> 其他公告 </small>
                                    </div>
                                    <div class="title text-truncate text-heavy font-weight-bold fz-18px">
                                        向山遊客中心第三展覽室、行政中心男廁暫時關閉公告</div>
                                </a>
                            </li>
                            <li class="border-top">
                                <a class="d-block d-md-flex align-items-center text-decoration-none py-1 py-md-2 hover-title position-relative" href="https://www.sunmoonlake.gov.tw/zh-tw/event/news/930" title="110年元旦連假公共運輸優惠">
                                    <div class="d-flex align-items-center flex-shrink-0 mb-1 mb-md-0 mr-md-2 text-heavy fz-15px">
                                        <small class="d-inline-flex align-items-center h-3 bg-light-blue px-1 mr-4px rounded">
                                            2020-11-26 </small> <small class="d-inline-flex align-items-center h-3 px-1 rounded"> 交通資訊 </small>
                                    </div>
                                    <div class="title text-truncate text-heavy font-weight-bold fz-18px">110年元旦連假公共運輸優惠
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <div class="d-flex justify-content-center pt-4px"><a href="https://www.sunmoonlake.gov.tw/zh-tw/event/newslist" title="更多最新快訊" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
                    </div>
                </section>
                <div class="col-12 col-xl-6 px-0 px-xl-12px mb-6 mb-xl-0">
                    <div class="index-event-slider flickity-enabled is-draggable" id="index-event-slider" tabindex="0">
                        <div class="flickity-viewport" style="height: 314px; touch-action: pan-y;">
                            <div class="flickity-slider" style="left: 0px; transform: translateX(-400%);">
                                <div class="item is-selected" key="item-11" style="position: absolute; left: 400%;" aria-selected="true">
                                    <a href="https://www.sunmoonlake.gov.tw/zh-tw/content/TripleCoupon.html" class="link" title="三倍券優惠專區(另開視窗)" rel="noopener noreferrer" target="_blank">
                                        <div class="thumb-frame embed-responsive embed-responsive-2by1">
                                            <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/compressed_004.jpg" data-src="/zh-tw/image/4229/compressed" alt="三倍券優惠專區" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                                        src=/zh-tw/image/4229/compressed alt=三倍券優惠專區
                                                        class="thumb embed-responsive-item"></noscript></picture>
                                        </div>
                                    </a>
                                </div>
                                <div class="item" key="item-9" style="position: absolute; left: 100%;" aria-selected="false">
                                    <a href="https://i30.taiwan.net.tw/" class="link" title="2020脊梁山脈旅遊年(另開視窗)" rel="noopener noreferrer" target="_blank">
                                        <div class="thumb-frame embed-responsive embed-responsive-2by1">
                                            <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/compressed_006.jpg" data-src="/zh-tw/image/3512/compressed" alt="2020脊梁山脈旅遊年" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                                        src=/zh-tw/image/3512/compressed alt=2020脊梁山脈旅遊年
                                                        class="thumb embed-responsive-item"></noscript></picture>
                                        </div>
                                    </a>
                                </div>
                                <div class="item" key="item-7" style="position: absolute; left: 200%;" aria-selected="false">
                                    <a href="https://theme.sunmoonlake.gov.tw/breakthought" class="link" title="勇闖日月潭 三大運動認證(另開視窗)" rel="noopener noreferrer" target="_blank">
                                        <div class="thumb-frame embed-responsive embed-responsive-2by1">
                                            <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/compressed_008.jpg" data-src="/zh-tw/image/3194/compressed" alt="勇闖日月潭 三大運動認證" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                                        src=/zh-tw/image/3194/compressed alt="勇闖日月潭 三大運動認證"
                                                        class="thumb embed-responsive-item"></noscript></picture>
                                        </div>
                                    </a>
                                </div>
                                <div class="item" key="item-3" style="position: absolute; left: 300%;" aria-selected="false">
                                    <a href="https://theme.sunmoonlake.gov.tw/activities/goldfiles/" class="link" title="檔案應用(另開視窗)" rel="noopener noreferrer" target="_blank">
                                        <div class="thumb-frame embed-responsive embed-responsive-2by1">
                                            <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/compressed.png" data-src="/zh-tw/image/1214/compressed" alt="檔案應用" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                                        src=/zh-tw/image/1214/compressed alt=檔案應用
                                                        class="thumb embed-responsive-item"></noscript></picture>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div><button class="flickity-button flickity-prev-next-button previous" type="button" aria-label="Previous"><svg class="flickity-button-icon" viewBox="0 0 100 100">
                                <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow"></path>
                            </svg></button><button class="flickity-button flickity-prev-next-button next" type="button" aria-label="Next"><svg class="flickity-button-icon" viewBox="0 0 100 100">
                                <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow"
                                    transform="translate(100, 100) rotate(180) "></path>
                            </svg></button>
                        <ol class="flickity-page-dots">
                            <li class="dot is-selected" aria-label="Page dot 1" aria-current="step"></li>
                            <li class="dot" aria-label="Page dot 2"></li>
                            <li class="dot" aria-label="Page dot 3"></li>
                            <li class="dot" aria-label="Page dot 4"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <div class="px-2 px-md-3 px-xl-0 py-4 py-md-6 py-xl-8 border-top max-width-xl mx-auto">
            <ul class="row mb-2">
                <li class="col-12 col-md-6 col-lg-3 mb-2 align-items-stretch d-md-flex">
                    <a href="https://www.sunmoonlake.gov.tw/zh-tw/forward?sn=25678" class="d-block text-decoration-none rounded shadow hover-title position-relative d-md-flex flex-column miw-0 w-100" rel="noopener noreferrer" title="2020精選！全台19處「落羽松景點」懶人包 湖上森林、落羽松步道一次看(另開視窗)"
                        target="_blank">
                        <div class="title bg-light-blue p-2 fz-18px text-heavy w-100">
                            <div class="line-clamp-2">2020精選！全台19處「落羽松景點」懶人包 湖上森林、落羽松步道一次看</div>
                        </div>
                        <div class="p-2 bg-white fz-15px flex-fill"><small class="d-block text-info mb-1"> MISC </small>
                            <div class="text-dark line-clamp-3 mb-4px"></div><small class="text-heavy"> 2020-12-18
                            </small>
                        </div>
                    </a>
                </li>
                <li class="col-12 col-md-6 col-lg-3 mb-2 align-items-stretch d-md-flex">
                    <a href="https://www.sunmoonlake.gov.tw/zh-tw/forward?sn=25676" class="d-block text-decoration-none rounded shadow hover-title position-relative d-md-flex flex-column miw-0 w-100" rel="noopener noreferrer" title="【超級商城】用心做好茶，日月潭傳承一甲子的頂級紅茶 - HUGOSUM和菓森林紅茶莊園(另開視窗)"
                        target="_blank">
                        <div class="title bg-light-blue p-2 fz-18px text-heavy w-100">
                            <div class="line-clamp-2">【超級商城】用心做好茶，日月潭傳承一甲子的頂級紅茶 - HUGOSUM和菓森林紅茶莊園</div>
                        </div>
                        <div class="p-2 bg-white fz-15px flex-fill"><small class="d-block text-info mb-1"> Yahoo奇摩新聞
                            </small>
                            <div class="text-dark line-clamp-3 mb-4px"></div><small class="text-heavy"> 2020-12-17
                            </small>
                        </div>
                    </a>
                </li>
                <li class="col-12 col-md-6 col-lg-3 mb-2 align-items-stretch d-none d-lg-flex">
                    <a href="https://www.sunmoonlake.gov.tw/zh-tw/forward?sn=25677" class="d-block text-decoration-none rounded shadow hover-title position-relative d-md-flex flex-column miw-0 w-100" rel="noopener noreferrer" title="全台唯一不靠海的縣市玩法！南投埔里「異國風夢幻景點＋清幽住宿」(另開視窗)"
                        target="_blank">
                        <div class="title bg-light-blue p-2 fz-18px text-heavy w-100">
                            <div class="line-clamp-2">全台唯一不靠海的縣市玩法！南投埔里「異國風夢幻景點＋清幽住宿」</div>
                        </div>
                        <div class="p-2 bg-white fz-15px flex-fill"><small class="d-block text-info mb-1"> UDN 聯合新聞網
                            </small>
                            <div class="text-dark line-clamp-3 mb-4px"></div><small class="text-heavy"> 2020-12-17
                            </small>
                        </div>
                    </a>
                </li>
                <li class="col-12 col-md-6 col-lg-3 mb-2 align-items-stretch d-none d-lg-flex">
                    <a href="https://www.sunmoonlake.gov.tw/zh-tw/forward?sn=25692" class="d-block text-decoration-none rounded shadow hover-title position-relative d-md-flex flex-column miw-0 w-100" rel="noopener noreferrer" title="響應「2021台灣自行車旅遊年」 日月潭引進電輔自行車吸睛(另開視窗)" target="_blank">
                        <div class="title bg-light-blue p-2 fz-18px text-heavy w-100">
                            <div class="line-clamp-2">響應「2021台灣自行車旅遊年」 日月潭引進電輔自行車吸睛</div>
                        </div>
                        <div class="p-2 bg-white fz-15px flex-fill"><small class="d-block text-info mb-1"> 工商時報 </small>
                            <div class="text-dark line-clamp-3 mb-4px"></div><small class="text-heavy"> 2020-12-16
                            </small>
                        </div>
                    </a>
                </li>
            </ul>
            <div class="d-flex justify-content-center mt-xl-auto"><a href="https://www.sunmoonlake.gov.tw/zh-tw/reports" title="更多 旅遊新聞" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
        </div>
        <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding bg-lake lake-02">
            <h2 class="text-white fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">活動推薦</h2>
            <p class="text-white fz-15px fz-md-18px text-center mb-1 mb-md-3">敘述文字敘述文字敘述文字</p>
            <ul class="row mb-4 index-event-list">
                <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/event/calendardetail/466" title="2021日月雙響．幸福加倍 跨年晚會">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/360x240_002.jpg" data-src="/zh-tw/image/5629/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5629/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">2020-12-31～2021-01-01</small>
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">2021日月雙響．幸福加倍 跨年晚會
                                </div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/event/calendardetail/933" title="2021日月潭櫻花季">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/360x240_003.jpg" data-src="/zh-tw/image/5612/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5612/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">1月</small>
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">2021日月潭櫻花季
                                </div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/event/calendardetail/924" title="日月潭春季自行車活動">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/360x240.jpg" data-src="/zh-tw/image/5479/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5479/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">3月</small>
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">日月潭春季自行車活動
                                </div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="item col-12 col-md-4 col-lg-3 d-flex mb-2 mb-md-0">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/event/calendardetail/932" title="2021日月潭星光螢火季">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/360x240_004.jpg" data-src="/zh-tw/image/5613/360x240" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/image/5613/360x240 alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100"><small class="d-block text-heavy mb-md-4px fz-15px">4月</small>
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">2021日月潭星光螢火季
                                </div>
                            </div>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="d-flex justify-content-center mt-xl-auto"><a href="https://www.sunmoonlake.gov.tw/zh-tw/event/calendar" title="更多活動" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
        </section>


        <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding">
            <h2 class="text-heavy fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">經典車道</h2>
            <p class="text-dark fz-15px fz-md-18px text-center mb-1 mb-md-3">敘述文字敘述文字敘述文字</p>
            <div class="index-recommend-blk d-lg-flex">
                <ul class="row mb-3 mb-md-2 mb-lg-0 index-recommend-list">

                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="新北淡水河左岸自行車道 ">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad01.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                新北淡水河左岸自行車道 </div>
                        </a>
                    </li>


                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="臺北河濱自行車道">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad02.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                臺北河濱自行車道 </div>
                        </a>
                    </li>



                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="新北市大漢及新店溪自行車道 ">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad03.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                新北市大漢及新店溪自行車道 </div>
                        </a>
                    </li>



                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="東北角舊草嶺環狀自行車道">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad04.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                東北角舊草嶺環狀自行車道 </div>
                        </a>
                    </li>



                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="宜蘭冬山河自行車道">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad05.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                宜蘭冬山河自行車道</div>
                        </a>
                    </li>


                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="南投集集綠色隧道暨環鎮自行車道">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad06.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                南投集集綠色隧道自行車道 </div>
                        </a>
                    </li>


                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="日月潭自行車道系統 ">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad07.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                日月潭自行車道系統 </div>
                        </a>
                    </li>

                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="臺中東豐自行車綠廊 ">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <source media="(min-width: 768px)">
                                    <img src="img/index/bikeRoad08.jpg" data-src="/zh-tw/Content/images/index/new-8view-01.jpg" class="thumb embed-responsive-item lazyloaded">
                                    <noscript><img src=/zh-tw/Content/images/index/new-8view-01.jpg 
                                             class="thumb embed-responsive-item">
                                    </noscript>
                                </picture>
                            </div>
                            <div class="text-white hover-bg-white-80 bg-black-50 p-1 text-truncate absolute-bottom-left w-100 fz-15px">
                                臺中東豐自行車綠廊</div>
                        </a>
                    </li>


                    <li class="item col-12 col-md-4 col-md-4 mb-1 mb-md-2">
                        <a class="d-block text-decoration-none position-relative rounded overflow-hidden" href="#" title="更多景點">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture>
                                    <img src="img/index/bikeRoad09.jpg" data-src="/zh-tw/content/images/index/attraction.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/content/images/index/attraction.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="d-flex justify-content-center align-items-center text-white bg-black-50 hover-bg-white-80 p-1 text-truncate absolute-top-left w-100 h-100 fz-15px">
                                看更多</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="d-flex d-md-none justify-content-center mt-xl-auto"><a href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/list" title="更多景點" class="btn btn-outline-primary w-100 mw-300px"> 看更多 </a></div>
        </section>


        <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding bg-bike">
            <h2 class="text-white fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-1">近期熱門住宿</h2>
            <p class="text-white fz-15px fz-md-18px text-center mb-1 mb-md-3">敘述文字敘述文字</p>
            <ul class="row mb-4 index-bike-list">
                <li class="item col-12 col-md-3">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/cycling-tannan" title="環潭、潭南區">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/bike-list-01.jpg" data-src="/zh-tw/Content/images/static/bike/bike-list-01.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/Content/images/static/bike/bike-list-01.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">環潭、潭南區</div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="item col-12 col-md-3">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/cycling-puli" title="埔里區">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/bike-list-02.jpg" data-src="/zh-tw/Content/images/static/bike/bike-list-02.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/Content/images/static/bike/bike-list-02.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">埔里區</div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="item col-12 col-md-3">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/cycling-che-cheng" title="水里、車埕區">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/bike-list-03.jpg" data-src="/zh-tw/Content/images/static/bike/bike-list-03.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/Content/images/static/bike/bike-list-03.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">水里、車埕區</div>
                            </div>
                        </a>
                    </div>
                </li>
                <li class="item col-12 col-md-3">
                    <div class="thumb-info-card w-100 bg-white shadow rounded vertical">
                        <a class="frame w-100 text-decoration-none d-flex position-relative hover-title rounded overflow-hidden" href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/cycling-ji-ji" title="集集區">
                            <div class="thumb-frame embed-responsive embed-responsive-4by3">
                                <picture> <img src="%E6%97%A5%E6%9C%88%E6%BD%AD%E8%A7%80%E5%85%89%E6%97%85%E9%81%8A%E7%B6%B2_files/bike-list-04.jpg" data-src="/zh-tw/Content/images/static/bike/bike-list-04.jpg" alt="" class="thumb embed-responsive-item lazyloaded"><noscript><img
                                            src=/zh-tw/Content/images/static/bike/bike-list-04.jpg alt=""
                                            class="thumb embed-responsive-item"></noscript></picture>
                            </div>
                            <div class="info-blk d-flex align-content-start flex-wrap py-1 px-12px miw-0 w-100">
                                <div class="title w-100 text-dark fz-16px font-weight-bold line-clamp-2">集集區</div>
                            </div>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="d-flex justify-content-center mt-xl-auto"><a href="https://www.sunmoonlake.gov.tw/zh-tw/attractions/sml-cycling" title="單車追風" class="btn btn-outline-white w-100 mw-300px"> 看更多 </a></div>
        </section>
        <section class="px-2 px-md-3 py-4 py-md-6 py-xl-8 max-width-xl-with-padding bg-lake lake-03">
            <h2 class="text-heavy fz-28px fz-md-36px text-center font-weight-bold mb-4px mb-md-4 mb-lg-5">規劃一趟屬於自己的自行車行程!
            </h2>
            <ul class="row mb-3">
                <li class="col-6 col-md-3 px-md-2 px-lg-5">
                    <a class="d-block text-decoration-none position-relative hover-title" href="http://www.sunmoonlaketrip.net/" title="日月潭台灣好行(另開視窗)" target="_blank">
                        <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded">
                            <i class="icon icon-bus-stop absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i></div>
                        <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">自行車道</div>
                    </a>
                </li>
                <li class="col-6 col-md-3 px-md-2 px-lg-5">
                    <a class="d-block text-decoration-none position-relative hover-title" href="https://www.taiwantourbus.com.tw/C/tw/home" title="台灣觀巴(另開視窗)" target="_blank">
                        <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="/zh-tw/Content/images/index/index-bg-tour-02.jpg" style="background-image: url(&quot;/zh-tw/Content/images/index/index-bg-tour-02.jpg&quot;);">
                            <i class="icon icon-bus absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i></div>
                        <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">單車租借</div>
                    </a>
                </li>
                <li class="col-6 col-md-3 px-md-2 px-lg-5">
                    <a class="d-block text-decoration-none position-relative hover-title" href="https://ntbus.welcometw.com/" title="南投假期(另開視窗)" target="_blank">
                        <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="/zh-tw/Content/images/index/index-bg-tour-03.jpg" style="background-image: url(&quot;/zh-tw/Content/images/index/index-bg-tour-03.jpg&quot;);">
                            <i class="icon icon-bike absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i></div>
                        <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">住宿訂房</div>
                    </a>
                </li>
                <li class="col-6 col-md-3 px-md-2 px-lg-5">
                    <a class="d-block text-decoration-none position-relative hover-title" href="https://www.railway.gov.tw/tra-tip-web/tip/tip00C/tipC19/view10" title="集集鐵路(另開視窗)" target="_blank">
                        <div class="rounded-circle position-relative w-100 overflow-hidden embed-responsive embed-responsive-1by1 mb-1 lazyloaded" data-bg="/zh-tw/Content/images/index/index-bg-tour-04.jpg" style="background-image: url(&quot;/zh-tw/Content/images/index/index-bg-tour-04.jpg&quot;);">
                            <i class="icon icon-train absolute-top-left text-white fz-48px fz-md-64px fz-lg-100px w-100 h-100 bg-indigo-70" aria-hidden="true"></i></div>
                        <div class="title text-heavy text-center fz-20px fz-md-24px font-weight-bold">行程規劃</div>
                    </a>
                </li>
            </ul>
        </section>

        <footer class="footer-wrapper pt-8 bg-lake lake-04">

            <div class="footer d-flex flex-column flex-md-row align-items-center pb-8 pb-xl-4 flex-lg-row justify-content-md-center align-items-md-start mx-auto">
                <span class="d-block mt-1" style="position:absolute;left:280px;bottom:63px">
                    <img src="iii.png"  alt="Sustainable_Destina" class="thumb embed-responsive-item" >
                </span>
                <div class="mx-md-6 d-xl-flex">
                    <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center text-md-left">
                        <p class="mb-1 font-weight-bold text-white fz-14px fz-md-15px">EEIT124第一組</p>
                        <p class="mb-1">黃祐善　徐浩然　葉政廷</p>
                        <p class="mb-1">黃喻喧　張文軒</p><br>
                        <p class="mb-1 font-weight-bold text-white fz-14px fz-md-10px">本網站只做為學習使用</p>
                        <p class="mb-1 font-weight-bold text-white fz-14px fz-md-10px">絕不用於任何商業用途</p>
                    </div>
                    <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center">
                        <p class="mb-1 font-weight-bold text-white fz-14px fz-md-15px">資料/圖片來源</p>
                        <p class="mb-1">捷安特自行車</p>
                        <p class="mb-1">日月潭觀光旅遊網</p>
                        <p class="mb-1">台灣自行車旅遊網</p>
                        <p class="mb-1">格上租車</p>
                        <p class="mb-1">資料來源</p>
                    </div>
                    <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center">
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                    </div>
                    <div class="blk mb-2 mr-xl-6 text-white fz-12px fz-md-13px text-center">
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                        <p class="mb-1">資料來源</p>
                    </div>

                </div>
        </footer>
        </div>
        >
</body>

</html>