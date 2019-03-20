<%-- 
    Document   : EmployeeSkillView
    Created on : Mar 14, 2019, 2:07:58 PM
    Author     : gerydanu
--%>

<%@page import="models.Employee"%>
<%@page import="models.EmployeeSkill"%>
<%@page import="models.Skill"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../headerCV.jsp" />
<%
    boolean isEmpSkillListEmpty = session.getAttribute("empSkillData") == null;
    boolean isEmployeeListEmpty = session.getAttribute("employeeData") == null;
    boolean isSkillListEmpty = session.getAttribute("skillData") == null;
    if (isEmpSkillListEmpty || isEmployeeListEmpty || isSkillListEmpty) {
        response.sendRedirect("../EmployeeSkillServlet");
    }
%>
<title>Employee Skill</title>

</head>
<body>
    <h1>Employee Skill</h1>
    <!--Inputs-->
    <form action="EmployeeSkillServlet" method="POST">
        <div class="form-group">
            <input type="hidden" class="form-control" name="empSkillId" value="<%= (session.getAttribute("empSkillId") != null) ? session.getAttribute("empSkillId") : ""%>"/>
        </div>
        <div class="form-group">
            <label>Skill</label>
            <select class="form-control" name="skillData" >
                <% for (Skill elem : (List<Skill>) session.getAttribute("skillData")) {
                        out.print("<option "
                                + "value=\"" + elem.getId() + "\" "
                                + (elem.getId().equals(session.getAttribute("skill")) ? "selected" : "") + ">"
                                + elem.getName() + " "
                                + elem.getCategory().getName() + "</option>");
                    }%>
            </select>
        </div>
        <div class="form-group">
            <label>Score</label>
            <input type="text" class="form-control" name="skillScore" value="<%= (session.getAttribute("skillScore") != null) ? session.getAttribute("skillScore") : ""%>"/>
        </div>
        <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>

        <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
    </form>
    <!--Show tables-->
    <table id="tableEmpSkill" class="table table-striped" cellspacing='30' align ='center' border="1">
        <thead class="active">
            <tr>
                <th>No.</th>
                <th>Skill</th>
                <th>Score</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 1;
                String tempID = "";
                String tempSkill = "";
                if (!isEmpSkillListEmpty) {
                    for (EmployeeSkill dataEmpSkill : (List<EmployeeSkill>) session.getAttribute("empSkillData")) {
            %>
            <tr>
                <td><%=i++%></td>
                <td><%=dataEmpSkill.getSkill().getName()%> <%= dataEmpSkill.getSkill().getCategory().getName()%></td>
                <td><%=dataEmpSkill.getScore()%></td>
                <td>
                    <%
                        if (!isEmployeeListEmpty) {
                            for (Employee dataEmployee : (List<Employee>) session.getAttribute("employeeData")) {
                                if (dataEmployee.getId().equalsIgnoreCase(dataEmpSkill.getId())) {
                                    tempID = dataEmpSkill.getId();
                                }
                            }
                        }
                        if (!isSkillListEmpty) {
                            for (Skill dataSkill : (List<Skill>) session.getAttribute("skillData")) {
                                if (dataSkill.getId().equalsIgnoreCase(dataSkill.getId())) {
                                    tempSkill = dataSkill.getId();
                                }
                            }
                        }
                    %>

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                            data-getid="<%=dataEmpSkill.getId()%>" data-getskill="<%=dataEmpSkill.getScore()%>">Edit</button>
                    <a class="btn btn-danger" href="EmployeeSkillServlet?action=delete&<%=dataEmpSkill.getId()%>">Hapus</a>
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
            $('#tableEmpSkill').DataTable();
        });
    </script>

</body>
<% session.removeAttribute("empSkillId"); %>
<% session.removeAttribute("skillData");%>
<% session.removeAttribute("skillScore");%>
<jsp:include page="../footerCV.jsp" />
