<%-- 
    Document   : RoleView
    Created on : Mar 15, 2019, 1:27:48 PM
    Author     : gerydanu
--%>

<%@page import="java.util.List"%>
<%@page import="models.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../headerCV.jsp" />
<%
    boolean isEmpRoleListEmpty = session.getAttribute("empRoleData") == null;
    boolean isEmployeeListEmpty = session.getAttribute("employeeData") == null;
    boolean isRoleListEmpty = session.getAttribute("roleData") == null;
    if (isEmpRoleListEmpty || isEmployeeListEmpty || isRoleListEmpty) {
        response.sendRedirect("../EmployeeRoleServlet");
    }
%>
<title>Employee Role</title>

</head>
<body>
    <h1>Roles</h1>
    <!--show table-->
    <table id="tableRole" class="table table-striped" cellspacing='30' align ='center' border="1">
        <thead class="active">
            <tr>
                <th>No.</th>
                <th>ID</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <% int i = 1;
            for (Role elem : (List<Role>) session.getAttribute("data")) {%>
            <tr>
                <td><%=i++%></td>
                <td><%=elem.getId()%></td>
                <td><%=elem.getName()%></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <script>
        $(document).ready(function () {
            $('#tableRole').DataTable();
        });
    </script>

</body>
<jsp:include page="../footerCV.jsp" />
