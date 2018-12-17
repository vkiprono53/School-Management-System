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
        <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;TEACHER DETAILS
    </h3>
    <div class="form-group">
        <input type="hidden" class="form-control" id="id" name="id" value="${teacher.id}">
        <label for="teacherName" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="teacherName" name="teacherName"
                   placeholder="Name" required>
        </div>
    </div>

    <div class="form-group">
        <label for="teacherAge" class="col-sm-2 control-label">Age</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="teacherAge" name="teacherAge" value="${teacher.teacherAge}"
                   required>

        </div>
    </div>

    <div class="form-group">
        <label for="teacherContact" class="col-sm-2 control-label">Contact</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="teacherContact" name="teacherContact"
                   value="${teacher.teacherContact}"
                   required>
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
        <label for="teacherRole" class="control-label col-lg-2">Role <span
                class="required">*</span></label>
        <div class="col-lg-10">
            <select id="teacherRole" name="teacherRole">
                <c:forEach var="role" items="${roles}">
                    <option value="${role.id}"><c:out value="${role.roleName}"></c:out></option>
                </c:forEach>
            </select>
        </div>
    </div>

</div>


