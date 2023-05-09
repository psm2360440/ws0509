<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
let cust_detail = {
    init:function(){
        $('#update_btn').click(function(){
            cust_detail.send();
        });
        $('#delete_btn').click(function(){
            var c = confirm("삭제하시겠습니까?");
            if(c == true){
                location.href = "/cust/deleteimpl?id=${cust.id}";
            }
        });
    },
    send: function(){
        $('#detail_form').attr({
            method:'post',
            action: '/cust/updateimpl'
        });
        $('#detail_form').submit();
    }
}
$(function (){
    cust_detail.init();
});

</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cust Detail</h1>
    <p class="mb-4"></p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Cust Detail</h6>
        </div>
        <!--레알차트 스타트-->
        <div class="card-body">
            <div id="container">
                <form id="detail_form">
                    <div class="form-group">
                        <input type="id" name="id" class="form-control" id="id" value="${cust.id}" readonly>
                    </div>
                    <div class="form-group">
                        <span id="check_id"></span>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="pwd">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="${cust.name}">
                    </div>
                    <button type="button" id="update_btn" class="btn btn-primary">UPDATE</button>
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

