<%-- 
    Document   : EmployeeAccessView
    Created on : Mar 15, 2019, 2:02:01 PM
    Author     : Firsta
--%>

<%@page import="models.EmployeeAccess"%>
<%@page import="models.Employee"%>
<%@page import="models.AccessCard"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Access</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <form action="../EmployeeAccessServlet" method="POST">
                        <div class="form-group">
                            <label>ID</label>
                            <input class="form-control" type="text" name="emId" value="<%= (session.getAttribute("emId") != null) ? session.getAttribute("emId") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>RECEIVE DATE</label>
                            <input class="form-control" type="date" name="emReceive" value="<%= (session.getAttribute("emReceive") != null) ? session.getAttribute("emReceive") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>RETURN DATE</label>
                            <input class="form-control" type="date" name="emReturn" value="<%= (session.getAttribute("emReturn") != null) ? session.getAttribute("emReturn") : ""%>"/>
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
            </div>
        </div>
    </body>
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
</html>
