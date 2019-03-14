<%-- 
    Document   : EmployeeRoleView
    Created on : Mar 14, 2019, 12:49:37 PM
    Author     : gerydanu
--%>

<%@page import="java.util.List"%>
<%@page import="models.EmployeeRole"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../headerCV.jsp" />
<%
    boolean isListEmpty = session.getAttribute("data") == null;
    if (isListEmpty) {
        response.sendRedirect("../EmployeeRoleServlet");
    }
%>
<title>Employee Role</title>

</head>
<body>
    <h1>Employee Role</h1>
    <!--show table-->
    <form action="EmployeeRoleServlet" method="POST">
        <!--Input form here-->
    </form>
    <table id="tableEmpRole" class="table table-striped" cellspacing='30' align ='center' border="1">
        <thead class="active">
            <tr>
                <th>No.</th>
                <th>ID</th>
                <th>Name</th>
                <th>Role</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 1;
                if (!isListEmpty) {
                    for (EmployeeRole data : (List<EmployeeRole>) session.getAttribute("data")) {
            %>
            <tr>
                <td><%=i++%></td>
                <td><%=data.getEmployee().getId()%></td>
                <td><%=data.getEmployee().getName()%></td>
                <td><%=data.getRole().getName()%></td>
                <td><%=data.getStartDate().toString()%></td>
                <td><%=data.getEndDate().toString()%></td>
                <td>
                    <!--for action buttons-->
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <script>
        $(document).ready(function () {
            $('#tableEmpRole').DataTable();
        });
    </script>

</body>

<jsp:include page="../footerCV.jsp" />
