<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/731d88c153.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- chatroom_client -->
<link href="css/member/chatroom_client.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="css/member/chat.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/member/chat.css">
<link rel="Shortcut Icon" type="image/x-icon" href="<c:url value='img/bikeIcon.png'/>" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/member/chatroom_client.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
		carousel-inner img {
		    width: 100%;
		    height: 100%;
		}
		
		@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700,800');
		@import url('https://fonts.googleapis.com/css?family=Lobster');
		.navbar {
/* 		    position: absolute; */
		    display:block;
		    left: 0;
		    top: 0;
		    padding: 0;
		    width: 100%;
		    background-color: #36c1b3d5;
		    transition: background 0.6s ease-in;
		    z-index: 9999;
		    margin-top:0px;
		}
		
		.navbar .navbar-brand {
		    font-family: 'Lobster', cursive;
		    font-size: 1.5rem;
		}
		
		.navbar .navbar-toggler {
		    position: relative;
		    height: 30px;
		    width: 50px;
		    border: none;
		    cursor: pointer;
		    outline: none;
		}
		
		.navbar .navbar-toggler .menu-icon-bar {
		    position: absolute;
		    left: 5px;
		    right: 5px;
		    height: 2px;
		    background-color: #fff;
		    opacity: 0;
		    -webkit-transform: translateY(-1px);
		    -ms-transform: translateY(-1px);
		    transform: translateY(-1px);
		    transition: all 0.3s ease-in;
		}
		
		.navbar .navbar-toggler .menu-icon-bar:first-child {
		    opacity: 1;
		    -webkit-transform: translateY(-1px) rotate(45deg);
		    -ms-sform: translateY(-1px) rotate(45deg);
		    transform: translateY(-1px) rotate(45deg);
		}
		
		.navbar .navbar-toggler .menu-icon-bar:last-child {
		    opacity: 1;
		    -webkit-transform: translateY(-1px) rotate(135deg);
		    -ms-sform: translateY(-1px) rotate(135deg);
		    transform: translateY(-1px) rotate(135deg);
		}
		
		.navbar .navbar-toggler.collapsed .menu-icon-bar {
		    opacity: 1;
		}
		
		.navbar .navbar-toggler.collapsed .menu-icon-bar:first-child {
		    -webkit-transform: translateY(-7px) rotate(0);
		    -ms-sform: translateY(-7px) rotate(0);
		    transform: translateY(-7px) rotate(0);
		}
		
		.navbar .navbar-toggler.collapsed .menu-icon-bar:last-child {
		    -webkit-transform: translateY(5px) rotate(0);
		    -ms-sform: translateY(5px) rotate(0);
		    transform: translateY(5px) rotate(0);
		}
		
		.navbar-dark .navbar-nav .nav-link {
		    position: relative;
		    color: #fff;
		    font-size: 1.2rem;
		}
		
		.navbar-dark .navbar-nav .nav-link:focus,
		.navbar-dark .navbar-nav .nav-link:hover {
		    color: #fff;
		}
		
		.navbar .dropdown-menu {
		    padding: 0;
		    background-color: rgba(56, 56, 56, 0.712);
		}
		
		.navbar .dropdown-menu .dropdown-item {
		    position: relative;
		    padding: 10px 10px;
		    color: #fff;
		    font-size: 1.2rem;
		    border-bottom: 1px solid rgba(255, 255, 255, .1);
		    transition: color 0.2s ease-in;
		}
		
		.navbar .dropdown-menu .dropdown-item:last-child {
		    border-bottom: none;
		}
		
		.navbar .dropdown-menu .dropdown-item:hover {
		    background: transparent;
		    color: #ffffff;
		}
		
		.navbar .dropdown-menu .dropdown-item::before {
		    content: '';
		    position: absolute;
		    bottom: 0;
		    left: 0;
		    top: 0;
		    width:10px;
		    background-color: #ffffff;
		    opacity: 0;
		    transition: opacity 0.2s ease-in;
		}
		
		.navbar .dropdown-menu .dropdown-item:hover::before {
		    opacity: 1;
		}
		
		.navbar.fixed-top {
		    position: fixed;
		    -webkit-animation: navbar-animation 0.6s;
		    animation: navbar-animation 0.6s;
		    background-color: #36c1b3d5;
		}
		
		.navbar.fixed-top.navbar-dark .navbar-nav .nav-link.active {
		    color: #ffffff;
		}
		
		.navbar.fixed-top.navbar-dark .navbar-nav .nav-link::after {
		    background-color: #ffffff;
		}
		
		.content {
		    padding: 120px 0;
		}
		
		@media screen and (max-width: 768px) {
		    .navbar-brand {
		        margin-left: 5px;
		    }
		    .navbar-nav {
		        padding: 0 20px;
		        background-color: #36c1b3d5;
		    }
		    .navbar.fixed-top .navbar-nav {
		        background: transparent;
		    }
		}
		
		@media screen and (min-width: 767px) {
		    .banner {
		        padding: 0 15px;
		    }
		    .banner h1 {
		        font-size: 5rem;
		    }
		    .banner p {
		        font-size: 2rem;
		    }
		    .navbar-dark .navbar-nav .nav-link {
		        padding: 23px 15px;
		    }
		    .navbar-dark .navbar-nav .nav-link::after {
		        content: '';
		        position: absolute;
		        bottom: 15px;
		        left: 1%;
		        right: 10%;
		        height: 1px;
		        background-color: #fff;
		        -webkit-transform: scaleX(0);
		        -ms-transform: scaleX(0);
		        transform: scaleX(0);
		        transition: transform 0.1s ease-in;
		    }
		    .navbar-dark .navbar-nav .nav-link:hover::after {
		        -webkit-transform: scaleX(1);
		        -ms-transform: scaleX(1);
		        transform: scaleX(1);
		    }
		    .dropdown-menu {
		        min-width: 200px;
		        top:65px;
		        -webkit-animation: dropdown-animation 0.3s;
		        animation: dropdown-animation 0.3s;
		        -webkit-transform-origin: top;
		        -ms-transform-origin: top;
		        transform-origin: top;
		    }
		}
		
		@-webkit-keyframes navbar-animation {
		    0% {
		        opacity: 0;
		        -webkit-transform: translateY(-100%);
		        -ms-transform: translateY(-100%);
		        transform: translateY(-100%);
		    }
		    100% {
		        opacity: 1;
		        -webkit-transform: translateY(0);
		        -ms-transform: translateY(0);
		        transform: translateY(0);
		    }
		}
		
		@keyframes navbar-animation {
		    0% {
		        opacity: 0;
		        -webkit-transform: translateY(-100%);
		        -ms-transform: translateY(-100%);
		        transform: translateY(-100%);
		    }
		    100% {
		        opacity: 1;
		        -webkit-transform: translateY(0);
		        -ms-transform: translateY(0);
		        transform: translateY(0);
		    }
		}
		
		@-webkit-keyframes dropdown-animation {
		    0% {
		        -webkit-transform: scaleY(0);
		        -ms-transform: scaleY(0);
		        transform: scaleY(0);
		    }
		    75% {
		        -webkit-transform: scaleY(1.1);
		        -ms-transform: scaleY(1.1);
		        transform: scaleY(1.1);
		    }
		    100% {
		        -webkit-transform: scaleY(1);
		        -ms-transform: scaleY(1);
		        transform: scaleY(1);
		    }
		}
		
		@keyframes dropdown-animation {
		    0% {
		        -webkit-transform: scaleY(0);
		        -ms-transform: scaleY(0);
		        transform: scaleY(0);
		    }
		    75% {
		        -webkit-transform: scaleY(1.1);
		        -ms-transform: scaleY(1.1);
		        transform: scaleY(1.1);
		    }
		    100% {
		        -webkit-transform: scaleY(1);
		        -ms-transform: scaleY(1);
		        transform: scaleY(1);
		    }
		}
	</style>
	
	
