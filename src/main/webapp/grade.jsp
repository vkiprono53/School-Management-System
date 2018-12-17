<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h2 style="color: royalblue">Manage <b>Grades</b></h2>
        </div>
        <div class="col-sm-4">
            <%--<h4 class="modal-title"><span class="glyphicon glyphicon-plus-sign"></span>  Add Member</h4>--%>
            <a class="btn btn-success" data-toggle="modal" data-target="#addGrade"><span
                    class="glyphicon glyphicon-plus-sign"></span><span>Add New Grade</span></a>
        </div>
    </div>
    <br>
    <hr>
    <table class="table table-striped table-hover" id="manageGradeTable">
        <thead>
        <tr>
            <th>Grade</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="grade" items="${grades}">
            <tr>
                <td><c:out value="${grade.gradeName}"></c:out></td>
                <td><c:out value="${grade.gradeDesc}"></c:out></td>
                <td>
                    <button class="btn btn-success btn-sm"
                            onclick="editGrade('${grade.id}');">
                        <i class="glyphicon glyphicon-edit"></i>&nbsp;Edit

                    </button>
                    <button class="btn btn-sm btn-danger"
                            onclick="deleteGrade('${grade.id}');">
                        <i class="glyphicon glyphicon-pencil"></i>&nbsp;Delete

                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Add modal -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="addGrade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Add a new Grade</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" id="createGradeForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="gradeName" class="col-sm-2 control-label">Grade</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="gradeName" name="gradeName" placeholder="grade"
                                   required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="gradeDesc" class="col-sm-2 control-label">Description:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="gradeDesc" name="gradeDesc" placeholder="grade"
                                   required>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="createGrade()" type="submit" class="btn btn-info btn-md" name="button" id="button"
                            value="saveButton">Save
                    </button>
                </div>
            </form>

        </div>

    </div>
</div>



<%--Editing the role--%>

<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="editGrade">
    <form role="form" id="form-edit-grade">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="viewGradeContent">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="editingGrade()" type="submit" class="btn btn-info btn-md" name="button" id="button"
                            value="editingButton">Update
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- Delete Modal HTML -->
<div id="deleteGrade" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Delete Role</h4>
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
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    //JS function to add role to the database:
    function createGrade() {

        $('#createGradeForm').submit(function (event) {
            event.preventDefault();
            // alert("Alert clicked!!");
            $.ajax({
                url: "gradeServlet",
                type: 'POST',
                data: {
                    gradeName: $('#gradeName').val(),
                    gradeDesc: $('#gradeDesc').val(),
                    button: $('#button').val()
                },
                success: function (json) {
                    //alert("Before");
                    $("#addGrade").hide();
                    window.location.reload();
                }

            });

        });
    }

    function deleteGrade(id) {
        bootbox.confirm("<p class=\"text-center\">Are you sure you want to delete this Grade?</p>", function (result) {
                if (result) {
                    $.ajax({
                        url: "gradeServlet",
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


    function editGrade(id) {
        $.ajax({
            url: "gradeServlet",
            type: 'POST',
            data: {
                button: 'selectGrade',
                id: id
            },
            dataType: 'html',
            success: function (html) {
                $('#viewGradeContent').html(html);
                alert("Yes Insinde editing---");
                $('#editGrade').modal('show');
            }


        });

    }

    function editingGrade() {
        $('#form-edit-grade').submit(function (event) {
            event.preventDefault();
            // alert("Alert clicked!!");
            $.ajax({
                url: "gradeServlet",
                type: 'POST',
                data: {
                    gradeName: $('#gradeName').val(),
                    gradeDesc: $('#gradeDesc').val(),
                    id: $('#id').val(),
                    button: 'editingButton'
                },
                success: function (json) {
                    //alert("Before");
                    $('#editGrade').modal('hide');
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