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
    <head>
        <%@include file="newHeader.jsp" %>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $('#tableorg').DataTable();
            });
        </script>
        <%@include file="Navbar.jsp" %>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">
                        <!-- MULTI CHARTS -->
                        <div class="modal fade" id="modalorg" tabindex="-1" role="dialog" 
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <form action="../OrganizationServlet" method="POST">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h3 class="modal-title">Organization</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" id="id-r" class="form-control" name="orgId" value="<%= (session.getAttribute("orgId") != null) ? session.getAttribute("orgId") : ""%>"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Nama Organisasi</label>
                                                <input type="text" id="name-r" class="form-control" name="orgName" value="<%= (session.getAttribute("orgName") != null) ? session.getAttribute("orgName") : ""%>"/>
                                            </div>
                                            <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- END MULTI CHARTS -->
                    </div>
                    <div class="col-md-10">
                        <!-- RECENT PURCHASES -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Organization</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>

                            <div class="panel-body">
                                <a class="btn btn-success" data-target="#modalorg" data-toggle="modal">Input Organization</a>
                            </div>
                            <div class="panel-body">
                                <table id="tableorg" class="table table-hover" tcellspacing='30' align='center'>
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Organisasi</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% int j = 1;
                                            for (Organization elem : (List<Organization>) session.getAttribute(
                                                    "data")) {%>
                                        <tr>
                                            <td><%= j++%></td>
                                            <td><%= elem.getName()%></td>
                                            <td>
                                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalorg" 
                                                        data-getid="<%= elem.getId()%>" data-getname="<%= elem.getName()%>"><span class="glyphicon glyphicon-pencil"></span></a></button>
                                                <button type="button" class="btn btn-danger"><a href="../OrganizationServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a></button>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
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
            </div>
            <%@include file="newFooter.jsp" %>
        </div>


        <script>
            $('#modalorg').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var id = button.data('getid') // Extract info from data-* attributes
                var name = button.data('getname')// Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('#id-r').val(id)
                modal.find('#name-r').val(name)
            })
        </script>

        <!-- END MAIN -->

        <% session.removeAttribute(
                            "orgId"); %>
        <% session.removeAttribute(
                            "orgName");%>
</html>