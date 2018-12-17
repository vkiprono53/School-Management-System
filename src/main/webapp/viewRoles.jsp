<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <!-- jQuery library -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="bootbox.min.js"></script>
</head>
<div class="container">
    <h3 class="text-center main-title">
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;ROLE DETAILS
    </h3>
    <div class="form-group">
        <input type="hidden" class="form-control" id="id" name="id" value="${role.id}">
        <label for="roleName" class="col-sm-2 control-label">Role</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="roleName" name="roleName" value="${role.roleName}">

        </div>
   </div>

</div>