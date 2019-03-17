<%-- 
    Document   : IdCardView
    Created on : Mar 14, 2019, 11:40:26 AM
    Author     : Firsta
--%>

<%@page import="models.IdCard"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Id Card</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <form action="../IdCardServlet" method="POST">
                        <div class="form-group">
                            <label>ID</label>
                            <input class="form-control" type="text" name="idcardId" value="<%= (session.getAttribute("idcardId") != null) ? session.getAttribute("idcardId") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>RECEIVE DATE</label>
                            <input class="form-control" type="date" name="idcardReceive" value="<%= (session.getAttribute("idcardReceive") != null) ? session.getAttribute("idcardReceive") : ""%>"/>
                        </div>
                        <div class="form-group">
                            <label>RETURN DATE</label>
                            <input class="form-control" type="date" name="idcardReturn" value="<%= (session.getAttribute("idcardReturn") != null) ? session.getAttribute("idcardReturn") : ""%>"/>
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
                            <th>Aksi</th>
                        </tr>

                        <% int j = 1;
                            for (IdCard elem : (List<IdCard>) session.getAttribute(
                                    "idcard")) {%>
                        <tr>
                            <td><%= j++%></td>
                            <td><%= elem.getId()%></td>
                            <td><%= elem.getReceiveDate()%></td>
                            <td><%= elem.getReturnDate()%></td>
                            <td><%= elem.getNote()%></td>
                            <td><%= elem.getEmployee().getName()%></td>
                            <td>
                                <a href="../IdCardServlet?action=update&id=<%= elem.getId()%>">Edit</a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
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
</div>
</div>
</body>
</html>
