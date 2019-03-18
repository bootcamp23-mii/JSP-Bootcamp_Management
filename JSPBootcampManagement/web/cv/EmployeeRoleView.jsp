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

        <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">New data</a>
        <form action="../EmployeeRoleServlet" method="POST">
            <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="close">
                                <span aria-hidden="true">
                                    &times;
                                </span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label data-error="wrong" data-success="true">Employee</label>
                            <select class="form-control" id="cbId" name="cbId">
                                <%
                                    if (!isEmployeeListEmpty) {
                                        for (Employee dataEmployee2 : (List<Employee>) session.getAttribute("employeeData")) {
                                %>
                                <option value="<%=dataEmployee2.getId()%>"><%out.print(dataEmployee2.getId() + " - " + dataEmployee2.getName());%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <label data-error="wrong" data-success="true">Role</label>
                            <select class="form-control" id="cbBatchClass" name="cbBatchClass">
                                <%
                                    if (!isEmployeeListEmpty) {
                                        for (Role dataRole : (List<Role>) session.getAttribute("roleData")) {
                                %>
                                <option value="<%=dataRole.getId()%>"><%out.print(dataRole.getName());%></option>
                                <%
                                        }
                                    }
                                %>

                            </select>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Save" name="save"/>
                        </div>
                    </div>
                </div>
            </div>
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
                <td><%=dataEmpRole.getStartDate().toInstant().toString()%></td>
                <td><%=dataEmpRole.getEndDate()%></td>
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
