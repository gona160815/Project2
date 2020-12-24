/* tbody list obj */
function tbodylist(res) {
    var list = res.list;
    $("#tbody").empty();
    $.each(list, function(i) {
        $("#tbody").append(
            '<tr><td id="id"><a href="eventDetail/' + list[i].eventId + '">' + list[i].eventId + '</a></td>' +
            '<td id="title">' + list[i].title + '</td>' +
            '<td id="location">' + list[i].location + '</td>' +
            '<td id="locationName">' + list[i].locationName + '</td>' +
            '<td id="price">' + list[i].price + '</td>' +
            '<td id="showunit">' + list[i].showunit + '</td>' +
            '<td id="startDate">' + list[i].startDate + '</td>' +
            '<td id="endDate">' + list[i].endDate + '</td>' +
            '<td><input class="btn btn-success my-2 my-sm-0 " type="button" name="' + list[i].eventId + '" value="修改" onclick="update(this)"/></td>' +
            '<td><input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + list[i].eventId + '" value="刪除" onclick="confirmListDelete(this)"/></td></tr>'
        );
    });
    $("#tbody").append(
        '<input type="hidden" id="categoryId" value="' + res.categoryId + '"/>' +
        '<input type="hidden" id="query" value="' + res.query + '"/>');
}


/* switch page btn obj */
function pagebtn(res) {
    var pagenums = res.pages;

    $("#pagebadge").remove();
    $("#pagebadgepre").after(
        '<span id="pagebadge" class="ml-2 badge badge-info w-25 ">第 ' + res.pageNo + ' 頁 / 共 ' + res.totalPages + ' 頁</span>'
    );

    $("#pagination").empty();
    $("#pagination").append(
        '<li class="list-group-item border border-white">' +
        '<div id="pfirst">' +
        '<button id="firstbtn" class="btn btn-sm btn-outline-primary m-2">第一頁</button>' +
        '</div></li>'
    );
    if (res.pageNo > 1) {
        $("#pagination").append(
            '<li class="list-group-item border border-white">' +
            '<div id="pprev">' +
            '<button id="prevbtn" class="btn btn-sm btn-outline-primary m-2 ">上一頁</button>' +
            '<input class="prev" type="hidden" value=' + (res.pageNo - 1) + '>' +
            '</div></li>');
    }

    $.each(pagenums, function(i, num) {
        if (num == res.pageNo) {
            $("#pagination").append(
                '<li class="list-group-item border border-white">' +
                '<button class="pagebtn btn btn-sm btn-info m-2 ">' + num + '</button>' +
                '</div></li>');

        } else {
            $("#pagination").append(
                '<li class="list-group-item border border-white">' +
                '<div><button class="pagebtn btn btn-sm btn-outline-primary m-2">' + num + '</button>' +
                '</div></li>'
            );
        }

    });
    if (res.pageNo != res.totalPages) {
        $("#pagination").append(
            '<li class="list-group-item border border-white">' +
            '<div id="pnext"><button id="nextbtn" class="btn btn-sm btn-outline-primary m-2 ">下一頁</button>' +
            '<input class="next" type="hidden" value=' + (res.pageNo + 1) + '>' +
            '</div></li>');
    }
    $("#pagination").append(
        '<li class="list-group-item border border-white">' +
        '<div id="plast">' +
        '<button id="lastbtn" class="btn btn-sm btn-outline-primary m-2">最末頁</button>' +
        '<input id="totalPages" type="hidden" value="' + res.totalPages + '">' +
        '</div></li>');
}


$("#sform").on("keyup", "#search", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $(this).val(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        }
    });
});

/* choose location btn */
$("#location").on("click", "button", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $(this).text(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        }
    });
});
$("#location").on("click", "#all", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: "",
            categoryId: ""
        },
        dataType: 'json',
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        }
    });
});

/* choose category btn */
$("#category").on("click", "#cat1", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: ""
        },
        dataType: 'json',
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        }
    });
});


$("#category").on("click", "#cat2", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "1"
        },
        dataType: 'json',
        success: function(res) {
            console.log(res);
            tbodylist(res);
            pagebtn(res);
        }
    });
});


$("#category").on("click", "#cat3", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "2"
        },
        dataType: 'json',
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        }
    });
});


$("#category").on("click", "#cat4", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "3"
        },
        dataType: 'json',
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        }
    });
});


/* 第一頁 */
$("#pageDiv").on("click", "#firstbtn", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
        }
    });
});

/* 上一頁 */
$("#pageDiv").on("click", "#prevbtn", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: $(".prev").val(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            pagebtn(res);
            tbodylist(res)
        }

    });
});

/* 下一頁 */
$("#pageDiv").on("click", "#nextbtn", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: $(".next").val(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
        }

    });
});

/* 最後頁 */
$("#pageDiv").on("click", "#lastbtn", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: $("#totalPages").val(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
        }

    });
});

/* 頁碼分頁 */
$("#pageDiv").on("click", ".pagebtn", function() {
    $.ajax({
        url: 'eventmgrPage.json',
        type: 'post',
        data: {
            pageNo: $(this).text(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val()
        },
        dataType: 'json',
        success: function(res) {
            console.log(res);
            pagebtn(res);
            tbodylist(res);
            console.log(res.pageNo);
        }

    });
});