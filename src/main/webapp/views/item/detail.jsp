<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let item_detail = {
        init:function (){
            $('#update_btn').click(function (){
                item_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href = "/item/deleteimpl?id=${gitem.id}";
                }
            });
        },
        send:function (){
            $('#register_form').attr({
                method:'post',
                action:'/item/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        item_detail.init();
    });
</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item Detail</h1>
    <p class="mb-4"></p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gitem.id}</h6>
        </div>
        <!--레알차트 스타트-->
        <div class="card-body">
            <div id="container">
                <form id="register_form">
                    <input type="hidden" class="form-control" id="id" name="id" value = "${gitem.id}">
                    <input type="hidden" class="form-control" id="imgname" name="imgname" value = "${gitem.imgname}">

                    <div class="form-group">
                        <img src = "/uimg/${gitem.imgname}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" value = "${gitem.name}">
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" id="price" name="price" value = "${gitem.price}">
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-control" id="img" name="img" placeholder="INPUT IMAGE FILE">
                    </div>
                    <button type="button" id="update_btn" class="btn btn-primary">MODIFY</button>
                    <button type="button" id="delete_btn" class="btn btn-primary">DELETE</button>
                </form>
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

