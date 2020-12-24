<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <h4>
            <span id="count">${count}</span> 項活動
        </h4>
        <nav aria-label="Page navigation example">
            <ul class="pagination">

                <li class="page-item"><a class="prevbtn page-link btn" aria-label="Previous">&laquo;</a> <input class="prev" type="hidden" value='${pageNo-1}'></input>
                </li>
                <c:forEach var='page' items='${pages}'>
                    <c:if test="${pageNo == page}">
                        <li class="page-item"><a class="active pagenum page-link btn" aria-current="page">${page}</a></li>

                    </c:if>
                    <c:if test="${pageNo != page}">
                        <li class="page-item"><a class="pagenum page-link btn">${page}</a></li>
                    </c:if>

                </c:forEach>
                <li class="page-item"><a class="nextbtn page-link btn" aria-label="Next">&raquo;</a> <input class="next" type="hidden" value='${pageNo+1}'></input>
                </li>

            </ul>
        </nav>
        <c:forEach items="${lists}" var="list">
            <div class="product-list mb-4 shadow-sm rounded">
           		<div class="favorite"><span class="event-favorite btn float-right mt-0"><i class="far fa-heart"></i></span></div>
                <a id="product-card-001" class="text-muted text-decoration-none" href="event/${list.eventId}">
                    <div class="row">
                        <div class="col-sm-5 col-lg-4">
                            <img class="rounded" width="255" height="272" src="img/hotballoon.jpg" alt="">
                        </div>
                        <div class="col-sm-7 col-lg-8">
                            <div class=" ">
                                <div class="">
                                    <h3 class="">${list.title}</h3>
                                    <p class="eventTitle card-text text-left m-1" style="height: 50px; display: -webkit-box; overflow: hidden; -webkit-line-clamp: 2; -webkit-box-orient: vertical; white-space: normal; text-overflow: ellipsis;">${list.description}</p>
                                    <p class="eventLocation card-text text-left m-1">
                                        <i class="fas fa-map-marker-alt"></i> ${list.location}
                                    </p>
                                    <p class="card-text text-left m-1">
                                        <i class="far fa-calendar-check"></i> ${list.startDate}
                                    </p>
                                    <p class="card-text text-left m-1">
                                        <i class="far fa-calendar-times"></i> ${list.endDate}
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
        <input id="counts" type="hidden" value="${count}">
        <input id="query" type="hidden" value="${query}">
        <script>
            $(".pagination").on("click", ".pagenum", function() {
                $.ajax({
                    url: 'querylist',
                    type: 'post',
                    data: {
                        pageNo: $(this).text(),
                        query: $("#query").val(),
                        categoryId: $("#categoryId").text()
                    },
                    success: function(res) {
                        $("#row").empty();
                        $("#row").html(res);
                    }
                });
            });
            $(".pagination").on("click", ".prevbtn", function() {
                $.ajax({
                    url: 'querylist',
                    type: 'post',
                    data: {
                        pageNo: $(".prev").val(),
                        query: $("#query").val(),
                        categoryId: $("#categoryId").text()
                    },
                    success: function(res) {
                        $(".next").remove();
                        $(".prev").remove();
                        $("#row").empty();
                        $("#row").html(res);
                    }
                });
            });
            $(".pagination").on("click", ".nextbtn", function() {
                $.ajax({
                    url: 'querylist',
                    type: 'post',
                    data: {
                        pageNo: $(".next").val(),
                        query: $("#query").val(),
                        categoryId: $("#categoryId").text()
                    },
                    success: function(res) {
                        $(".next").remove();
                        $(".prev").remove();
                        $("#row").empty();
                        $("#row").html(res);
                    }
                });
            });
        </script>