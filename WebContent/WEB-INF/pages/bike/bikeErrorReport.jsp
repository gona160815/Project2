<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html>

        <head>
            <title>追風者｜問題回報</title>
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp" %>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                <style>
                    .carousel .carousel-item img {
                        min-height: 200px;
                        max-height: 500px;
                        object-fit: cover;
                    }
                    
                    #topimg img {
                        min-height: 200px;
                        max-height: 200px;
                        object-fit: cover;
                    }
                    
                    #top-block {
                        height: 200px;
                        width: 100%;
                        background-color: #f5f5f5;
                        top: 0;
                        background-position: 50%;
                        background-repeat: no-repeat;
                        background-size: cover;
                        overflow: hidden;
                        position: relative;
                        background-image: url("img/bikeroad/bike5.jpg");
                    }
                    
                    #top-box {
                        background-size: cover;
                        overflow: hidden;
                        position: absolute;
                        width: 100%;
                        height: 100%;
                        top: 0px;
                        left: 0px;
                        display: block;
                        background: rgba(0, 0, 0, 0.3);
                        transition: opacity 0.5s ease-in-out;
                        color: #FFF;
                        text-align: center;
                    }
                    
                    #title {
                        position: relative;
                        text-align: center;
                        top: 50px;
                        font-family: "Material Icons";
                        font-size: 40px;
                        color: #fff;
                    }
                </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp" %>
                <div id="top-block">
                    <div id="top-box">
                        <h1 id="title" class="align-middle">問題回報</h1>
                    </div>
                </div>
                <!-- ---------search bar------------ -->
                <div class="ml-3">
                    <input type="hidden" name="membername" value="${loginOK.name}"> 親愛的會員:${loginOK.name}您好
                </div>

                <!-- container -->
                <div class="container my-5">
                    <c:set var="insert" value="${insertResult}">

                    </c:set>
                    <table class="table tablesorter " id="" style="table-layout: fixed;">
                        <thead class=" text-primary">
                            <tr>
                                <th>序號</th>
                                <th>主旨</th>
                                <th>問題類型</th>
                                <th>狀態</th>
                                <th>回覆時間</th>
                                <th>細節</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${insert.id}</td>
                                <td>${insert.title}</td>
                                <td>${insert.tag}</td>
                                <td>${insert.status}</td>
                                <td>${insert.endtime}</td>
                                <form action="<c:url value='/bikeErrorDetailEntry.controller' />" method="post">
                                    <input type="hidden" name="changeid" value="${insert.id}">
                                    <input type="hidden" name="title" value="${insert.title}">
                                    <input type="hidden" name="memberid" value="${insert.memberid}">
                                    <input type="hidden" name="tag" value="${insert.tag}">
                                    <input type="hidden" name="status" value="${insert.status}">
                                    <input type="hidden" name="starttime" value="${insert.starttime}">
                                    <input type="hidden" name="endtime" value="${insert.endtime}">
                                    <input type="hidden" name="picture" value="${pic}">
                                    <input type="hidden" name="description" value="${insert.description}">
                                    <input type="hidden" name="reply" value="${insert.reply}">
                                    <td><input type="submit" class="btn btn-primary" value="more..."></td>
                                </form>
                            </tr>

                        </tbody>
                    </table>

                </div>
                <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
        </body>


        </html>