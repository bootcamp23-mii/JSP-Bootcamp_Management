<%-- 
    Document   : EmployeeRoleView
    Created on : Mar 14, 2019, 12:49:37 PM
    Author     : gerydanu
--%>

<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="models.EmployeeRole"%>
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
    <h1>Employee Role</h1>
    <!--show table-->
    <form action="EmployeeRoleServlet" method="POST">
        <div class="form-group">
            <input type="hidden" class="form-control" name="empRoleId" value="<%= (session.getAttribute("empRoleId") != null) ? session.getAttribute("empRoleId") : ""%>"/>
        </div>
        <div class="form-group">
            <label>Role</label>
            <select class="form-control" name="roleData" >
                <% for (Role elem : (List<Role>) session.getAttribute("roleData")) {
                        out.print("<option "
                                + "value=\"" + elem.getId() + "\" "
                                + (elem.getId().equals(session.getAttribute("role")) ? "selected" : "") + ">"
                                + elem.getName() + "</option>");
                    }%>

            </select>
        </div>
        <div class="form-group">
            <label>Start date</label>
            <input type="text" class="form-control" name="empRoleStartDate" value="<%= (session.getAttribute("empRoleStartDate") != null) ? session.getAttribute("empRoleStartDate") : ""%>"/>
        </div>
        <div class="form-group">
            <label>End date</label>
            <input type="text" class="form-control" name="empRoleEndDate" value="<%= (session.getAttribute("empRoleEndDate") != null) ? session.getAttribute("empRoleEndDate") : ""%>"/>
        </div>
        <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>

        <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
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
                String tempID = "";
                String tempRole = "";
                if (!isEmpRoleListEmpty) {
                    for (EmployeeRole dataEmpRole : (List<EmployeeRole>) session.getAttribute("empRoleData")) {
            %>
            <tr>
                <td><%=i++%></td>
                <td><%=dataEmpRole.getEmployee().getId()%></td>
                <td><%=dataEmpRole.getEmployee().getName()%></td>
                <td><%=dataEmpRole.getRole().getName()%></td>
                <td><%=dataEmpRole.getStartDate().toString()%></td>
                <td><%=dataEmpRole.getEndDate().toString()%></td>
                <td>
                    <%
                            if (!isEmployeeListEmpty) {
                                for (Employee dataEmployee : (List<Employee>) session.getAttribute("employeeData")) {
                                    if (dataEmployee.getId().equalsIgnoreCase(dataEmpRole.getId())) {
                                        tempID = dataEmpRole.getId();
                                    }
                                }
                            }
                            if (!isRoleListEmpty) {
                                for (Role dataRole : (List<Role>) session.getAttribute("roleData")) {
                                    if (dataRole.getId().equalsIgnoreCase(dataRole.getId())) {
                                        tempRole = dataRole.getId();
                                    }
                                }
                            }
                        %>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                                onclick="selectDropDown('<%=tempID%>','<%=tempRole%>')"
                                >Edit</button>
                        <a class="btn btn-danger" href="../EmployeeRoleServlet?action=delete&id=<%= dataEmpRole.getId()%>">Hapus</a>
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
<% session.removeAttribute("empRoleId"); %>
<% session.removeAttribute("roleData");%>
<% session.removeAttribute("empRoleStartDate");%>
<% session.removeAttribute("empRoleEndDate");%>
<jsp:include page="../footerCV.jsp" />
