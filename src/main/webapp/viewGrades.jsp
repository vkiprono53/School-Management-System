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
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;GRADE DETAILS
    </h3>

    <div class="form-group">
        <input type="hidden" class="form-control" id="id" name="id" value="${grade.id}">
        <label for="gradeName" class="col-sm-2 control-label">Grade</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="gradeName" name="gradeName" value="${grade.gradeName}"
                   required>
        </div>
    </div>

    <div class="form-group">
        <label for="gradeDesc" class="col-sm-2 control-label">Description:</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="gradeDesc" name="gradeDesc" value="${grade.gradeDesc}"
                   required>
        </div>
    </div>


</div>