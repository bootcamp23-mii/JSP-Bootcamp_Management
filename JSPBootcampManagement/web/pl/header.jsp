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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#myTable').DataTable();
            });
        </script>

        <title>ID CARD LIST</title>
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
