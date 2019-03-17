<%-- 
    Document   : EmployeeLockerView
    Created on : Mar 15, 2019, 3:24:04 PM
    Author     : Firsta
--%>

<%@page import="models.EmployeeLocker"%>
<%@page import="models.Locker"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Locker</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <form action="../EmployeeLockerServlet" method="POST">
                        <div class="form-group">
                            <label>ID</label>
                            <input class="form-control" type="text" name="empId" value="<%= (session.getAttribute("empId") != null) ? session.getAttribute("empId") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>RECEIVE DATE</label>
                            <input type="date" data-date-format="mm/dd/yyyy" class="form-control" name="empReceive" value="<%= (session.getAttribute("empReceive") != null) ? session.getAttribute("empReceive") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>RETURN DATE</label>
                             <input type="date" data-date-format="mm/dd/yyyy" class="form-control" name="empReturn" value="<%= (session.getAttribute("empReceive") != null) ? session.getAttribute("empReturn") : ""%>"/>
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
                <div class="col-md-2">
                </div>
                <div class="col-md-5">
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
                            <td><%= elem.getReceiveDate()%></td>
                            <td><%= elem.getReturnDate()%></td>
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
            </div>
        </div>
    </body>
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
</html>
