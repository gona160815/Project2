$(function() {
    function tbodylist(res) {
        var list = res.list;
        $("#tbody").empty();
        $.each(list, function(i) {
            $("#tbody").append(
                `<tr class="actNameList">
                <td class='text-center'>` + list[i].actNameId + `</td>
                <td class='act-name text-center'>` + list[i].name + `</td>
                <td class='text-center'>` + list[i].orderTime + `</td>
                <td class='text-center'>` + list[i].price + `</td>
                <td class="info text-center"><input class="preupdate btn btn-info my-2 my-sm-0 " type="button" name="" value="行程內容" /></td>
                <td class="text-right">
                    <input class="preupdate btn btn-success my-2 my-sm-0 " type="button" name="" value="修改" data-toggle="modal" data-target="#exampleModal" />
                    <input class="deletebtn btn btn-danger my-2 my-sm-0 " type="button" name="" value="刪除" />
                </td>
            </tr>`
            );
        });
        $("#tbody").append(
            '<input type="hidden" id="query" value="' +
            res.query +
            '"/>'
        );
    }

    /* switch page btn obj */
    function pagebtn(res) {
        var pagenums = res.pages;

        $("#pagebadge").remove();
        $("#pagebadgepre").after(
            '<span id="pagebadge" class="ml-2 badge badge-info w-25 ">第 ' +
            res.pageNo +
            " 頁 / 共 " +
            res.totalPages +
            " 頁</span>"
        );

        $("#pagination").empty();
        $("#pagination").append(
            `<li class="page-item"><a id="firstbtn" class="page-link" href="javascript:void(0)">第一頁</a></li>`
        );
        if (res.pageNo > 1) {
            $("#pagination").append(
                '<li class="page-item"><a id="prevbtn" class="page-link" href="javascript:void(0)">上一頁</a>' +
                '<input class="prev" type="hidden" value=' +
                (res.pageNo - 1) +
                "></li>"
            );
        }

        $.each(pagenums, function(i, num) {
            if (num == res.pageNo) {
                $("#pagination").append(
                    `<li class="page-item active"><a id="pageNo" class="pagebtn page-link " href="javascript:void(0)">` +
                    num + `<span class="sr-only">(current)</span></a></li>`

                );
            } else {
                $("#pagination").append(
                    `<li class="page-item"><a id="pageNo" class="pagebtn page-link" href="javascript:void(0)">` +
                    num + `</a></li>`

                );
            }
        });
        if (res.pageNo != res.totalPages) {
            $("#pagination").append(
                '<li class="page-item"><a id="nextbtn" class="page-link" href="javascript:void(0)">下一頁</a>' +
                '<input class="next" type="hidden" value=' +
                (res.pageNo + 1) +
                "></li>"

            );
        }
        $("#pagination").append(
            '<li class="page-item"><a id="lastbtn" class="page-link" href="javascript:void(0)">最末頁</a>' +
            '<input id="totalPages" type="hidden" value="' +
            res.totalPages +
            '"></li>'
        );
    }

    const fp = flatpickr(".actDate", {})


    function addAct() {
        return `<div id="act-list" class="act-list col-md-12">
    <p class="mx-2 ">
    <input placeholder="行程日期" type="text" class="actDate custom-select custom-select-lg col-md-2" required>
    <span class="remove float-right col-sm-1 btn btn-sm btn-outline-danger "><i class="fas fa-minus-circle"></i> 移除</span>
    <span class="float-right col-sm-1 "><i style="color:rgb(248, 225, 14);" class="price fas fa-dollar-sign">0</i></span>
    </p>

    <select class="typeId mx-2 custom-select custom-select-lg col-md-2">
        <option selected>請選擇行程類型</option>
        <option value="1">飯店</option>
        <option value="2">租車</option>
        <option value="3">活動</option>
        <option value="4">車道</option>
        <option value="5">補給站</option>
        <option value="6">我的最愛</option>
    </select>
    </div><div class="col-md-12"><hr/></div>`;
    }

    function type() {
        return `
<select class="typeId mx-2 custom-select custom-select-lg col-md-2">
    <option selected>請選擇行程類型</option>
    <option value="1">飯店</option>
    <option value="2">租車</option>
    <option value="3">活動</option>
    <option value="4">車道</option>
    <option value="5">補給站</option>
    <option value="6">我的最愛</option>
</select>`;
    }

    function condition() {
        return `
<select class="condition mx-2 custom-select custom-select-lg col-md-2">
    <option selected>請選擇搜尋條件</option>
    <option value="1">依區域搜尋</option>
    <option value="2">關鍵字搜尋</option>
</select>`;
    }

    function regionnum() {
        return `
<select class="region mx-2 custom-select custom-select-lg col-md-2">
    <option selected>請選擇地區</option>
    <option value="1">臺北市</option>
    <option value="2">新北市</option>
    <option value="3">基隆市</option>
    <option value="4">桃園市</option>
    <option value="5">新竹市</option>
    <option value="6">新竹縣</option>
    <option value="7">苗栗縣</option>
    <option value="8">臺中市</option>
    <option value="9">彰化縣</option>
    <option value="10">南投縣</option>
    <option value="11">雲林縣</option>
    <option value="12">嘉義市</option>
    <option value="13">嘉義縣</option>
    <option value="14">臺南市</option>
    <option value="15">高雄市</option>
    <option value="16">屏東縣</option>
    <option value="17">宜蘭縣</option>
    <option value="18">花蓮縣</option>
    <option value="19">臺東縣</option>
    <option value="20">澎湖縣</option>
    <option value="21">金門縣</option>
    <option value="22">連江縣</option>
  </select>`;
    }

    function region() {
        return `
<select class="region mx-2 custom-select custom-select-lg col-md-2">
    <option selected>請選擇地區</option>
    <option value="臺北市">臺北市</option>
    <option value="新北市">新北市</option>
    <option value="基隆市">基隆市</option>
    <option value="桃園市">桃園市</option>
    <option value="新竹市">新竹市</option>
    <option value="新竹縣">新竹縣</option>
    <option value="苗栗縣">苗栗縣</option>
    <option value="臺中市">臺中市</option>
    <option value="彰化縣">彰化縣</option>
    <option value="南投縣">南投縣</option>
    <option value="雲林縣">雲林縣</option>
    <option value="嘉義市">嘉義市</option>
    <option value="嘉義縣">嘉義縣</option>
    <option value="臺南市">臺南市</option>
    <option value="高雄市">高雄市</option>
    <option value="屏東縣">屏東縣</option>
    <option value="宜蘭縣">宜蘭縣</option>
    <option value="花蓮縣">花蓮縣</option>
    <option value="臺東縣">臺東縣</option>
    <option value="澎湖縣">澎湖縣</option>
    <option value="金門縣">金門縣</option>
    <option value="連江縣">連江縣</option>
  </select>`;
    }

    function query() {
        return `<input placeholder="請輸入查詢字串" type="text" class="query mx-2 border-0 custom-select-lg col-md-2"> `
    }

    function bikeStore(description) {
        return `<select class="store mx-2 custom-select custom-select-lg col-md-2">
    <option selected>` + description + `</option></select><input type="hidden" value="0" > `;

    }

    function chooseBike(description) {
        return `<select class="infoId bike mx-2 custom-select custom-select-lg col-md-3">
    <option selected>` + description + `</option></select> `;

    }

    function hotel(description) {
        return `<select class="infoId hotel mx-2 custom-select custom-select-lg col-md-2">
    <option selected>` + description + `</option></select> `;
    }

    function chooseRoom(description) {
        return `<select class="room mx-2 custom-select custom-select-lg col-md-3">
    <option selected>` + description + `</option><input type="hidden" value="0" ></select> `;
    }

    function info(description) {
        return `<select class="infoId mx-2 custom-select custom-select-lg col-md-5">
    <option selected>` + description + `</option></select> 
    <input type="hidden" class="price" value="0">`;

    }

    function infolist(infoId, obj) {
        return '<option value="' + infoId + '">' + obj + '</option></select>';

    }

    function roomlist() {
        return `<option value="1000 ">二人房</option></select>
            <option value="2000 ">三人房</option></select>
            <option value="3000 ">家庭套房</option></select>
            <option value="4000 ">總統套房</option></select>`;

    }

    function favoritelist() {
        return `<select class="favorite infoId mx-2 custom-select custom-select-lg col-md-5">
    <option selected>請選擇我的最愛</option></select> 
    <input type="hidden" class="price" value="0">`;
    }

    function favorite(i, obj) {
        return `<option id="` + obj[i].typeId + `" value="` + obj[i].infoId + `">` + obj[i].favName + `</option>`;
    }



    var orderTime = moment().format("yyyy-MM-DD");
    var totalPrice = parseInt($(".totalPrice").text().trim());

    $("#plus").on("click", function() {
        $("#myAct").append(addAct());
        const fp = flatpickr(".actDate", {})

    });

    $("#myAct").on("change", ".typeId", function() {
        var $t = $(this);
        var typeId = $(this).val();
        $(this).nextAll().remove();
        if ($(this).val() == 6) {
            $(this).after(favoritelist());

            $.ajax({
                url: 'getFavInfo',
                type: 'post',
                data: {
                    memberId: $("#memberId").val(),
                },
                success: function(res) {
                    // console.log(res);
                    console.log(res);
                    var favType;
                    $.each(res.favorite, function(i, obj) {
                        favType = res.favorite[i].typeId;

                        $t.siblings(".favorite").append(favorite(i, res.favorite));

                        // if (favType == 1) {
                        //     $(".favorite").after(chooseRoom('請選擇房型'));
                        // }
                        if (favType == 2) {
                            var lastPrice = $t.siblings("input").val();
                            totalPrice -= lastPrice;
                            var price = parseInt(res.list[i].dayPrice);
                            totalPrice += price;
                            // $t.closest(".act-list").find(".price").text(price);
                            $t.siblings("input").val(price);
                            // $(".totalPrice").text(totalPrice);
                        }
                    })
                }
            });
        } else {
            $(this).after(condition());
        }
    });

    $("#myAct").on("change", ".favorite", function() {
        var price = parseInt($(this).siblings("input").val());
        var $t = $(this);
        var options = $(this).find('option:selected').attr('id');
        console.log("options");
        console.log(options);
        $.ajax({
            url: 'getSelectFav',
            type: 'post',
            data: {
                memberId: $("#memberId").val(),
                infoId: $(this).val(),
                typeId: options
            },
            success: function(res) {
                var favType = res.favorite.typeId;
                console.log(res);
                if (favType == 1) {
                    totalPrice -= price;
                    $(".favorite").after(chooseRoom('請選擇房型'));
                    $(".room").append(roomlist());
                }
                if (favType == 2) {
                    totalPrice -= price;
                    totalPrice += price;
                    $t.closest(".act-list").find(".price").text(price);
                    $(".totalPrice").text(totalPrice);
                }
                $t.siblings('.typeId').val(favType);
            }
        });
    });


    $("#myAct").on("change", ".condition", function() {
        var typeId = $(this).siblings('.typeId').val();
        var condition = $(this).val();
        if (condition == 1) {
            $(this).nextAll().remove();
            if (typeId == 2) {
                $(this).after(regionnum());
            } else {
                $(this).after(region());
            }
        }
        if (condition == 2) {
            $(this).nextAll().remove();
            $(this).after(query())
        }
    });

    $("#myAct").on("change", ".region", function() {
        var typeId = $(this).siblings('.typeId').val();
        $(this).nextAll().remove();
        if (typeId == 1) {
            $(this).after(hotel('請選擇飯店'));
        };
        if (typeId == 2) {
            $(this).after(bikeStore('請選擇車行'));
        };
        if (typeId == 3) {
            $(this).after(info('請選擇活動'));
        };
        if (typeId == 4) {
            $(this).after(info('請選擇車道'));
        };
        if (typeId == 5) {
            $(this).after(info('請選擇站點'));
        };
        if (typeId == 6) {
            $(this).after(info('請選擇我的最愛'));
        };
        $.ajax({
            url: 'getInfo',
            type: 'post',
            data: {
                typeId: typeId,
                query: $(this).val()
            },
            success: function(res) {
                console.log(res);

                if (typeId == 1) {
                    if (res.homestay.length == 0) {
                        $(".hotel").append(infolist(0, '查無飯店,請重新查詢'));
                    }
                    $.each(res.homestay, function(i, obj) {
                        $(".hotel").append(infolist(obj.Id, obj.Name));
                    });
                }
                if (typeId == 2) {
                    if (res.store.length == 0) {
                        $(".store").append(infolist(0, '查無車行,請重新查詢'));
                    }
                    $.each(res.store, function(i, obj) {
                        $(".store").append(infolist(obj.store_id, obj.st_name));
                    });
                }
                if (typeId == 3) {
                    if (res.event.length == 0) {
                        $(".infoId").append(infolist(0, '查無活動,請重新查詢'));
                    }
                    $.each(res.event, function(i, obj) {
                        $(".infoId").append(infolist(obj.eventId, obj.title));
                    });
                }
                if (typeId == 4) {
                    if (res.bike.length == 0) {
                        $(".infoId").append(infolist(0, '查無車道,請重新查詢'));
                    }
                    $.each(res.bike, function(i, obj) {
                        $(".infoId").append(infolist(obj.id, obj.name));
                    });
                }
                if (typeId == 5) {
                    if (res.restArea.length == 0) {
                        $(".infoId").append(infolist(0, '查無站點,請重新查詢'));
                    }
                    $.each(res.restArea, function(i, obj) {
                        $(".infoId").append(infolist(obj.id, obj.name));
                    });
                }
            }
        });
    });



    $("#myAct").on("change", ".hotel", function() {
        var typeId = $(this).siblings('.typeId').val();
        $(this).after(chooseRoom('請選擇房型'));
        if (typeId = 1) {
            $(".room").append(roomlist());
        }


    });
    $("#myAct").on("change", ".room", function() {
        var lastPrice = $(this).siblings("input").val();
        totalPrice -= lastPrice;
        var price = parseInt($(this).val());
        totalPrice += price;

        $(".totalPrice").text(totalPrice);
        $(this).closest(".act-list").find(".price").text(price);
        $(this).siblings("input").val(price);

    });
    $("#myAct").on("change", ".store", function() {
        var typeId = $(this).siblings('.typeId').val();
        $(this).after(chooseBike('請選擇車型'));
        $.ajax({
            url: 'getBikeByStore',
            type: 'post',
            data: {
                storeId: $(this).val()
            },
            success: function(res) {
                if (typeId = 2) {
                    if (res.bike.length == 0) {
                        $(".infoId").append(infolist(0, '查無庫存,請重新查詢'));
                    }
                    $.each(res.bike, function(i, obj) {
                        $(".infoId").append(infolist(obj.simBike.simRbId, obj.simBike.rbName));
                    })
                }
            }
        });
    });



    $("#myAct").on("change", ".bike", function() {
        var $t = $(this);
        $.ajax({
            url: 'getBikeInfo',
            type: 'post',
            data: {
                simRbId: $(this).val()
            },
            success: function(res) {
                // console.log(res);
                var lastPrice = $t.siblings("input").val();
                totalPrice -= lastPrice;
                var price = parseInt(res.bike.dayPrice);
                totalPrice += price;

                $t.closest(".act-list").find(".price").text(price);
                $t.siblings("input").val(price);
                $(".totalPrice").text(totalPrice);
            }
        });
    });



    $("#myAct").on("keyup", ".query", function() {
        var typeId = $(this).siblings('.typeId').val();
        $(this).nextAll().remove();
        if (typeId == 1) {
            $(this).after(info('請選擇飯店'));
        };
        if (typeId == 2) {
            $(this).after(info('請選擇車行'));
        };
        if (typeId == 3) {
            $(this).after(info('請選擇活動'));
        };
        if (typeId == 4) {
            $(this).after(info('請選擇車道'));
        };
        if (typeId == 5) {
            $(this).after(info('請選擇站點'));
        };
        if (typeId == 6) {
            $(this).after(info('請選擇我的最愛'));
        };
        $.ajax({
            url: 'getInfo',
            type: 'post',
            data: {
                typeId: typeId,
                query: $(this).val()
            },
            success: function(res) {
                // console.log(res);
                if (typeId == 3) {
                    if (res.event.length == 0) {
                        $(".infoId").append(infolist(0, '查無活動,請重新查詢'));
                    }
                    $.each(res.event, function(i, obj) {
                        $(".infoId").append(infolist(obj.eventId, obj.title));
                    });

                }
            }
        });
    });

    $("#save").on("click", function() {
        var name = $("#name").val().trim();
        if (!name == "" || !name == null) {
            console.log("name");
            var dataArray = new Array();
            var actName = {};
            actName.name = name;
            actName.memberId = parseInt($("#memberId").val());
            actName.orderTime = orderTime;
            actName.status = 0;
            actName.price = parseInt($(".totalPrice").text());
            dataArray.push(actName);
            $(".act-list").each(function(i) {
                var eventActivity = {};
                eventActivity.typeId = $(this).children(".typeId").val();
                eventActivity.infoId = $(this).children(".infoId").val();
                eventActivity.actDate = $(this).find(".actDate").val();
                eventActivity.name = name;
                eventActivity.price = $(this).children("input").val();
                eventActivity.memberId = parseInt($("#memberId").val());

                dataArray.push(eventActivity);
            });
            $.ajax({
                url: 'checkActivity',
                type: 'post',
                data: {
                    memberId: $("#memberId").val(),
                    actName: name
                },
                success: function(res) {
                    var result = res.result;
                    if (result) {
                        Swal.fire({
                            title: "名稱和現有行程重複，覆蓋原有行程?",
                            icon: "warning",
                            showCancelButton: true,
                            closeOnConfirm: false,
                            showLoaderOnConfirm: true,
                            confirmButtonClass: "btn-warning",
                            confirmButtonText: "覆蓋",
                            cancelButtonText: "取消",
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    headers: {
                                        Accept: "application/json",
                                        "Content-Type": "application/json",
                                    },
                                    url: 'addActivity',
                                    type: 'post',
                                    dataType: "json",
                                    data: JSON.stringify(dataArray),
                                    success: function() {
                                        Swal.fire({
                                                title: "儲存成功",
                                                icon: "success",
                                                timer: 3000,
                                                showConfirmButton: false,
                                            })
                                            .then(() => {
                                                location.reload();
                                            });
                                    }
                                });
                            }
                        });
                    } else {
                        $.ajax({
                            headers: {
                                Accept: "application/json",
                                "Content-Type": "application/json",
                            },
                            url: 'addActivity',
                            type: 'post',
                            dataType: "json",
                            data: JSON.stringify(dataArray),
                            success: function() {
                                Swal.fire({
                                        title: "儲存成功",
                                        text: "重新導向...",
                                        icon: "success",
                                        timer: 3000,
                                        showConfirmButton: false,
                                    })
                                    .then(() => {
                                        window.location.href = "activityMgr";
                                    });
                            }
                        });
                    }
                }
            });
        } else {
            Swal.fire({
                title: "請輸入行程名稱!",
                icon: "warning",
                timer: 1000,
                showConfirmButton: false,
            });
        }

    })

    $("#myAct").on("click", ".remove", function() {
        $(this).closest(".act-list").next().remove();
        $(this).closest(".act-list").remove();

    });

    $("#pageDiv").on("click", "#firstbtn", function() {
        $.ajax({
            url: "activityMgr.json",
            type: "post",
            data: {
                pageNo: 1,
                query: $("#query").val(),
            },
            dataType: "json",
            success: function(res) {
                pagebtn(res);
                tbodylist(res);
            },
        });
    });
    /* 上一頁 */
    $("#pageDiv").on("click", "#prevbtn", function() {
        $.ajax({
            url: "activityMgr.json",
            type: "post",
            data: {
                pageNo: $(".prev").val(),
                query: $("#query").val(),
            },
            dataType: "json",
            success: function(res) {
                pagebtn(res);
                tbodylist(res);
            },
        });
    });
    /* 下一頁 */
    $("#pageDiv").on("click", "#nextbtn", function() {
        $.ajax({
            url: "activityMgr.json",
            type: "post",
            data: {
                pageNo: $(".next").val(),
                query: $("#query").val(),
            },
            dataType: "json",
            success: function(res) {
                pagebtn(res);
                tbodylist(res);
            },
        });
    });
    /* 最後頁 */
    $("#pageDiv").on("click", "#lastbtn", function() {
        $.ajax({
            url: "activityMgr.json",
            type: "post",
            data: {
                pageNo: $("#totalPages").val(),
                query: $("#query").val(),
            },
            dataType: "json",
            success: function(res) {
                pagebtn(res);
                tbodylist(res);
            },
        });
    });
    /* 頁碼分頁 */
    $("#pageDiv").on("click", ".pagebtn", function() {
        $.ajax({
            url: "activityMgr.json",
            type: "post",
            data: {
                pageNo: $(this).text(),
                query: $("#query").val(),
            },
            dataType: "json",
            success: function(res) {
                pagebtn(res);
                tbodylist(res);
                console.log(res.pageNo);
            },
        });
    });

});