<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="models.Organization"%>
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
                    <form action="../OrganizationServlet" method="POST">
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="orgId" value="<%= (session.getAttribute("orgId") != null) ? session.getAttribute("orgId") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>Nama Organisasi</label>
                            <input type="text" class="form-control" name="orgName" value="<%= (session.getAttribute("orgName") != null) ? session.getAttribute("orgName") : ""%>"/>
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
                            <th>Organisasi</th>
                        </tr>
                        <% int j = 1;
                            for (Organization elem : (List<Organization>) session.getAttribute(
                                    "data")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getName() %></td>
                            <td>
                                <a href="../OrganizationServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                                <a href="../OrganizationServlet?action=delete&id=<%= elem.getId()%>">Hapus</a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <% session.removeAttribute(
                "orgId"); %>
    <% session.removeAttribute(
                "orgName");%>
</html>