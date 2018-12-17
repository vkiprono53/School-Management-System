<%@ page import="com.kiprono.enums.Gender" %>
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
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;STUDENT DETAILS
    </h3>
    <div class="form-group">
        <input type="hidden" class="form-control" id="id" name="id" value="${student.id}">
        <label for="studentName" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="studentName" name="studentName" value="${student.studentName}">
        </div>
    </div>
    <div class="form-group">
        <label for="studentAge" class="col-sm-2 control-label">Age</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="studentAge" name="studentAge" value="${student.studentAge}">
        </div>
    </div>
    <div class="form-group">
        <label for="gender" class="col-sm-2 control-label">Gender</label>
        <div class="col-sm-10">
            <select id="gender" name="gender">
                <%
                    for (Gender gender : Gender.values()) {
                %>
                <option value="<%=gender%>"><%=gender%>
                </option>
                <%
                    }
                %>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="studentGrade" class="col-sm-2 control-label">Grade</label>
        <div class="col-sm-10">
            <select id="studentGrade" name="studentGrade">
                <c:forEach var="grade" items="${grades}">
                    <option value="${grade.id}"><c:out value="${grade.gradeName}"></c:out></option>
                </c:forEach>
            </select>
        </div>
    </div>

</div>