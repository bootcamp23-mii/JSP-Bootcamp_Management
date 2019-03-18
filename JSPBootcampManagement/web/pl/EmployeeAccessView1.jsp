<%-- 
    Document   : IdCardView1
    Created on : Mar 18, 2019, 4:24:31 AM
    Author     : Firsta
--%>

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
<jsp:include page="newHeader.jsp" />
<jsp:include page="newFooter.jsp" />
<!DOCTYPE html>
<html>
    <body>
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <!-- MAIN-->
        <div class="main">
            <!--MAIN CONTENT-->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- MULTI CHARTS -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Input Employee Access</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form action="../EmployeeAccessServlet" method="POST">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input class="form-control" type="text" name="emId" value="<%= (session.getAttribute("emId") != null) ? session.getAttribute("emId") : ""%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label>RECEIVE DATE</label>
                                            <input type="date" class="form-control" id="emReceive" name="emReceive" value="<%= (session.getAttribute("emReceive") != null) ? dateFormatChoose.format(session.getAttribute("emReceive")) : dateFormatChoose.format(new Date())%>">
                                        </div>
                                        <div class="form-group">
                                            <label>RETURN DATE</label>
                                            <input type="date" class="form-control" id="emReturn" name="emReturn" value="<%= (session.getAttribute("emReturn") != null) ? dateFormatChoose.format(session.getAttribute("emReturn")) : dateFormatChoose.format(new Date())%>">
                                        </div>
                                        <div class="form-group">
                                            <label>NOTE</label>
                                            <input class="form-control" type="text" name="emNote" value="<%= (session.getAttribute("emNote") != null) ? session.getAttribute("emNote") : ""%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label>ACCESS NUMBER</label>
                                            <select class="form-control" name="emNumber">
                                                <% for (AccessCard elem : (List<AccessCard>) session.getAttribute("accessCard")) {
                                                        out.print("<option "
                                                                + "value=\"" + elem.getId() + "\" "
                                                                + (elem.getId().equals(session.getAttribute("emNumber")) ? "selected" : "") + ">"
                                                                + elem.getAccessNumber() + "</option>");
                                                    }%>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>EMPLOYEE</label>
                                            <select class="form-control" name="emEmployee">
                                                <% for (Employee elem : (List<Employee>) session.getAttribute("employee")) {
                                                        out.print("<option "
                                                                + "value=\"" + elem.getId() + "\" "
                                                                + (elem.getId().equals(session.getAttribute("emEmployee")) ? "selected" : "") + ">"
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
                                    <h3 class="panel-title">Access Card</h3>
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
                                            <th>Receive Date</th>
                                            <th>Return Date</th>
                                            <th>Note</th>
                                            <th>Access Number</th>
                                            <th>Employee</th>
                                            <th>Aksi</th>
                                        </tr>

                                        <% int j = 1;
                                            for (EmployeeAccess elem : (List<EmployeeAccess>) session.getAttribute(
                                                    "accesses")) {%>
                                        <tr>
                                            <td><%= j++%></td>
                                            <td><%= elem.getId()%></td>
                                            <td><%= elem.getReceiveDate()%></td>
                                            <td><%= elem.getReturnDate()%></td>
                                            <td><%= elem.getNotes()%></td>
                                            <td><%= elem.getAccessCard().getAccessNumber()%></td>
                                            <td><%= elem.getEmployee().getName()%></td>
                                            <td>
                                                <a href="../EmployeeAccessServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                                            </td>
                                        </tr>
                                        <%}%>
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
                    </div>

                    <!-- END MAIN -->
                    <% session.removeAttribute(
                                "emId"); %>
                    <% session.removeAttribute(
                                "emReceive");%>
                    <% session.removeAttribute(
                                "emReturn");%>
                    <% session.removeAttribute(
                                "emNote");%>
                    <% session.removeAttribute(
                                "emNumber");%>
                    <% session.removeAttribute(
                                "emEmployee");%>
                </div>
            </div>
        </div>
    </body>
</html>
