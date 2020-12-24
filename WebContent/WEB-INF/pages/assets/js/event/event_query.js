/* query page list */
function qlist(i, list) {
    var img = "";
    if (list.image != null) {
        img = list.image;
    } else {
        img = "img/event/img" + i + ".jpg";
    }
    var listobj =
        '<div class="product-list mb-4 shadow-sm rounded">' +
        '<input id="eid' +
        i +
        '" class="eventId" value="' +
        list.eventId +
        '" type="hidden">' +
        '<a id="favorite' +
        i +
        '" class="event-favorite btn float-right mt-0"><i class="far fa-heart"></i></a>' +
        '<a id="product-card-00' +
        i +
        '" class="text-muted text-decoration-none" href="event/' +
        list.eventId +
        '">' +
        '<div class="row"><div class="col-sm-5 col-lg-4">' +

        '<img class="rounded" width="255" height="272" src="' +
        img +
        '" alt="">' +
        '</div><div class="col-sm-7 col-lg-8"><div class=" "><div class="">' +
        '<h3 class="">' +
        list.title +
        "</h3>" +
        '<p class="eventDescription card-text text-left m-1">' +
        list.description +
        "</p>" +
        '<p class="eventLocation card-text text-left mx-1">' +
        '<i class="fas fa-map-marker-alt"></i>&nbsp' +
        list.location +
        '</p><p class="card-text text-left mx-1">' +
        '<i class="far fa-calendar-check"></i>&nbsp' +
        list.startDate +
        '</p><p class="card-text text-left mx-1"><i class="far fa-calendar-times">' +
        "</i>&nbsp" +
        list.endDate +
        "</p></div></div></div></div></a></div>";
    return listobj;
}

/* page btn items */
function pagination(res) {
    var pagenums = res.pages;
    $(".pagination").empty();
    $(".pagination").append(
        '<li class="page-item">' +
        '<a class="prevbtn page-link btn" aria-label="Previous">&laquo;' +
        '<input class="prev" type="hidden" value=' +
        (res.pageNo - 1) +
        "></input>" +
        '<input class="categoryId" type="hidden" value=' +
        res.categoryId +
        "></input>" +
        "</a></li>"
    );
    $.each(pagenums, function(i, num) {
        if (num == res.pageNo) {
            $(".pagination").append(
                '<li class="page-item active"><a class="pagenum page-link btn " aria-current="page" >' +
                num +
                '<span class="sr-only">(current)</span></a></li>'
            );
        } else {
            $(".pagination").append(
                '<li class="page-item"><a class="pagenum page-link btn" >' +
                num +
                "</a></li>"
            );
        }
    });
    $(".pagination").append(
        '<li class="page-item">' +
        '<a class="nextbtn page-link btn" aria-label="Next">&raquo;' +
        '<input class="next" type="hidden" value=' +
        (res.pageNo + 1) +
        "></input>" +
        "</a></li>"
    );
    $(".pagination").append(
        '<input id="query" type="hidden" value="' + res.query + '">'
    );
    var count = res.count;
    $("#count").empty();
    $("#count").text(count);
}

function backtop() {
    $("html,body").animate({
            scrollTop: 0,
        },
        "slow"
    );
    return false;
}

/* check login */
/* jackey/controller/EventPageController --> checkLogin */

function checkLogin() {
    $(function() {
        $.ajax({
            url: "checkLogin",
            type: "post",
            dataType: "json",
            success: function(res) {
                if (res.login == false) {

                    // $(".event-favorite").prop("href", "loginPage");
                    $(".event-favorite").click(function() {
                        Swal.fire({
                                title: "請先登入會員",
                                text: "導向登入頁...",
                                icon: "warning",
                                timer: 1500,
                                showConfirmButton: false,
                            })
                            .then(() => {
                                window.location.href = "loginPage";
                            });
                        // alert("請先登入會員才能加入我的最愛");
                    });

                } else {
                    favload();
                }
            },
        });
    });
}

$(function() {
    $.ajax({
        url: "checkLogin",
        type: "post",
        dataType: "json",
        success: function(res) {
            if (res.login == false) {
                // $(".event-favorite").prop("href", "loginPage");
                $(".event-favorite").click(function() {
                    //     alert("請先登入會員才能加入我的最愛");
                    Swal.fire({
                            title: "請先登入會員",
                            text: "導向登入頁...",
                            icon: "warning",
                            timer: 1500,
                            showConfirmButton: false,
                        })
                        .then(() => {
                            window.location.href = "loginPage";
                        });
                });

            } else {
                favload();
            }
        },
    });
});
/* every page check login status */


/* every page reload fav status */
function favload() {
    var dataArray = new Array();
    $(".product-list").each(function(i) {
        var data = {};
        data.infoId = parseInt($("#eid" + i).val());
        data.typeId = 3;
        data.memberId = parseInt($("#memberId").val());
        dataArray.push(data);
    });

    $(function() {
        $.ajax({
            headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
            },
            url: "checkMyFavoriteList",
            type: "post",
            dataType: "json",
            data: JSON.stringify(dataArray),
            success: function(res) {
                var result = res.result;
                for (var i = 0; i < result.length; i++) {
                    if (res.result[i] == true) {
                        $("#favorite" + i).empty();
                        $("#favorite" + i).append(
                            '<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>'
                        );
                        $("#favorite" + i).next().val(1);
                    }
                }
            },
        });
    });
}

/* check multiple favorite */

function checkfav() {
    var dataArray = new Array();
    $(".product-list").each(function(i) {
        var data = {};
        data.infoId = parseInt($("#eid" + i).val());
        data.typeId = 3;
        data.memberId = parseInt($("#memberId").val());
        dataArray.push(data);
    });

    $(function() {
        $.ajax({
            headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
            },
            url: "checkMyFavoriteList",
            type: "post",
            dataType: "json",
            data: JSON.stringify(dataArray),
            success: function(res) {
                var result = res.result;
                for (var i = 0; i < result.length; i++) {
                    if (res.result[i] == true) {
                        $("#favorite" + i).empty();
                        $("#favorite" + i).append(
                            '<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>'
                        );
                        $("#favorite" + i).next().val(1);
                    }
                }
            },
        });
    });
}

// multiple 計數器
function checkFavorite(infoId, th, title) {
    var counter = th.next().val();
    if (counter % 2 == 0) {
        $.ajax({
            url: "addMyFavorite",
            type: "post",
            dataType: "json",
            data: {
                memberId: $("#memberId").val(),
                typeId: 3,
                infoId: infoId,
                favName: title

            },
            success: function(res) {
                if (res.success == true) {
                    th.empty();
                    th.append(
                        '<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>'
                    );
                }
            },
        });
    }
    if (counter % 2 == 1) {
        var info = {
            memberId: $("#memberId").val(),
            typeId: 3,
            infoId: infoId,
        };
        $.ajax({
            url: "deleteMyFavorite",
            type: "post",
            dataType: "json",
            data: info,
            success: function(res) {
                console.log(res);
                if (res.success == true) {
                    th.empty();
                    th.append('<i class="far fa-heart"></i>');
                }
            },
        });
    }
    counter++;
    th.next().val(counter);
}

/* add favorite */
$(".eventList").on("click", ".event-favorite", function() {
    var infoId = $(this).prev().val();
    var title = $(this).siblings('a').find('.eventTitle').text().trim();
    console.log(title);
    checkFavorite(infoId, $(this), title);
});

/* search query btn */
$("#search").on("click", ".searchButton", function() {
    $.ajax({
        url: "queryLists",
        type: "POST",
        data: {
            pageNo: 1,
            query: $(".searchTerm").val(),
            categoryId: "",
        },
        success: function(res) {
            pagination(res);
            $(".eventList").empty();
            var listobj = res.lists;
            $.each(listobj, function(i, list) {
                $(".eventList").append(qlist(i, list));
            });
            $("#querytext").empty();
            $("#querytext").text(res.query);
            favload();
            checkLogin();
        },
    });
});

$(document).keyup(function(event) {
    if (event.keyCode == 13) {
        $("#search").trigger("click");
    }
});

/* location query btn */
$("#location-btn").on("click", "span", function() {
    var query = $(this).text();
    $.ajax({
        url: "queryLists",
        type: "POST",
        data: {
            pageNo: 1,
            query: $(this).text(),
            categoryId: $(".categoryId").val(),
        },
        success: function(res) {
            pagination(res);
            $(".eventList").empty();
            var listobj = res.lists;
            $.each(listobj, function(i, list) {
                $(".eventList").append(qlist(i, list));
            });
            $("#querytext").empty();
            $("#querytext").text(res.query);
            favload();
            checkLogin();
        },
    });
});

/* category query btn */
function catList(cat) {
    console.log(cat);
    $.ajax({
        url: "queryLists",
        type: "POST",
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: cat,
        },
        success: function(res) {
            pagination(res);
            $(".eventList").empty();
            var listobj = res.lists;
            $.each(listobj, function(i, list) {
                $(".eventList").append(qlist(i, list));
            });
            $("#querytext").empty();
            $("#querytext").text(res.query);
            favload();
            checkLogin();
        },
    });
}
$("#category-btn").on("click", "#cat1", function() {
    catList(1);
});
$("#category-btn").on("click", "#cat2", function() {
    catList(2);
});
$("#category-btn").on("click", "#cat3", function() {
    catList(3);
});







/* pagenum btn */
$(".pagination").on("click", ".pagenum", function() {
    $.ajax({
        url: "queryLists",
        type: "post",
        data: {
            pageNo: $(this).text(),
            query: $("#querytext").text().trim(),
            categoryId: $(".categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            pagination(res);
            $(".eventList").empty();
            var listobj = res.lists;
            $.each(listobj, function(i, list) {
                $(".eventList").append(qlist(i, list));
            });

            favload();
            checkLogin();
            backtop();
        },
    });
});
/* prev page num */
$(".pagination").on("click", ".prevbtn", function() {
    $.ajax({
        url: "queryLists",
        type: "post",
        data: {
            pageNo: $(".prev").val(),
            query: $("#querytext").text().trim(),
            categoryId: $(".categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            $(".next").remove();
            $(".prev").remove();
            pagination(res);
            $(".eventList").empty();
            var listobj = res.lists;
            $.each(listobj, function(i, list) {
                $(".eventList").append(qlist(i, list));
            });
            favload();
            checkLogin();
            backtop();
        },
    });
});
/* next page btn */
$(".pagination").on("click", ".nextbtn", function() {
    $.ajax({
        url: "queryLists",
        type: "post",
        data: {
            pageNo: $(".next").val(),
            query: $("#querytext").text().trim(),
            categoryId: $(".categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            $(".next").remove();
            $(".prev").remove();
            pagination(res);
            $(".eventList").empty();
            var listobj = res.lists;
            $.each(listobj, function(i, list) {
                $(".eventList").append(qlist(i, list));
            });
            favload();
            checkLogin();
            backtop();
        },
    });
});