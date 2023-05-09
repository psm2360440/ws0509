<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>




    let register_form = {
        init: function () {
            $('#register_btn').attr('disabled', true);
            $('#register_btn').click(function () {
                register_form.send();
            });
            $('#lev').keyup(function () {
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if (id.length >= 4 && pwd != '' && lev != '') {
                    $('#register_btn').attr('disabled', false);
                }
            });
            $('#id').keyup(function () {

                var txt_id = $('#id').val();
                if (txt_id.length <= 3) {

                    return;
                }
                $.ajax({
                    url: '/checkid',
                    data: {id: txt_id},
                    success: function (result) {
                        if (result == 0) {
                            $('#check_id').text('사용가능한 아이디입니다!');
                            $('#pwd').focus();
                        } else {
                            $('#check_id').text('이미 사용중인 아이디입니다!');
                        }
                    }
                });

            });
        },
        send: function () {
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if (id.length <= 3) {
                $('#check_id').text('4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if (pwd == '') {
                $('#pwd').focus();
                return;
            }
            if (lev == '') {
                $('#lev').focus();
                return;
            }
            $('#register_form').attr({
                'action': '/registerimpl',
                'method': 'post'
            });
            $('#register_form').submit();
        }
    };


    $(function () {
        register_form.init();
    });
</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">JOIN NOW!</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">REGISTER PAGE</h6>
        </div>
        <!--레알차트 스타트-->
        <div class="card-body">
            <div id="container">
                <div class="page-header">
                    <h1>REGISTER</h1>
                </div>
                <p>WELCOME</p>
                <p>DIGI Campus 2nd</p>
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
                        <input type="password" class="form-control" id="pwd2" placeholder="PASSWORD HERE AGAIN">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lev" name="lev" placeholder="LEV">
                    </div>
                    <button type="button" id="register_btn" class="btn btn-block">REGISTER</button>
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

