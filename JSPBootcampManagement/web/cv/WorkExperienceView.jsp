<%-- 
    Document   : WorkExperienceView
    Created on : Mar 14, 2019, 2:08:14 PM
    Author     : gerydanu
--%>

<%@page import="models.WorkExperience"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean isWorkExpListEmpty = session.getAttribute("workExpData") == null;
    boolean isEmployeeListEmpty = session.getAttribute("employeeData") == null;
    if (isWorkExpListEmpty || isEmployeeListEmpty) {
        response.sendRedirect("../WorkExperienceServlet");
    }
%>
<div class="panel">
    <div class="panel-body">

        <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">New data</a>
        <form action="../WorkExperienceServlet" method="POST">
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
                            <div class="md-form">
                                <label data-error="wrong" data-success="true">Name</label>
                                <input type="text" name="workName" id="id-r" class="form-control" value="<%if (session.getAttribute("workName") != null) {
                                        out.print(session.getAttribute("workName"));
                                    }%>">
                            </div>
                            <div class="md-form">
                                <label data-error="wrong" data-success="true">Description</label>
                                <input type="text" name="workDesc" id="name-r" class="form-control" value="<%if (session.getAttribute("workDesc") != null) {
                                        out.print(session.getAttribute("workDesc"));
                                    }%>">
                            </div>
                            <div class="md-form">
                                <label data-error="wrong" data-success="true">Start Date</label>
                                <input type="text" name="workExpStartDate" id="id-r" class="form-control" value="<%if (session.getAttribute("workExpStartDate") != null) {
                                        out.print(session.getAttribute("workExpStartDate"));
                                    }%>">
                            </div>
                            <div class="md-form">
                                <label data-error="wrong" data-success="true">End Date</label>
                                <input type="text" name="workExpEndDate" id="name-r" class="form-control" value="<%if (session.getAttribute("workExpEndDate") != null) {
                                        out.print(session.getAttribute("workExpEndDate"));
                                    }%>">
                            </div>
                            <div>
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
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Save" name="save"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <table id="tableWorkExp" class="table table-striped" cellspacing='30' align ='center' border="1">
            <thead class="active">
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;
                    if (!isWorkExpListEmpty) {
                        for (WorkExperience dataWorkExp : (List<WorkExperience>) session.getAttribute("workExpData")) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=dataWorkExp.getName()%></td>
                    <td><%=dataWorkExp.getDescription()%></td>
                    <td><%=dataWorkExp.getStartDate().toString()%></td>
                    <td><%=dataWorkExp.getEndDate().toString()%></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                                data-getid="<%= dataWorkExp.getId()%>" data-getname="<%= dataWorkExp.getName()%>" data-getdescription="<%= dataWorkExp.getDescription()%>" data-getstartdate="<%=dataWorkExp.getStartDate().toString()%>" data-getenddate="<%=dataWorkExp.getEndDate().toString()%>">Edit</button>
                        <a class="btn btn-danger" href="WorkExperienceServlet?action=delete&<%= dataWorkExp.getId()%>">Hapus</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
            <script>
                $(document).ready(function () {
                    $('#tableWorkExp').DataTable();
                });
            </script>
        </table>

        <script>
            $(document).ready(function () {
                $('#tableWorkExp').DataTable();
            });
        </script>

    </div>
</div>
<% session.removeAttribute("workName"); %>
<% session.removeAttribute("workDesc");%>
<% session.removeAttribute("workExpStartDate");%>
<% session.removeAttribute("workExpEndDate");%>
<% session.removeAttribute("employeeData");%>
