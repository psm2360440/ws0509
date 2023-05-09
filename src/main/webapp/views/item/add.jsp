<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let item_add = {
        init:function (){
            $('#register_btn').click(function (){
                item_add.send();
            });
        },
        send:function (){
            $('#register_form').attr({
                method:'post',
                action:'/item/addimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        item_add.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item Add</h1>
    <p class="mb-4"></p>


    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item Add</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form">
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="NAME">
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" id="price" name="price" placeholder="PRICE">
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-control" id="img" name="img" placeholder="INPUT IMAGE FILE">
                    </div>
                    <button type="button" id="register_btn" class="btn btn-primary">REGISTER</button>
                </form>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<!-- Bootstrap core JavaScript-->

