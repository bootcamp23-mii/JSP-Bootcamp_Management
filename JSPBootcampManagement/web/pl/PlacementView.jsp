<%-- 
    Document   : PlacementView
    Created on : Mar 17, 2019, 4:38:36 PM
    Author     : Firsta
--%>

<%@page import="models.Placement"%>
<%@page import="models.Employee"%>
<%@page import="models.Company"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placement</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
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
                            <input class="form-control" type="date" name="plaStart" value="<%= (session.getAttribute("plaStart") != null) ? session.getAttribute("plaStart") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>FINISH DATE</label>
                            <input class="form-control" type="date" name="plaFinish" value="<%= (session.getAttribute("plaFinish") != null) ? session.getAttribute("plaFinish") : ""%>"/>
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
                <div class="col-md-1">
                </div>
                <div class="col-md-5">
                    <table class="table table-hover" tcellspacing='30' align='center'>
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

                        <% int j = 1;
                            for (Placement elem : (List<Placement>) session.getAttribute(
                                    "placement")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getDescription()%></td>
                            <td><%= elem.getAddress()%></td>
                            <td><%= elem.getDepartment()%></td>
                            <td><%= elem.getStartDate()%></td>
                            <td><%= elem.getFinishDate()%></td>
                            <td><%= elem.getCompany().getName()%></td>
                            <td><%= elem.getEmployee().getName()%></td>
                            <td>
                                <a href="../PlacementServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
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
