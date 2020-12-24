<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>event</title>

            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.16/jquery.timepicker.min.css" integrity="sha512-GgUcFJ5lgRdt/8m5A0d0qEnsoi8cDoF0d6q+RirBPtL423Qsj5cI9OxQ5hWvPi5jjvTLM/YhaaFuIeWCLi6lyQ==" crossorigin="anonymous"
                />
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js" integrity="sha512-s5u/JBtkPg+Ff2WEr49/cJsod95UgLHbC00N/GglqdQuLnYhALncz8ZHiW/LxDRGduijLKzeYb7Aal9h3codZA==" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
                <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

                <style>
                    @import url(https://fonts.googleapis.com/css?family=Open+Sans);
                    body {
                        font-family: 'Open Sans', sans-serif;
                    }
                    
                    .scrollby {
                        bottom: 50px;
                        position: fixed;
                        right: 10px;
                    }
                </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>


                <div class="container my-1">
                    <!-- HOMEPAGE EVENTCAT EVENTID -->
                    <div id="backtop" class="font-weight-light text-secondary  ">
                        <span class="text-left "><a class="text-decoration-none" href="#"><i class="text-decoration-none text-muted fas fa-home">首頁</i></a></span>
                        <span class="text-left "><a class="text-decoration-none text-muted" href="#">/ 行程規劃</a></span>


                    </div>
                    <div class="font-weight-light text-secondary text-left">

                    </div>
                </div>

                <!-- container -->
                <div class="container my-5">
                    <input id="memberId" type="hidden" value="${loginOK.memberId}">
                    <input id="actNameId" type="hidden" value="${activity.actNameId}">
                    <div>
                        <h3 class="">個人行程規劃表
                        </h3>
                        <p class="input-group">
                            <input id="name" type="text" class="form-control col-sm-3 border-0 " value="${name}" />
                            <span class="text-center h4 col-sm-7">總金額：<i style="color:rgb(248, 225, 14);" class="totalPrice fas fa-dollar-sign">${totalPrice}</i></span>
                            <span id="update" class="mx-2 col-sm-1 btn btn-outline-success ">更新</span>
                            <span id="plus" class="col-sm-1 btn btn-outline-primary "><i class="fas fa-plus"></i>新增</span>
                        </p>
                        <hr/>
                    </div>
                    <div id="myAct" class="row">



                    </div>

                </div>
                <!-- back to top -->
                <div class="m-2 scrollby ">
                    <span>
                        <a href="#" class="btn btn-secondary shadow">

                            <i class=" fa fa-2x fa-angle-up"></i>
                        </a>
                    </span>
                </div>



                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                <script src="../js/event/event_activity_update.js"></script>


                <script>
                    $('.scrollby').scrollspy({
                        target: '#backtop'
                    });
                </script>
        </body>

        </html>