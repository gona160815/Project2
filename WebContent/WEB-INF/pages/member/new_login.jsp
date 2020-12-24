<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <link rel="icon8" href="/docs/4.0/assets/img/favicons/favicon.ico">

            <title>追風者｜會員登入</title>
            <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
            <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/floating-labels/">

            <!-- Bootstrap core CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

            <!-- Custom styles for this template -->
            <link href="css/floating-labels.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@300&display=swap" rel="stylesheet">
            <!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <style>
                    body {
                        font-family: Microsoft JhengHei;
                        background-color: #f5f5f5;
                        font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                        color: #333333;
                    }
                </style>
        </head>
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://www.google.com/recaptcha/api.js?render=6LdL6eQZAAAAAJ-U7FECqP6agndtDxtrrop-aZtc"></script>

        <body>
            <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>

                <div class="card m-auto " style="top: 40px; width: 600px;background-color: rgba(255, 255, 255, 0.9);">
                    <form class="form-signin" action="memberLogin.controller" method="post">
                        <div class="text-center mb-4">
                            <img class="p-2 mb-4" src="img/bicycle.png" alt="" width="100" height="100">
                            <h1 class="h3 mb-3 font-weight-normal">立即登入，享受服務。</h1>
                            <p id="result" style="color:red;"></p>
                            <!-- <p>Build form controls with floating labels via the <code>:placeholder-shown</code> pseudo-element. <a href="https://caniuse.com/#feat=css-placeholder-shown">Works in latest Chrome, Safari, and Firefox.</a></p> -->
                        </div>

                        <div class="form-label-group ">
                            <input type="email" id="inputEmail" class="form-control " placeholder="Email" value="${requestScope.user}${param.account}" name="account" required="" autofocus=""> <label for="inputEmail">Email</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control" placeholder="密碼" value="${requestScope.CookiePassword}${param.password}" name="password" required=""> <label for="inputPassword">密碼</label>
                        </div>

                        <div class="checkbox mb-3 text-center">

                            <input class="m-1" type="checkbox" name="rememberMe" id="rm" <c:if test='${requestScope.rememberMe==true}'> checked='checked'
                            </c:if>
                            value="true"/>
                            <label class="m-1"> 記住帳密</label>
                        </div>
                        <button class="btn btn-lg btn-dark btn-block g-recaptcha" id="login" type="button" data-sitekey="6LdL6eQZAAAAAJ-U7FECqP6agndtDxtrrop-aZtc" data-callback='onClick' data-action='login'>登入</button>
                        <button class="btn btn-danger btn-lg btn-block" type="button" id="btnSignIn"><i class="fab fa-google">使用google帳號登入</i></button>
                        <button class="btn btn-primary btn-lg btn-block" type="button" onclick="FBLogin()"><i class="fab fa-facebook-square">使用facebook帳號登入</i></button>
                        <!--<button class="btn btn-primary btn-lg btn-block" type="button" onclick="FBlogout()"><i class="fab fa-facebook-square">facebook帳號登出</i></button>-->
                        <div class="my-2 mb-2">
                            <button class="w-50 float-left btn-warning btn-lg btn-inline" type="button" onclick="Admin()"><i class="fa fa-user-secret">管理員</i></button>
                            <button class="w-50 float-right btn-success btn-lg btn-inline " type="button" onclick="Member()"><i class="fa fa-user-circle">一般會員</i></button>

                        </div>

                        <!-- <button class="g-recaptcha" 
        		data-sitekey="6LdL6eQZAAAAAJ-U7FECqP6agndtDxtrrop-aZtc" 
        		data-callback='onSubmit' 
        		data-action='submit'>Submit</button> -->
                        <p class="my-3 text-muted text-center inline-text">
                            <a class="m-4  text-decoration-none inline-text" href="registPage">加入會員</a>
                            <a class="m-4  text-decoration-none inline-text" href="forgetPasswordPage">忘記密碼</a> <a class="m-4  text-decoration-none inline-text" href="#">聯絡我們</a>
                        </p>



                    </form>
                    <input type="hidden" id="url" value="${url}" />
                    <input type="hidden" id="token" value="" />
                    <input type="hidden" id="remember" value="" />

                    <!--引用Google Sign-in必須的.js，callback function(GoogleSigninInit)名稱自訂 -->
                    <!-- <script async defer src="https://apis.google.com/js/api.js"
            onload="this.onload=function(){};GoogleClientInit();GoogleSigninInit()"
            onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>  -->
                    <script src="https://apis.google.com/js/platform.js?onload=GoogleSigninInit" async defer></script>

                    <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
                        <script type="text/javascript">
                            //jQuery

                            console.log($("#rm").val());

                            function Admin() {
                                $("#inputEmail").val("eeit124group1Admin@gmail.com");
                                $("#inputPassword").val("asd123");
                            }

                            function Member() {
                                $("#inputEmail").val("eeit124group1test@gmail.com");
                                $("#inputPassword").val("asd123");
                            }
                            <!--google-->
                            //jQuery處理button click event 當畫面DOM都載入時....
                            $(function() {
                                $("#btnSignIn").on("click", function() {
                                    GoogleLogin(); //Google 登入
                                });
                            });

                            function GoogleSigninInit() {
                                gapi.load('auth2', function() {
                                    gapi.auth2.init({
                                        client_id: "514166050422-k0sff2opmpf37l6865c1n5tnsbhi8rcj.apps.googleusercontent.com" //必填，記得開發時期要開啟 Chrome開發人員工具 查看有沒有403錯誤(Javascript來源被禁止)
                                    });
                                }); //end gapi.load
                            } //end GoogleSigninInit function

                            function GoogleClientInit() {
                                //官網範例寫client:auth2，但本人實測由於待會要呼叫gapi.client.init而不是gapi.auth2.init，所以給client即可
                                gapi.load('client', function() {
                                    gapi.client.init({
                                        //client_id 和 scope 兩者參數必填
                                        clientId: "514166050422-mqgn8ju8leg36ghp0uuj5tqhjl53m065.apps.googleusercontent.com",
                                        //scope列表參考：https://developers.google.com/people/api/rest/v1/people/get
                                        //"profile"是簡寫，要用完整scope名稱也可以
                                        scope: "https://www.googleapis.com/auth/user.addresses.read https://www.googleapis.com/auth/user.birthday.read https://www.googleapis.com/auth/user.phonenumbers.read", //"https://www.googleapis.com/auth/userinfo.profile",
                                        discoveryDocs: DISCOVERY_DOCS
                                    });


                                }); //end gapi.load
                            } //end GoogleClientInit function


                            function GoogleLogin() {
                                let auth2 = gapi.auth2.getAuthInstance(); //取得GoogleAuth物件
                                auth2.signIn().then(function(GoogleUser) {
                                        console.log("Google登入成功");
                                        let user_id = GoogleUser.getId(); //取得user id，不過要發送至Server端的話，請使用↓id_token   
                                        let AuthResponse = GoogleUser.getAuthResponse(true); //true會回傳access token ，false則不會，自行決定。如果只需要Google登入功能應該不會使用到access token
                                        let id_token = AuthResponse.id_token; //取得id_token

                                        /* $.ajax({
                    url: "googleLoging",
                    method: "post",
                    data: { id_token: id_token },
                    success: function (msg) {
                        console.log(msg.success);
                    }
                });//end $.ajax 
				*/
                                        var page2 = $("#url").val();
                                        $.ajax({
                                            url: "googleLoging",
                                            method: "post",
                                            data: {
                                                id_token: id_token
                                            },
                                            success: function(msg) {
                                                if (msg.registSuccess) { //跳轉填寫資料
                                                    $(window).attr('location', "googleInfo");
                                                }
                                                if (msg.loginSuccess) { //跳轉首頁
                                                    $(window).attr('location', page2);
                                                }
                                                if (msg.inputInfo) { //跳轉填寫資料
                                                    $(window).attr('location', "googleInfo");
                                                }
                                                if (msg.emailExist) { //帳號已存在
                                                    $("#result").text(msg.emailExist);
                                                }
                                                if (msg.error) { //報錯
                                                    $("#result").text(msg.error);
                                                }

                                            }
                                        }); //end $.ajax  

                                        /*      gapi.client.people.people.get({
                    'resourceName': 'people/me',
                    //用戶個資↓
                    'personFields': 'names,phoneNumbers,emailAddresses,addresses,residences,genders,birthdays,occupations',
                }).then(function (res) {

                        //success
                        let str = JSON.stringify(res.result);//將物件列化成string，方便顯示結果在畫面上
                        //顯示授權你網站存取的用戶個資
                         console.log(str); 
                        //↑通常metadata標記primary:true的個資就是你該抓的資料
						
                        //請再自行Parse JSON，可以將JSON字串丟到線上parse工具查看：http://json.parser.online.fr/
						var year = res.result.birthdays[0].date.year
						var month = res.result.birthdays[0].date.month
						var day = res.result.birthdays[0].date.day
						var birthday = year+"-"+month+"-"+day
						console.log(birthday);
					 	var info = {
									"birthday":birthday

									} 
                        //最終，取得用戶個資後看要填在畫面表單上或是透過Ajax儲存到資料庫(記得是傳id_token給你的Web Server而不是明碼的user_id喔)，本範例就不贅述，請自行努力XD

                }); */

                                    },
                                    function(error) {
                                        console.log("Google登入失敗");
                                        console.log(error);
                                    });

                            } //end function GoogleLogin


                            <!--FaceBook-->


                            window.fbAsyncInit = function() {
                                FB.init({
                                    appId: '836708630494599',
                                    cookie: true,
                                    xfbml: true,
                                    version: 'v9.0'
                                });

                                FB.AppEvents.logPageView();

                            };

                            (function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) {
                                    return;
                                }
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "https://connect.facebook.net/zh_TW/sdk.js";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));


                            function GetProfile() {
                                //document.getElementById('content').innerHTML = "";//先清空顯示結果

                                //FB.api()使用說明：https://developers.facebook.com/docs/javascript/reference/FB.api
                                //取得用戶個資
                                FB.api("/me", "GET", {
                                    fields: 'last_name,first_name,name,email'
                                }, function(user) {
                                    //user物件的欄位：https://developers.facebook.com/docs/graph-api/reference/user
                                    if (user.error) {
                                        console.log(response);
                                    } else {
                                        console.log(user);
                                        console.log(user.email);
                                        console.log(user.name);
                                        var name = user.name;
                                        var email = user.email;
                                        var page2 = $("#url").val();
                                        $.ajax({
                                            url: "facebookLoging",
                                            method: "post",
                                            data: {
                                                name: name,
                                                email: email
                                            },
                                            success: function(msg) {
                                                if (msg.registSuccess) { //跳轉填寫資料
                                                    $(window).attr('location', "googleInfo");
                                                }
                                                if (msg.loginSuccess) { //跳轉首頁
                                                    $(window).attr('location', page2);
                                                }
                                                if (msg.inputInfo) { //跳轉填寫資料
                                                    $(window).attr('location', "googleInfo");
                                                }
                                                if (msg.emailExist) { //帳號已存在
                                                    $("#result").text(msg.emailExist);
                                                }
                                                if (msg.error) { //報錯
                                                    $("#result").text(msg.error);
                                                }

                                            }
                                        }); //end $.ajax                    
                                    }
                                });

                            }

                            function FBLogin() {
                                FB.getLoginStatus(function(res) { //
                                    console.log('status:' + res.status); //Debug

                                    if (res.status === "connected") {
                                        let userID = res["authResponse"]["userID"];
                                        console.log("用戶已授權您的App，用戶須先revoke撤除App後才能再重新授權你的App");
                                        console.log(`已授權App登入FB 的 userID:${userID}`);
                                        GetProfile();

                                    } else if (res.status === 'not_authorized' || res.status === "unknown") {
                                        //App未授權或用戶登出FB網站才讓用戶執行登入動作
                                        FB.login(function(response) {
                                            //console.log(response); //debug用
                                            if (response.status === 'connected') {
                                                //user已登入FB
                                                //抓userID
                                                let userID = response.authResponse.userID;
                                                console.log('已授權App登入FB 的 userID:' + userID);
                                                GetProfile();


                                            } else {
                                                // user FB取消授權
                                                alert("Facebook帳號無法登入");
                                            }
                                            //"public_profile"可省略，仍然可以取得name、userID
                                        }, {
                                            scope: 'email'
                                        });
                                    }

                                });

                            }

                            function FBlogout() {
                                FB.getLoginStatus(function(response) {
                                    if (response && response.status === 'connected') {
                                        FB.logout(function(response) {
                                            document.location.reload();
                                        });
                                    }
                                });
                            }
                        </script>

                        <script>
                            $(function() {

                                grecaptcha.ready(function() {
                                    grecaptcha.execute('6LdL6eQZAAAAAJ-U7FECqP6agndtDxtrrop-aZtc', {
                                        action: 'login'
                                    }).then(function(token) {
                                        // Add your logic to submit to your backend server here.
                                        console.log("token=" + token);
                                        $("#token").val(token)

                                        //ajax to google api
                                        var info = {
                                            "secret": "6LdL6eQZAAAAAJT3kadlE1gHJmAQej4E6yQvCuu2",
                                            "response": $("#token").val(token)
                                        };
                                    });
                                });

                                <!-- normal login-->
                                var page = $("#url").val();
                                // 			alert(page);
                                var rm;
                                console.log(page)
                                $("#login").on("click", function() {
                                    if ($("#rm").prop("checked")) {
                                        $("#remember").val("123");
                                    } else {
                                        $("#remember").val();
                                    }
                                    console.log($("#remember").val());
                                    var info = {
                                        "account": $("#inputEmail").val(),
                                        "password": $("#inputPassword").val(),
                                        "rememberMe": $("#remember").val(),
                                        "token": $("#token").val()
                                    }
                                    $.ajax({
                                        type: "post",
                                        url: "memberLogin.controller",
                                        dataType: "json",
                                        data: info,
                                        success: function(data) {
                                            console.log(data);
                                            console.log(page);
                                            if (data.loginSuccess == 1) {
                                                if (page == null || page == "") {
                                                    $(window).attr('location', 'homepage');
                                                } else {
                                                    $(window).attr('location', page);
                                                }
                                            }
                                            if (data.loginSuccess == 2) {
                                                $(window).attr('location', 'adminPage.controller');
                                                //$(window).attr('location','adminPage');
                                            }
                                            if (data.loginError) {
                                                $("#result").text(data.loginError);
                                            }

                                        }
                                    });
                                });




                            })
                        </script>
                </div>



        </body>

        </html>