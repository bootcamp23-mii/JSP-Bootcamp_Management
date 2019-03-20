<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>

<%@page import="controllers.Session"%>
<%@page import="controllers.Session"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.SessionControllerInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
    </head>

    <body>

        <% if (session.getAttribute("login") != null) {
                SessionControllerInterface sesi = new Session();
                String id = (String) session.getAttribute("login");

                if (sesi.admin(id)) {%> 
                    <jsp:include page="NavbarAdmin.jsp" />
                    <%} else if (sesi.trainer(id)) {%> <jsp:include page="NavbarTrainer.jsp" />
                    <%} else {%> <jsp:include page="Navbar.jsp" /><%}
                    }%>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="row" id="loadthis">
                        <jsp:include page="home.jsp" />
                    </div>
                </div>
            </div>
            <jsp:include page="newFooter.jsp" />
        </div>
        <script src="assets/js/navbarjs.js"></script>
    </body>

</html>