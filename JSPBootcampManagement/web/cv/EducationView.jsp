<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Education"%>
<%@page import="java.util.List"%>
<%@page import="controllers.EducationController"%>
<%@page import="controllers.EducationControllerInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<body bgcolor='#F0FFFF'> 
    
    <div class="container">
    <table class="table table-striped" cellspacing='30' align ='center'>
        <tr class="active">
            <th>No.</th>
            <th>Name</th>
            <th>Degree</th>
            <th>University</th>
            <th>Aksi</th>
        </tr>
        <% int i = 1;
            for (Education elem : (List<Education>) session.getAttribute("data")) {%>
        <tr>
            <td><%= i++%></td>
            <td><%= elem.getMajor().getName()%></td>
            <td><%= elem.getDegree().getName()%></td>
            <td><%= elem.getUniversity().getName()%></td>
            <td>
                <a class="btn btn-success" href="RegionServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                <a class="btn btn-danger" href="RegionServlet?action=delete&id=<%= elem.getId()%>">Hapus</a>
            </td>
        </tr>
        <%}%>
    </table>
    </div>
</body>
<jsp:include page="footer.jsp" />
</html>
