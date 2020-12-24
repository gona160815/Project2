<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/pages/global/new_frontEnd_header.jsp" %>
    <title>追風者｜訂房</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link href="css/hotel/head.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- Vendor CSS Files -->
	<link href="css/hotel/bootstrap.min.css" rel="stylesheet">
	<link href="css/hotel/icofont.min.css" rel="stylesheet">
	<link href="css/hotel/boxicons.min.css" rel="stylesheet">
	<link href="css/hotel/venobox.css" rel="stylesheet">
	<link href="css/hotel/owl.carousel.min.css" rel="stylesheet">
	<link href="css/hotel/aos.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
        
      }

      .carousel .carousel-item img {
	min-height: 600px;
	max-height: 600px;
	object-fit: cover;
}

.navbar {
	width: 100%;
	top: 0;
	box-sizing: border-box;

}

select {

    text-align: center;
    text-align-last: center;
    border-radius: 0px 0px 0px 5px;
}
    </style>
    <!-- Custom styles for this template -->
    <link href="css/hotel/carousel.css" rel="stylesheet">
  </head>
  <body>
  
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"></script>

<main role="main">
<%@ include file="/WEB-INF/pages/global/new_frontEnd_top.jsp" %>

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
   
    <div class="carousel-caption" id="header" style="position:absolute;height:35%;top:25%;opacity:0.92;">
      <!-- 搜索欄位 ------------------->     
                    <div class="container" >     
                        <h1 style="font-size:1.8cm;font-weight:bold;">主標題主標題</h1>
                        <h3>副標題副標題副標題副標題副標題副標題副標題</h3>
                    </div> 

                    <div class="s01">
                      <form>
                        <div class="inner-form">
              
                          <div class="input-field box">
                            <select name="" id="">
                              <option>選項一</option>
                              <option>選項二</option>
                              <option>選項三</option>
                            </select>
                            <!-- <input id="search" type="text" placeholder="What are you looking for?" /> -->
                          </div>
                          <div class="input-field second-wrap">
                            <input id="location" type="text" placeholder="location" />
                          </div>
                          <div class="input-field third-wrap">
                            <button class="btn-search" type="button">Search</button>
                          </div>
                        </div>
                      </form>
                    </div>   
                    <a href="#hot" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>        
     <!-- 搜索欄位 -------------------------->
     </div>
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>


    <!-- ------------輪播圖片---------------- -->

    <div class="carousel-inner" >
      <div class="carousel-item active" >
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" ><rect width="100%" height="100%" fill="#777" im/></svg>
        <img class="bd-placeholder-img"  src="img/index/list01.jpg" alt="圖片一"/>
        <div class="container">
          <div class="carousel-caption text-left">
          </div>
        </div>
      </div>
  
      <div class="carousel-item" >
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <img class="bd-placeholder-img"  src="img/index/list01.jpg" alt="圖片二"/>
        <div class="container">         
        </div>
      </div>

      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <img class="bd-placeholder-img"  src="img/index/list01.jpg" alt="圖片三"/>
        <div class="container">
          <div class="carousel-caption text-right">
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
 <!-- ------------輪播圖片---------------- -- >

  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row" id="header">    
      <h1 class="col-lg-4"><a href="#hot" class="scrollto" style="text-decoration:none;"><img  src="img/hotel_image/fire.png"   style="padding-right:5%;padding-bottom:15px;"/>熱門排行</a></h1>
      <h1 class="col-lg-4" ><a href="#like" class="scrollto" style="text-decoration:none;"><img  src="img/hotel_image/like.png" style="padding-right:5%;padding-bottom:8px;"/>精選住宿</a></h1>
      <h1 class="col-lg-4" ><a href="#area" class="scrollto" style="text-decoration:none;"><img  src="img/hotel_image/star.png" style="padding-right:5%;padding-bottom:8px;"/>熱門地區</a></h1>
    </div>

   <!-- ================================================== -->
  <!-- 第一區塊 -->
  <div class="out" data-aos="fade-up" style="margin:100px auto;" id="hot" >
  <h1 class="col-lg-4" style="margin:50px auto" ><img  src="img/hotel_image/fire.png" alt="熱門" style="padding-right:5%;padding-bottom:15px;"/>熱門排行</h1>
    <div class="row">
      
      <div class="col-lg-4" >
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>Heading</h2>
        <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
        <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>Heading</h2>
        <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
        <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
        <h2>Heading</h2>
        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>

    <!-- START THE FEATURETTES -->

    <!-- ================================================== -->
  <!-- 第二區塊 -->
  <div class="out" data-aos="fade-up" style="margin:80px auto;" id="like" >
    <h1 class="col-lg-4" style="margin:50px auto" ><img  src="img/hotel_image/like.png"  style="padding-right:5%;padding-bottom:15px;"/>精選住宿</h1>
      <div class="row">
        
        <div class="col-lg-4" >
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
    </div>
  
      <!-- START THE FEATURETTES -->
    <!-- /END THE FEATURETTES -->



   <!-- ================================================== -->
  <!-- 第三區塊 -->
  <div class="out" data-aos="fade-up" style="margin:80px auto;" id="area" >
    <h1 class="col-lg-4" style="margin:50px auto" ><img  src="img/hotel_image/star.png" alt="熱門" style="padding-right:5%;padding-bottom:15px;"/>熱門排行</h1>
      <div class="row">
        
        <div class="col-lg-4" >
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
    </div>
  
      <!-- START THE FEATURETTES -->
    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
 <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>  
</main>
<!-- Vendor JS Files -->
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script src="js/hotel/counterup.min.js"></script>
<script src="js/hotel/isotope.pkgd.min.js"></script>
<script src="js/hotel/venobox.min.js"></script>
<script src="js/hotel/owl.carousel.min.js"></script>
<script src="js/hotel/aos.js"></script>

<!-- Template Main JS File -->
<script src="js/hotel/indexmain.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</html>
