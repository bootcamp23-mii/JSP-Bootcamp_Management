<%-- 
    Document   : IdCardView1
    Created on : Mar 18, 2019, 4:24:31 AM
    Author     : Firsta
--%>

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
            $('#tableid').DataTable();
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
                <h3 class="panel-title">Input Id Card</h3>
                <div class="right">
                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <form action="../IdCardServlet" method="POST">
                    <div class="form-group">
                        <label>ID</label>
                        <input class="form-control" type="text" name="idcardId" value="<%= (session.getAttribute("idcardId") != null) ? session.getAttribute("idcardId") : ""%>"/>
                    </div>
                    <div class="form-group">
                        <label>RECEIVE DATE</label>
                        <input type="date" class="form-control" id="idcardReceive" name="idcardReceive" value="<%= (session.getAttribute("idcardReceive") != null) ? dateFormatChoose.format(session.getAttribute("idcardReceive")) : dateFormatChoose.format(new Date())%>">
                    </div>
                    <div class="form-group">
                        <label>RETURN DATE</label>
                        <input type="date" class="form-control" id="idcardReturn" name="idcardReturn" value="<%= (session.getAttribute("idcardReturn") != null) ? dateFormatChoose.format(session.getAttribute("idcardReturn")) : dateFormatChoose.format(new Date())%>">
                    </div>
                    <div class="form-group">
                        <label>NOTE</label>
                        <input class="form-control" type="text" name="idcardNote" value="<%= (session.getAttribute("idcardNote") != null) ? session.getAttribute("idcardNote") : ""%>"/>
                    </div>
                    <div class="form-group">
                        <label>EMPLOYEE</label>
                        <select class="form-control" name="idcardEmployee">
                            <% for (Employee elem : (List<Employee>) session.getAttribute("employees")) {
                                    out.print("<option "
                                            + "value=\"" + elem.getId() + "\" "
                                            + (elem.getId().equals(session.getAttribute("idcardEmployee")) ? "selected" : "") + ">"
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
    <div class="col-md-6">
        <!-- RECENT PURCHASES -->
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Id Card</h3>
                <div class="right">
                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                </div>
            </div>
            <div class="panel-body">
                <table id="tableid" class="table table-hover" tcellspacing='30' align='center'>
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Id</th>
                            <th>Receive Date</th>
                            <th>Return Date</th>
                            <th>Note</th>
                            <th>Employee</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int j = 1;
                            for (IdCard elem : (List<IdCard>) session.getAttribute(
                                    "idcard")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= dateFormat.format(elem.getReceiveDate())%></td>
                            <td><%= dateFormat.format(elem.getReturnDate())%></td>
                            <td><%= elem.getNote()%></td>
                            <td><%= elem.getEmployee().getName()%></td>
                            <td>
                                <a href="../IdCardServlet?action=update&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a href="../IdCardServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a>
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
                                "idcardId"); %>
    <% session.removeAttribute(
                                "idcardReceive");%>
    <% session.removeAttribute(
                                "idcardReturn");%>
    <% session.removeAttribute(
                                "idcardNote");%>
    <% session.removeAttribute(
                                "idcardEmployee");%>

</html>
