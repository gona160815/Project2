$(function() {

    // ==================LIST===============
    function comment(res) {
        var commentcard =
            '<div id="' + res.comment.commentId + '" class="comment card m-2">' +
            '<div class="card-body ">' +
            '<img data-toggle="tooltip" data-placement="top" title="' + res.intro + '" class="rounded-circle" width="40" height="40" src="../showMemberIcon?id=' + res.member.memberId + '">' +
            '<span id="' + res.member.memberId + '" class="m-1 ">' +
            res.nickName + '</span>' +
            '<small	class="text-secondary">' +
            res.commentTime + '</small>' +
            '<span class="deleteComment btn btn-sm btn-light float-right"><i style="color:red;" class="fas fa-trash-alt"></i>刪除</span>' +
            '<span class="updateComment btn btn-sm btn-light float-right"><i class="far fa-edit"></i>修改</span>' +
            '<br> <br>' +
            '<span class="ml-5 ">' +
            res.comment.content + '</span>' +
            '</div></div>';
        return commentcard;
    }

    function comments(res, i) {
        var commentcard =
            '<div id="' + res.comment[i].commentId + '" class="comment card m-2">' +
            '<div class="card-body ">' +
            '<img data-toggle="tooltip" data-placement="top" title="' + res.intro[i] + '" class="rounded-circle" width="40" height="40" src="../showMemberIcon?id=' + res.comment[i].memberId + '">' +
            '<span id="' + res.member[i].memberId + '" class="member m-1 ">' +
            res.nickName[i] + '</span>' +
            '<small	class="text-secondary">' +
            res.comment[i].time + '</small>' +
            '<br> <br>' +
            '<span class="ml-5 ">' +
            res.comment[i].content + '</span>' +
            '</div></div>';
        return commentcard;
    }

    var today = new Date();
    var currentDateTime =
        today.getFullYear() + "-" +
        (today.getMonth() + 1) + "-" +
        today.getDate() + " " +
        today.getHours() + ":" +
        today.getMinutes() + ":" + today.getSeconds();



    // ==========CHECK LOGIN================
    $.ajax({
        url: '../checkLogin',
        type: 'post',
        dataType: 'json',
        success: function(res) {
            /* 從這開始改自己想要增加的按鈕 */
            if (res.login == false) {
                //沒登入案愛心導向登入頁
                // $("#favorite").prop("href", "../loginPage");
                $("#favorite").click(function() {
                    Swal.fire({
                            title: "請先登入",
                            text: "導向登入頁...",
                            icon: "warning",
                            timer: 1500,
                            showConfirmButton: false,
                        })
                        .then(() => {
                            window.location.href = "../loginPage";
                        });
                });
                // $("#like").prop("href", "../loginPage");
                $("#like").click(function() {
                    Swal.fire({
                            title: "請先登入",
                            text: "導向登入頁...",
                            icon: "warning",
                            timer: 1500,
                            showConfirmButton: false,
                        })
                        .then(() => {
                            window.location.href = "../loginPage";
                        });
                })
                $("#sendComment").prop("href", "../loginPage");
                $("#sendComment").text("登入");
                $("#content").prop("placeholder", "請先登入會員才能發表評論")

                $("#addAct").remove();
                $(".event-price").find("h5")
                    .after('<button id="actlogin" type="button" class="btn btn-block btn-lg btn-info" ">加入行程表</button>');

            }
        }
    });

    $(".event-price").on("click", "#actlogin", function() {

        Swal.fire({
                title: "請先登入",
                text: "導向登入頁...",
                icon: "warning",
                timer: 1500,
                showConfirmButton: false,
            })
            .then(() => {
                window.location.href = "../loginPage";
            });


    });
    // =================CHECK FAVORITE============================
    $.ajax({
        url: '../checkMyFavorite',
        type: 'post',
        dataType: 'json',
        data: {
            typeId: 3,
            infoId: $("#eventId").val(),
            memberId: $("#memberId").val(),
        },
        success: function(res) {
            if (res.favorite == true) {
                $("#favorite").empty();
                $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                $("#favcounter").val(1);
            } else {
                $("#favcounter").val(2);
            }
        }

    });

    // ===============FAVORITE計數器=================
    function checkFavorite() {
        var counter = $("#favcounter").val();
        if (counter % 2 == 0) {
            var info = {
                "memberId": $("#memberId").val(),
                "typeId": 3,
                "infoId": $("#eventId").val(),
                "favName": $(".event-title").find("h3").text().trim()
            }
            $.ajax({
                url: '../addMyFavorite',
                type: 'post',
                dataType: 'json',
                data: info,
                success: function(res) {
                    if (res.success == true) {
                        $("#favorite").empty();
                        $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                    }
                }
            });

        }
        if (counter % 2 == 1) {
            var info = {
                "memberId": $("#memberId").val(),
                "typeId": 3,
                "infoId": $("#eventId").val(),
            }
            $.ajax({
                url: '../deleteMyFavorite',
                type: 'post',
                dataType: 'json',
                data: info,
                success: function(res) {
                    if (res.success == true) {
                        $("#favorite").empty();
                        $("#favorite").append('<i class="far fa-heart"></i>');
                    }
                }
            });

        }
        counter++;
        $("#favcounter").val(counter);
    }

    /* =============ADD FAVORITE============== */
    $("#favorite").on("click", function() {
        checkFavorite();
    });


    // ===================CHECK LIKE===================
    $.ajax({
        url: '../checkLike',
        type: 'post',
        dataType: 'json',
        data: {
            eventId: $("#eventId").val(),
            memberId: $("#memberId").val(),
        },
        success: function(res) {
            if (res.liked == true) {
                $("#like").empty();
                $("#like").append('<i style="color:blue;text-shadow: 1px 1px 1px #ccc" class="far fa-thumbs-up"></i>' + '<span class="badge badge-pill badge-primary ">已按讚</span>');
                $("#likecounter").val(1);
            }
        }

    });

    // ===================LIKE COUNTER====================

    function checkLike() {
        var counter = $("#likecounter").val();
        if (counter % 2 == 0) {
            $.ajax({
                url: '../addLike',
                type: 'post',
                dataType: 'json',
                data: {
                    eventId: $("#eventId").val(),
                    memberId: $("#memberId").val(),
                },
                success: function(res) {
                    if (res.success == true) {
                        $("#like").empty();
                        $("#like").append('<i style="color:blue;text-shadow: 1px 1px 1px #ccc" class="far fa-thumbs-up"></i>' + '<span class="badge badge-pill badge-primary ">已按讚</span>');
                    }
                }
            });

        }
        if (counter % 2 == 1) {
            $.ajax({
                url: '../removeLike',
                type: 'post',
                dataType: 'json',
                data: {
                    eventId: $("#eventId").val(),
                    memberId: $("#memberId").val(),
                },
                success: function(res) {
                    if (res.success == true) {
                        $("#like").empty();
                        $("#like").append('<i class="far fa-thumbs-up"></i>');
                    }
                }
            });
        }
        counter++;
        $("#likecounter").val(counter);
    }

    /* ============ADD LIKE=============== */
    $("#like").on("click", function() {
        checkLike()
    });


    // ==================COMMENT LIST===============
    $.ajax({
        url: '../eventComments',
        type: 'GET',
        data: {
            eventId: $("#eventId").val()
        },
        dataType: 'json',
        success: function(res) {
            for (var i = 0; i < res.comment.length; i++) {
                $("#comment").append(comments(res, i));
            }
            $(".comment").each(function(i) {
                var commentId = $(this).attr("id");
                var memberId = $("#memberId").val();
                var $t = $(this);
                $.ajax({
                    url: '../checkCommentByMember',
                    type: 'post',
                    data: {
                        commentId: commentId,
                        memberId: memberId
                    },
                    dataType: 'json',
                    success: function(res) {
                        if (res) {
                            $t.find("small").after(
                                `<span class="deleteComment btn btn-sm btn-light float-right"><i style="color:red;" class="fas fa-trash-alt"></i>刪除</span>` +
                                `<span class="updateComment btn btn-sm btn-light float-right"><i class="far fa-edit"></i>修改</span>`
                            );
                        }
                    }
                });

            });
        }
    });
    // ===============DELETE COMMENT BY USER============

    $("body").on("click", ".deleteComment", function() {
        var commentId = $(this).closest(".comment").attr("id");
        var memberId = $(this).siblings(".member").attr("id");
        var $t = $(this);
        Swal.fire({
            title: "確認刪除您的評論?",
            text: "刪除後將無法回復",
            icon: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "刪除",
            cancelButtonText: "取消",
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../userDeleteComment',
                    type: 'post',
                    data: {
                        commentId: commentId,
                        memberId: memberId
                    },
                    dataType: 'json',
                    success: function(res) {
                        if (res) {

                            Swal.fire({
                                    title: "刪除成功",
                                    icon: "success",
                                    timer: 1500,
                                    showConfirmButton: false,
                                })
                                .then(() => {
                                    $t.closest(".comment").remove();
                                    // location.reload();
                                });
                        }
                    },
                });
            }
        });
    });

    // ============ADD COMMENT======================
    $("#sendComment").on("click", function() {
        $.ajax({
            url: '../addComment',
            type: 'post',
            dataType: 'json',
            data: {
                eventId: $("#eventId").val(),
                memberId: $("#memberId").val(),
                time: currentDateTime,
                content: $("#content").val()
            },
            success: function(res) {
                console.log(res);
                $("#content").val("");
                $("#firstcomment").after(comment(res));

            }

        });
    });



    // =====================MAP====================
    $("#googlemap").on("click", function() {
        location.reload();
    })

    $("#osmmap").on("click", function() {
        var location = $(".event-location").find("span").text().trim();
        $.ajax({
            url: 'https://nominatim.openstreetmap.org/search.php?q=' + location + '&format=jsonv2',
            type: 'GET',
            contentType: 'text; charset=utf-8',
            dataType: 'json',
            success: function(res) {
                $("#map").css('background', '#333')
                    .css('width', '80%').css('height', '100%').css('position', 'relative');
                var px = res[0].lon;
                var py = res[0].lat;
                var map;
                map = L.map('map').setView([py, px], 15);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '<a href="https://www.openstreetmap.org/">OSM</a>',
                    maxZoom: 18,
                }).addTo(map);
                var marker = L.marker([py, px]);
                marker.addTo(map);
            }


        });
    });

    $.ajax({
        url: '../getMyActName',
        type: 'post',
        data: {
            memberId: $("#memberId").val()
        },
        success: function(res) {
            $.each(res.actName, function(i, obj) {
                $(".list-group").append('<li class=" list-group-item"><a class="actName h4" href="javascript:void(0)">' + obj.name + '</a></li>');
            });
        }

    });


    $("#newAct").on("click", function() {
        $(this).closest('li').after('<li class="inputText list-group-item "><input placeholder="請輸入行程名稱" type="text" class=" border-0 "><button id="createAct" class="btn btn-sm btn-primary">確認</button></li>');
    });

    $(".list-group").on("click", "#createAct", function() {
        $.ajax({
            url: '../addMyActName',
            type: 'post',
            data: {
                memberId: $("#memberId").val(),
                actName: $(this).siblings("input").val(),
            },
            success: function(res) {
                $('.newAct').after('<li class="list-group-item"><a class="actName h4" href="javascript:void(0)">' + res.actName.name + '</a></li>');
                $(".inputText").remove();
            }

        });


    });

    $(".list-group").on("click", ".actName", function() {
        $(this).closest('li').prevAll().remove();
        $(this).closest('li').nextAll().remove();
        $(this).after('<li class="list-group-item"><input class="my-2 actDate form-control-lg" placeholder="請選擇日期" type="text" ></li>')
        const fp = flatpickr(".actDate", {})
    });

    $("#addNewAct").on("click", function() {
        $.ajax({
            url: '../addActivityByCart',
            type: 'post',
            data: {
                typeId: 3,
                infoId: $("#eventId").val(),
                actDate: $(".actDate").val(),
                name: $(".actName").text().trim(),
                price: 0,
                memberId: $("#memberId").val()
            },
            success: function(res) {
                Swal.fire({
                        title: "新增成功",
                        icon: "success",
                        timer: 3000,
                        showConfirmButton: false,
                    })
                    .then(() => {
                        location.reload();
                    });

            }

        });

    });

    function originList() {
        return `<li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct" href="javascript:void(0)">加入新行程</a></li>`
    }

    $("#reset").click(function() {

        $.ajax({
            url: '../getMyActName',
            type: 'post',
            data: {
                memberId: $("#memberId").val()
            },
            success: function(res) {
                $(".list-group").empty().append(originList());
                $.each(res.actName, function(i, obj) {
                    $(".list-group").append('<li class=" list-group-item"><a class="actName h4">' + obj.name + '</a></li>');
                });
            }

        });
    });

});