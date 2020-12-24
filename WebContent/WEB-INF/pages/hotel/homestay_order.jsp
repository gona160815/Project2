<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
<title>追風者｜訂房</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->



<style>
         #fuckOutside { 
             margin-top: 40px; 
             margin-bottom: 30px; 
             box-shadow: 1px 1px 2px 2px #cccccc; 
             padding: 15px; 
             border-radius:10px; 
            
         } 

        .insideBorder {
            /* margin: 10px; */
        }

        .col {
            /* width: 500px; */
            /* height: 350px; */
            /* border: 1px solid rgb(42, 209, 70); */
        }

        .rightText {
        	font-weight:500;
        	font-size:16px;
            float: right;
        }

        .leftText {
        	font-weight:500;
        	font-size:16px;
            float: left;
        }

        input {
            /* border: 1px solid #B3D6EF;
            background: #ffffff; */
            border-radius: 5px;
        }

        input {
            star : expression(onmouseover=function() {
                    this.style.backgroundColor="#D5E9F6"
                }

                ,
                onmouseout=function() {
                    this.style.backgroundColor="#ffffff"
                }

            )
        }
        
         
         #main-nav{
             margin-left:30px;	
         }
                        
         #main-nav a{
             color:white;
         }
         
         #membername{
          margin-left:45px;
         }
        
    </style>


</head>
<body>
	
	
	
	<div>
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
	



	<div class="container" id="fuckOutside">


        <div class="row">
            <div class="col insideBorder">

                <div>
                    <div>
                        <div style="float: left;box-shadow:0px 3px 3px 3px #cccccc;">
                            <c:choose>

                                <c:when test="${chg.picturel != null }">
                                    <img src="${chg.picturel }" class="card-img-top" alt="飯店照片" style="width:400px;height:350px;"
                                        data-target="image-preview">
                                </c:when>
                                <c:otherwise>
                                    <img src="img/hotel_image/d4940929.jpg" class="card-img-top" style="width:400px;height:350px;"
                                        alt="飯店照片" data-target="image-preview">
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <span
                            style="margin-left:5px;margin-right: 5px;float: left;font-size: .7647058823529411em;color: #616161;padding: 20px;width:300px;height:350px;">
                            <span style=" color:black;font-weight: bold; font-size:2.5em">${chg.name }</span>
                            <br>
                            <br>
                            <span style="font-weight: bold;">${countStarNum }/5</span> 太讚了 (${hotelMomentNum }則評論)
                            <br>旅客給了住宿清潔度 ${countStarNum }/5 的評價。
                            <br>
                            <br>
                            <span style="font-weight: bold;">房型：</span>${houseTypeName }
                            <br>
                            <br>
                            <span style="color: #d40035;font-weight: 400;font-size: inherit; line-height: inherit;"><i
                                    class="fa fa-info-circle fa-6" aria-hidden="true"></i>不得退款</span>
                            <br>
                            <br>
                            <span style="font-weight: bold;">入住：</span> ${startDate }
                            <br>
                            <br>
                            <span style="font-weight: bold;">退房：</span> ${endDate }
                            <br>
                            <br>
                           		<span style="font-weight: bold;font-size:16px;"> 共${daysize }晚住宿</span>
                            <br>
                        </span>

						
                        <c:choose>
                            <c:when test="${houseType==5}">
                                <div style="float: left;">
                                    <img style="margin 5px;box-shadow:0px 3px 3px 3px #cccccc; width:400px;height:350px;"
                                        src="img/hotel_image/twohouse.jpg" class="card-img-top dddiv" alt="...">
                                </div>
                            </c:when>
                            <c:when test="${houseType==6}">
                                <div style="float: left;">
                                    <img style="margin 5px;box-shadow:0px 3px 3px 3px #cccccc;width:400px;height:350px;" 
                                        src="img/hotel_image/threehouse.jpg" class="card-img-top dddiv" alt="...">
                                </div>
                            </c:when>
                            <c:when test="${houseType==7}">
                                <div style="float: left;">
                                    <img style="margin 5px;box-shadow:0px 3px 3px 3px #cccccc;width:400px;height:350px;"
                                        src="img/hotel_image/familyhouse.jpg" class="card-img-top dddiv" alt="...">
                                </div>
                            </c:when>
                        </c:choose>
                    </div>

                    <div style="float: left;">
                        <br>
                        <label style="font-size: 1.3rem;line-height: 1.4;color: #616161;font-weight: 700;">會員姓名：</label>
                        <input class="input_control" type="text" value="${loginOK.name }" readonly>
						<br>
                        <label style="font-size: 1.3rem;line-height: 1.4;color: #616161;font-weight: 700;">會員電話：</label>
                        <input class="input_control" type="text" value="${loginOK.tel }" readonly>
                        <br>
						<label style="font-size: 1.3rem;line-height: 1.4;color: #616161;font-weight: 700;">Ｍａｉｌ：</label>
                        <input class="input_control" type="text" value="${loginOK.email }" style="width:300px;" readonly>
                        
                    </div>
                    					
                    
                </div>
					

            </div>
				
            <hr>

            <div class="w-100"></div>

            <div class="col insideBorder">
                <div>
                    <br>
                    <div style="color: #00355f;font-weight: bold;font-size:25px;">價格詳情：</div>
                    <div style="text-align:right;">
                    <c:choose>
                            <c:when test="${daysize==0 }">
                                <a href="sixsix.BookingHouseDetail.controller?homenum=<c:out value=" ${houseid }" />"
                                class="btn btn-danger">請重新輸入日期區間(不可為0天)</a>
                            </c:when>
                            <c:when test="${daysize!=0 }">
                                <form action="sixsix.HotelCheckingOK.controller" method="post" id="sendOK">

                                    <input type="hidden" name="houseType" value="${houseType }" />
                                    <input type="hidden" name="daySize" value="${daysize }" />
                                    <input type="hidden" name="totalMoney" value="${totalMoney }" />
                                    <input type="hidden" name="memberTotalDays" value="${memberTotalDays }" />
                                    <input type="hidden" name="houseid" value="${houseid }" />
									
                                    <button type="button" class="btn btn-info" id="checkOKBooking" >確認下訂</button>
                                </form>

                            </c:when>
                        </c:choose>
                    </div>
                    <hr>
                    <div><span class="leftText">共${daysize }晚</span><span class="rightText">NT<fmt:formatNumber type="number" value="${totalMoneyNotTax }" maxFractionDigits="2"/></span>
                    </div>
                    <br>
                    <div><span class="leftText">稅金和費用：</span><span class="rightText">NT<fmt:formatNumber type="number" value="${tax }" maxFractionDigits="2"/></span></div>
                    <br>
                    <br>
                    <c:choose>
                        <c:when test="${(daysize)>=5}">
                            <i class="fa fa-tags fa-6"
                                style="border:5px solid yellow;border-radius:10px ; background-color:yellow;"
                                aria-hidden="true">
                                <span style="color: #465280; font-size: 1.1rem;" id="sale">8折優惠 </span>
                            </i>
                        </c:when>
                        <c:when test="${(daysize)>=3 && (daysize)<5}">
                            <i class="fa fa-tags fa-6"
                                style="border:5px solid yellow;border-radius:10px ; background-color:yellow;"
                                aria-hidden="true">
                                <span style="color: #465280; font-size: 1.1rem;" id="sale">9折優惠 </span>
                            </i>
                        </c:when>
                    </c:choose>
                    <br>
                    <hr>
                    <div style="color: #1f1f1f;font-weight: bold;font-size:30px;"><span class="leftText" style="color: #1f1f1f;font-weight: bold;font-size:30px;">總計：</span><span
                            class="rightText" style="color: #1f1f1f;font-weight: bold;font-size:30px;">NT <fmt:formatNumber type="number" value="${totalMoney }" maxFractionDigits="2"/></span></div>
                </div>
            </div>
        </div>

	</div>

    </div>

	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
	
	

	<script>
	$(function(){
		$("#checkOKBooking").click(function(){
			
			const swalWithBootstrapButtons = Swal.mixin({
				  customClass: {
				    confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				  },
				  buttonsStyling: false
				})
			
			swalWithBootstrapButtons.fire({
				  title: "確定下訂？",
				  text: "下訂後將無法取消！",
				  imageUrl: "https://mypaper.pchome.com.tw/show/article/rxfj7vljph/A1378224089",
				  showCancelButton: true,
				  confirmButtonColor: "#3cb371",
				  confirmButtonText: "确定！",
				  cancelButtonText: "取消！",
				  closeOnConfirm: false,
				  closeOnCancel: false,
				}).then((result) => {
					if(result.isConfirmed){
						swalWithBootstrapButtons.fire('下訂成功！', '', 'success').then((result1) =>{
							if(result1.isConfirmed){
								$("#sendOK").submit();
							}
						})
					}	else if (result.dismiss === Swal.DismissReason.cancel){
						swalWithBootstrapButtons.fire('取消！", "請再參考看看！', '', 'info','#3cb371')
					}
				})
				
			
		});
	});
	
	
	
	</script>

	

</body>
</html>