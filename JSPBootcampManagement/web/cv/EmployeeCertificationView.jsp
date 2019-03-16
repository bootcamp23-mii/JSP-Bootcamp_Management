<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="models.Certificate"%>
<%@page import="models.EmployeeCertification"%>
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
        <script type="text/javascript">
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd'
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <form action="../EmployeeCertificationServlet" method="POST">
                        <div class="form-group">
                            <input type="hidden" class="form-control" name="certId" value="<%= (session.getAttribute("certId") != null) ? session.getAttribute("certId") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>Certification Date</label>
                            <input type="date" data-date-format="mm/dd/yyyy" class="form-control" name="certDate" value="<%= (session.getAttribute("certDate") != null) ? session.getAttribute("certDate") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>Certification Number</label>
                            <input type="text" class="form-control" name="certNum" value="<%= (session.getAttribute("certNum") != null) ? session.getAttribute("certNum") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>Education</label>
                            <select class="form-control" name="cert">
                                <% for (Certificate elem : (List<Certificate>) session.getAttribute("datace")) {
                                        out.print("<option "
                                                + "value=\"" + elem.getId() + "\" "
                                                + (elem.getId().equals(session.getAttribute("cert")) ? "selected" : "") + ">"
                                                + elem.getName() + "</option>");
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
                            <th>Certification Date</th>
                            <th>Certification Number</th>
                            <th>Name</th>
                        </tr>
                        <% int j = 1;
                            for (EmployeeCertification elem : (List<EmployeeCertification>) session.getAttribute(
                                    "data")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getCertificatedate()%></td>
                            <td><%= elem.getCertificatenumber()%></td>
                            <td><%= elem.getCertificate().getName()%></td>
                            <td>
                                <a href="../EmployeeCertificationServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                                <a href="../EmployeeCertificationServlet?action=delete&id=<%= elem.getId()%>">Hapus</a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
     <% session.removeAttribute(
                "certId"); %>
    <% session.removeAttribute(
                "certDate");%>
    <% session.removeAttribute(
                "certNum");%>
    <% session.removeAttribute(
                            "cert");%>
</html>