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
<jsp:include page="newHeader.jsp" />
<jsp:include page="newFooter.jsp" />
<!DOCTYPE html>
<html>


    <body>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- MULTI CHARTS -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Input Education History</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form action="../EducationHistoryServlet" method="POST">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="eduId" value="<%= (session.getAttribute("eduId") != null) ? session.getAttribute("eduId") : ""%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label>GPA</label>
                                            <input type="number" step="any" min="0" max="4" class="form-control" name="eduGpa" value="<%= (session.getAttribute("eduGpa") != null) ? session.getAttribute("eduGpa") : ""%>"/>
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

                                        <button type="submit" value="Save" name="save" class="btn btn-success">Save</button>
                                    </form>
                                </div>
                            </div>
                            <!-- END MULTI CHARTS -->
                        </div>
                        <div class="col-md-6">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Education History</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body no-padding">
                                    <table class="table table-striped" tcellspacing='30' align='center'>
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
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div>
                                        <!--<div class="col-md-6 text-right"><a href="#" class="btn btn-primary">View All Purchases</a></div>-->
                                    </div>
                                </div>
                            </div>
                            <!-- END RECENT PURCHASES -->
                        </div>
                    </div>

                    <!-- END MAIN -->

                    <% session.removeAttribute(
            "educationId"); %>
                    <% session.removeAttribute(
            "educationGpa");%>
                    <% session.removeAttribute(
            "educationHistory");%>
                    </html>