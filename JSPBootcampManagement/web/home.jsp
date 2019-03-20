<%-- 
    Document   : home
    Created on : Mar 17, 2019, 11:49:13 PM
    Author     : FES
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.EmployeeController"%>
<%@page import="controllers.EmployeeControllerInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
    </head>

    <body>


        <jsp:include page="Navbar.jsp" />
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="panel">
                            <div class="panel-body">
                                <% if (session.getAttribute("login") != null) {%>
                                <h3> Halo   
                                    <% String id = (String) session.getAttribute("login");
                                      EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
                                      out.print(ec.getByid(id).getName());
                                  }%> !</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="newFooter.jsp" />
        </div>
        <script src="assets/js/navbarjs.js"></script>
    </body>
</html>
