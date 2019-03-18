<%-- 
    Document   : home
    Created on : Mar 17, 2019, 11:49:13 PM
    Author     : FES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <title>Bootcamp Management</title>
    </head>
    <body>
        <h1>Bootcamp Management</h1>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="LogoutServlet" method="post">
                            <h3 class="text-center text-info">Logout</h3>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Logout">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
