<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let login_form = {
        init: function () {
            $('#login_btn').click(function () {
                login_form.send();
            });
        },
        send: function () {
            $('#login_form').attr({
                'action': '/loginimpl',
                'method': 'post'
            });
            $('#login_form').submit();
        }
    };



    $(function () {
        login_form.init();
    });
</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">LOGIN PAGE</h1>
    <p class="mb-4">This is DIGICampus Admin LOGIN PAGE. Please Enter Your Account And Find Out What You Want!</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">LOGIN PAGE</h6>
        </div>
        <!--레알차트 스타트-->
        <div class="card-body">
            <div id="container">
                <div class="page-header">
                    <h1>LOG IN</h1>
                </div>
                <p>WELCOME</p>
                <p>DIGI Campus 2nd</p>
                <form id="login_form">
                    <div class="form-group">
                        <input type="id" name="id" class="form-control" id="id" placeholder="ID">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
                    </div>
                    <div class="form-group" style="margin-top: 10px; text-align: center;">
                        <button type="button" id="login_btn" class="btn btn-default">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

