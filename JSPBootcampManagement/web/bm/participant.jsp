<%-- 
    Document   : participant
    Created on : Mar 14, 2019, 11:55:07 AM
    Author     : FES
--%>

<%@page import="models.Participant"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../header.jsp" %>%>
        <script>
            $(document).ready(function () {
                $('#regionTable').DataTable();
            });
        </script>
        <%
            boolean isListEmpty = session.getAttribute("data") == null;
            if (isListEmpty) response.sendRedirect("../ParticipantServlet");
        %>
        <title>Participant</title>
    </head>
    <body>
        <h1>Participant</h1>
        <!--show table-->
        <table class="table table-striped" id="regionTable" cellspacing='30' align ='center' border="1">
            <thead class="active">
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Trainer</th>
                    <th>Batch</th>
                    <th>Class</th>
                    <th>Room</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;
                    if (!isListEmpty) {
                        for (Participant data : (List<Participant>) session.getAttribute("data")) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td<%=data.getEmployee().getName()%></td>
                    <td><%=data.getBatchClass().getTrainer().getName()%></td>
                    <td><%=data.getBatchClass().getBatch().getName()%></td>
                    <td><%=data.getBatchClass().getClasses().getName()%></td>
                    <td><%=data.getBatchClass().getRoom().getName()%></td>
                    <td>
                        
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <!--end of show table-->


    </body>

    <%@include file="../footer.jsp" %>%>
</html>
