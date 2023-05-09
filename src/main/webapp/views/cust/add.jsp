<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let cust_add = {
        init:function (){
            $('#register_btn').click(function (){
                cust_add.send();
            });
        },
        send:function (){
            $('#register_form').attr({
                method:'post',
                action:'/cust/addimpl'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        cust_add.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cust Add</h1>
    <p class="mb-4"></p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Cust Add</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form">
                    <div class="form-group">
                        <input type="id" name="id" class="form-control" id="id" placeholder="ID">
                    </div>
                    <div class="form-group">
                        <span id="check_id"></span>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="NAME">
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

