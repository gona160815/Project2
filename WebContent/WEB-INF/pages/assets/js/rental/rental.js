$(function() {

    $(function() {
        $.ajax({
            url: "checkLogin",
            type: "post",
            dataType: "json",
            success: function(res) {
                if (res.login == false) {

                    $(".rental-favorite").click(function() {
                        Swal.fire({
                                title: "請先登入",
                                text: "導向登入頁...",
                                icon: "warning",
                                timer: 1500,
                                showConfirmButton: false,
                            })
                            .then(() => {
                                window.location.href = "loginPage";
                            });
                    });
                    $("#addAct").removeAttr("data-target").removeAttr("data-toggle");
                    $("#addAct").click(function() {
                        Swal.fire({
                                title: "請先登入",
                                text: "導向登入頁...",
                                icon: "warning",
                                timer: 1500,
                                showConfirmButton: false,
                            })
                            .then(() => {
                                window.location.href = "loginPage";
                            });
                    });

                }
            },
        });
    });


    /* check multiple favorite */
    /* hugo/controller/MyFavoriteController/checkMyFavoriteList() */
    /* 需要在愛心上下藏一個物件ID和計數器 */

    var dataArray = new Array();
    $(".lineup-detail-list-item").each(function(i) {
        var data = {};
        data.infoId = $(this).find(".simBikeId").val();
        data.typeId = 2;
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
                        $("#favorite" + i).val(1);
                    }
                }
            },
        });
    });


    // multiple 計數器
    function checkFavorite(infoId, th, title) {
        var counter = th.next().val();
        console.log(counter);
        if (counter % 2 == 0) {
            $.ajax({
                url: "addMyFavorite",
                type: "post",
                dataType: "json",
                data: {
                    memberId: $("#memberId").val(),
                    typeId: 2,
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
                typeId: 2,
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
    $(".lineup-detail-list-item").on("click", ".rental-favorite", function() {
        var infoId = $(this).closest("p").siblings("input").val();
        var title = $(this).closest("p").siblings('.lineup-detail-list-ttl').text().trim();
        console.log("title");
        checkFavorite(infoId, $(this), title);
    });



    $.ajax({
        url: 'getMyActName',
        type: 'post',
        data: {
            memberId: $("#memberId").val()
        },
        success: function(res) {
            console.log(res);
            $.each(res.actName, function(i, obj) {
                $(".list-group").append('<li class=" list-group-item"><a class="actName h4">' + obj.name + '</a></li>');
            });
        }

    });

    $(".addAct").on("click", function() {
        $("#bikeId").val($(this).closest("p").siblings(".simBikeId").val());
        $("#price").val($(this).closest("p").siblings(".dayprice").val())
    });

    $("#newAct").on("click", function() {
        $(this).closest('li').after('<li class="inputText list-group-item "><input placeholder="請輸入行程名稱" type="text" class=" border-0 "><button id="createAct" class="btn btn-sm btn-primary">確認</button></li>');
    });

    $(".list-group").on("click", "#createAct", function() {
        $.ajax({
            url: 'addMyActName',
            type: 'post',
            data: {
                memberId: $("#memberId").val(),
                actName: $(this).siblings("input").val(),
            },
            success: function(res) {
                $('.newAct').after('<li class="list-group-item"><a class="actName h4">' + res.actName.name + '</a></li>');
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
            url: 'addActivityByCart',
            type: 'post',
            data: {
                typeId: 2,
                infoId: $("#bikeId").val(),
                actDate: $(".actDate").val(),
                name: $(".actName").text().trim(),
                price: $("#price").val(),
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
        return `<li class="newAct list-group-item "><i class="fas fa-plus-circle"></i><a id="newAct">加入新行程</a></li>`
    }

    $("#reset").click(function() {

        $.ajax({
            url: 'getMyActName',
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