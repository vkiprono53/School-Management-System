<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Laviki Sch Management System</title>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">Laviki</h1>

        </div>
        <h3>Welcome to Laviki School Management System</h3>

        <h2>Login in</h2>
        <form class="m-t" role="form" action="login" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="username" name="username" id="username" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="password" name="password" id="password" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">Login</button>

            <a href="#"><small>Forgot password?</small></a>
            <p class="text-muted text-center"><small>Do not have an account?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="register.jsp">Create an account</a>
        </form>
        <p class="m-t"> <small>Designed By Kiprono Vincent &copy; 2018</small> </p>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>

</html>
