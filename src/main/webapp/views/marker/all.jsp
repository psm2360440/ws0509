<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let marker_search = {
        init: function(){
            $('#search_btn').click(function(){
                $('#search_form').attr({
                    method:'get',
                    action:'/marker/search'
                });
                $('#search_form').submit();
            });
        }
    };
    $(function(){
        marker_search.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4"></p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker All</h6>
            <form id="search_form" class="form-inline well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="loc">Location:</label>
                    <div class = "col-sm-4">
                        <select class = "form-control" id = "loc" name = "loc">
                            <!--selected 쓰는 이유: 키워드 옵션 하나 선택 이후에 검색을 하면 초기화 되어서 기본값 서울로 돌아오는 것을 방지하기 위하여
                            <option>안에 jstl 조건문을 써서 검색 후애도 선택한  loc 키워드가 선택되어 있도록 하기 위하여 사용한다 -->
                            <option value = "">지역</option>
                            <option value = "s"     <c:if test = "${ms.loc == 's'}">selected</c:if>     >서울</option>
                            <option value = "b"     <c:if test = "${ms.loc == 'b'}">selected</c:if>     >부산</option>
                            <option value = "j"     <c:if test = "${ms.loc == 'j'}">selected</c:if>     >제주</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter TITLE"
                        value = "${ms.title}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="search_btn" type="button" class="btn btn-primary">SEARCH</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="card-body">

            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>IMAGE</th>
                            <th>TITLE</th>
                            <th>TARGET</th>
                            <th>LAT</th>
                            <th>LNG</th>
                            <th>LOC</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>IMAGE</th>
                            <th>TITLE</th>
                            <th>TARGET</th>
                            <th>LAT</th>
                            <th>LNG</th>
                            <th>LOC</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach var = "m" items = "${mlist}">
                            <tr>
                                <td><a href = "#" data-toggle="modal" data-target="#target${m.title}">
                                    <img class="medium_img" src="/uimg/${m.img}" style = "width: 75px; height:75px;"></a></td>
                                <td><a href="/marker/detail?id=${m.id}">${m.title}</a></td>
                                <td>${m.target}</td>
                                <td>${m.lat}</td>
                                <td>${m.lng}</td>
                                <td>${m.loc}</td>

                                <!-- Modal -->
                                <div id="target${m.title}" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"></button></br>
                                                <h4 class="modal-title"></h4>
                                            </div>
                                            <div class="modal-body">
                                                <h4>
                                                    Detail Image
                                                </h4>
                                                <p>${m.img}</p>
                                                <img src="/uimg/${m.img}">

                                            </div>
                                            <div class="modal-footer">
                                                <a href = "/marker/detail?id=${m.id}" class="btn btn-primary" role = "button">Detail</a>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>



<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/js/sb-admin-2.min.js"></script>

