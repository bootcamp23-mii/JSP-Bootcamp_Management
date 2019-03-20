<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<!DOCTYPE html>
<html>
    
    <script>
        $(document).ready(function () {
            $('#tablecert').DataTable();
        });
    </script>
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <!-- MAIN -->
        

                    <div class="row">
                        <div class="col-md-5">
                            <!-- MULTI CHARTS -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Input Certificate</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form action="../EmployeeCertificationServlet" method="POST">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="certId" value="<%= (session.getAttribute("certId") != null) ? session.getAttribute("certId") : ""%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Certification Date</label>
                                            <input type="date" class="form-control" id="certDate" name="certDate" value="<%= (session.getAttribute("certDate") != null) ? dateFormatChoose.format(session.getAttribute("certDate")) : dateFormatChoose.format(new Date())%>">
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
                            </div>
                            <!-- END MULTI CHARTS -->
                        </div>
                        <div class="col-md-7">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Certificates</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <table id="tablecert" name="tablecert" class="table table-hover" tcellspacing='30' align='center'>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Certification Date</th>
                                                <th>Certification Number</th>
                                                <th>Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int j = 1;
                                                for (EmployeeCertification elem : (List<EmployeeCertification>) session.getAttribute(
                                                        "data")) {%>
                                            <tr>
                                                <td><%= j++%></td>
                                                <td><%= dateFormat.format(elem.getCertificatedate())%></td>
                                                <td><%= elem.getCertificatenumber()%></td>
                                                <td><%= elem.getCertificate().getName()%></td>
                                                <td>
                                                    <a href="../EmployeeCertificationServlet?action=update&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-pencil"></span></a>
                                                    <a href="../EmployeeCertificationServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-4"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div>
                                        <!--<div class="col-md-6 text-right"><a href="#" class="btn btn-primary">View All Purchases</a></div>-->
                                    </div>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>
               


        <!-- END MAIN -->
        <% session.removeAttribute(
                                "certId"); %>
        <% session.removeAttribute(
                "certDate");%>
        <% session.removeAttribute(
                "certNum");%>
        <% session.removeAttribute(
                "cert");%>
</html>