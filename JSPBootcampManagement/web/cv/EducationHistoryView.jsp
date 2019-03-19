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

<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
    </head>

    <body>
        <script>
            $(document).ready(function () {
                $('#tableedu').DataTable();
            });
        </script>
        <%@include file="Navbar.jsp" %>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">

                        <div class="modal fade" id="modaledu" tabindex="-1" role="dialog" 
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <form action="../EducationHistoryServlet" method="POST">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h3 class="modal-title">Education</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="id-r" name="eduId" value="<%= (session.getAttribute("eduId") != null) ? session.getAttribute("eduId") : ""%>"/>
                                            </div>
                                            <div class="form-group">
                                                <label>GPA</label>
                                                <input type="number" step="any" min="0" max="4" class="form-control" id="gpa-r" name="eduGpa" value="<%= (session.getAttribute("eduGpa") != null) ? session.getAttribute("eduGpa") : ""%>"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Education</label>
                                                <select class="form-control" id="edu-r" name="edu" >
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
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" value="Save" name="save" class="btn btn-success">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- END MULTI CHARTS -->

                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Education History</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>

                                </div>
                                <div class="panel-body">
                                    <a class="btn btn-success" data-target="#modaledu" data-toggle="modal">Input Education</a>
                                </div>

                                <div class="panel-body">


                                    <table class="table table-bordered" id="tableedu" tcellspacing='30' align='center'>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>GPA</th>
                                                <th>Education</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int j = 1;
                                                for (EducationHistory elem : (List<EducationHistory>) session.getAttribute(
                                                        "data")) {%>
                                            <tr>
                                                <td><%= j++%></td>
                                                <td><%= elem.getGpa()%></td>
                                                <td><%= elem.getEducation().getDegree().getName()%> <%= elem.getEducation().getMajor().getName()%>  <%= elem.getEducation().getUniversity().getName()%></td>
                                                <td>
                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modaledu" 
                                                            data-getid="<%= elem.getId()%>" data-getgpa="<%= elem.getGpa()%>" data-getedu="<%= elem.getEducation().getId()%>"><span class="glyphicon glyphicon-pencil"></span></a></button>

                                                    <button type="button" class="btn btn-danger"><a href="../EducationHistoryServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a></button>
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
            </div>
            <%@include file="newFooter.jsp" %>
        </div>


        <script>
            $('#modaledu').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var id = button.data('getid') // Extract info from data-* attributes
                var gpa = button.data('getgpa')
                var eduid = button.data('getedu')// Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('#id-r').val(id)
                modal.find('#gpa-r').val(gpa)
                modal.find('#edu-r').val(eduid)
            })
        </script>

        <!-- END MAIN -->

        <% session.removeAttribute(
                                "educationId"); %>
        <% session.removeAttribute(
                                "educationGpa");%>
        <% session.removeAttribute(
                                "educationHistory");%>
</html>