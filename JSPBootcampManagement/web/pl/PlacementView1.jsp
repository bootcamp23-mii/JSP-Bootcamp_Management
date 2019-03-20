<%-- 
    Document   : IdCardView1
    Created on : Mar 18, 2019, 4:24:31 AM
    Author     : Firsta
--%>

<%@page import="models.Placement"%>
<%@page import="models.Company"%>
<%@page import="models.EmployeeAccess"%>
<%@page import="models.AccessCard"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="models.IdCard"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        $(document).ready(function () {
            $('#tableplace').DataTable();
        });
    </script>
    <%
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
    %>
    <!-- MAIN-->

    <div class="col-md-6">
        <!-- MULTI CHARTS -->
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Input Placement</h3>
                <div class="right">
                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <form action="../PlacementServlet" method="POST">
                    <div class="form-group">
                        <label>ID</label>
                        <input class="form-control" type="text" name="plaId" value="<%= (session.getAttribute("plaId") != null) ? session.getAttribute("plaId") : ""%>"/>
                    </div>
                    <div class="form-group">
                        <label>DESCRIPTION</label>
                        <input class="form-control" type="text" name="plaDescription" value="<%= (session.getAttribute("plaDescription") != null) ? session.getAttribute("plaDescription") : ""%>"/>
                    </div>
                    <div class="form-group">
                        <label>ADDRESS</label>
                        <input class="form-control" type="text" name="plaAddress" value="<%= (session.getAttribute("plaAddress") != null) ? session.getAttribute("plaAddress") : ""%>"/>
                    </div>
                    <div class="form-group">
                        <label>DEPARTMENT</label>
                        <input class="form-control" type="text" name="plaDepartment" value="<%= (session.getAttribute("plaDepartment") != null) ? session.getAttribute("plaDepartment") : ""%>"/>
                    </div>
                    <div class="form-group">
                        <label>START DATE</label>
                        <input type="date" class="form-control" id="plaStart" name="plaStart" value="<%= (session.getAttribute("plaStart") != null) ? dateFormatChoose.format(session.getAttribute("plaStart")) : dateFormatChoose.format(new Date())%>">
                    </div>
                    <div class="form-group">
                        <label>FINISH DATE</label>
                        <input type="date" class="form-control" id="plaFinish" name="plaFinish" value="<%= (session.getAttribute("plaFinish") != null) ? dateFormatChoose.format(session.getAttribute("plaFinish")) : dateFormatChoose.format(new Date())%>">                     
                    </div>
                    <div class="form-group">
                        <label>COMPANY</label>
                        <select class="form-control" name="plaCompany">
                            <% for (Company elem : (List<Company>) session.getAttribute("company")) {
                                    out.print("<option "
                                            + "value=\"" + elem.getId() + "\" "
                                            + (elem.getId().equals(session.getAttribute("plaCompany")) ? "selected" : "") + ">"
                                            + elem.getName() + "</option>");
                                }%>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>EMPLOYEE</label>
                        <select class="form-control" name="plaEmployee">
                            <% for (Employee elem : (List<Employee>) session.getAttribute("employee")) {
                                    out.print("<option "
                                            + "value=\"" + elem.getId() + "\" "
                                            + (elem.getId().equals(session.getAttribute("plaEmployee")) ? "selected" : "") + ">"
                                            + elem.getName() + "</option>");
                                }%>

                        </select>
                    </div>
                    <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
                </form>
            </div>
        </div>
        <!-- END MULTI CHARTS -->
    </div>
    <div class="col-md-10">
        <!-- RECENT PURCHASES -->
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Placement</h3>
                <div class="right">
                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <table id="tableplace" class="table table-hover" tcellspacing='30' align='center'>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Id</th>
                            <th>Description</th>
                            <th>Address</th>
                            <th>Department</th>
                            <th>Start Date</th>
                            <th>Finish Date</th>
                            <th>Company</th>
                            <th>Employee</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int j = 1;
                                                for (Placement elem : (List<Placement>) session.getAttribute(
                                                        "placement")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getDescription()%></td>
                            <td><%= elem.getAddress()%></td>
                            <td><%= elem.getDepartment()%></td>
                            <td><%= dateFormat.format(elem.getStartDate())%></td>
                            <td><%= dateFormat.format(elem.getFinishDate())%></td>
                            <td><%= elem.getCompany().getName()%></td>
                            <td><%= elem.getEmployee().getName()%></td>
                            <td>
                                <a href="../PlacementServlet?action=update&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a href="../PlacementServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div>
                </div>
            </div>
        </div>
        <!-- END RECENT PURCHASES -->
    </div> 

    <!-- END MAIN -->
    <% session.removeAttribute(
                                "plaId"); %>
    <% session.removeAttribute(
                                "plaDescription");%>
    <% session.removeAttribute(
                                "plaAddress");%>
    <% session.removeAttribute(
                                "plaDepartment");%>
    <% session.removeAttribute(
                                "plaStart");%>
    <% session.removeAttribute(
                                "plaFinish");%>
    <% session.removeAttribute(
                                "plaCompany");%>
    <% session.removeAttribute(
                                "plaEmployee");%>

</html>
