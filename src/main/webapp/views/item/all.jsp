<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4"></p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item All</h6>
            <form action = "/item/search" method = "get" id="search_form" class="form-inline well">

                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Enter title"
                               value="${ms.name}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price">Price:</label>
                    <div class="col-sm-10">
                        <input type="number" name="price" class="form-control" id="price" placeholder="Enter title"
                               value="${ms.price}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="startdate">Start Date:</label>
                    <div class="col-sm-10">
                        <input type="date" name="startdate" class="form-control" id="startdate" placeholder="Enter title"
                               value="${ms.startdate}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="enddate">End Date:</label>
                    <div class="col-sm-10">
                        <input type="date" name="enddate" class="form-control" id="enddate" placeholder="Enter title"
                               value="${ms.enddate}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button id="search_btn" type="submit" class="btn btn-primary">Search</button>
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
                            <th>ITEM CODE</th>
                            <th>ITEM NAME</th>
                            <th>ITEM PRICE</th>
                            <th>ITEM REG_DATE</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>IMAGE</th>
                            <th>ITEM CODE</th>
                            <th>ITEM NAME</th>
                            <th>ITEM PRICE</th>
                            <th>ITEM REG_DATE</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <c:forEach var = "i" items = "${ilist}">
                            <tr>
                                <td><a href = "#"data-toggle="modal" data-target="#target${i.name}">
                                    <img class="medium_img" src="/uimg/${i.imgname}" style = "width: 75px; height:75px;"></a></td>
                                <td><a href="/item/detail?id=${i.id}">${i.id}</a></td>
                                <td>${i.name}</td>
                                <td><fmt:formatNumber value="${i.price}" type="number" pattern = "###,###원"/></td>
                                <td><fmt:formatDate value="${i.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                                <!-- Modal -->
                                <div id="target${i.name}" class="modal fade" role="dialog">
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
                                                <p>${i.imgname}</p>
                                                <img src="/uimg/${i.imgname}">

                                            </div>
                                            <div class="modal-footer">
                                                <a href = "/item/detail?id=${i.id}" class="btn btn-info" role = "button">Detail</a>
                                                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
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

