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
<jsp:include page="newHeader.jsp" />
<jsp:include page="newFooter.jsp" />
<!DOCTYPE html>
<html>


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
                                <h3 class="panel-title">Input Organization</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>
                            <div class="panel-body">
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
                        </div>
                        <!-- END MULTI CHARTS -->
                    </div>
                    <div class="col-md-6">
                        <!-- RECENT PURCHASES -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Organization</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>
                            <div class="panel-body no-padding">
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
                                        <td><%= elem.getName()%></td>
                                        <td>
                                            <a href="../OrganizationServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                                            <a href="../OrganizationServlet?action=delete&id=<%= elem.getId()%>">Hapus</a>
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
                "orgId"); %>
                <% session.removeAttribute(
                "orgName");%>
                </html>