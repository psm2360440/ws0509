<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

    let adminfo_form = {
        init: function () {
            $('#modify_btn').click(function () {
                adminfo_form.send();
            });
        },
        send: function () {
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if(id.length <= 3){
                $('#check_id').text('4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(lev == ''){
                $('#lev').focus();
                return;
            }
            $('#adminfo_form').attr({
                'action': '/adminfoimpl',
                'method': 'post'
            });
            $('#adminfo_form').submit();
        }
    };


    $(function () {
        adminfo_form.init();
    });
</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">JOIN NOW!</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">ADM INFO PAGE</h6>
        </div>
        <!--레알차트 스타트-->
        <div class="card-body">
            <div id="container">
                <div class="page-header">
                    <h1>ADM INFO</h1>
                </div>
                <p>UPDATE YOUR INFO</p>
                <p>DIGI Campus 2nd</p>
                <form id="adminfo_form">
                    <div class="form-group">
                        <input type="text" name="id" class="form-control" id="id" value = "${adminfo.id}" readonly>
                    </div>
                    <div class="form-group">
                        <span id="check_id"></span>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="lev" name="lev" value = "${adminfo.lev}">
                    </div>
                    <button type="button" id="modify_btn" class="btn btn-block">MODIFY</button>
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

