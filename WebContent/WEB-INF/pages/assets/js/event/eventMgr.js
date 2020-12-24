/* tbody list obj */
function backtop() {
    $("html,body").animate({
            scrollTop: 500,
        },
        "slow"
    );
    return false;
}

function tbodylist(res) {
    var list = res.list;
    $("#tbody").empty();
    $.each(list, function(i) {
        $("#tbody").append(
            '<tr><td class="eventId"><a href="eventDetail/' +
            list[i].eventId +
            '">' +
            list[i].eventId +
            '</a></td>' +
            '<td class="title">' +
            list[i].title +
            '</td>' +
            '<td class="location">' +
            list[i].location +
            '</td>' +
            '<td class="locationName">' +
            list[i].locationName +
            '</td>' +
            '<td class="price">' +
            list[i].price +
            '</td>' +
            '<td class="showunit">' +
            list[i].showunit +
            '</td>' +
            '<td class="startDate">' +
            list[i].startDate +
            '</td>' +
            '<td class="endDate">' +
            list[i].endDate +
            '</td>' +
            '<td><input class="preupdate btn btn-success my-2 my-sm-0 " type="button" name=' +
            list[i].eventId +
            ' value="修改" data-toggle="modal" data-target="#exampleModal" /></td>' +
            '<td><input class="deletebtn btn btn-danger my-2 my-sm-0 " type="button" name="' +
            list[i].eventId +
            '" value="刪除"/></td>' +
            '<input class="image" type="hidden" value="' +
            list[i].image +
            '">' +
            '<input class="categoryId" type="hidden" value="' +
            res.categoryId +
            '">' +
            '<input class="description" type="hidden" value="' +
            list[i].description +
            '">' +
            '<input class="website" type="hidden" value="' +
            list[i].website +
            '">' +
            '<input class="onsales" type="hidden" value="' +
            list[i].onsales +
            '"></tr>'
        );
    });
    $("#tbody").append(
        '<input type="hidden" id="categoryId" value="' +
        res.categoryId +
        '"/>' +
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
$(function() {
    $("#add").on("click", function() {
        $("#title").val("12/25期末發表");
        $("#catId").val(3);
        $("#location").val("桃園市中壢區中大路300號");
        $("#locationName").val("資策會");
        $("#showunit").val("跨域爪哇班");
        $("#website").val("http://www.iii.com.tw");
        $("#onsales").val("Y");
        $("#price").val(100000);
        $("#startDate").val("2020-12-25");
        $("#endDate").val("2020-12-25");
        $("#description").val("結案順利");
    });
});

// ======================PRE UPDATE===================
$("#tbody").on("click", ".preupdate", function() {
    $(".modal-title").text("修改資料");

    $("#eventId").val($(this).closest("tr").find(".eventId").text());
    $("#catId").val($(this).closest("tr").find(".categoryId").val());
    $("#title").val($(this).closest("tr").find(".title").text());
    $("#location").val($(this).closest("tr").find(".location").text());
    $("#locationName").val($(this).closest("tr").find(".locationName").text());
    $("#price").val($(this).closest("tr").find(".price").text());
    $("#showunit").val($(this).closest("tr").find(".showunit").text());
    $("#startDate").val($(this).closest("tr").find(".startDate").text());
    $("#endDate").val($(this).closest("tr").find(".endDate").text());
    $("#description").text($(this).closest("tr").find(".description").val());
    $("#onsales").val($(this).closest("tr").find(".onsales").val());
    $("#image").val($(this).closest("tr").find(".image").val());
    $("#website").val($(this).closest("tr").find(".website").val());
    $("#insertbtn").attr("id", "updatebtn");
});

//=========================INSERT======================
$("#exampleModal").on("click", "#insertbtn", function() {
    $.ajax({
        url: "saveEvent",
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
                    text: "重新導向...",
                    icon: "success",
                    timer: 3000,
                    showConfirmButton: false,
                })
                .then(() => {
                    location.reload();
                });
        },
    });
});

// ====================UPDATE============================
$("#exampleModal").on("click", "#updatebtn", function() {
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
                url: "eventUpdate.controller",
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
                            text: "重新導向...",
                            icon: "success",
                            timer: 3000,
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

// ====================DELETE===========================
$("#tbody").on("click", ".deletebtn", function() {
    Swal.fire({
        title: "確認刪除此項資料(ID:" +
            $(this).closest("tr").find(".eventId").text() +
            ")?",
        // text: "(ID:" + $(this).closest("tr").find(".eventId").text() + ")",
        icon: "error",
        showCancelButton: true,
        closeOnConfirm: false,
        showLoaderOnConfirm: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "刪除",
        cancelButtonText: "取消",
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "eventDelete.controller",
                type: "post",
                data: {
                    eventId: $(this).closest("tr").find(".eventId").text(),
                },
                success: function(res) {
                    if (res) {
                        Swal.fire({
                                title: "刪除成功",
                                text: "重新導向...",
                                icon: "success",
                                timer: 3000,
                                showConfirmButton: false,
                            })
                            .then(() => {
                                location.reload();
                            });
                    } else {
                        bootbox.alert("操作有誤");
                    }
                },
            });
        }
    });

});

const id = "29f8f19bf530bf5";
const token = "d30fd4af2bd4d24d07cd7500c1db97133754de1b";
const album = "UZJ88Cx";

const upload = new Vue({
    el: "#upload-wrap",
    data: {
        album: album,
        file: null,
        fs: {
            name: "",
            thumbnail: null,
            size: null,
        },
        title: "",
        des: "",
    },
    methods: {
        showFile(e) {
            this.file = e.target.files[0];
            this.fs.name = this.file.name;
            this.fs.size = Math.floor(this.file.size * 0.001) + "KB";
            this.fs.thumbnail = window.URL.createObjectURL(this.file);
            this.title = this.fs.name;
        },
        submit() {
            let settings = {
                async: true,
                crossDomain: true,
                processData: false,
                contentType: false,
                type: "POST",
                dataType: "json",
                url: "https://api.imgur.com/3/image",
                headers: {
                    Authorization: "Bearer " + token,
                },
                mimeType: "multipart/form-data",
            };

            let form = new FormData();
            form.append("image", this.file);
            form.append("title", this.title);
            form.append("album", album);

            settings.data = form;

            $.ajax(settings).done(function(res) {
                console.log(res);
                console.log(res.data.id);
                var imgId = res.data.id;
                $("#image").val("https://imgur.com/" + imgId + ".jpg");
                Swal.fire({
                    title: "上傳完成",
                    icon: "success",
                    timer: 2000,
                    showConfirmButton: true,
                });
            });
        },
    },
});

/* Search*/
$("#sform").on("keyup", "#search", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $(this).val(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        },
    });
});

/* choose location btn */
$("#region").on("click", "button", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $(this).text(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        },
    });
});
$("#region").on("click", "#all", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: "",
            categoryId: "",
        },
        dataType: "json",
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        },
    });
});

/* choose category btn */
$("#category").on("click", "#cat1", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "",
        },
        dataType: "json",
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        },
    });
});
$("#category").on("click", "#cat2", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "1",
        },
        dataType: "json",
        success: function(res) {
            console.log(res);
            tbodylist(res);
            pagebtn(res);
        },
    });
});
$("#category").on("click", "#cat3", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "2",
        },
        dataType: "json",
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        },
    });
});
$("#category").on("click", "#cat4", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: "3",
        },
        dataType: "json",
        success: function(res) {
            tbodylist(res);
            pagebtn(res);
        },
    });
});

/* 第一頁 */
$("#pageDiv").on("click", "#firstbtn", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: 1,
            query: $("#query").val(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
            backtop();
        },
    });
});
/* 上一頁 */
$("#pageDiv").on("click", "#prevbtn", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: $(".prev").val(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
            backtop();
        },
    });
});
/* 下一頁 */
$("#pageDiv").on("click", "#nextbtn", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: $(".next").val(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
            backtop();
        },
    });
});
/* 最後頁 */
$("#pageDiv").on("click", "#lastbtn", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: $("#totalPages").val(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
            backtop();
        },
    });
});
/* 頁碼分頁 */
$("#pageDiv").on("click", ".pagebtn", function() {
    $.ajax({
        url: "eventmgrPage.json",
        type: "post",
        data: {
            pageNo: $(this).text(),
            query: $("#query").val(),
            categoryId: $("#categoryId").val(),
        },
        dataType: "json",
        success: function(res) {
            pagebtn(res);
            tbodylist(res);
            backtop();
        },
    });
});


// LOCATION CHART

var ctx = document.getElementById("locationChart").getContext("2d");
var gradientStroke2 = ctx.createLinearGradient(0, 230, 0, 50);

gradientStroke2.addColorStop(1, 'rgba(29,140,248,0.2)');
gradientStroke2.addColorStop(0.4, 'rgba(29,140,248,0.0)');
gradientStroke2.addColorStop(0, 'rgba(29,140,248,0)');

var gradientBarChartConfiguration = {
    scaleShowValues: true,
    maintainAspectRatio: false,
    legend: {
        display: false
    },

    tooltips: {
        backgroundColor: '#f5f5f5',
        titleFontColor: '#333',
        bodyFontColor: '#666',
        bodySpacing: 4,
        xPadding: 10,
        mode: "nearest",
        intersect: 0,
        position: "nearest"
    },
    responsive: true,
    scales: {
        yAxes: [{
            gridLines: {
                drawBorder: false,
                color: 'rgba(29,140,248,0.1)',
                zeroLineColor: 'transparent',
            },
            ticks: {
                suggestedMin: 0,
                suggestedMax: 50,
                padding: 10,
                fontColor: '#9e9e9e',
                autoSkip: false,
                beginAtZero: true,
                maxTicksLimit: 10
            }
        }],

        xAxes: [{
            gridLines: {
                drawBorder: false,
                color: 'rgba(29,140,248,0.1)',
                zeroLineColor: 'transparent',
            },
            ticks: {
                padding: 10,
                fontColor: '#9e9e9e',
                autoSkip: false,
                beginAtZero: true,
                maxTicksLimit: 10
            }
        }],
    }
};

var locationChart = new Chart(ctx, {
    legend: {
        display: true
    },
    type: 'bar',
    data: {
        labels: [],
        datasets: [{
            label: "地區",
            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", "#8e5ea2"],
            // hoverBackgroundColor: gradientStroke2,
            // borderColor: ["rgba(0,227,227,0.4)", "#0080FF", "#02F78E", "#7B7B7B", "#CE0000", "#FF0080", "#E800E8"],
            // borderWidth: 2,
            // borderDash: [],
            // borderDashOffset: 0.0,
            data: [],

        }, ]
    },
    options: gradientBarChartConfiguration,
    showTooltips: false

});

$.ajax({
    type: "post",
    url: "eventLocationData",
    dataType: "json",
    success: function(res) {
        var area = new Array;
        $.each(res.area, function(i) {
            area.push(res.area[i].area_name);
        });
        var locationCount = res.locationCount;
        locationChart.data.datasets[0].data = locationCount;
        locationChart.data.labels = area;
        locationChart.update();
    }
})


//  CAT CHART
var ctx2 = document.getElementById("catChart").getContext("2d");

var catChart = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: ["飯店", "租車", "活動", "自行車道", "補給站"],
        datasets: [{
            label: "會員行程偏好",
            backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", '#FF2D2D', '#FFD306', '#00395c'],
            data: [0, 0, 0, 0, 0]
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
            display: true
        }


    },
    tooltips: {
        callbacks: {
            label: function(tooltipItem, data) {
                var dataset = data.datasets[tooltipItem.datasetIndex];
                var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
                    return previousValue + currentValue;
                });
                var currentValue = dataset.data[tooltipItem.index];
                var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
                return percentage + "%";
            }
        }
    },

});



$.ajax({
    type: "post",
    url: "eventCatData",
    dataType: "json",
    success: function(res) {
        console.log(res);
        catChart.data.datasets[0].data = res;
        catChart.data.labels = ["娛樂", "展覽", "親子"];
        catChart.update();
    }
})