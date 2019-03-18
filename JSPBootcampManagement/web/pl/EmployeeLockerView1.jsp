<%-- 
    Document   : IdCardView1
    Created on : Mar 18, 2019, 4:24:31 AM
    Author     : Firsta
--%>

<%@page import="models.EmployeeLocker"%>
<%@page import="models.Locker"%>
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
                                    <h3 class="panel-title">Input Employee Locker</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form action="../EmployeeLockerServlet" method="POST">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input class="form-control" type="text" name="empId" value="<%= (session.getAttribute("empId") != null) ? session.getAttribute("empId") : ""%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label>RECEIVE DATE</label>
                                            <input type="date" class="form-control" id="empReceive" name="empReceive" value="<%= (session.getAttribute("empReceive") != null) ? dateFormatChoose.format(session.getAttribute("empReceive")) : dateFormatChoose.format(new Date())%>">
                                        </div>
                                        <div class="form-group">
                                            <label>RETURN DATE</label>
                                            <input type="date" class="form-control" id="empReturn" name="empReturn" value="<%= (session.getAttribute("empReturn") != null) ? dateFormatChoose.format(session.getAttribute("empReturn")) : dateFormatChoose.format(new Date())%>">
                                        </div>
                                        <div class="form-group">
                                            <label>NOTE</label>
                                            <input class="form-control" type="text" name="empNote" value="<%= (session.getAttribute("empNote") != null) ? session.getAttribute("empNote") : ""%>"/>
                                        </div>
                                        <div class="form-group">
                                            <label>EMPLOYEE</label>
                                            <select class="form-control" name="empEmployee">
                                                <% for (Employee elem : (List<Employee>) session.getAttribute("employee")) {
                                                        out.print("<option "
                                                                + "value=\"" + elem.getId() + "\" "
                                                                + (elem.getId().equals(session.getAttribute("empEmployee")) ? "selected" : "") + ">"
                                                                + elem.getName() + "</option>");
                                                    }%>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>LOCKER NUMBER</label>
                                            <select class="form-control" name="empLocker">
                                                <% for (Locker elem : (List<Locker>) session.getAttribute("lockers")) {
                                                        out.print("<option "
                                                                + "value=\"" + elem.getId() + "\" "
                                                                + (elem.getId().equals(session.getAttribute("empLocker")) ? "selected" : "") + ">"
                                                                + elem.getLockerNumber() + "</option>");
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
                                    <h3 class="panel-title">Locker</h3>
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
                                            <th>Employee</th>
                                            <th>Locker Number</th>
                                            <th>Aksi</th>
                                        </tr>

                                        <% int j = 1;
                                            for (EmployeeLocker elem : (List<EmployeeLocker>) session.getAttribute(
                                                    "locker")) {%>
                                        <tr>
                                            <td><%= j++%></td>
                                            <td><%= elem.getId()%></td>
                                            <td><%= dateFormat.format(elem.getReceiveDate())%></td>
                                            <td><%= dateFormat.format(elem.getReturnDate())%></td>
                                            <td><%= elem.getNotes()%></td>
                                            <td><%= elem.getEmployee().getName()%></td>
                                            <td><%= elem.getLocker().getLockerNumber()%></td>
                                            <td>
                                                <a href="../EmployeeLockerServlet?action=update&id=<%= elem.getId()%>">Edit</a>
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
                                "empId"); %>
                    <% session.removeAttribute(
                                "empReceive");%>
                    <% session.removeAttribute(
                                "empReturn");%>
                    <% session.removeAttribute(
                                "empNote");%>
                    <% session.removeAttribute(
                                "empEmployee");%>
                    <% session.removeAttribute(
                                "empLocker");%>
                </div>
            </div>
        </div>
    </body>
</html>
