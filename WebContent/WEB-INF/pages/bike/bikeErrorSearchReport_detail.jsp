<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>追風者｜問題回報</title>
    <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp"%>
    <style>
        .carousel .carousel-item img {
            min-height: 200px;
            max-height: 500px;
            object-fit: cover;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>


    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
             <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-="4"></li>
<!--             <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>  -->
        </ol>

        <div class="carousel-inner">
            <div class="carousel-item active">
				<img src="<c:url value='/img/bikeroad/bike5.jpg'/>" class="d-block w-100 " alt="...">
			</div>
			 <div class="carousel-item">
                <img src="<c:url value='/img/bikeroad/bike7.jpg'/>" class="d-block w-100 " alt="...">
            </div>
            <div class="carousel-item">
                <img src="<c:url value='/img/bikeroad/bike01.jpg'/>" class="d-block w-100 " alt="...">
            </div>
            <div class="carousel-item">
                <img src="<c:url value='/img/bikeroad/bike_08.jpg'/>" class="d-block w-100 " alt="...">
            </div>
            <div class="carousel-item">
                <img src="<c:url value='/img/bikeroad/bike_05.jpg'/>" class="d-block w-100 " alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- ---------search bar------------ -->


    <!-- container -->
    <div class="container my-5">

        <p>
<%--             <a class="float-left mx-4 h4" href="#"><strong>${param.name}</strong></a> --%>
<%--             <a class="float-left mx-4 h4" href="#"><strong>${changeid}</strong></a> --%>
        </p>
        <div class="clearfix">

        </div>
        <hr class=" border-secondary" />
        <div class="card-body">
            <div class="row">
                <div class="col-md-4 pb-2 ">
<!--                     <img src="img01.jpg" class="img-thumbnail rounded mt-0" alt="..."> -->
						<h3>問題描述:</h3>
						<hr>
						${param.description}
                </div>
                <div class="col-md-8">

                    <p class="float-left ">
<%--                         <a href="#" class="badge badge-light">${param.city}</a> --%>
<%--                         <a href="#" class="badge badge-light">${param.town}</a> --%>
                    </p>
                    <div class="clearfix">

                    </div>
                    <p class="float-left badge badge-success"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
                        
                    </svg>問題序號 </p><span class="mx-2">${changeid}</span>
                    <div class="clearfix">

                    </div>
                    <p class="float-left badge badge-secondary"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>會員名稱</p>
                     <input type="hidden" name="membername" value="${loginOK.name}">
<span class="mx-2">${loginOK.name}</span>
                    <div class="clearfix">

                    </div>
                    <p class="float-left badge badge-info">
                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-octagon-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM5.496 6.033a.237.237 0 0 1-.24-.247C5.35 4.091 6.737 3.5 8.005 3.5c1.396 0 2.672.73 2.672 2.24 0 1.08-.635 1.594-1.244 2.057-.737.559-1.01.768-1.01 1.486v.105a.25.25 0 0 1-.25.25h-.81a.25.25 0 0 1-.25-.246l-.004-.217c-.038-.927.495-1.498 1.168-1.987.59-.444.965-.736.965-1.371 0-.825-.628-1.168-1.314-1.168-.803 0-1.253.478-1.342 1.134-.018.137-.128.25-.266.25h-.825zm2.325 6.443c-.584 0-1.009-.394-1.009-.927 0-.552.425-.94 1.01-.94.609 0 1.028.388 1.028.94 0 .533-.42.927-1.029.927z"/>
</svg> 問題主旨
                    </p>
                    <span class="mx-2">${param.title}</span>
                    <div class="clearfix">

                    </div>
                    <p class="float-left badge badge-warning"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z"/>
                        <path fill-rule="evenodd" d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z"/>
                      </svg>回報時間</p><span class="mx-2">${param.starttime}</span>
                      				<div class="clearfix"></div>
<!-- 					<p class="float-left badge badge-danger"> -->
					
<!-- 					</p> -->
					</button>
					</form>
                </div>





            </div>
              <div class="col-md-4 pb-2 ">
<!--                     <img src="img01.jpg" class="img-thumbnail rounded mt-0" alt="..."> -->
						<h3>客服回應:</h3>
						<hr>
						${param.reply}
                </div>
            <p class="h4 my-4"><svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
            <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
          </svg><strong class=" mx-2 my-0">錯誤圖片</strong></p>
            <hr class=" border-secondary" />
<%-- 			<iframe width="100%" height="300" frameborder="0" src="data:image/png;base64,${param.picture}"></iframe> --%>
			<iframe width="100%" height="300" frameborder="0" src="data:image/png;base64,${param.picString}"></iframe>
			<hr>
<div class="row">
<!--                 <div class="col-md-4 pb-2 "> -->
<!-- <!--                     <img src="img01.jpg" class="img-thumbnail rounded mt-0" alt="..."> --> 
<!-- 						<h3>客服回應</h3> -->
<!-- 						<hr> -->
<%-- 						${param.reply} --%>
<!--                 </div> -->
        </div>
	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
</body>

</html>