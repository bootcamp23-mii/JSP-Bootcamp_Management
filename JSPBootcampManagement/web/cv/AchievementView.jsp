<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="models.Achievement"%>
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
<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">


                        <div class="modal fade" id="modalach" tabindex="-1" role="dialog" 
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <form action="../AchievementServlet" method="POST">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h3 class="modal-title">Organization</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="id-r" name="achId" value="<%= (session.getAttribute("achId") != null) ? session.getAttribute("achId") : ""%>"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Achievement</label>
                                                <input type="text" class="form-control" id="name-r" name="achName" value="<%= (session.getAttribute("achName") != null) ? session.getAttribute("achName") : ""%>" required/>
                                            </div>
                                            <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
                                        </div>
                                </form>
                            </div>
                        </div>
                        <!-- END MULTI CHARTS -->
                    </div>
                    <div class="col-md-6">
                        <!-- RECENT PURCHASES -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Achievement</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>
                            <div class="panel-body">
                                <a class="btn btn-success" data-target="#modalach" data-toggle="modal">Input Achievement</a>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover" tcellspacing='30' align='center'>
                                    <tr>
                                        <th>No.</th>
                                        <th>Achievement</th>
                                        <th>Action</th>
                                    </tr>
                                    <% int j = 1;
                                        for (Achievement elem : (List<Achievement>) session.getAttribute(
                                                "data")) {%>
                                    <tr>
                                        <td><%= j++%></td>
                                        <td><%= elem.getName()%></td>
                                        <td>
                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalach" 
                                                    data-getid="<%= elem.getId()%>" data-getname="<%= elem.getName()%>"><span class="glyphicon glyphicon-pencil"></span></a></button>
                                            <a href="../AchievementServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a>
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
            </div>
        </div>
        <%@include file="newFooter.jsp" %>
    </div>

    <script>
        $('#modalach').on('show.bs.modal', function (event) {
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
                "achId"); %>
    <% session.removeAttribute(
                "achName");%>
</html>