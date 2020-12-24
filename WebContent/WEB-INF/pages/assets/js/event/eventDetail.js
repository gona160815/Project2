$(function() {


    function commentList(res, i) {
        var thead =
            "<tr><th>Comment ID</th><th>Member ID</th><th>Member Name</th>" +
            '<th>Time</th><th class="text-left">Content</th>' +
            '<th class="text-right"></th></tr>';
        var tbody =
            '<tr><td class="commentId">' +
            res.comment[i].commentId +
            "</td><td>" +
            res.comment[i].memberId +
            "</td>" +
            "<td>" +
            res.name[i] +
            "</td><td>" +
            res.comment[i].time +
            '</td><td class="text-left">' +
            res.comment[i].content +
            '</td><td><button id="deleteComment" class="float-right btn btn-danger my-2 my-sm-0  ">刪除</button>' +
            '<button class="float-right btn btn-warning my-2 my-sm-0 mx-2  ">停權</button></td></tr>';
        $("#thead").empty();
        $("#thead").append(thead);
        $("#tbody").empty();
        $("#tbody").append(tbody);
        $("#commandbtn").empty();
        $("#des").empty();
    }

    $("#commentbtn").on("click", function() {
        $.ajax({
            url: "../commentList",
            type: "post",
            data: {
                eventId: $("#eid").val(),
            },
            dataType: "json",
            success: function(res) {
                $.each(res, function() {
                    var i = 0;
                    commentList(res, i);
                    i++;
                });
            },
        });
    });

    $("#tbody").on("click", "#deleteComment", function() {
        Swal.fire({
            title: "確認刪除此評論?",
            icon: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
            confirmButtonClass: "btn-warning",
            confirmButtonText: "刪除",
            cancelButtonText: "取消",
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "../mgrDeleteComment",
                    type: "post",
                    data: {
                        commentId: $("td").eq(0).text(),
                    },
                    dataType: "json",
                    success: function() {
                        Swal.fire({
                                title: "刪除成功",
                                icon: "success",
                                timer: 1500,
                                showConfirmButton: false,
                            })
                            .then(() => {
                                location.reload();
                            });
                    }
                });
            }
        });

    });


    $("#preupdate").on("click", function() {

        $("#eventId").val($("#eid").val());
        $("#catId").val($(".categoryId").val());
        $("#title").val($(".title").text().trim());
        $("#location").val($(".location").text().trim());
        $("#locationName").val($(".locationName").text().trim());
        $("#price").val($(".price").text().trim());
        $("#showunit").val($(".showunit").val());
        $("#startDate").val($(".startDate").val());
        $("#endDate").val($(".endDate").val());
        $("#description").text($(".description").text().trim());
        $("#onsales").val($(".onsales").val());
        $("#image").val($(".image").val());
        $("#website").val($(".website").val());
    });

    $("#updatebtn").on("click", function() {
        Swal.fire({
            title: "確認更新此項資料?",
            text: "更新後將無法回復",
            icon: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "更新",
            cancelButtonText: "取消",
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "../eventUpdate.controller",
                    dataType: "json",
                    type: "post",
                    data: {
                        eventId: $("#eventId").val(),
                        categoryId: $("#catId").val(),
                        title: $("#title").val(),
                        location: $("#location").val(),
                        locationName: $("#locationName").val(),
                        price: $("#price").val(),
                        showunit: $("#showunit").val(),
                        startDate: $("#startDate").val(),
                        endDate: $("#endDate").val(),
                        description: $("#description").val(),
                        onsales: $("#onsales").val(),
                        image: $("#image").val(),
                        website: $("#website").val(),
                    },
                    success: function(res) {
                        Swal.fire({
                                title: "更新成功",
                                icon: "success",
                                timer: 1500,
                                showConfirmButton: false,
                            })
                            .then(() => {
                                location.reload();
                            });
                    },
                });
            }
        });
    });

})