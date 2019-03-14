<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="models.EducationHistory"%>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Education History </title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <form action="../EducationHistoryServlet" method="POST">
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="eduId" value="<%= (session.getAttribute("eduId") != null) ? session.getAttribute("eduId") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>GPA</label>
                            <input type="text" class="form-control" name="eduGpa" value="<%= (session.getAttribute("eduGpa") != null) ? session.getAttribute("eduGpa") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>Education</label>
                            <select class="form-control" name="edu" >
                                <% for (Education elem : (List<Education>) session.getAttribute("dataedu")) {
                                        out.print("<option "
                                                + "value=\"" + elem.getId() + "\" "
                                                + (elem.getId().equals(session.getAttribute("edu")) ? "selected" : "") + ">"
                                                + elem.getDegree().getName() + " "
                                                + elem.getMajor().getName() + " "
                                                + elem.getUniversity().getName() + "</option>");
                                    }%>

                            </select>
                        </div>
                        <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>
                        
                        <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
                    </form>
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-5">
                    <table class="table table-hover" tcellspacing='30' align='center'>
                        <tr>
                            <th>No.</th>
                            <th>Id</th>
                            <th>GPA</th>
                            <th>Region</th>
                            <th>Aksi</th>
                        </tr>
                        <% int j = 1;
                            for (EducationHistory elem : (List<EducationHistory>) session.getAttribute(
                                    "data")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getGpa()%></td>
                            <td><%= elem.getEducation().getDegree().getName()%> <%= elem.getEducation().getMajor().getName()%>  <%= elem.getEducation().getUniversity().getName()%></td>
                            <td>
                                <a href="../EducationHistoryServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                                <a href="../EducationHistoryServlet?action=delete&id=<%= elem.getId()%>">Hapus</a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <% session.removeAttribute(
                "educationId"); %>
    <% session.removeAttribute(
                "educationGpa");%>
    <% session.removeAttribute(
                "educationHistory");%>
</html>