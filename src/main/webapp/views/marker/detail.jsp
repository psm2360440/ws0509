<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f154fb7d1604c83c2bdb25d0f4a23c"></script>

<style>
    #map {
        width: 400px;
        height: 400px;
        border:2px solid lightpink;
    }
</style>
<script>
    let marker_detail_map = {
        map: null,
        init: function(){
            var mapContainer = document.querySelector('#map');
            var mapOption = {
                center: new kakao.maps.LatLng(${gmarker.lat}, ${gmarker.lng}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();

            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(${gmarker.lat}, ${gmarker.lng});

            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            marker.setMap(map);

            var iwContent = '<img src = "/uimg/${gmarker.img}.jpg" style = "width:50px;"><div style="padding:5px;">카카오로가자</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });

            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                location.href ='${gmarker.target}';
            });

        }
    };
    let marker_detail = {
        init:function (){
            $('#update_btn').click(function (){
                marker_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href = "/marker/deleteimpl?id=${gmarker.id}";
                }
            });
        },
        send:function (){
            $('#register_form').attr({
                method:'post',
                action:'/marker/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        marker_detail.init();
        marker_detail_map.init();
    });
</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">marker Detail</h1>
    <p class="mb-4"></p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gmarker.id}</h6>
        </div>
        <!--레알차트 스타트-->
        <div class="card-body">
            <div id="container">
                <form id="register_form">
                    <input type="hidden" class="form-control" id="id" name="id" value = "${gmarker.id}">
                    <input type="hidden" class="form-control" id="img" name="img" value = "${gmarker.img}">
                    <div class="form-group">
                        <img src = "/uimg/${gmarker.img}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" name="title" value = "${gmarker.title}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="target" name="target" value = "${gmarker.target}">
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" id="lat" name="lat" value = "${gmarker.lat}">
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" id="lng" name="lng" value = "${gmarker.lng}">
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-control" id="imgname" name="imgname" placeholder="INPUT IMAGE FILE">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="loc" name="loc" value = "${gmarker.loc}">
                    </div>
                    <button type="button" id="update_btn" class="btn btn-primary">MODIFY</button>
                    <button type="button" id="delete_btn" class="btn btn-primary">DELETE</button>
                </form>
                <div class = "card body">
                    <div class = "row">
                        <div class = "col-sm-10" id = "map">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

