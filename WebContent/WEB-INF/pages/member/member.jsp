<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
            <link rel="icon" type="image/png" href="img/favicon.png">
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css" />
            <title>EEIT124Team1</title>
            <!--     Fonts and icons     -->
            <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
            <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
            <!-- Nucleo Icons -->
            <link href="css/nucleo-icons.css" rel="stylesheet" />
            <!-- CSS Files -->
            <link href="css/black-dashboard.css" rel="stylesheet" />
            <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css" />
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <style type="text/css">
                body {
                    font-family: Microsoft JhengHei;
                    background-color: #f5f5f5;
                    font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro", "ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
                    color: #333333;
                }
            </style>
        </head>
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script> -->
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


        <script>
            function confirmListDelete(listobj) {
                var obj = listobj.name;
                Swal.fire({
                    title: "確定停權此用戶(ID:" + obj + "?)",
                    icon: "warning",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "停權",
                    cancelButtonText: "取消",
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            type: "POST",
                            url: "memberSuspension.controller",
                            dataType: "text",
                            data: {
                                memberId: obj
                            },
                            success: function(res) {
                                if (res == 1) {

                                    Swal.fire({
                                            title: "已停權",
                                            icon: "success",
                                            timer: 1500,
                                            showConfirmButton: false,
                                        })
                                        .then(() => {
                                            $("input[name='" + obj + "']").closest('td').prev().html('<font style="color:orange">已停權');
                                        });
                                }

                            },
                        });
                    }
                });
            }
            //
            function update(listobj) {
                var obj = listobj.id;
                Swal.fire({
                    title: "確定恢復此用戶權限(ID:" + obj + "?)",
                    icon: "info",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                    confirmButtonClass: "btn-info",
                    confirmButtonText: "恢復",
                    cancelButtonText: "取消",
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            type: "POST",
                            url: "memberEmpowerment.controller",
                            dataType: "text",
                            data: {
                                memberId: obj
                            },
                            success: function(res) {
                                if (res == 1) {
                                    Swal.fire({
                                            title: "已恢復權限",
                                            icon: "success",
                                            timer: 1500,
                                            showConfirmButton: false,
                                        })
                                        .then(() => {
                                            $("input[id='" + obj + "']").closest('td').prev().html("<font style='color:#6F00D2'>尚未驗證");
                                        });

                                }
                                if (res == 2) {
                                    Swal.fire({
                                            title: "已恢復權限",
                                            icon: "success",
                                            timer: 1500,
                                            showConfirmButton: false,
                                        })
                                        .then(() => {
                                            $("input[id='" + obj + "']").closest('td').prev().html("<font style='color:navy'>已驗證");
                                        });
                                }
                            },
                        });
                    }
                });

            }

            //
            function showInfo(data) {
                var id = data.id;
                $.ajax({
                    type: "post",
                    url: "getMemberInfo",
                    dataType: "json",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        console.log(data);
                        if (data.memberAdvanced != null) {
                            if (data.memberAdvanced.birthday != null) {
                                var dateString = ("\/Date(" + data.memberAdvanced.birthday + ")\/").substr(6);
                                var currentTime = new Date(parseInt(dateString));
                                var month = currentTime.getMonth() + 1;
                                var day = currentTime.getDate();
                                var year = currentTime.getFullYear();
                                var date = year + "/" + month + "/" + day;
                            }
                        }
                        if (data.memberAdvanced == null) {
                            $("#birthday").text("尚未經過信箱驗證");
                        } else if (data.memberAdvanced.birthday == null) {
                            $("#birthday").text("尚未填寫");
                        } else {
                            $("#birthday").text(date);
                        }

                        if (data.memberAdvanced == null) {
                            $("#address").text("尚未經過信箱驗證");
                        } else if (data.memberAdvanced.address == null) {
                            $("#address").text("尚未填寫");
                        } else {
                            $("#address").text(data.memberAdvanced.address);
                        }

                        $("#name").text(data.name);
                        $("#gender").text(data.gender);
                        $("#email").text(data.email);
                        $("#tel").text(data.tel);
                    }
                });
            }

            function memberBasicList2(memberList, levelList, statusList, i) {
                var type = memberList[i].loginType;
                var status = statusList[i];
                var listNormalAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:green">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:navy">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';

                var listNormalNot = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:green">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:#6F00D2">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';
                var listNormalDen = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:green">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:orange">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';


                var listGoogleAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:red">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:navy">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';
                var listGoogleNot = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:red">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:#6F00D2">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';

                var listGoogleDen = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:red">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:orange">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';

                var listFacAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:blue">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:navy">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';
                var listFacNot = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:blue">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:#6F00D2">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';
                var listFacAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                    '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                    '</td><td>' + levelList[i] + '</td><td><font style="color:blue">' + memberList[i].loginType + '</font></td>' +
                    '<td class="text-center" id="status"><font style="color:orange">' + statusList[i] +
                    '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                    '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                    '</td></tr>';

                if (type == "一般" && status == "已驗證") {
                    return listNormalAlr;
                } else if (type == "一般" && status == "尚未驗證") {
                    return listNormalNot;
                } else if (type == "一般" && status == "已停權") {
                    return listNormalDen;
                } else if (type == "google" && status == "已驗證") {
                    return listGoogleAlr;
                } else if (type == "google" && status == "尚未驗證") {
                    return listGoogleNot;
                } else if (type == "google" && status == "已停權") {
                    return listGoogleDen;
                } else if (type == "facebook" && status == "已驗證") {
                    return listFacAlr;
                } else if (type == "facebook" && status == "尚未驗證") {
                    return listFacNot;
                } else {
                    return listFacDen;
                }

            }
            var option = {
                "destroy": true,
                "lengthMenu": [10, 20],
                "searching": false,
                "language": {
                    "processing": "處理中...",
                    "loadingRecords": "載入中...",
                    "lengthMenu": "顯示 _MENU_ 項結果",
                    "zeroRecords": "沒有符合的結果",
                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                    "infoPostFix": "",
                    "paginate": {
                        "first": "第一頁",
                        "previous": "上一頁",
                        "next": "下一頁",
                        "last": "最後一頁"
                    },
                    "aria": {
                        "sortAscending": ": 升冪排列",
                        "sortDescending": ": 降冪排列"
                    }
                }
            }
            var table = ` <thead class="thead-light text-primary">
        <tr>
        <th>
         	 會員ID
        </th>
        <th>
           	 姓名
        </th>
        <th>
            	居住地區
        </th>
        <th>
       	 	註冊時間
        </th>
        <th>
        	用戶等級
        </th>
        <th class="text-center">
            	帳號狀態
        </th>
        <th class="text-right">
            <a class="btn btn-secondary my-2 my-sm-0  " href="eventInsertEntryPage"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
              </svg>
              </a>
        </th>
    </tr>
</thead>
<tbody id="tbody">`

            function queryfavor(num) {
                id = num.id;
                $.ajax({
                    type: "post",
                    url: "queryByFavor",
                    dataType: "json",
                    data: {
                        favorId: id
                    },
                    success: function(data) {

                        if (data != null) {
                            $("#tbody").empty();
                            $("#info").DataTable().destroy();
                            $("#info").DataTable().clear();
                            $("#info").empty();
                            $("#info").append(table);
                            console.log(data);
                            for (var i = 0; i < data.memberBasic.length; i++) {
                                loginType();
                                var memberList = data.memberBasic;
                                var levelList = data.level;
                                var statusList = data.status;
                                $("#tbody").append(memberBasicList2(memberList, levelList, statusList, i));
                                console.log(memberList[i].memberId);
                                if (data.memberBasic.length == 0) {
                                    $("#total").text("共筆資料");
                                } else {
                                    $("#total").text("共" + data.memberBasic.length + "筆資料");
                                }
                                console.log(data.memberBasic.length);
                            }
                            $("#info").DataTable(option).draw();

                        }
                    }
                })
            }

            function querystatus(num) {
                var status = num.id;
                $.ajax({
                    type: "post",
                    url: "queryByStatus",
                    dataType: "json",
                    data: {
                        status: status
                    },
                    success: function(data) {

                        if (data != null) {
                            $("#tbody").empty();
                            $("#info").DataTable().destroy();
                            $("#info").DataTable().clear();
                            $("#info").empty();
                            $("#info").append(table);
                            console.log(data);
                            for (var i = 0; i < data.memberBasic.length; i++) {
                                loginType();
                                var memberList = data.memberBasic;
                                var levelList = data.level;
                                var statusList = data.status;
                                $("#tbody").append(memberBasicList2(memberList, levelList, statusList, i));
                                console.log(memberList[i].memberId);
                                if (data.memberBasic.length == 0) {
                                    $("#total").text("共筆資料");
                                } else {
                                    $("#total").text("共" + data.memberBasic.length + "筆資料");
                                }
                                console.log(data.memberBasic.length);
                            }
                            $("#info").DataTable(option).draw();

                        }
                    }
                })
            }

            function queryarea(num) {
                area = num.id;
                $.ajax({
                    type: "post",
                    url: "queryByArea.controller",
                    dataType: "json",
                    data: {
                        area: area
                    },
                    success: function(data) {

                        if (data != null) {
                            $("#tbody").empty();
                            $("#info").DataTable().destroy();
                            $("#info").DataTable().clear();
                            $("#info").empty();
                            $("#info").append(table);
                            console.log(data);
                            for (var i = 0; i < data.memberBasic.length; i++) {
                                var memberList = data.memberBasic;
                                var levelList = data.level;
                                var statusList = data.status;
                                $("#tbody").append(memberBasicList2(memberList, levelList, statusList, i));
                                console.log(memberList[i].memberId);
                                if (data.memberBasic.length == 0) {
                                    $("#total").text("共筆資料");
                                } else {
                                    $("#total").text("共" + data.memberBasic.length + "筆資料");
                                }
                                console.log(data.memberBasic.length);
                            }
                            $("#info").DataTable(option).draw();

                        }
                    }
                })
            }

            function querygender(num) {
                var gender = num.id;
                $.ajax({
                    type: "post",
                    url: "queryByGender",
                    dataType: "json",
                    data: {
                        gender: gender
                    },
                    success: function(data) {

                        if (data != null) {
                            $("#tbody").empty();
                            $("#info").DataTable().destroy();
                            $("#info").DataTable().clear();
                            $("#info").empty();
                            $("#info").append(table);
                            console.log(data);
                            for (var i = 0; i < data.memberBasic.length; i++) {
                                var memberList = data.memberBasic;
                                var levelList = data.level;
                                var statusList = data.status;
                                $("#tbody").append(memberBasicList2(memberList, levelList, statusList, i));
                                console.log(memberList[i].memberId);
                                if (data.memberBasic.length == 0) {
                                    $("#total").text("共筆資料");
                                } else {
                                    $("#total").text("共" + data.memberBasic.length + "筆資料");
                                }
                                console.log(data.memberBasic.length);
                            }
                            $("#info").DataTable(option).draw();

                        }
                    }
                })
            }
            $(function() {

                function memberBasicList(memberList, levelList, statusList, i) {
                    var type = memberList[i].loginType;
                    var status = statusList[i];
                    var listNormalAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:green">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:navy">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';

                    var listNormalNot = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:green">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:#6F00D2">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';
                    var listNormalDen = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:green">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:orange">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';


                    var listGoogleAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:red">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:navy">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';
                    var listGoogleNot = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:red">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:#6F00D2">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';

                    var listGoogleDen = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:red">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:orange">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';

                    var listFacAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:blue">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:navy">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';
                    var listFacNot = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:blue">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:#6F00D2">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';
                    var listFacAlr = '<tr><td><a href="" cursor="pointer" onclick="showInfo(this)" id="' + memberList[i].memberId + '" data-toggle="modal" name="' + memberList[i].memberId + '" data-target=".bd-example-modal-sm">' + memberList[i].memberId +
                        '</a></td><td>' + memberList[i].name + '</td><td>' + memberList[i].memberArea.area + '</td><td>' + memberList[i].registTime +
                        '</td><td>' + levelList[i] + '</td><td><font style="color:blue">' + memberList[i].loginType + '</font></td>' +
                        '<td class="text-center" id="status"><font style="color:orange">' + statusList[i] +
                        '</font></td><td class="text-right"><input class="btn btn-success my-2 my-sm-0 " type="button" id="' + memberList[i].memberId + '" value="恢復權限"  onclick="update(this)"/>' +
                        '<input class="btn btn-danger my-2 my-sm-0 " type="button" name="' + memberList[i].memberId + '" value="停權" onclick="confirmListDelete(this)"/>' +
                        '</td></tr>';

                    if (type == "一般" && status == "已驗證") {
                        return listNormalAlr;
                    } else if (type == "一般" && status == "尚未驗證") {
                        return listNormalNot;
                    } else if (type == "一般" && status == "已停權") {
                        return listNormalDen;
                    } else if (type == "google" && status == "已驗證") {
                        return listGoogleAlr;
                    } else if (type == "google" && status == "尚未驗證") {
                        return listGoogleNot;
                    } else if (type == "google" && status == "已停權") {
                        return listGoogleDen;
                    } else if (type == "facebook" && status == "已驗證") {
                        return listFacAlr;
                    } else if (type == "facebook" && status == "尚未驗證") {
                        return listFacNot;
                    } else {
                        return listFacDen;
                    }
                }
                $("#query").keyup(function() {
                    var query = $("#query").val();
                    console.log(query);
                    $.ajax({
                        type: "post",
                        url: "allRangeQuery",
                        dataType: "json",
                        data: {
                            query: query
                        },
                        success: function(data) {

                            if (data != null) {
                                $("#tbody").empty();
                                //
                                $("#info").DataTable().destroy();
                                $("#info").DataTable().clear();
                                $("#info").empty();
                                $("#info").append(table);
                                //
                                console.log(data);
                                for (var i = 0; i < data.memberBasic.length; i++) {
                                    var memberList = data.memberBasic;
                                    var levelList = data.level;
                                    var statusList = data.status;
                                    $("#tbody").append(memberBasicList(memberList, levelList, statusList, i));
                                    console.log(memberList[i].memberId);
                                    if (data.memberBasic.length == 0) {
                                        $("#total").text("共筆資料");
                                    } else {
                                        $("#total").text("共" + data.memberBasic.length + "筆資料");
                                    }
                                    console.log(data.memberBasic.length);
                                }
                                $("#info").DataTable(option).draw();
                            }
                        }
                    });
                });




            })
        </script>

        <body class="white-content">
            <div class="wrapper">
                <div class="sidebar" data="blue">

                    <div class="sidebar-wrapper">
                        <div class="logo">
                            <a href="javascript:void(0)" class="simple-text logo-mini"> III
					</a> <a href="javascript:void(0)" class="simple-text logo-normal">
						EEIT124Team1 </a>
                        </div>
                        <ul class="nav">
                            <li>
                                <a href="dashboard"> <i class="tim-icons icon-chart-pie-36"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="active ">
                                <a href="adminPage.controller"> <i class="tim-icons icon-single-02"></i>
                                    <p>會員</p>
                                </a>
                            </li>
                            <li>
                                <a href="maintainStorePre.controller?pageNo=1"> <i class="tim-icons icon-cart"></i>
                                    <p>租車</p>
                                </a>
                            </li>
                            <li>
                                <a href="eventDashboard"> <i class="tim-icons icon-calendar-60"></i>
                                    <p>活動</p>
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/bikeMgrEntry.controller?pageNo=1'/>"> <i class="tim-icons"><svg width="1.5em" height="1.2em"
									viewBox="0 0 16 16" class="bi bi-bicycle" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443l-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057L9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z" />
                              </svg></i>
                                    <p class="p-1">自行車</p>
                                </a>
                            </li>
                            <li>
                                <a href="sixsix.Home.controller"> <i class="tim-icons"><svg
									width="1.5em" height="1.2em" viewBox="0 0 16 16"
									class="bi bi-house-fill" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
										d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                <path fill-rule="evenodd"
										d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                              </svg></i>
                                    <p class="p-1">住宿</p>
                                </a>
                            </li>

                            <li>
                                <a href="toSettingPage?authority=2"> <i class="tim-icons icon-settings-gear-63"></i>
                                    <p>設定</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="main-panel">
                    <!-- Navbar -->

                    <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<i class="tim-icons icon-simple-remove"></i>
							</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Navbar -->

                    <div class="content">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h1 class="h2">會員</h1>
                            <h1 class="h2"></h1>
                            <div class="btn-toolbar mb-2 mb-md-0">
                                <div id="export" class="export dropdown-menu dropdown-menu-right" aria-labelledby="">
                                    <a href="eventAllData" download="eventChart.json" id="export-json" class="dropdown-item">JSON</a>
                                    <!-- <a id="export-excel" class="dropdown-item">EXCEL</a> -->
                                </div>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    匯出圖表
  </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a id="export-png" class="dropdown-item" download="meiyuehuiyuan.png">每月會員數</a>
                                        <a id="export-png2" class="dropdown-item" href="#" download="gediquhuiyuan.png">各地區會員</a>
                                        <a id="export-png3" class="dropdown-item" href="#" download="huiyuandenrufangshi.png">會員登入方式</a>
                                        <a id="export-png4" class="dropdown-item" href="#" download="nienlinfenbu.png">年齡分布</a>
                                        <a id="export-png5" class="dropdown-item" download="todayhuiyuan.png">今日註冊數</a>
                                        <a id="export-png6" class="dropdown-item" href="#" download="weekhuiyuan.png">本周註冊數</a>
                                        <a id="export-png7" class="dropdown-item" download="bikefavor.png">單車偏好</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card card-chart">
                                    <div class="card-header ">
                                        <div class="row">
                                            <div class="col-sm-6 text-left">
                                                <h5 class="card-category" id="little">此數量包含一般、進階及已停權會員</h5>
                                                <h2 class="card-title" id="big">
                                                    <i class="fas fa-users" style="color:orange;font-size:30px"></i>共${count}位註冊會員
                                                </h2>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                                    <label class="btn btn-sm btn-primary btn-simple active" id="0"> <input type="radio" name="options" checked>
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">每月會員數</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-single-02"></i>
											</span>
											</label> <label class="btn btn-sm btn-primary btn-simple" id="1">
												<input type="radio" class="d-none d-sm-none" name="options">
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">各地區會員數</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-gift-2"></i>
											</span>
											</label> <label class="btn btn-sm btn-primary btn-simple" id="2">
												<input type="radio" class="d-none" name="options"> <span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">每月登入方式統計</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-tap-02"></i>
											</span>
											</label> <label class="btn btn-sm btn-info btn-simple" id="3">
												<input type="radio" class="d-none" name="options"> <span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">年齡分佈</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-tap-02"></i>
											</span>
											</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="chartBig1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <span class="card-category">顯示數據為近七日之會員註冊數</span>
                                                <h2 class="card-title">
                                                    <i style="color:orange;font-size:25px" class="fas fa-user"></i>會員註冊數
                                                </h2>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                                                    <label class="btn btn-sm btn-primary btn-simple active" id="A"> <input type="radio" name="options" checked>
												<span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">今日會員註冊數</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-single-02"></i>
											</span>
											</label> <label class="btn btn-sm btn-primary btn-simple " id="B">
												<input type="radio" name="options" checked> <span
												class="d-none d-sm-block d-md-block d-lg-block d-xl-block">本周會員註冊數</span>
												<span class="d-block d-sm-none"> <i
													class="tim-icons icon-single-02"></i>
											</span>
											</label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="chartLinePurple"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="card card-chart">
                                    <div class="card-header">

                                        <span class="card-category">會員之自行車偏好及所在地區&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                                        <h2 class="card-title">
                                            <i style="color:orange;font-size:27px" class="fas fa-bicycle"></i>會員單車偏好
                                        </h2>

                                    </div>

                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="chartLineGreen"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <div class="card ">
                                    <div class="card-header">
                                        <h3 class="card-title">
                                            會員資料
                                            </h4>

                                            <span class="float-left">
										<div class="dropdown">
											<button type="button" class="btn btn-link"
												data-toggle="dropdown">
												<i class="tim-icons">性別</i>
											</button>
											<div class="dropdown-menu dropdown-menu-right"
												aria-labelledby="dropdownMenuLink">
												<button class="dropdown-item" id="Male"
													onclick="querygender(this)">男</button>
												<button class="dropdown-item" id="Female"
													onclick="querygender(this)">女</button>
												<button class="dropdown-item" id="Other"
													onclick="querygender(this)">其他</button>
											</div>
										</div>

									</span> <span class="float-left">
										<div class="dropdown">
											<button type="button" class="btn btn-link"
												data-toggle="dropdown">
												<i class="tim-icons">居住地區</i>
											</button>
											<div class="dropdown-menu dropdown-menu-right"
												aria-labelledby="dropdownMenuLink">
												<button class="dropdown-item" id="1"
													onclick="queryarea(this)">台北市</button>
												<button class="dropdown-item" id="2"
													onclick="queryarea(this)">新北市</button>
												<button class="dropdown-item" id="3"
													onclick="queryarea(this)">基隆市</button>
												<button class="dropdown-item" id="4"
													onclick="queryarea(this)">宜蘭縣</button>
												<button class="dropdown-item" id="5"
													onclick="queryarea(this)">桃園市</button>
												<button class="dropdown-item" id="6"
													onclick="queryarea(this)">新竹市</button>
												<button class="dropdown-item" id="7"
													onclick="queryarea(this)">新竹縣</button>
												<button class="dropdown-item" id="8"
													onclick="queryarea(this)">苗栗縣</button>
												<button class="dropdown-item" id="9"
													onclick="queryarea(this)">台中市</button>
												<button class="dropdown-item" id="10"
													onclick="queryarea(this)">彰化縣</button>
												<button class="dropdown-item" id="11"
													onclick="queryarea(this)">南投縣</button>
												<button class="dropdown-item" id="12"
													onclick="queryarea(this)">雲林縣</button>
												<button class="dropdown-item" id="13"
													onclick="queryarea(this)">嘉義市</button>
												<button class="dropdown-item" id="14"
													onclick="queryarea(this)">嘉義縣</button>
												<button class="dropdown-item" id="15"
													onclick="queryarea(this)">台南市</button>
												<button class="dropdown-item" id="16"
													onclick="queryarea(this)">高雄市</button>
												<button class="dropdown-item" id="17"
													onclick="queryarea(this)">屏東縣</button>
												<button class="dropdown-item" id="18"
													onclick="queryarea(this)">台東縣</button>
												<button class="dropdown-item" id="19"
													onclick="queryarea(this)">花蓮縣</button>
												<button class="dropdown-item" id="20"
													onclick="queryarea(this)">澎湖縣</button>
												<button class="dropdown-item" id="21"
													onclick="queryarea(this)">金門縣</button>
												<button class="dropdown-item" id="22"
													onclick="queryarea(this)">連江縣</button>
											</div>
										</div>

									</span> <span class="float-left">
										<div class="dropdown">
											<button type="button" class="btn btn-link"
												data-toggle="dropdown">
												<i class="tim-icons">自行車偏好</i>
											</button>
											<div class="dropdown-menu dropdown-menu-right"
												aria-labelledby="dropdownMenuLink">
												<button class="dropdown-item" id="1"
													onclick="queryfavor(this)">公路車</button>
												<button class="dropdown-item" id="2"
													onclick="queryfavor(this)">登山車</button>
												<button class="dropdown-item" id="3"
													onclick="queryfavor(this)">極限單車</button>
												<button class="dropdown-item" id="4"
													onclick="queryfavor(this)">摺疊車</button>
												<button class="dropdown-item" id="5"
													onclick="queryfavor(this)">淑女車</button>
												<button class="dropdown-item" id="6"
													onclick="queryfavor(this)">單速車</button>
												<button class="dropdown-item" id="7"
													onclick="queryfavor(this)">電動單車</button>
												<button class="dropdown-item" id="8"
													onclick="queryfavor(this)">斜躺車</button>
											</div>
										</div>

									</span> <span class="float-left">
										<div class="dropdown">
											<button type="button" class="btn btn-link"
												data-toggle="dropdown">
												<i class="tim-icons">帳號狀態</i>
											</button>
											<div class="dropdown-menu dropdown-menu-right"
												aria-labelledby="dropdownMenuLink">
												<button class="dropdown-item" id="1"
													onclick="querystatus(this)">未驗證</button>
												<button class="dropdown-item" id="2"
													onclick="querystatus(this)">已驗證</button>
												<button class="dropdown-item" id="3"
													onclick="querystatus(this)">已停權</button>
											</div>
										</div>

									</span>
                                            <form class="form-inline float-right mx-0" action="#" method="get">
                                                關鍵字搜尋： <input class="form-control h-25 w-200" placeholder="Email,姓名,電話" id="query" type="text" name="query" />

                                            </form>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table tablesorter " id="info">
                                                <thead class="thead-light text-primary">
                                                    <tr>
                                                        <th>
                                                            <h4>會員ID</h4>
                                                        </th>
                                                        <th>
                                                            <h4>姓名</h4>
                                                        </th>
                                                        <th>
                                                            <h4>居住地區</h4>
                                                        </th>
                                                        <th>
                                                            <h4>註冊時間</h4>
                                                        </th>
                                                        <th>
                                                            <h4>用戶等級</h4>
                                                        </th>
                                                        <th>
                                                            <h4>登入方式</h4>
                                                        </th>
                                                        <th>
                                                            <h4>帳號狀態</h4>
                                                        </th>
                                                        <th class="text-right">
                                                            <!-- <a class="btn btn-secondary my-2 my-sm-0  " href="eventInsertEntryPage"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                                      </svg>
                                                      </a>  -->
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                    <c:forEach var="rg" items="${member}">
                                                        <tr>
                                                            <td><a cursor="pointer" onclick="showInfo(this)" id="${rg.memberId}" data-toggle="modal" name="${rg.memberId}" data-target=".bd-example-modal-sm" href="">${rg.memberId}</a></td>
                                                            <td>${rg.name}</td>
                                                            <td>${rg.memberArea.area}</td>
                                                            <td>${rg.registTime}</td>
                                                            <td>${rg.memberAuth.memberLevel.mLevel}</td>
                                                            <c:if test="${rg.loginType == '一般'}">
                                                                <td>
                                                                    <font style="color: green">${rg.loginType}</font>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${rg.loginType == 'google'}">
                                                                <td>
                                                                    <font style="color: red">${rg.loginType}</font>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${rg.loginType == 'facebook'}">
                                                                <td>
                                                                    <font style="color: blue">${rg.loginType}</font>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${rg.memberAuth.status.status == '已驗證'}">
                                                                <td id="status">
                                                                    <font style="color:navy">${rg.memberAuth.status.status}</font>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${rg.memberAuth.status.status == '尚未驗證'}">
                                                                <td id="status">
                                                                    <font style="color:#6F00D2">${rg.memberAuth.status.status}</font>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${rg.memberAuth.status.status == '已停權'}">
                                                                <td id="status">
                                                                    <font style="color:orange">${rg.memberAuth.status.status}</font>
                                                                </td>
                                                            </c:if>
                                                            <td class="text-right" id="td"><input class="btn btn-success my-2 my-sm-0 " type="button" id="${rg.memberId}" value="恢復權限" onclick="update(this)" />
                                                                <input class="btn btn-danger my-2 my-sm-0 " type="button" name="${rg.memberId}" value="停權" onclick="confirmListDelete(this)" />
                                                                <!-- <a class="btn btn-danger my-2 my-sm-0  " href="#">停權</a> -->
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <footer class="footer">
                        <div class="container-fluid">
                            <ul class="nav">
                            </ul>

                        </div>
                    </footer>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th>
                                        <h4 class="text-white bg-dark">會員資訊</h4>
                                    </th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>姓名:</td>
                                    <th id="name"></th>

                                </tr>
                                <tr>
                                    <td>性別:</td>
                                    <th scope="row" id="gender"></th>

                                </tr>
                                <tr>
                                    <td>帳號/E-mail:</td>
                                    <th scope="row" id="email"></th>

                                </tr>
                                <tr>
                                    <td>生日:</td>
                                    <th scope="row" id="birthday"></th>

                                </tr>
                                <tr>
                                    <td>聯絡電話:</td>
                                    <th scope="row" id="tel"></th>

                                </tr>
                                <tr>
                                    <td>聯絡地址:</td>
                                    <th scope="row" id="address"></th>

                                </tr>
                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
            <!--   Core JS Files   -->
            <script src="js/core/jquery.min.js"></script>
            <script src="js/core/popper.min.js"></script>
            <script src="js/core/bootstrap.min.js"></script>
            <script src="js/plugins/perfect-scrollbar.jquery.min.js"></script>
            <!-- Chart JS -->
            <script src="js/plugins/chartjs.min.js"></script>
            <!--  Notifications Plugin    -->
            <script src="js/plugins/bootstrap-notify.js"></script>
            <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="js/black-dashboard.min.js?v=1.0.0"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>
            <script>
                $(function() {

                })

                function loginType() {
                    var loginType = $(".loginType").text();
                    console.log(loginType);
                    if (loginType == "一般") {
                        $("#loginType").css("color", "green");
                    }
                    if (loginType == "google") {
                        $("#loginType").css("color", "red");
                    }
                    if (loginType == "facebook") {
                        $("#loginType").css("color", "blue");
                    }
                }
                $(document).ready(function() {


                    var stepSize;
                    gradientBarChartConfiguration = {
                        maintainAspectRatio: false,
                        legend: {
                            display: true
                        },

                        tooltips: {
                            backgroundColor: '#f5f5f5',
                            titleFontColor: '#333',
                            bodyFontColor: '#666',
                            bodySpacing: 4,
                            xPadding: 12,
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
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    suggestedMin: 0,
                                    suggestedMax: 200,
                                    padding: 15,
                                    stepSize: 50,
                                    fontColor: "#9e9e9e"
                                }
                            }],

                            xAxes: [{
                                barPercentage: 0.5,
                                gridLines: {
                                    drawBorder: false,
                                    color: 'rgba(29,140,248,0.1)',
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    padding: 15,
                                    fontColor: "#9e9e9e",
                                    maxTicksLimit: 20
                                }
                            }]
                        },
                        animation: {
                            onComplete: function() {
                                var URI = myChart.toBase64Image();

                                $("#export-png").attr('href', URI);
                            }
                        }
                    };

                    var chartdata;
                    var ctx = document.getElementById('chartBig1').getContext('2d');
                    var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
                    gradientStroke.addColorStop(1, 'rgba(29,140,248,0.3)');
                    gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.3)');
                    gradientStroke.addColorStop(0, 'rgba(29,140,248,1)'); //blue colors
                    var config = {
                        type: 'bar',
                        responsive: true,
                        legend: {
                            display: true
                        },
                        data: {
                            labels: ['總數', '男性', '女性', '其他', '一般會員', '進階會員'],
                            datasets: [{
                                label: "一周會員註冊數",
                                fill: true,
                                //backgroundColor: gradientStroke,
                                hoverBackgroundColor: gradientStroke,
                                borderColor: '#1f8ef1',
                                borderWidth: 2,
                                borderDash: [],
                                borderDashOffset: 0.0,
                                data: chartdata,
                            }]
                        },
                        options: gradientBarChartConfiguration
                    }

                    var myChart = new Chart(ctx, config);


                    $("#0").on("click", function() {
                        $.ajax({
                            type: "post",
                            url: "getEveryMonthOfMember",
                            dataType: "json",
                            success: function(list) {
                                console.log(list)
                                var allMember = list.monthsMember;
                                var googleMember = list.monthsMemberGoogle;
                                var facebookMember = list.monthsMemberFacebook;
                                var normalMember = list.monthsMemberNormal;
                                var data2 = myChart.config.data;
                                myChart.config.type = 'line';
                                data2.datasets[0].label = '每月會員註冊數';
                                data2.datasets[0].data = allMember;
                                data2.labels = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
                                data2.datasets.splice(1.2);
                                stepSize = 50;
                                myChart.update();
                            }
                        })
                    })


                    $("#1").on("click", function() {
                        $.ajax({
                            type: "post",
                            url: "getEveryAreaOfMember.controller",
                            dataType: "json",
                            success: function(list) {
                                console.log(list)
                                var data2 = myChart.config.data;
                                myChart.config.type = 'bar';
                                data2.datasets[0].label = '各地區會員數';
                                data2.datasets[0].data = list;
                                data2.labels = ['台北市', '新北市', '基隆市', '宜蘭縣', '桃園市', '新竹市', '新竹縣', '苗栗縣', '台中市', '彰化縣', '南投縣', '雲林縣', '嘉義市', '嘉義縣', '台南市', '高雄市', '屏東縣', '台東縣', '花蓮縣', '澎湖縣', '金門縣', '連江縣'];
                                data2.datasets.splice(1.2);
                                stepSize = 50;
                                myChart.update();
                            }
                        })
                    })

                    var normal = {
                        label: "一般登入",
                        fill: true,
                        // backgroundColor: gradientStroke,
                        hoverBackgroundColor: gradientStroke,
                        borderColor: '#000000',
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: chartdata,
                    };
                    var facebook = {
                        label: "facebook",
                        fill: true,
                        //backgroundColor: gradientStroke,
                        hoverBackgroundColor: gradientStroke,
                        borderColor: '#0066CC',
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: chartdata,
                    };
                    $("#2").on("click", function() {

                            $.ajax({
                                type: "post",
                                url: "getEveryMonthOfMember",
                                dataType: "json",
                                success: function(list) {
                                    console.log(list)
                                    var allMember = list.monthsMember;
                                    var googleMember = list.monthsMemberGoogle;
                                    var facebookMember = list.monthsMemberFacebook;
                                    var normalMember = list.monthsMemberNormal;
                                    var data2 = myChart.config.data;
                                    myChart.config.type = 'line';
                                    data2.datasets[0].label = 'google';
                                    data2.datasets[0].data = googleMember;
                                    data2.datasets[0].borderColor = '#FF0000';
                                    data2.datasets.splice(1.2);
                                    //
                                    normal.data = normalMember;
                                    data2.datasets.push(normal);
                                    facebook.data = facebookMember;
                                    data2.datasets.push(facebook);
                                    //
                                    data2.labels = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
                                    stepSize = 50;
                                    myChart.update();
                                }
                            })
                        })
                        //
                    var newdataset = {
                        label: "",
                        fill: true,
                        backgroundColor: '#FFAAD5',
                        hoverBackgroundColor: '#FFAAD5',
                        borderColor: '#FFAAD5',
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: [],
                    }
                    var newdataset2 = {
                        label: "",
                        fill: true,
                        backgroundColor: '#FFAF60',
                        hoverBackgroundColor: '#FFAF60',
                        borderColor: '#FFAF60',
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: [],
                    }
                    $("#3").on("click", function() {

                            $.ajax({
                                type: "post",
                                url: "getEveryAgeOfMember",
                                dataType: "json",
                                success: function(list) {
                                    console.log(list)
                                    var male = list.agem;
                                    var female = list.agef;
                                    var other = list.ageo;
                                    var data2 = myChart.config.data;
                                    myChart.config.type = 'bar';
                                    data2.datasets[0].label = '男性';
                                    data2.datasets[0].data = male;
                                    data2.labels = ['20以下', '20~30', '30~40', '40~50', '50~60', '60以上'];
                                    data2.datasets.splice(1.2);
                                    //
                                    newdataset.label = "女性";
                                    newdataset.data = female;
                                    data2.datasets.push(newdataset);
                                    newdataset2.label = "其他";
                                    newdataset2.data = other;
                                    data2.datasets.push(newdataset2);
                                    stepSize = 10;
                                    //
                                    myChart.update();
                                }
                            })

                        })
                        //

                    $.ajax({
                        type: "post",
                        url: "getEveryMonthOfMember",
                        dataType: "json",
                        success: function(list) {
                            console.log(list)
                            var allMember = list.monthsMember;
                            var googleMember = list.monthsMemberGoogle;
                            var facebookMember = list.monthsMemberFacebook;
                            var normalMember = list.monthsMemberNormal;
                            var data2 = myChart.config.data;
                            myChart.config.type = 'line';
                            data2.datasets[0].label = '每月會員註冊數';
                            data2.datasets[0].data = allMember;
                            data2.labels = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
                            stepSize = 50;
                            myChart.update();
                        }
                    })

                    gradientChartOptionsConfigurationWithTooltipPurple = {
                        maintainAspectRatio: false,
                        legend: {
                            display: true
                        },

                        tooltips: {
                            backgroundColor: '#f5f5f5',
                            titleFontColor: '#333',
                            bodyFontColor: '#666',
                            bodySpacing: 4,
                            xPadding: 12,
                            mode: "nearest",
                            intersect: 0,
                            position: "nearest"
                        },
                        responsive: true,
                        scales: {
                            yAxes: [{
                                barPercentage: 1.6,
                                gridLines: {
                                    drawBorder: false,
                                    color: 'rgba(29,140,248,0.0)',
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    suggestedMin: 0,
                                    suggestedMax: 50,
                                    padding: 10,
                                    fontColor: "#9a9a9a"
                                }
                            }],

                            xAxes: [{
                                barPercentage: 0.8,
                                gridLines: {
                                    drawBorder: false,
                                    color: 'rgba(225,78,202,0.1)',
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    padding: 20,
                                    fontColor: "#9a9a9a"
                                }
                            }]
                        },
                        animation: {
                            onComplete: function() {
                                var URI = myChart2.toBase64Image();

                                $("#export-png5").attr('href', URI);
                            }
                        }

                    };



                    var ctx2 = document.getElementById("chartLinePurple").getContext("2d");

                    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

                    gradientStroke2.addColorStop(1, 'rgba(72,72,176,0.5)');
                    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.5)');
                    gradientStroke2.addColorStop(0, 'rgba(119,52,169,5)'); //purple colors

                    var data2 = {
                        labels: ['總數', '男性', '女性', '其他', '未驗證會員', '已驗證會員', "停權會員"],
                        legend: {
                            display: true
                        },
                        datasets: [{
                            label: "今日會員註冊數",
                            fill: true,
                            backgroundColor: ['#5CADAD', 'rgba(29,140,248,1)', '#FFAAD5', '#FFAF60', '#82D900', '#844200', '#CA8EC2'],
                            borderColor: ['#5CADAD', 'rgba(29,140,248,1)', '#FFAAD5', '#FFAF60', '#82D900', '#844200', '#CA8EC2'],
                            borderWidth: 2,
                            borderDash: [],
                            borderDashOffset: 0.0,
                            pointBackgroundColor: '#d048b6',
                            pointBorderColor: 'rgba(255,255,255,0)',
                            pointHoverBackgroundColor: '#d048b6',
                            pointBorderWidth: 20,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 15,
                            pointRadius: 4,
                            data: [80, 100, 70, 80, 120, 80],
                        }]
                    };

                    var myChart2 = new Chart(ctx2, {
                        type: 'bar',
                        responsive: true,
                        legend: {
                            display: true
                        },
                        data: data2,
                        options: gradientChartOptionsConfigurationWithTooltipPurple
                    });

                    var chartdata2;

                    $.ajax({
                        type: "post",
                        url: "getdaymember.controller",
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            var allnum = data.weekallnum
                            var male = data.weekallMale
                            var malenum = male.length
                            var female = data.weekallFemale
                            var femalenum = female.length
                            var other = data.weekallOther
                            var othernum = other.length
                            var basicnum = data.weekallBasic.length
                            var advancednum = data.weekallAdvanced.length
                            var deletenum = data.weekallDelete.length


                            chartdata2 = [allnum, malenum, femalenum, othernum, basicnum, advancednum, deletenum];
                            data2.datasets[0].data = chartdata2;
                            myChart2.update();
                        }
                    });

                    $("#A").on("click", function() {

                        $.ajax({
                            type: "post",
                            url: "getdaymember.controller",
                            dataType: "json",
                            success: function(data) {
                                console.log(data);
                                var allnum = data.weekallnum
                                var male = data.weekallMale
                                var malenum = male.length
                                var female = data.weekallFemale
                                var femalenum = female.length
                                var other = data.weekallOther
                                var othernum = other.length
                                var basicnum = data.weekallBasic.length
                                var advancednum = data.weekallAdvanced.length
                                var deletenum = data.weekallDelete.length


                                chartdata2 = [allnum, malenum, femalenum, othernum, basicnum, advancednum, deletenum];
                                data2.datasets[0].data = chartdata2;
                                data2.datasets[0].label = "今日會員註冊數";
                                myChart2.update();
                            }
                        });
                    })
                    $("#B").on("click", function() {
                        $.ajax({
                            type: "post",
                            url: "getweekmember.controller",
                            dataType: "json",
                            success: function(data) {
                                console.log(data);
                                var allnum = data.weekallnum
                                var male = data.weekallMale
                                var malenum = male.length
                                var female = data.weekallFemale
                                var femalenum = female.length
                                var other = data.weekallOther
                                var othernum = other.length
                                var basicnum = data.weekallBasic.length
                                var advancednum = data.weekallAdvanced.length
                                var deletenum = data.weekallDelete.length


                                chartdata2 = [allnum, malenum, femalenum, othernum, basicnum, advancednum, deletenum];
                                data2.datasets[0].data = chartdata2;
                                data2.datasets[0].label = "本周會員註冊數";
                                myChart2.update();
                            }
                        })
                    })

                    var ctx3 = document.getElementById("chartLineGreen").getContext("2d");

                    var myDoughnutChart = new Chart(ctx3, {
                        type: 'pie',
                        data: {
                            labels: ["公路車", "登山車", "極限單車", "折疊車", "淑女車", "單速車", "電動單車", "斜躺車"],
                            datasets: [{
                                label: "會員單車偏好",
                                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850", '#FF2D2D', '#FFD306', '#00395c'],
                                data: [0, 0, 0, 0, 0, 0, 0, 0]
                            }]
                        },
                        options: {

                            responsive: true,
                            legend: {
                                display: true
                            },
                            animation: {
                                onComplete: function() {
                                    var URI = myChart.toBase64Image();

                                    $("#export-png7").attr('href', URI);
                                }
                            }
                        }
                        //
                        ,
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
                        }
                        //
                    });



                    $.ajax({
                        type: "post",
                        url: "getEveryFavorOfMember",
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            myDoughnutChart.data.datasets[0].data = data;

                            myDoughnutChart.update();
                        }
                    })




                    $("#info").DataTable(option);

                    $().ready(function() {
                        $sidebar = $('.sidebar');
                        $navbar = $('.navbar');
                        $main_panel = $('.main-panel');

                        $full_page = $('.full-page');

                        $sidebar_responsive = $('body > .navbar-collapse');
                        sidebar_mini_active = true;
                        white_color = false;

                        window_width = $(window).width();

                        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



                        $('.fixed-plugin a').click(function(event) {
                            if ($(this).hasClass('switch-trigger')) {
                                if (event.stopPropagation) {
                                    event.stopPropagation();
                                } else if (window.event) {
                                    window.event.cancelBubble = true;
                                }
                            }
                        });

                        $('.fixed-plugin .background-color span').click(function() {
                            $(this).siblings().removeClass('active');
                            $(this).addClass('active');

                            var new_color = $(this).data('color');

                            if ($sidebar.length != 0) {
                                $sidebar.attr('data', new_color);
                            }

                            if ($main_panel.length != 0) {
                                $main_panel.attr('data', new_color);
                            }

                            if ($full_page.length != 0) {
                                $full_page.attr('filter-color', new_color);
                            }

                            if ($sidebar_responsive.length != 0) {
                                $sidebar_responsive.attr('data', new_color);
                            }
                        });

                        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
                            var $btn = $(this);

                            if (sidebar_mini_active == true) {
                                $('body').removeClass('sidebar-mini');
                                sidebar_mini_active = false;
                                blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
                            } else {
                                $('body').addClass('sidebar-mini');
                                sidebar_mini_active = true;
                                blackDashboard.showSidebarMessage('Sidebar mini activated...');
                            }

                            // we simulate the window Resize so the charts will get updated in realtime.
                            var simulateWindowResize = setInterval(function() {
                                window.dispatchEvent(new Event('resize'));
                            }, 180);

                            // we stop the simulation of Window Resize after the animations are completed
                            setTimeout(function() {
                                clearInterval(simulateWindowResize);
                            }, 1000);
                        });

                        $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
                            var $btn = $(this);

                            if (white_color == true) {

                                $('body').addClass('change-background');
                                setTimeout(function() {
                                    $('body').removeClass('change-background');
                                    $('body').removeClass('white-content');
                                }, 900);
                                white_color = false;
                            } else {

                                $('body').addClass('change-background');
                                setTimeout(function() {
                                    $('body').removeClass('change-background');
                                    $('body').addClass('white-content');
                                }, 900);

                                white_color = true;
                            }


                        });

                        $('.light-badge').click(function() {
                            $('body').addClass('white-content');
                        });

                        $('.dark-badge').click(function() {
                            $('body').removeClass('white-content');
                        });
                    });
                });
            </script>
            <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
            <script>
                window.TrackJS &&
                    TrackJS.install({
                        token: "ee6fab19c5a04ac1a32a645abde4613a",
                        application: "black-dashboard-free"
                    });
            </script>
        </body>

        </html>