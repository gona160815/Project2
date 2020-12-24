<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bike-Homepage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">
<style>
.carousel .carousel-item img {
	min-height: 600px;
	max-height: 600px;
	object-fit: cover;
}

.navbar {
	width: 100%;
	top: 0;
	position: fixed;
	box-sizing: border-box;
	z-index: +100;
}



/* .bg-light {
    background-color:#e0ffff;
    color:#e0ffff;
    } */

/* .navbar-light .navbar-nav .nav-link {
	    color: blue
	} */

/*  .navbar-light .navbar-brand {
	    color:  #e0ffff;
	} */
</style>
</head>

<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript">
	$.ajax({
		type : "post",
		url : "getAdmins",
		data : {
			authority : 2
		},
		success : function() {
		}
	})
</script>
<body>

<div class="container demo">
	
	
	<div class="text-center">
		<button type="button" class="btn btn-demo" data-toggle="modal" data-target="#myModal">
			Left Sidebar Modal
		</button>

		<button type="button" class="btn btn-demo" data-toggle="modal" data-target="#myModal2">
			Right Sidebar Modal
		</button>
	</div>

	<!-- Modal -->
	<div class="modal left fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Left Sidebar</h4>
				</div>

				<div class="modal-body">
					<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					</p>
				</div>

			</div><!-- modal-content -->
		</div><!-- modal-dialog -->
	</div><!-- modal -->
	
	<!-- Modal -->
	<div class="modal right fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel2">Right Sidebar</h4>
				</div>

				<div class="modal-body">
					<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
					</p>
				</div>

			</div><!-- modal-content -->
		</div><!-- modal-dialog -->
	</div><!-- modal -->
	
	
</div><!-- container -->

<footer class="demo-footer">
	<a href="http://www.bootpen.com" target="_blank">Get more code snippets</a>
</footer>
	
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalRelatedContent">Launch
  modal</button>

<!--Modal: modalRelatedContent-->
<div class="modal fade right" id="modalRelatedContent" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-top-right  modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <p class="heading">Related article</p>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

        <div class="row">
          <div class="col-5">
            <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(55).jpg"
              class="img-fluid" alt="">
          </div>

          <div class="col-7">
            <p><strong>My travel to paradise</strong></p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit [...]</p>
            <button type="button" class="btn btn-info btn-md">Read more</button>

          </div>
        </div>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>

<!-- Side Modal Top Right -->

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sideModalTR">
  Launch demo modal
</button>

<!-- To change the direction of the modal animation change .right class -->
<div class="modal fade right" id="sideModalTR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-side and then add class .modal-top-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-side modal-top-right modal-info" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title w-100" id="myModalLabel">加入行程表</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-md" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-info btn-md">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- Side Modal Top Right -->
	
	
	
	
	
	
	
	
	
<!-- 	<div id="carouselExampleIndicators" class="carousel slide" -->
<!-- 		data-ride="carousel" data-interval="1500"> -->
<!-- 		<ol class="carousel-indicators"> -->
<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="0" -->
<!-- 				class="active"></li> -->
<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li> -->
<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li> -->
<!-- 			<li data-target="#carouselExampleIndicators" data-slide-="4"></li> -->
<!-- 			<li data-target="#carouselExampleIndicators" data-slide-to="5"></li> -->
<!-- 		</ol> -->
<!-- 		<div class="carousel-inner"> -->
<!-- 			<div class="carousel-item active"> -->
<%-- 				<img src="<c:url value='image/S__71647237.jpg'/>" --%>
<!-- 					class="d-block w-100 " alt="..."> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item"> -->
<%-- 				<img src="<c:url value='image/S__71647238.jpg'/>" --%>
<!-- 					class="d-block w-100 " alt="..."> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item"> -->
<%-- 				<img src="<c:url value='/image/S__71647234.jpg'/>" --%>
<!-- 					class="d-block w-100 " alt="..."> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item"> -->
<%-- 				<img src="<c:url value='/image/S__71647239.jpg'/>" --%>
<!-- 					class="d-block w-100 " alt="..."> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item"> -->
<%-- 				<img src="<c:url value='/image/S__71647240.jpg'/>" --%>
<!-- 					class="d-block w-100 " alt="..."> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item"> -->
<%-- 				<img src="<c:url value='/image/S__71647241.jpg'/>" --%>
<!-- 					class="d-block w-100 " alt="..."> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<a class="carousel-control-prev" href="#carouselExampleIndicators" -->
<!-- 			role="button" data-slide="prev"> <span -->
<!-- 			class="carousel-control-prev-icon" aria-hidden="true"></span> <span -->
<!-- 			class="sr-only">Previous</span> -->
<!-- 		</a> <a class="carousel-control-next" href="#carouselExampleIndicators" -->
<!-- 			role="button" data-slide="next"> <span -->
<!-- 			class="carousel-control-next-icon" aria-hidden="true"></span> <span -->
<!-- 			class="sr-only">Next</span> -->
<!-- 		</a> -->
<!-- 	</div> -->

	<div class="container marketing">

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					<a href="<c:url value='bike/bikeindex.jsp' />">首先，選擇最適合你的自行車道吧</a>
					<br>
					<h6 class="text-muted">
						上千條車道任君挑選
						</h5>
				</h2>
				<p class="lead">收錄全台各縣市自行車道資訊，依照個人需求挑選出今天要騎的路線吧！</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
	        <image
						xlink:href="https://taiwanbike.tw/att/ablum/02000021/b_14000209.jpg">
	      </svg>
			</div>
		</div>
		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading">
					<a href="<c:url value='/EventsController' />">騎累了嗎？不妨停下來走走</a> <br>
					<h6 class="text-muted">
						各種活動總會有適合你的</span>
					</h6>
				</h2>
				<p class="lead">
					幫你整理了娛樂、展覽、親子、文化，及音樂等類型的活動。<br>我都放在那裡了，自己去找吧！
				</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
	      <image
						xlink:href="https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2019-07/e4ec8aa0-9bf9-11e9-87df-d417487db9c0"
						width="600" height="400">
	      </svg>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					<a href="<c:url value='/RetrievePageStore' />">你終究是要升級的，何不一開始就升</a>
					<br>
					<h6 class="text-muted">台灣首家自行車線上商城上線啦(目前只有租借服務的啦)</h6>
				</h2>
				<p class="lead">登入就送S級煞車皮，各種福利商品不必VIP10就能擁有</p>
			</div>
			<div class="col-md-5">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
        <image
						xlink:href="https://www.sportscience.com.tw/data/image/article/3a/d7/c2/eb/d88136e43d2cce49c42e2ed.jpg?v=1563206371"
						width="600" height="400">
        </svg>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading">
					<a href="<c:url value='Hotel/homestay.jsp' />">流了一整天的汗，辛苦了</a> <br>
					<h6 class="text-muted">
						約泡湯嗎，約嗎約嗎</span>
					</h6>
					<p class="lead">
						忙碌了一天，你值得睡一場好覺。<br>不必再換網頁找住宿了，這裡都幫你想好了！
					</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="500" height="500" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
        <image
						xlink:href="https://www.fun-taiwan.com/Images/HousePhotos/657201.jpg"
						width="600" height="400">
        </svg>
			</div>
		</div>

		<hr class="featurette-divider">

	</div>
	<!-- /.container -->


	<!-- FOOTER -->
	<footer class="container">
		<p class="float-right">
			<a href="#">Back to top</a>
		</p>
		<!-- <p>© 2017-2020 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p> -->
	</footer>


	<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
</body>

</html>