<%@ page import="com.kiprono.enums.Gender" %>
<%@ page import="com.kiprono.models.Role" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h2 style="color: royalblue">Manage <b>Teachers</b></h2>
        </div>
        <div class="col-sm-4">
            <%--<h4 class="modal-title"><span class="glyphicon glyphicon-plus-sign"></span>  Add Member</h4>--%>
            <a class="btn btn-success" data-toggle="modal" data-target="#addTeacher"><span
                    class="glyphicon glyphicon-plus-sign"></span><span>Add New Teacher</span></a>
        </div>
    </div>
    <br>
    <hr>
    <table class="table table-striped table-hover" id="manageTeacherTable">
        <thead>
        <tr>
            <th>Name</th>
            <th>Contact</th>
            <th>Gender</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="teacher" items="${teachers}">
        <tr>
            <td><c:out value="${teacher.teacherName}"></c:out></td>
            <td><c:out value="${teacher.teacherContact}"></c:out></td>
            <td><c:out value="${teacher.gender}"></c:out></td>
            <td><c:out value="${teacher.teacherRole.roleName}"></c:out></td>

            <td>
                <button class="btn btn-success btn-sm"
                        onclick="editTeacher('${teacher.id}');">
                    <i class="glyphicon glyphicon-edit"></i>&nbsp;Edit

                </button>
                <button class="btn btn-sm btn-danger"
                        onclick="deleteTeacher('${teacher.id}');">
                    <i class="glyphicon glyphicon-remove"></i>&nbsp;Delete

                </button>
            </td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</div>

<!-- Add modal -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="addTeacher">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Add a new Teacher</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" id="createTeacherForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="teacherName" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="teacherName" name="teacherName"
                                   placeholder="Name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teacherAge" class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="teacherAge" name="teacherAge" placeholder="age"
                                   required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teacherContact" class="col-sm-2 control-label">Contact</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="teacherContact" name="teacherContact"
                                   placeholder="Contact"
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="createTeacher()" type="submit" class="btn btn-info btn-md" name="button"
                            id="button"
                            value="saveButton">Save
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


<%--Editing the teacher--%>

<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="editTeacher">
    <form role="form" id="form-edit-teacher">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="view-teacher-content">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="editingTeacher()" type="submit" class="btn btn-info btn-md" name="button" id="button"
                            value="editingButton">Update
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- Delete Modal HTML -->
<div id="deleteTeacher" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Delete Teacher</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning">
                        <small>This action cannot be undone.</small>
                    </p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <button type="submit" class="btn btn-primary" name="button" id="button"
                            value="deleteButton">Delete
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    //JS function to add role to the database:
    function createTeacher() {
        $('#createTeacherForm').submit(function (event) {
            event.preventDefault();
            // alert("Alert clicked!!");
            $.ajax({
                url: "teacherServlet",
                type: 'POST',
                data: {
                    teacherName: $('#teacherName').val(),
                    teacherAge: $('#teacherAge').val(),
                    teacherContact: $('#teacherContact').val(),
                    gender: $('#gender').val(),
                    teacherRole: $('#teacherRole').val(),
                    button: $('#button').val()
                },
                success: function (json) {
                    //alert("Before");
                    $("#addTeacher").hide();
                    window.location.reload();
                }

            });

        });

    }

    function deleteTeacher(id) {
        bootbox.confirm("<p class=\"text-center\">Are you sure you want to delete this teacher?</p>", function (result) {
                if (result) {
                    $.ajax({
                        url: "teacherServlet",
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


    function editTeacher(id) {
        $.ajax({
            url: "teacherServlet",
            type: 'POST',
            data: {
                button: 'selectTeacher',
                id: id
            },
            dataType: 'html',
            success: function (html) {
                $('#view-teacher-content').html(html);

                alert("Yes Insinde editing---");
                jQuery.noConflict();
                $('#editTeacher').modal('show');
            }


        });

    }

    function editingTeacher() {
        $('#form-edit-teacher').submit(function (event) {
            event.preventDefault();
            // alert("Alert clicked!!");
            $.ajax({
                url: "teacherServlet",
                type: 'POST',
                data: {
                    teacherName: $('#teacherName').val(),
                    teacherAge: $('#teacherAge').val(),
                    teacherContact: $('#teacherContact').val(),
                    gender: $('#gender').val(),
                    teacherRole: $('#teacherRole').val(),
                    id: $('#id').val(),
                    button: 'editingButton'
                },
                success: function (json) {
                    //alert("Before");
                    $('#editTeacher').modal('hide');
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