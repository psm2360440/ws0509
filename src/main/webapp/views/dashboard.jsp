<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<script>

    let contents = {
        init: function () {
            contents.getdata1();
            contents.getdata2();
            contents.getdata3();
            // setInterval(contents.getdata, 1000);
        },
        getdata1: function () {
            $.ajax({
                url: '/custom1',
                success: function (data) {
                    contents.display1(data);
                }
            });
        },
        getdata2: function(){
            $.ajax({
                url: '/custom2',
                success: function(data){
                    contents.display2(data);
                }
            });
        },
        getdata3: function(){
            $.ajax({
                url:'/custom3',
                success: function(data){
                    contents.display3(data);
                }
            });
        },
        display3: function(data){
            Highcharts.chart('custom3', {
                chart: {
                    type: 'funnel3d',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        depth: 50,
                        viewDistance: 50
                    }
                },
                title: {
                    text: 'Highcharts Funnel3D Chart'
                },
                accessibility: {
                    screenReaderSection: {
                        beforeChartFormat: '<{headingTagName}>{chartTitle}</{headingTagName}><div>{typeDescription}</div><div>{chartSubtitle}</div><div>{chartLongdesc}</div>'
                    }
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                            allowOverlap: true,
                            y: 10
                        },
                        neckWidth: '30%',
                        neckHeight: '25%',
                        width: '80%',
                        height: '80%'
                    }
                },
                series: [{
                    name: 'Unique users',
                    data: data
                }]
            });
        },
        display2: function(data){
            Highcharts.chart('custom2', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        viewDistance: 25,
                        depth: 40
                    }
                },

                title: {
                    text: 'DigiCampus Programming Achievement Result',
                    align: 'left'
                },

                xAxis: {
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },

                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: 'score',
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },

                tooltip: {
                    headerFormat: '<b>{point.key}</b><br>',
                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
                },

                plotOptions: {
                    series: {
                        pointStart: 2023
                    },
                    column: {
                        stacking: 'normal',
                        depth: 40
                    }
                },



                series: [{
                    name: 'Daeho Lee',
                    data: data.first,
                    stack: 'Male'
                }, {
                    name: 'Jinhee Kim',
                    data: data.second,
                    stack: 'Female'
                }, {
                    name: 'Myeonghyeon Heo',
                    data: data.third,
                    stack: 'Male'
                }, {
                    name: 'Sunmi Park',
                    data: data.fourth,
                    stack: 'Female'
                }]
            });

        },
        display1: function (data) {
            var chart = Highcharts.chart('custom1', {
                chart: {
                    type: 'column'
                },

                title: {
                    text: 'Yearly Best Awards'
                },

                subtitle: {
                    text: 'Resize the frame or click buttons to change appearance'
                },

                legend: {
                    align: 'right',
                    verticalAlign: 'middle',
                    layout: 'vertical'
                },

                xAxis: {
                    categories: data.category,
                    labels: {
                        x: -10
                    }
                },

                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'Amount'
                    }
                },

                series: [{
                    name: 'Sunmi Park',
                    data: data.datas
                }, {
                    name: 'Jinhee Kim',
                    data: data.datas2
                }, {
                    name: 'Seongyoung Lee',
                    data: data.datas3
                }],

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                align: 'center',
                                verticalAlign: 'bottom',
                                layout: 'horizontal'
                            },
                            yAxis: {
                                labels: {
                                    align: 'left',
                                    x: 0,
                                    y: -5
                                },
                                title: {
                                    text: null
                                }
                            },
                            subtitle: {
                                text: null
                            },
                            credits: {
                                enabled: false
                            }
                        }
                    }]
                }
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

    <!-- Content Row -->
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
                            <div id = "content1_msg" class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                        </div>
                        <div class="col">
                            <div class="progress progress-sm mr-2">
                                <div id = "progress1" class="progress-bar bg-primary" role="progressbar"
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
                            <div id = "content2_msg" class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                        </div>
                        <div class="col">
                            <div class="progress progress-sm mr-2">
                                <div id = "progress2" class="progress-bar bg-success" role="progressbar"
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
                                    <div id = "content3_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id = "progress3" class="progress-bar bg-info" role="progressbar"
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
                            <div id = "content4_msg" class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                        </div>
                        <div class="col">
                            <div class="progress progress-sm mr-2">
                                <div id = "progress4" class="progress-bar bg-warning" role="progressbar"
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

    <!-- Content Row -->
    <!-- Area Chart -->
    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Best Employee</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="container">
                        <div class="chart-area" id="custom1"></div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">MBTI RATIO</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                             aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <div id="container3">
                            <div class="chart-area" id="custom3"></div>
                        </div>
                    </div>
                    <div class="mt-4 text-center small">

                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-5 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">DIGI CAM 1Team</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="container2">
                        <div class="chart-area" id="custom2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Charts End -->



</div>
<!-- /.container-fluid -->

</div>