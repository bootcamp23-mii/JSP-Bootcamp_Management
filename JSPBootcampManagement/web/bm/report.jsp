<%-- 
    Document   : report
    Created on : Mar 18, 2019, 6:44:46 AM
    Author     : FES
--%>

<%@page import="java.util.List"%>
<%@page import="models.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../header.jsp" %>
        <title>Report</title>
        <%            boolean isParticipantListEmpty = session.getAttribute("dataEmployee") == null;
            if (isParticipantListEmpty) {
                response.sendRedirect("../ReportServlet");
            }
        %>
    </head>
    <body>
        <h1>Report</h1>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="../ReportServlet" method="post">
                            <h3 class="text-center text-info">Generate</h3>
                            <label data-error="wrong" data-success="true">Employee</label>
                            <select class="form-control" id="cbParticipant" name="cbParticipant">
                                <%
                                    session.getServletContext().getRealPath("");
                                    if (!isParticipantListEmpty) {
                                        for (Employee dataE2 : (List<Employee>) session.getAttribute("dataEmployee")) {
                                %>
                                <option value="<%=dataE2.getId()%>"><%out.print(dataE2.getId() + " - " + dataE2.getName());%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
