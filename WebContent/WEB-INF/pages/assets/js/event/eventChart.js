$(function() {
    $.ajax({
        url: '../eventData/' + $("#eid").val(),
        type: 'post',
        success: function(res) {
            console.log(res);

            // --------------7 DAYS DATA-------
            var last0day = res.recent7Days.last0day;
            var last1DayData = res.recent7Days.last1day;
            var last2DayData = res.recent7Days.last2day;
            var last3DayData = res.recent7Days.last3day;
            var last4DayData = res.recent7Days.last4day;
            var last5DayData = res.recent7Days.last5day;
            var last6DayData = res.recent7Days.last6day;
            // 
            var viewCount7 = [last6DayData[3], last5DayData[3], last4DayData[3], last3DayData[3], last2DayData[3], last1DayData[3], last0day[3]];
            var likeCount7 = [last6DayData[2], last5DayData[2], last4DayData[2], last3DayData[2], last2DayData[2], last1DayData[2], last0day[2]];
            var commentCount7 = [last6DayData[1], last5DayData[1], last4DayData[1], last3DayData[1], last2DayData[1], last1DayData[1], last0day[1]];
            var label7 = [last6DayData[0], last5DayData[0], last4DayData[0], last3DayData[0], last2DayData[0], last1DayData[0], last0day[0]];

            // ---------------30DAYS DATA---------------
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
            // 
            var day30label = [last29DayData[0], last28DayData[0], last27DayData[0], last26DayData[0], last25DayData[0], last24DayData[0], last23DayData[0], last22DayData[0], last21DayData[0], last20DayData[0], last19DayData[0], last18DayData[0], last17DayData[0], last16DayData[0], last15DayData[0], last14DayData[0], last13DayData[0], last12DayData[0], last11DayData[0], last10DayData[0], last9DayData[0], last8DayData[0], last7DayData[0], last6DayData[0], last5DayData[0], last4DayData[0], last3DayData[0], last2DayData[0], last1DayData[0], last0day[0]];

            var day30comment = [last29DayData[1], last28DayData[1], last27DayData[1], last26DayData[1], last25DayData[1], last24DayData[1], last23DayData[1], last22DayData[1], last21DayData[1], last20DayData[1], last19DayData[1], last18DayData[1], last17DayData[1], last16DayData[1], last15DayData[1], last14DayData[1], last13DayData[1], last12DayData[1], last11DayData[1], last10DayData[1], last9DayData[1], last8DayData[1], last7DayData[1], last6DayData[1], last5DayData[1], last4DayData[1], last3DayData[1], last2DayData[1], last1DayData[1], last0day[1]];
            var day30like = [last29DayData[2], last28DayData[2], last27DayData[2], last26DayData[2], last25DayData[2], last24DayData[2], last23DayData[2], last22DayData[2], last21DayData[2], last20DayData[2], last19DayData[2], last18DayData[2], last17DayData[2], last16DayData[2], last15DayData[2], last14DayData[2], last13DayData[2], last12DayData[2], last11DayData[2], last10DayData[2], last9DayData[2], last8DayData[2], last7DayData[2], last6DayData[2], last5DayData[2], last4DayData[2], last3DayData[2], last2DayData[2], last1DayData[2], last0day[2]];
            var day30view = [last29DayData[3], last28DayData[3], last27DayData[3], last26DayData[3], last25DayData[3], last24DayData[3], last23DayData[3], last22DayData[3], last21DayData[3], last20DayData[3], last19DayData[3], last18DayData[3], last17DayData[3], last16DayData[3], last15DayData[3], last14DayData[3], last13DayData[3], last12DayData[3], last11DayData[3], last10DayData[3], last9DayData[3], last8DayData[3], last7DayData[3], last6DayData[3], last5DayData[3], last4DayData[3], last3DayData[3], last2DayData[3], last1DayData[3], last0day[3]];

            // ----------------MONTHLY DATA-----------------

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

            var commentmondata = [Jan[0], Feb[0], Mar[0], Apr[0], May[0], Jun[0], Jul[0], Aug[0], Sep[0], Oct[0], Nov[0], Dec[0]];
            var likemondata = [Jan[1], Feb[1], Mar[1], Apr[1], May[1], Jun[1], Jul[1], Aug[1], Sep[1], Oct[1], Nov[1], Dec[1]];
            var viewmondata = [Jan[2], Feb[2], Mar[2], Apr[2], May[2], Jun[2], Jul[2], Aug[2], Sep[2], Oct[2], Nov[2], Dec[2]];
            var monthlylabel = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
            // ------------END OF MONTHLY DATA----------------

            var ctx = document.getElementById('event-chart').getContext("2d");

            var eventconfig = {
                // title: {
                //     display: true,
                //     text: '近七日數據'
                // },
                scaleShowValues: true,
                maintainAspectRatio: false,
                legend: {
                    display: true
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
                }
            };
            var eventData = {

                labels: label7,
                datasets: [{
                    type: "bar",
                    label: "評論數",
                    backgroundColor: 'rgba(217, 232, 246,0.1)',
                    hoverBackgroundColor: 'rgba(217, 232, 246,0.1)',
                    borderColor: '#02DF82',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    data: commentCount7,

                }, {
                    type: "bar",
                    label: "按讚數",
                    backgroundColor: 'rgba(217, 232, 246,0.1)',
                    hoverBackgroundColor: 'rgba(217, 232, 246,0.1)',
                    borderColor: '#1f8ef1',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    data: likeCount7,

                }, {
                    type: "bar",
                    label: "瀏覽數",
                    backgroundColor: 'rgba(217, 232, 246,0.1)',
                    hoverBackgroundColor: 'rgba(217, 232, 246,0.1)',
                    borderColor: '#FF9224',
                    borderWidth: 2,
                    borderDash: [],
                    borderDashOffset: 0.0,
                    data: viewCount7,

                }]

            };
            var config = {
                legend: {
                    display: true
                },
                type: 'bar',
                data: eventData,
                options: eventconfig,

            };
            //----------  EVENT CHART------------------------
            var eventChart = new Chart(ctx, config);
            var data = eventChart.config.data;





            // --------------TODAY DATA--------------------

            var todayComment = res.todayData.todayData[0];
            var todayLike = res.todayData.todayData[1];
            var todayView = res.todayData.todayData[2];
            var labeltoday = ['今日'];

            var ctx2 = document.getElementById('event-todayChart').getContext("2d");

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
                            suggestedMin: 0,
                            suggestedMax: 30,
                            // padding: 10,
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
                            min: 0,
                            // padding: 10,
                            fontColor: '#9e9e9e',
                            autoSkip: false,
                            beginAtZero: true,
                            maxTicksLimit: 15
                        }
                    }],
                }
            };

            // -----------TODAY CHART-------------
            var todayChart = new Chart(ctx2, {
                legend: {
                    display: false
                },
                type: 'bar',
                data: {
                    labels: ["評論數", "按讚數", "瀏覽數"],
                    datasets: [{

                        backgroundColor: ['#E8FFF5', '#C4E1FF', '#FFE4CA'],
                        hoverBackgroundColor: ['#E8FFF5', '#C4E1FF', '#FFE4CA'],
                        borderColor: ['#02DF82', '#1f8ef1', '#FF9224'],
                        borderWidth: 2,
                        borderDash: [],
                        borderDashOffset: 0.0,
                        data: [todayComment, todayLike, todayView],

                    }, ]
                },
                options: gradientBarChartConfiguration,
            });
            $("#cattoday").on("click", function() {
                $(".totalbtn").attr('id', 'totaltoday');
                $(".commbtn").attr('id', 'commtoday');
                $(".likebtn").attr('id', 'liketoday');
                $(".viewbtn").attr('id', 'viewtoday');
                // eventChart.config.options.title.text = '今日數據';

                data.datasets[0].data = todayComment;
                data.datasets[1].data = todayLike;
                data.datasets[2].data = todayView;
                data.labels = labeltoday;
                eventChart.update();

            });

            $("#totaltoday").on("click", function() {
                data.datasets[0].data = todayComment;
                data.datasets[1].data = todayLike;
                data.datasets[2].data = todayView;
                eventChart.update();

            });
            $("#commtoday").on("click", function() {
                data.datasets[0].data = todayComment;
                data.datasets[1].data = [];
                data.datasets[2].data = [];
                eventChart.update();

            });
            $("#liketoday").on("click", function() {
                data.datasets[0].data = [];
                data.datasets[1].data = todayLike;
                data.datasets[2].data = [];
                eventChart.update();

            });
            $("#viewtoday").on("click", function() {
                data.datasets[0].data = [];
                data.datasets[1].data = [];
                data.datasets[2].data = todayView;
                eventChart.update();

            });


            // ------------END OF TODAY BTN--------------

            // ----------------CAT 7 DAYS BTN---------------
            $("#cat7").on("click", function() {
                $(".totalbtn").attr('id', 'total7');
                $(".commbtn").attr('id', 'comm7');
                $(".likebtn").attr('id', 'like7');
                $(".viewbtn").attr('id', 'view7');
                // eventChart.config.options.title.text = '近七日數據';
                $("#chart-title").text('近七日數據');
                data.datasets[0].data = commentCount7;
                data.datasets[1].data = likeCount7;
                data.datasets[2].data = viewCount7;
                data.datasets[0].type = "bar";
                data.datasets[1].type = "bar";
                data.datasets[2].type = "bar";
                data.labels = label7;
                eventChart.update();

            });

            // CAT 7 EACH COUNT BTN
            // $("#total7").on("click", function() {
            //     data.datasets[0].data = commentCount7;
            //     data.datasets[1].data = likeCount7;
            //     data.datasets[2].data = viewCount7;
            //     eventChart.update();

            // });
            // $("#comm7").on("click", function() {
            //     data.datasets[0].data = commentCount7;
            //     data.datasets[1].data = [];
            //     data.datasets[2].data = [];
            //     eventChart.update();

            // });
            // $("#like7").on("click", function() {
            //     data.datasets[0].data = [];
            //     data.datasets[1].data = likeCount7;
            //     data.datasets[2].data = [];
            //     eventChart.update();

            // });
            // $("#view7").on("click", function() {
            //     data.datasets[0].data = [];
            //     data.datasets[1].data = [];
            //     data.datasets[2].data = viewCount7;
            //     eventChart.update();

            // });
            // ----------END OF CAT 7 DAYS-------------




            // -----------CAT 30　DAYS BTN-----------
            $("#cat30").on("click", function() {
                $(".totalbtn").attr('id', 'total30');
                $(".commbtn").attr('id', 'comm30');
                $(".likebtn").attr('id', 'like30');
                $(".viewbtn").attr('id', 'view30');
                // eventChart.config.options.title.text = '近三十日數據';
                $("#chart-title").text('近三十日數據');
                data.datasets[0].data = day30comment;
                data.datasets[1].data = day30like;
                data.datasets[2].data = day30view;
                data.datasets[0].type = "line";
                data.datasets[1].type = "line";
                data.datasets[2].type = "line";
                data.labels = day30label;
                eventChart.update();

            });

            // $("#total30").on("click", function() {
            //     data.datasets[0].data = day30comment;
            //     data.datasets[1].data = day30like;
            //     data.datasets[2].data = day30view;
            //     eventChart.update();

            // });
            // $("#comm30").on("click", function() {
            //     data.datasets[0].data = day30comment;
            //     data.datasets[1].data = [];
            //     data.datasets[2].data = [];
            //     eventChart.update();

            // });
            // $("#like30").on("click", function() {
            //     data.datasets[0].data = [];
            //     data.datasets[1].data = day30like;
            //     data.datasets[2].data = [];
            //     eventChart.update();

            // });
            // $("#view30").on("click", function() {
            //     data.datasets[0].data = [];
            //     data.datasets[1].data = [];
            //     data.datasets[2].data = day30view;
            //     eventChart.update();

            // });

            // ----------END OF 30 DAYS ------------------

            // -----------CAT MONTHLY-----------------

            $("#catmon").on("click", function() {
                $(".totalbtn").attr('id', 'totalmon');
                $(".commbtn").attr('id', 'commmon');
                $(".likebtn").attr('id', 'likemon');
                $(".viewbtn").attr('id', 'viewmon');
                $("#chart-title").text('年度數據');
                // eventChart.config.options.title.text = '年度數據';

                data.datasets[0].data = commentmondata;
                data.datasets[1].data = likemondata;
                data.datasets[2].data = viewmondata;
                data.labels = monthlylabel;
                eventChart.update();

            });

            // $("#totalmon").on("click", function() {
            //     data.datasets[0].data = commentmondata;
            //     data.datasets[1].data = likemondata;
            //     data.datasets[2].data = viewmondata;
            //     eventChart.update();

            // });
            // $("#commmon").on("click", function() {
            //     data.datasets[0].data = commentmondata;
            //     data.datasets[1].data = [];
            //     data.datasets[2].data = [];
            //     eventChart.update();

            // });
            // $("#likemon").on("click", function() {
            //     data.datasets[0].data = [];
            //     data.datasets[1].data = likemondata;
            //     data.datasets[2].data = [];
            //     eventChart.update();

            // });
            // $("#viewmon").on("click", function() {
            //     data.datasets[0].data = [];
            //     data.datasets[1].data = [];
            //     data.datasets[2].data = viewmondata;
            //     eventChart.update();

            // });



        }



    });





})