/*last seven days chart*/

$(function() {

    /*  last 7 days  */
    $.ajax({
        url: 'mgrSevenData',
        type: 'post',
        dataType: 'json',
        success: function(res) {
            var todayData = res.last0day;
            var last1DayData = res.last1day;
            var last2DayData = res.last2day;
            var last3DayData = res.last3day;
            var last4DayData = res.last4day;
            var last5DayData = res.last5day;
            var last6DayData = res.last6day;

            var viewCount7 = [last6DayData[3], last5DayData[3], last4DayData[3], last3DayData[3], last2DayData[3], last1DayData[3], todayData[3]];
            var likeCount7 = [last6DayData[2], last5DayData[2], last4DayData[2], last3DayData[2], last2DayData[2], last1DayData[2], todayData[2]];
            var commentCount7 = [last6DayData[1], last5DayData[1], last4DayData[1], last3DayData[1], last2DayData[1], last1DayData[1], todayData[1]];
            var label7 = [last6DayData[0], last5DayData[0], last4DayData[0], last3DayData[0], last2DayData[0], last1DayData[0], todayData[0]];

            var ctx7 = document.getElementById('sevenDays').getContext("2d");
            var gradientStroke7 = ctx7.createLinearGradient(0, 230, 0, 50);

            gradientStroke7.addColorStop(1, 'rgba(72,72,176,0.2)');
            gradientStroke7.addColorStop(0.2, 'rgba(72,72,176,0.0)');
            gradientStroke7.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors



            var seventCongig = {
                maintainAspectRatio: false,
                legend: {
                    display: false
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
                        barPercentage: 1.4,
                        gridLines: {
                            drawBorder: false,
                            color: 'rgba(29,140,248,0.0)',
                            zeroLineColor: "transparent",
                        },
                        ticks: {
                            suggestedMin: 10,
                            suggestedMax: 50,
                            padding: 10,
                            fontColor: "#9a9a9a"
                        }
                    }],

                    xAxes: [{
                        barPercentage: 1.4,
                        gridLines: {
                            drawBorder: false,
                            color: 'rgba(225,78,202,0.1)',
                            zeroLineColor: "transparent",
                        },
                        ticks: {
                            padding: 10,
                            fontColor: "#9a9a9a"
                        }
                    }]
                },
                animation: {
                    onComplete: function() {
                        var URI = sevenChart.toBase64Image();

                        $("#export7-png").attr('href', URI);
                    }
                }
            };
            var data = {
                labels: label7,
                datasets: [{
                    type: "line",
                    label: "評論數",
                    fill: true,
                    backgroundColor: gradientStroke7,
                    borderColor: '#00d6b4',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#00d6b4',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#00d6b4',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: commentCount7,
                }, {
                    type: "line",
                    label: "按讚數",
                    fill: true,
                    backgroundColor: gradientStroke7,
                    borderColor: '#FF5151',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#FF5151',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#FF5151',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: likeCount7,
                }, {
                    type: "line",
                    label: "觀看數",
                    fill: true,
                    backgroundColor: gradientStroke7,
                    borderColor: '#00FFFF',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#00FFFF',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#00FFFF',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: viewCount7,
                }]
            };

            var config7 = {
                type: 'bar',
                data: data,
                options: seventCongig
            }
            var sevenChart = new Chart(ctx7, config7);

            $("#changebtn7").on("click", "#totalbtn7", function() {
                var data = sevenChart.config.data;
                data.datasets[0].data = commentCount7;
                data.datasets[1].data = likeCount7;
                data.datasets[2].data = viewCount7;
                data.labels = label7;
                sevenChart.update();
            });

            $("#changebtn7").on("click", "#commentbtn7", function() {
                var data = sevenChart.config.data;
                data.datasets[0].data = commentCount7;
                data.datasets[1].data = [];
                data.datasets[2].data = [];
                data.labels = label7;
                sevenChart.update();
            });
            $("#changebtn7").on("click", "#likebtn7", function() {
                var data = sevenChart.config.data;
                data.datasets[0].data = [];
                data.datasets[1].data = likeCount7;
                data.datasets[2].data = [];
                data.labels = label7;
                sevenChart.update();
            });
            $("#changebtn7").on("click", "#viewbtn7", function() {
                var data = sevenChart.config.data;
                data.datasets[0].data = [];
                data.datasets[1].data = [];
                data.datasets[2].data = viewCount7;
                data.labels = label7;
                sevenChart.update();
            });
        }

    });

    // -------------------TODAY CHART ---------------------------
    $.ajax({
        url: 'mgrTodayData',
        type: 'post',
        dataType: 'json',
        success: function(res) {
            console.log(res);

            var commentCount = res.todayData[0];
            var likeCount = res.todayData[1];
            var viewCount = res.todayData[2];
            var todaylabel = ["今日"];

            var ctx2 = document.getElementById('today').getContext("2d");

            var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

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
                            suggestedMin: 30,
                            suggestedMax: 80,
                            padding: 10,
                            fontColor: '#9e9e9e',
                            autoSkip: false,
                            beginAtZero: true,
                            maxTicksLimit: 15
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
                            maxTicksLimit: 15
                        }
                    }],
                },
                animation: {
                    onComplete: function() {
                        var URI = todayChart.toBase64Image();

                        $("#exportToday-png").attr('href', URI);
                    }
                }
            };

            var todayChart = new Chart(ctx2, {
                // plugins: [ChartDataLabels],
                legend: {
                    display: true
                },
                type: 'bar',
                data: {
                    labels: ["評論數", "按讚數", "瀏覽數"],
                    datasets: [{
                        label: "今日",
                        backgroundColor: gradientStroke2,
                        hoverBackgroundColor: gradientStroke2,
                        borderColor: '#1f8ef1',
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: [commentCount, likeCount, viewCount],

                    }, ]
                },
                options: gradientBarChartConfiguration,
                showTooltips: false

            });

        }
    });





})


/* last 30 days chart*/

$(function() {




    $.ajax({
        url: 'mgr30DaysData',
        type: 'post',
        dataType: 'json',
        success: function(res) {
            console.log(res);



            var Jan = res.monthly.month0;
            var Feb = res.monthly.month1;
            var Mar = res.monthly.month2;
            var Apr = res.monthly.month3;
            var May = res.monthly.month4;
            var Jun = res.monthly.month5;
            var Jul = res.monthly.month6;
            var Aug = res.monthly.month7;
            var Sep = res.monthly.month8;
            var Oct = res.monthly.month9;
            var Nov = res.monthly.month10;
            var Dec = res.monthly.month11;

            // ------------MONTHLY DATA----------------
            var commentmondata = [Jan[0], Feb[0], Mar[0], Apr[0], May[0], Jun[0], Jul[0], Aug[0], Sep[0], Oct[0], Nov[0], Dec[0]];
            var likemondata = [Jan[1], Feb[1], Mar[1], Apr[1], May[1], Jun[1], Jul[1], Aug[1], Sep[1], Oct[1], Nov[1], Dec[1]];
            var viewmondata = [Jan[2], Feb[2], Mar[2], Apr[2], May[2], Jun[2], Jul[2], Aug[2], Sep[2], Oct[2], Nov[2], Dec[2]];
            var monthlylabel = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

            var ctx = document.getElementById('monthly').getContext("2d");

            // -----------------------------------------
            var gradientStrokemon = ctx.createLinearGradient(0, 230, 0, 50);

            gradientStrokemon.addColorStop(1, 'rgba(72,72,176,0.2)');
            gradientStrokemon.addColorStop(0.2, 'rgba(72,72,176,0.0)');
            gradientStrokemon.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors

            var monthlyConfig = {
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
                        barPercentage: 1.2,
                        gridLines: {
                            drawBorder: false,
                            color: 'rgba(29,140,248,0.0)',
                            zeroLineColor: "transparent",
                        },
                        ticks: {
                            suggestedMin: 180,
                            suggestedMax: 600,
                            padding: 10,
                            fontColor: "#9a9a9a"
                        }
                    }],

                    xAxes: [{
                        barPercentage: 1.0,
                        gridLines: {
                            drawBorder: false,
                            color: 'rgba(225,78,202,0.1)',
                            zeroLineColor: "transparent",
                        },
                        ticks: {
                            padding: 10,
                            fontColor: "#9a9a9a"
                        }
                    }]
                },
                animation: {
                    onComplete: function() {
                        var URI = myChart.toBase64Image();

                        $("#exportYear-png").attr('href', URI);
                    }
                }
            };

            // function done() {
            //     alert(myChart.toBase64Image());
            // }

            var datamon = {
                labels: monthlylabel,
                datasets: [{
                    type: "line",
                    label: "評論數",
                    fill: true,
                    backgroundColor: 'rgba(202, 224, 246, 0.52)',
                    borderColor: '#00d6b4',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#00d6b4',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#00d6b4',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: commentmondata,
                }, {
                    type: "line",
                    label: "按讚數",
                    fill: true,
                    backgroundColor: 'rgba(202, 224, 246, 0.52)',
                    borderColor: '#FF5151',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#FF5151',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#FF5151',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: likemondata,
                }, {
                    type: "line",
                    label: "觀看數",
                    fill: true,
                    backgroundColor: 'rgba(202, 224, 246, 0.52)',
                    borderColor: '#00FFFF',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#00FFFF',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#00FFFF',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: viewmondata,
                }]
            };

            // --------------------30DAYS DATA---------------------------------

            //  如果不可行chart-body裡放兩個chart

            var todayData = res.last30days.last0day;
            var last1DayData = res.last30days.last1day;
            var last2DayData = res.last30days.last2day;
            var last3DayData = res.last30days.last3day;
            var last4DayData = res.last30days.last4day;
            var last5DayData = res.last30days.last5day;
            var last6DayData = res.last30days.last6day;
            var last7DayData = res.last30days.last7day;
            var last8DayData = res.last30days.last8day;
            var last9DayData = res.last30days.last9day;
            var last10DayData = res.last30days.last10day;
            var last11DayData = res.last30days.last11day;
            var last12DayData = res.last30days.last12day;
            var last13DayData = res.last30days.last13day;
            var last14DayData = res.last30days.last14day;
            var last15DayData = res.last30days.last15day;
            var last16DayData = res.last30days.last16day;
            var last17DayData = res.last30days.last17day;
            var last18DayData = res.last30days.last18day;
            var last19DayData = res.last30days.last19day;
            var last20DayData = res.last30days.last20day;
            var last21DayData = res.last30days.last21day;
            var last22DayData = res.last30days.last22day;
            var last23DayData = res.last30days.last23day;
            var last24DayData = res.last30days.last24day;
            var last25DayData = res.last30days.last25day;
            var last26DayData = res.last30days.last26day;
            var last27DayData = res.last30days.last27day;
            var last28DayData = res.last30days.last28day;
            var last29DayData = res.last30days.last29day;




            // ------30 days label----------
            var day30label = [last29DayData[0], last28DayData[0], last27DayData[0], last26DayData[0], last25DayData[0], last24DayData[0], last23DayData[0], last22DayData[0], last21DayData[0], last20DayData[0], last19DayData[0], last18DayData[0], last17DayData[0], last16DayData[0], last15DayData[0], last14DayData[0], last13DayData[0], last12DayData[0], last11DayData[0], last10DayData[0], last9DayData[0], last8DayData[0], last7DayData[0], last6DayData[0], last5DayData[0], last4DayData[0], last3DayData[0], last2DayData[0], last1DayData[0], todayData[0]];

            var day30comment = [last29DayData[1], last28DayData[1], last27DayData[1], last26DayData[1], last25DayData[1], last24DayData[1], last23DayData[1], last22DayData[1], last21DayData[1], last20DayData[1], last19DayData[1], last18DayData[1], last17DayData[1], last16DayData[1], last15DayData[1], last14DayData[1], last13DayData[1], last12DayData[1], last11DayData[1], last10DayData[1], last9DayData[1], last8DayData[1], last7DayData[1], last6DayData[1], last5DayData[1], last4DayData[1], last3DayData[1], last2DayData[1], last1DayData[1], todayData[1]];
            var day30like = [last29DayData[2], last28DayData[2], last27DayData[2], last26DayData[2], last25DayData[2], last24DayData[2], last23DayData[2], last22DayData[2], last21DayData[2], last20DayData[2], last19DayData[2], last18DayData[2], last17DayData[2], last16DayData[2], last15DayData[2], last14DayData[2], last13DayData[2], last12DayData[2], last11DayData[2], last10DayData[2], last9DayData[2], last8DayData[2], last7DayData[2], last6DayData[2], last5DayData[2], last4DayData[2], last3DayData[2], last2DayData[2], last1DayData[2], todayData[2]];
            var day30view = [last29DayData[3], last28DayData[3], last27DayData[3], last26DayData[3], last25DayData[3], last24DayData[3], last23DayData[3], last22DayData[3], last21DayData[3], last20DayData[3], last19DayData[3], last18DayData[3], last17DayData[3], last16DayData[3], last15DayData[3], last14DayData[3], last13DayData[3], last12DayData[3], last11DayData[3], last10DayData[3], last9DayData[3], last8DayData[3], last7DayData[3], last6DayData[3], last5DayData[3], last4DayData[3], last3DayData[3], last2DayData[3], last1DayData[3], todayData[3]];

            var ctx30 = document.getElementById('monthly').getContext("2d");
            var gradientStroke = ctx30.createLinearGradient(0, 230, 0, 50);

            gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
            gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
            gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors

            var days30config = {
                maintainAspectRatio: false,
                legend: {
                    display: false
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
                        barPercentage: 1.0,
                        gridLines: {
                            drawBorder: false,
                            color: 'rgba(29,140,248,0.0)',
                            zeroLineColor: "transparent",
                        },
                        ticks: {
                            suggestedMin: 10,
                            suggestedMax: 50,
                            padding: 10,
                            fontColor: "#9a9a9a"
                        }
                    }],

                    xAxes: [{
                        barPercentage: 1.4,
                        gridLines: {
                            drawBorder: false,
                            color: 'rgba(225,78,202,0.1)',
                            zeroLineColor: "transparent",
                        },
                        ticks: {
                            padding: 10,
                            fontColor: "#9a9a9a"
                        }
                    }]
                }
            };
            var data30 = {
                labels: day30label,
                datasets: [{
                    type: "line",
                    label: "評論數",
                    fill: true,
                    backgroundColor: gradientStroke,
                    borderColor: '#00d6b4',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#00d6b4',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#00d6b4',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: day30comment,
                }, {
                    type: "line",
                    label: "按讚數",
                    fill: true,
                    backgroundColor: gradientStroke,
                    borderColor: '#FF5151',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#FF5151',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#FF5151',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: day30like,
                }, {
                    type: "line",
                    label: "觀看數",
                    fill: true,
                    backgroundColor: gradientStroke,
                    borderColor: '#00FFFF',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    pointBackgroundColor: '#00FFFF',
                    pointBorderColor: 'rgba(255,255,255,0)',
                    pointHoverBackgroundColor: '#00FFFF',
                    pointBorderWidth: 20,
                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 15,
                    pointRadius: 4,
                    data: day30view,
                }]
            };

            //-------------- chart  default monthly--------------------
            var config = {
                legend: {
                    display: true
                },
                type: 'bar',
                data: datamon,
                options: monthlyConfig
            };
            var myChart = new Chart(ctx, config);

            // -------category btn-----------------
            $("#catmon").on("click", function() {
                // myChart.config.data = datamon;
                // myChart.config.options = monthlyConfig;
                $("#firstTitle").empty();
                $("#firstTitle").append(`<i class="fas fa-chart-line fa-7x text-primary"></i>年度分析`);
                $("#totalbtn30").attr('id', 'totalbtnmonth');
                $("#commentbtn30").attr('id', 'commentbtnmonth');
                $("#likebtn30").attr('id', 'likebtnmonth');
                $("#viewbtn30").attr('id', 'viewbtnmonth');
                var data = myChart.config.data;
                data.datasets[0].data = commentmondata;
                data.datasets[1].data = likemondata;
                data.datasets[2].data = viewmondata;
                data.labels = monthlylabel;
                myChart.update();


            });

            $("#cat30").on("click", function() {
                // myChart.config.options = days30config;
                // myChart.config.data = data30;
                // myChart.ctxmon = ctx30;

                $("#totalbtnmonth").attr('id', 'totalbtn30');
                $("#commentbtnmonth").attr('id', 'commentbtn30');
                $("#likebtnmonth").attr('id', 'likebtn30');
                $("#viewbtnmonth").attr('id', 'viewbtn30');
                $("#firstTitle").empty();
                $("#firstTitle").append(`<i class="fas fa-chart-line fa-7x text-primary"></i>近三十日分析`);
                var config2 = myChart.config.options;
                var data = myChart.config.data;
                config2.scales.yAxes[0].ticks.suggestedMin = 10;
                config2.scales.yAxes[0].ticks.suggestedMax = 50;
                data.datasets[0].data = day30comment;
                data.datasets[1].data = day30like;
                data.datasets[2].data = day30view;
                data.labels = day30label;
                myChart.update();

            });




            // -------------------right ride- MONTHLY change btn------------------------

            $("#changebtn").on("click", "#totalbtnmonth", function() {
                var data = myChart.config.data;
                data.datasets[0].data = commentmondata;
                data.datasets[1].data = likemondata;
                data.datasets[2].data = viewmondata;

                myChart.update();
            });

            $("#changebtn").on("click", "#commentbtnmonth", function() {
                var data = myChart.config.data;
                data.datasets[0].data = commentmondata;
                data.datasets[1].data = [];
                data.datasets[2].data = [];

                myChart.update();
            });
            $("#changebtn").on("click", "#likebtnmonth", function() {
                var data = myChart.config.data;
                data.datasets[0].data = [];
                data.datasets[1].data = likemondata;
                data.datasets[2].data = [];

                myChart.update();
            });
            $("#changebtn").on("click", "#viewbtnmonth", function() {
                var data = myChart.config.data;
                data.datasets[0].data = [];
                data.datasets[1].data = [];
                data.datasets[2].data = viewmondata;

                myChart.update();
            });

            //          -------------------RIGHT 30DAYS BTN-----------------

            $("#changebtn").on("click", "#totalbtn30", function() {
                var data = myChart.config.data;
                data.datasets[0].data = day30comment;
                data.datasets[1].data = day30like;
                data.datasets[2].data = day30view;
                myChart.update();
            });

            $("#changebtn").on("click", "#commentbtn30", function() {
                var data = myChart.config.data;
                data.datasets[0].data = day30comment;
                data.datasets[1].data = [];
                data.datasets[2].data = [];
                myChart.update();
            });
            $("#changebtn").on("click", "#likebtn30", function() {
                var data = myChart.config.data;
                data.datasets[0].data = [];
                data.datasets[1].data = day30like;
                data.datasets[2].data = [];
                myChart.update();
            });
            $("#changebtn").on("click", "#viewbtn30", function() {
                var data = myChart.config.data;
                data.datasets[0].data = [];
                data.datasets[1].data = [];
                data.datasets[2].data = day30view;

                myChart.update();
            });




        }
    });




});