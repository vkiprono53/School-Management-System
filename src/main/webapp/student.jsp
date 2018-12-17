<%@ page import="com.kiprono.enums.Gender" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h2 style="color: royalblue">Manage <b>Students</b></h2>
        </div>
        <div class="col-sm-4">
            <%--<h4 class="modal-title"><span class="glyphicon glyphicon-plus-sign"></span>  Add Member</h4>--%>
            <a class="btn btn-success" data-toggle="modal" data-target="#addStudent"><span
                    class="glyphicon glyphicon-plus-sign"></span><span>Add New Student</span></a>
        </div>
    </div>
    <br>
    <hr>
    <table class="table table-striped table-hover" id="manageStudentTable">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>[
            <th>Grade</th>
            <th>Actions</th>
        </tr>
        </thead>
        <c:forEach var="student" items="${students}">
            <tbody>
            <tr>
                <td><c:out value="${student.studentName}"></c:out></td>
                <td><c:out value="${student.studentAge}"></c:out></td>
                <td><c:out value="${student.gender}"></c:out></td>
                <td><c:out value="${student.studentGrade.gradeName}"></c:out></td>
                <td>

                    <button class="btn btn-success btn-sm"
                            onclick="editStudent('${student.id}');">
                        <i class="glyphicon glyphicon-edit"></i>&nbsp;Edit

                    </button>

                    <button class="btn btn-sm btn-danger"
                            onclick="deleteStudent('${student.id}');">
                        <i class="glyphicon glyphicon-remove"></i>Delete
                    </button>
                </td>

            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>

<!-- Add modal -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="addStudent">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Add a new Student</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>

            <form class="form-horizontal" id="createStudentForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="studentName" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="studentName" name="studentName"
                                   placeholder="Name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="studentAge" class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="studentAge" name="studentAge" placeholder="age"
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="createStudent()" type="submit" class="btn btn-info btn-md" name="button"
                            id="button"
                            value="saveButton">Save
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--Editing the student--%>

<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="editStudent">
    <form role="form" id="form-edit-student">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="view_student-content">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="editingStudent()" type="submit" class="btn btn-info btn-md" name="button" id="button"
                            value="editingButton">Update
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
    function createStudent() {
        $('#createStudentForm').submit(function (event) {
            event.preventDefault();
            // alert("Alert clicked!!");
            $.ajax({
                url: "studentServlet",
                type: 'POST',
                data: {
                    studentName: $('#studentName').val(),
                    studentAge: $('#studentAge').val(),
                    gender: $('#gender').val(),
                    studentGrade: $('#studentGrade').val(),
                    button: $('#button').val()
                },
                success: function (json) {
                    //alert("Before");
                    $("#addStudent").hide();
                    window.location.reload();
                }

            });

        });
    }

    function deleteStudent(id) {
        bootbox.confirm("<p class=\"text-center\">Are you sure you want to delete this Student?</p>", function (result) {
                if (result) {
                    $.ajax({
                        url: "studentServlet",
                        type: 'POST',
                        data: {
                            button: 'deleteButton',
                            id: id
                        },
                        success: function (json) {
                            window.location.reload();
                        }
                    });
                }

            }
        );
    }

    function editStudent(id) {
        $.ajax({
            url: "studentServlet",
            type: 'POST',
            data: {
                button: 'selectStudent',
                id: id
            },
            dataType: 'html',
            success: function (html) {
                $('#view_student-content').html(html);

                alert("Yes Insinde editing---");
                jQuery.noConflict();
                $('#editStudent').modal('show');
            }


        });

    }

    function editingStudent() {
        $('#form-edit-student').submit(function (event) {
            event.preventDefault();
            // alert("Alert clicked!!");
            $.ajax({
                url: "studentServlet",
                type: 'POST',
                data: {
                    studentName: $('#studentName').val(),
                    studentAge: $('#studentAge').val(),
                    gender: $('#gender').val(),
                    studentGrade: $('#studentGrade').val(),
                    id: $('#id').val(),
                    button: 'editingButton'
                },
                success: function (json) {
                    //alert("Before");
                    $('#editStudent').modal('hide');
                    window.location.reload();
                }

            });

        });

    }
</script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="bootbox.min.js"></script>