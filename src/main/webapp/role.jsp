<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="bootbox.min.js"></script>

    <script type="text/javascript">

        //JS function to add role to the database:
        function createRole() {
            $('#createRoleForm').submit(function (event) {
                event.preventDefault();
                // alert("Alert clicked!!");
                $.ajax({
                    url: "roleServlet",
                    type: 'POST',
                    data: {
                        roleName: $('#roleName').val(),
                        button: $('#button').val()
                    },
                    success: function (json) {
                        //alert("Before");
                        $("#addRole").hide();
                        window.location.reload();
                    }

                });

            });
        }

        function deleteRole(id) {
            bootbox.confirm("<p class=\"text-center\">Are you sure you want to delete this role?</p>", function (result) {
                    if (result) {
                        $.ajax({
                            url: "roleServlet",
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


        function editRole(id) {
            $.ajax({
                url: "roleServlet",
                type: 'POST',
                data: {
                    button: 'selectRole',
                    id: id
                },
                dataType: 'html',
                success: function (html) {
                    $('#view_role-content').html(html);
                    alert("Yes Insinde editing---");
                    // $('#editRole').show();
                   $('#editRole').modal('show');
                    // jQuery.noConflict();
                    // jQuery('#editRole').modal('show');
                }


            });

        }


        function editingRole() {
            $('#form-edit-role').submit(function (event) {
                event.preventDefault();
                // alert("Alert clicked!!");
                $.ajax({
                    url: "roleServlet",
                    type: 'POST',
                    data: {
                        roleName: $('#roleName').val(),
                        id: $('#id').val(),
                        button: 'editingButton'
                    },
                    success: function (json) {
                        //alert("Before");
                        $('#editRole').modal('hide');
                        window.location.reload();
                    }

                });

            });

        }

    </script>
</head>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h2 style="color: royalblue"><i class="glyphicon glyphicon-film"></i>Manage <b>Roles</b></h2>
        </div>
        <div class="col-sm-4">
            <a class="btn btn-success" data-toggle="modal" data-target="#addRole"><span
                    class="glyphicon glyphicon-plus-sign"></span><span>Add New Role</span></a>
        </div>
    </div>
    <%--<div class="container">
        <h3 class="text-center main-title">
            <i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;MANAGE &nbsp; ROLES
        </h3>--%>
    <table class="table table-responsive table-striped">
        <thead>
        <tr>
            <th>Role</th>
            <th>ACTION</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${roles}">

            <tr>
                <td><c:out value="${role.roleName}"></c:out></td>
                <td>
                    <button class="btn btn-success btn-sm"
                            onclick="editRole('${role.id}');">
                        <i class="glyphicon glyphicon-edit"></i>&nbsp;Edit

                    </button>
                    <button class="btn btn-sm btn-danger"
                            onclick="deleteRole('${role.id}');">
                        <i class="glyphicon glyphicon-remove"></i>&nbsp;Delete

                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Adding Role -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="addRole">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Add a new Role</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" id="createRoleForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="roleName" class="col-sm-2 control-label">Role</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="roleName" name="roleName" placeholder="roleName"
                                   required>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="createRole()" type="submit" class="btn btn-info btn-md" name="button" id="button"
                            value="saveButton">Save
                    </button>
                </div>
            </form>

        </div>

    </div>
</div>

<%--Editing the role--%>

<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="editRole">
    <form role="form" id="form-edit-role">
        <div class="modal-dialog large-modal">
            <div class="modal-content">
                <div class="modal-body" id="view_role-content">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="editingRole()" type="submit" class="btn btn-info btn-md" name="button" id="button"
                            value="editingButton">Update
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>


