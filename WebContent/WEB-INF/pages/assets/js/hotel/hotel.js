$(function() {

    $.ajax({
        url: 'checkLogin',
        type: 'post',
        dataType: 'json',
        success: function(res) {
            /* 從這開始改自己想要增加的按鈕 */
            console.log(res);
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
                            window.location.href = "loginPage";
                        });
                });
                // $("#like").prop("href", "../loginPage");

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
        }
    });

    $.ajax({
        url: 'checkMyFavorite',
        type: 'post',
        dataType: 'json',
        data: {
            typeId: 1,
            infoId: $("#homestayId").val(),
            memberId: $("#memberId").val(),
        },
        success: function(res) {
            console.log(res);
            if (res.favorite == true) {
                $("#favorite").empty();
                $("#favorite").append('<i style="color:red;text-shadow: 1px 1px 1px #ccc" class="fas fa-heart"></i>');
                $("#favcounter").val(1);
            } else {
                $("#favcounter").val(2);
            }
        }

    });

    function checkFavorite() {
        var counter = $("#favcounter").val();
        if (counter % 2 == 0) {
            var info = {
                "memberId": $("#memberId").val(),
                "typeId": 1,
                "infoId": $("#homestayId").val(),
                "favName": $("#hotelName").text().trim()
            }
            $.ajax({
                url: 'addMyFavorite',
                type: 'post',
                dataType: 'json',
                data: info,
                success: function(res) {
                    console.log(res);
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
                "typeId": 1,
                "infoId": $("#homestayId").val(),
            }
            $.ajax({
                url: 'deleteMyFavorite',
                type: 'post',
                dataType: 'json',
                data: info,
                success: function(res) {
                    console.log(res);
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
        $("#price").val($(this).next("input").val());
        console.log($(this).next("input").val());
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
                typeId: 1,
                infoId: $("#homestayId").val(),
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