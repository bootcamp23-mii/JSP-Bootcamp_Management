<%-- 
    Document   : header
    Created on : Mar 13, 2019, 3:02:47 PM
    Author     : Lusiana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/css/sb-admin-2.css" integrity="sha256-Nw3+bcyGO+cJbXm3SQCxXQQahDmxDP66aesy3IZ4aJQ=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/css/sb-admin-2.min.css" integrity="sha256-WeMGw+d+qR+l2h9TzmC+jTME4zy5zYzG8E6FbPikzeM=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/css/sb-admin-2.min.css" integrity="sha256-WeMGw+d+qR+l2h9TzmC+jTME4zy5zYzG8E6FbPikzeM=" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/startbootstrap-sb-admin-2/3.3.7+1/js/sb-admin-2.min.js" integrity="sha256-Y0Z5pT4qPGaoUSHoxW+J8fIWjQnjc7v03WBEUnt9SQ0=" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#myTable').DataTable();
            });
        </script>

        <title>Education List</title>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="RegionServlet">
                    <img src="https://i.pinimg.com/originals/08/e3/33/08e3330c5d59c6ecad1d7ae31dc08602.jpg"
                         class="img-circle img-responsive" alt="Gambar" width="70" height="70">
                    </img></a>
            </div>
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">Home</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tabel<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="RegionServlet">Region</a></li>
                        <li><a href="CountryServlet">Country</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

</head>
</html>
