<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>追風者｜回報紀錄</title>
            <%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp"%>
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
                <div class="ml-3">
                    <input type="hidden" name="membername" value="${loginOK.name}"> 親愛的會員:${loginOK.name}您好
                </div>

                <!-- container -->
                <div class="container my-5">


                    <h2>過往回報紀錄</h2>
                    <table class="table tablesorter " id="" style="table-layout: fixed;">
                        <c:forEach var="search" items="${queryResult}">
                            <thead class=" text-primary">
                                <tr>
                                    <th>序號</th>
                                    <th>主旨</th>
                                    <!-- 					<th>會員ID</th> -->
                                    <th>問題類型</th>
                                    <th>狀態</th>
                                    <th>回覆時間</th>
                                    <th>細節</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${search.id}</td>
                                    <td>${search.title}</td>
                                    <%-- 					<td>${search.memberid}</td> --%>
                                        <td>${search.tag}</td>
                                        <td>${search.status}</td>
                                        <td>${search.endtime}</td>
                                        <%-- 					<td>${search.picString}</td> --%>
                                            <td>
                                                <form action="<c:url value='/bikeErrorSearchDetailEntry.controller' />" method="post">
                                                    <input type="hidden" name="changeid" value="${search.id}">
                                                    <input type="hidden" name="title" value="${search.title}">
                                                    <input type="hidden" name="memberid" value="${search.memberid}">
                                                    <input type="hidden" name="tag" value="${search.tag}">
                                                    <input type="hidden" name="status" value="${search.status}">
                                                    <input type="hidden" name="starttime" value="${search.starttime}">
                                                    <input type="hidden" name="endtime" value="${search.endtime}">
                                                    <input type="hidden" name="picString" value="${search.picString}">
                                                    <input type="hidden" name="description" value="${search.description}">
                                                    <input type="hidden" name="reply" value="${search.reply}">
                                                    <input type="hidden" name="picture" value="${search.picture}">
                                                    <input type="hidden" name="picString" value="${search.picString}">
                                                    <%-- 						<input type="hidden" name="pic" value="${search.picture}"> --%>
                                                        <input type="submit" class="btn btn-primary" value="more...">
                                                </form>
                                            </td>
                                </tr>

                            </tbody>
                        </c:forEach>
                    </table>
                </div>

                <%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp" %>
        </body>


        </html>