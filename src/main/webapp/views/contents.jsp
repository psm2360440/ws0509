<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<script>
    let websocket_center = {
        stompClient: null,
        init: function () {
            this.connect();
        },
        connect: function () {
            var socket = new SockJS('${adminserver}/wss');

            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);

                this.subscribe('/sendadm', function (msg) {
                    $('#content1_msg').text(JSON.parse(msg.body).content1);
                    $('#content2_msg').text(JSON.parse(msg.body).content2);
                    $('#content3_msg').text(JSON.parse(msg.body).content3);
                    $('#content4_msg').text(JSON.parse(msg.body).content4);

                    $('#progress1').css('width', (JSON.parse(msg.body).content1) + '%');
                    $('#progress1').attr('aria-valuenow', JSON.parse(msg.body).content1);

                    $('#progress2').css('width', (JSON.parse(msg.body).content2) / 10 + '%');
                    $('#progress2').attr('aria-valuenow', JSON.parse(msg.body).content2 / 10);

                    $('#progress3').css('width', (JSON.parse(msg.body).content3) / 5 + '%');
                    $('#progress3').attr('aria-valuenow', JSON.parse(msg.body).content3 / 5);

                    $('#progress4').css('width', (JSON.parse(msg.body).content4) * 10 + '%');
                    $('#progress4').attr('aria-valuenow', JSON.parse(msg.body).content4 * 10);

                });
            });
        }
    };


    let contents = {
        init: function () {
            contents.getdata1();
            contents.getdata2();
            contents.getdata3();
            contents.getdata4();
            contents.getdata5();
            contents.getdata6();
            contents.getdata7();
            // setInterval(contents.getdata, 1000);
        },
        getdata1: function () {
            $.ajax({
                url: '/mainchart1',
                success: function (data) {
                    contents.display1(data);
                }
            })
        },
        getdata2: function () {
            $.ajax({
                url: '/mainchart2',
                success: function (data) {
                    contents.display2(data);
                }
            })
        },
        getdata3: function () {
            $.ajax({
                url: '/mainchart3',
                success: function (data) {
                    contents.display3(data);
                }
            })
        },
        getdata4: function () {
            $.ajax({
                url: '/mainchart4',
                success: function (data) {
                    contents.display4(data);
                }
            })
        },
        getdata5: function () {
            $.ajax({
                url: '/mainchart5',
                success: function (data) {
                    contents.display5(data);
                }
            })
        },
        getdata6: function () {
            $.ajax({
                url: '/mainchart6',
                success: function (data) {
                    contents.display6(data);
                }
            })
        },
        getdata7: function () {
            $.ajax({
                url: '/mainchart7',
                success: function (data) {
                    contents.display7(data);
                }
            })
        },
        display7: function (data) {
            $('#jan').text(((data.Msales[0]+data.Fsales[0])/15000).toFixed(2) + '%');
            $('#feb').text(((data.Msales[1]+data.Fsales[1])/15000).toFixed(2) + '%');
            $('#mar').text(((data.Msales[2]+data.Fsales[2])/15000).toFixed(2) + '%');
            $('#apr').text(((data.Msales[3]+data.Fsales[3])/15000).toFixed(2) + '%');
            $('#may').text(((data.Msales[4]+data.Fsales[4])/15000).toFixed(2) + '%');
            $('#jun').text(((data.Msales[5]+data.Fsales[5])/15000).toFixed(2) + '%');
            $('#jul').text(((data.Msales[6]+data.Fsales[6])/15000).toFixed(2) + '%');
            $('#aug').text(((data.Msales[7]+data.Fsales[7])/15000).toFixed(2) + '%');

            $('#jan_pro').css('width', ((data.Msales[0]+data.Fsales[0])/15000).toFixed(2) + '%');
            $('#jan_pro').html(((data.Msales[0]+data.Fsales[0])/15000).toFixed(2) + '%');
            $('#jan_pro').attr('aria-valuenow', (data.Msales[0]+data.Fsales[0])/15000);

            $('#feb_pro').css('width', ((data.Msales[1]+data.Fsales[1])/15000).toFixed(2) + '%');
            $('#feb_pro').html(((data.Msales[1]+data.Fsales[1])/15000).toFixed(2) + '%');
            $('#feb_pro').attr('aria-valuenow', (data.Msales[1]+data.Fsales[1])/15000);

            $('#mar_pro').css('width', ((data.Msales[2]+data.Fsales[2])/15000).toFixed(2) + '%');
            $('#mar_pro').html(((data.Msales[2]+data.Fsales[2])/15000).toFixed(2) + '%');
            $('#mar_pro').attr('aria-valuenow', (data.Msales[2]+data.Fsales[2])/15000);

            $('#apr_pro').css('width', ((data.Msales[3]+data.Fsales[3])/15000).toFixed(2) + '%');
            $('#apr_pro').html(((data.Msales[3]+data.Fsales[3])/15000).toFixed(2) + '%');
            $('#apr_pro').attr('aria-valuenow', (data.Msales[3]+data.Fsales[3])/15000);

            $('#may_pro').css('width', ((data.Msales[4]+data.Fsales[4])/15000).toFixed(2) + '%');
            $('#may_pro').html(((data.Msales[4]+data.Fsales[4])/15000).toFixed(2) + '%');
            $('#may_pro').attr('aria-valuenow', (data.Msales[4]+data.Fsales[4])/15000);

            $('#jun_pro').css('width', ((data.Msales[5]+data.Fsales[5])/15000).toFixed(2) + '%');
            $('#jun_pro').html(((data.Msales[5]+data.Fsales[5])/15000).toFixed(2) + '%');
            $('#jun_pro').attr('aria-valuenow', (data.Msales[5]+data.Fsales[5])/15000);

            $('#jul_pro').css('width', ((data.Msales[6]+data.Fsales[6])/15000).toFixed(2) + '%');
            $('#jul_pro').html(((data.Msales[6]+data.Fsales[6])/15000).toFixed(2) + '%');
            $('#jul_pro').attr('aria-valuenow', (data.Msales[6]+data.Fsales[6])/15000);

            $('#aug_pro').css('width', ((data.Msales[7]+data.Fsales[7])/15000).toFixed(2) + '%');
            $('#aug_pro').html(((data.Msales[7]+data.Fsales[7])/15000).toFixed(2) + '%');
            $('#aug_pro').attr('aria-valuenow', (data.Msales[7]+data.Fsales[7])/15000);
        },
        display6: function (data) {
            var colors = Highcharts.getOptions().colors,
                categories = [
                    'Female',
                    'Male'
                ],

                data = [
                    {
                        y: data.Fsum / (data.Msum + data.Fsum) * 100,
                        color: colors[5],
                        drilldown: {
                            name: 'Female',
                            categories: data.cate,
                            data: data.Fsales
                        }
                    },
                    {
                        y:data.Msum / (data.Msum + data.Fsum) * 100,
                        color: colors[1],
                        drilldown: {
                            name: 'Male',
                            categories: data.cate,
                            data: data.Msales
                        }
                    }
                ],
                browserData = [],
                versionsData = [],
                i,
                j,
                dataLen = data.length,
                drillDataLen,
                brightness;


// Build the data arrays
            for (i = 0; i < dataLen; i += 1) {

                // add browser data
                browserData.push({
                    name: categories[i],
                    y: data[i].y,
                    color: data[i].color
                });

                // add version data
                drillDataLen = data[i].drilldown.data.length;
                for (j = 0; j < drillDataLen; j += 1) {
                    brightness = 0.2 - (j / drillDataLen) / 5;
                    versionsData.push({
                        name: data[i].drilldown.categories[j],
                        y: data[i].drilldown.data[j],
                        color: Highcharts.color(data[i].color).brighten(brightness).get()
                    });
                }
            }

// Create the chart
            Highcharts.chart('custom9', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Donut Chart For Monthly Records',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: <a href="http://172.16.21.53" target="_blank">www.digicampus-shop.com</a>',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        shadow: false,
                        center: ['50%', '50%']
                    }
                },
                tooltip: {
                    valueSuffix: '%'
                },
                series: [{
                    name: 'Group',
                    data: browserData,
                    size: '60%',
                    dataLabels: {
                        formatter: function () {
                            return this.y > 5 ? this.point.name : null;
                        },
                        color: '#ffffff',
                        distance: -30
                    }
                }, {
                    name: 'Month',
                    data: versionsData,
                    size: '80%',
                    innerSize: '60%',
                    dataLabels: {
                        formatter: function () {
                            // display only if larger than 1
                            return this.y > 1 ? '<b>' + this.point.name + ':</b> ' +
                                this.y + '원' : null;
                        }
                    },
                    id: 'versions'
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 400
                        },
                        chartOptions: {
                            series: [{}, {
                                id: 'versions',
                                dataLabels: {
                                    enabled: false
                                }
                            }]
                        }
                    }]
                }
            });
        },
        display5: function (data) {
            Highcharts.chart('custom8', {
                chart: {
                    type: 'bubble',
                    plotBorderWidth: 1,
                    zoomType: 'xy'
                },

                title: {
                    text: 'Sales Records 2022 1月 - 8月 (단위: 만원)',
                    align: 'left'
                },

                xAxis: {
                    gridLineWidth: 1,
                    accessibility: {
                        rangeDescription: 'Range: 0 to 9.'
                    }
                },

                yAxis: {
                    startOnTick: false,
                    endOnTick: false,
                    accessibility: {
                        rangeDescription: 'Range: 0 to 100.'
                    }
                },

                series: [{
                    name: 'Male',
                    data: data.Msales,
                    marker: {
                        fillColor: {
                            radialGradient: {cx: 0.4, cy: 0.3, r: 0.7},
                            stops: [
                                [0, 'rgba(255,255,255,0.5)'],
                                [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0.5).get('rgba')]
                            ]
                        }
                    }
                }, {
                    name: 'Female',
                    data: data.Fsales,
                    marker: {
                        fillColor: {
                            radialGradient: {cx: 0.4, cy: 0.3, r: 0.7},
                            stops: [
                                [0, 'rgba(255,255,255,0.5)'],
                                [1, Highcharts.color(Highcharts.getOptions().colors[1]).setOpacity(0.5).get('rgba')]
                            ]
                        }
                    }
                }]
            });
        },
        display4: function (data) {
            Highcharts.chart('custom7', {
                chart: {
                    type: 'packedbubble',
                    height: '55%'
                },
                title: {
                    text: 'Bubble Chart For Digicam Shoppingmall Sales Records',
                    align: 'left'
                },
                tooltip: {
                    useHTML: true,
                    pointFormat: '{point.value}원'
                },
                plotOptions: {
                    packedbubble: {
                        minSize: '20%',
                        maxSize: '100%',
                        zMin: 0,
                        zMax: 10000000,
                        layoutAlgorithm: {
                            gravitationalConstant: 0.05,
                            splitSeries: true,
                            seriesInteraction: false,
                            dragBetweenSeries: true,
                            parentNodeLimit: true
                        },
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}',
                            filter: {
                                property: 'y',
                                operator: '>',
                                value: 250
                            },
                            style: {
                                color: 'black',
                                textOutline: 'none',
                                fontWeight: 'normal'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Male',
                    data: data.Msales,
                }, {
                    name: 'Female',
                    data: data.Fsales
                }]
            })
        },
        display3: function (data) {
            Highcharts.chart('custom6', {
                title: {
                    text: 'Digicam Shoppingmall Sales Records',
                    align: 'left'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug']
                },
                yAxis: {
                    title: {
                        text: 'SUM PRICE'
                    }
                },
                tooltip: {
                    valueSuffix: '원(KRW)'
                },
                plotOptions: {
                    series: {
                        borderRadius: '25%'
                    }
                },
                series: [{
                    type: 'column',
                    name: 'Male',
                    data: data.Msales
                }, {
                    type: 'column',
                    name: 'Female',
                    data: data.Fsales
                }, {
                    type: 'spline',
                    name: 'Average by Gender',
                    data: data.Avg,
                    marker: {
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[3],
                        fillColor: 'white'
                    }
                }, {
                    type: 'pie',
                    name: 'Total',
                    data: [{
                        name: 'Male',
                        y: data.Msum,
                        color: Highcharts.getOptions().colors[0], // 2020 color
                        dataLabels: {
                            enabled: true,
                            distance: -50,
                            format: '{point.total} 원',
                            style: {
                                fontSize: '15px'
                            }
                        }
                    }, {
                        name: 'Female',
                        y: data.Fsum,
                        color: Highcharts.getOptions().colors[1] // 2021 color
                    }],
                    center: [75, 65],
                    size: 100,
                    innerSize: '70%',
                    showInLegend: false,
                    dataLabels: {
                        enabled: false
                    }
                }]
            });
        },
        display2: function (data) {
            Highcharts.chart('custom5', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 0,
                    plotShadow: false
                },
                title: {
                    text: 'Female<br>Group<br>',
                    align: 'center',
                    verticalAlign: 'middle',
                    y: 60
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        dataLabels: {
                            enabled: true,
                            distance: -50,
                            style: {
                                fontWeight: 'bold',
                                color: 'white'
                            }
                        },
                        startAngle: -90,
                        endAngle: 90,
                        center: ['50%', '75%'],
                        size: '110%'
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Sales Share',
                    innerSize: '50%',
                    data: data
                }]
            });
        },
        display1: function (data) {
            Highcharts.chart('custom4', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Monthly Sum Sales Records'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="http://172.16.21.53" ' +
                        'target="_blank">www.digicampus-shop.com</a>'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug']
                },
                yAxis: {
                    title: {
                        text: '원(KRW)'
                    }
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: [{
                    name: 'Male',
                    data: data.Msales
                }, {
                    name: 'Female',
                    data: data.Fsales
                }]
            });
        }
    };
    $(function () {
        contents.init();
        websocket_center.init();
    })
</script>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row1 Start-->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Earnings (Monthly)
                            </div>
                            <div id="content1_msg" class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                        </div>
                        <div class="col">
                            <div class="progress progress-sm mr-2">
                                <div id="progress1" class="progress-bar bg-primary" role="progressbar"
                                     style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                     aria-valuemax="500"></div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                Earnings (Annual)
                            </div>
                            <div id="content2_msg" class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                        </div>
                        <div class="col">
                            <div class="progress progress-sm mr-2">
                                <div id="progress2" class="progress-bar bg-success" role="progressbar"
                                     style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                     aria-valuemax="500"></div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="content3_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress3" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="500"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                Pending Requests
                            </div>
                            <div id="content4_msg" class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col">
                            <div class="progress progress-sm mr-2">
                                <div id="progress4" class="progress-bar bg-warning" role="progressbar"
                                     style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                     aria-valuemax="500"></div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Content Row1 End-->

    <!-- Content Row2 Start-->
    <div class="row">
        <div class="col-xl-8 col-lg-7 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Monthly Sales Chart</h6>
                </div>
                <div class="card-body col mr-8">
                    <div class="chart-area" id="custom6"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Donut Chart For Monthly Records</h6>
                </div>
                <div class="card-body">
                    <div class="chart-area" id="custom9"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Content Row2 End-->

    <!-- Content Row3 Start-->
    <div class="row">
        <div class="col-xl-8">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Monthly Sales Chart</h6>
                </div>
                <div class="card-body col mr-8">
                    <div class="chart-area" id="custom4"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Monthly Share (Female)</h6>
                </div>
                <div class="card-body">
                    <div class="chart-area" id="custom5"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Content Row3 End-->

    <!-- Content Row4 Start-->
    <div class="row">
        <div class="col-xl-6 col-lg-5 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Bubble Chart For Digicam Shoppingmall Sales
                        Records</h6>
                </div>
                <div class="card-body col mr-8">
                    <div class="chart-area" id="custom7" style="height: 400px"></div>
                </div>
            </div>
        </div>
        <div class="col-xl-6 col-lg-5 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Sales Records 2022 1月 - 8月 (단위: 만원)</h6>
                </div>
                <div class="card-body col mr-8">
                    <div class="chart-area" id="custom8" style="height: 400px"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Content Row4 End-->

    <!-- Content Row5 Start-->
    <div class="row">
        <!--Progress Bar with Sales Table-->
        <div class="col-xl-12 col-lg-11 mb-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Sales Achievement Rate</h6>
                </div>
                <div class="card-body">
                    <h4 class="small font-weight-bold">1월<span id = "jan" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "jan_pro" class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">2월<span id = "feb" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "feb_pro"class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">3월<span id = "mar" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "mar_pro" class="progress-bar" role="progressbar" style="width: 60%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">4월<span id = "apr" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "apr_pro" class="progress-bar bg-info" role="progressbar" style="width: 80%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">5월<span id = "may" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "may_pro" class="progress-bar bg-success" role="progressbar" style="width: 100%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">6월<span id = "jun" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "jun_pro" class="progress-bar bg-dark" role="progressbar" style="width: 100%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">7월<span id = "jul" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "jul_pro" class="progress-bar bg-gradient-warning" role="progressbar" style="width: 100%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                    <h4 class="small font-weight-bold">8월<span id = "aug" class="float-right"></span></h4>
                    <div class="progress mb-4">
                        <div id = "aug_pro" class="progress-bar bg-gradient-primary" role="progressbar" style="width: 100%"
                             aria-valuenow="" aria-valuemin="0" aria-valuemax="1500000"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Content Row5 End-->

</div>
<!-- /.container-fluid -->