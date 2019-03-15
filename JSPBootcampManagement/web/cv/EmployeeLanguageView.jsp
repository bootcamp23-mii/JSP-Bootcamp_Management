<%-- 
    Document   : EmployeeLanguageView
    Created on : Mar 14, 2019, 2:07:30 PM
    Author     : gerydanu
--%>

<%@page import="models.Language"%>
<%@page import="models.Employee"%>
<%@page import="models.EmployeeLanguage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../headerCV.jsp" />
<%
    boolean isEmpLangListEmpty = session.getAttribute("empLangData") == null;
    boolean isEmployeeListEmpty = session.getAttribute("employeeData") == null;
    boolean isLanguageListEmpty = session.getAttribute("languageData") == null;
    if (isEmpLangListEmpty || isEmployeeListEmpty || isLanguageListEmpty) {
        response.sendRedirect("../EmployeeLanguageServlet");
    }
%>
<title>Employee Skill</title>

</head>
<body>
    <h1>Employee Skill</h1>
    <!--show table-->
    <form action="EmployeeLanguageServlet" method="POST">
        <div class="form-group">
            <input type="hidden" class="form-control" name="empLangId" value="<%= (session.getAttribute("empSkillId") != null) ? session.getAttribute("empSkillId") : ""%>"/>
        </div>
        <div class="form-group">
            <label>Skill</label>
            <select class="form-control" name="languageData" >
                <% for (Language elem : (List<Language>) session.getAttribute("languageData")) {
                        out.print("<option "
                                + "value=\"" + elem.getId() + "\" "
                                + (elem.getId().equals(session.getAttribute("skill")) ? "selected" : "") + ">"
                                + elem.getName() + "</option>");
                    }%>
            </select>
        </div>
        <div class="form-group">
            <label>Score</label>
            <input type="text" class="form-control" name="languageScore" value="<%= (session.getAttribute("languageScore") != null) ? session.getAttribute("languageScore") : ""%>"/>
        </div>
        <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>

        <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
    </form>
    <table id="tableEmpLang" class="table table-striped" cellspacing='30' align ='center' border="1">
        <thead class="active">
            <tr>
                <th>No.</th>
                <th>Language</th>
                <th>Score</th>
                <!--<th>Active / Passive</th>-->
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 1;
                String tempID = "";
                String tempLanguage = "";
                if (!isEmpLangListEmpty) {
                    for (EmployeeLanguage dataEmpLang : (List<EmployeeLanguage>) session.getAttribute("empLangData")) {
            %>
            <tr>
                <td><%=i++%></td>
                <td><%=dataEmpLang.getLanguage().getName()%></td>
                <td><%=dataEmpLang.getScore()%></td>
                <td><%=dataEmpLang.getIsActive()%></td>
                <td>
                    <%
                        if (!isEmployeeListEmpty) {
                            for (Employee dataEmployee : (List<Employee>) session.getAttribute("employeeData")) {
                                if (dataEmployee.getId().equalsIgnoreCase(dataEmpLang.getId())) {
                                    tempID = dataEmpLang.getId();
                                }
                            }
                        }
                        if (!isLanguageListEmpty) {
                            for (Language dataLanguage : (List<Language>) session.getAttribute("languageData")) {
                                if (dataLanguage.getId().equalsIgnoreCase(dataLanguage.getId())) {
                                    tempLanguage = dataLanguage.getId();
                                }
                            }
                        }
                    %>

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                            onclick="selectDropDown('<%=tempID%>', '<%=tempLanguage%>')"
                            >Edit</button>
                    <a class="btn btn-danger" href="../EmployeeLanguageServlet?action=delete&id=<%= dataEmpLang.getId()%>">Hapus</a>
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
            $('#tableEmpLang').DataTable();
        });
    </script>

</body>
<% session.removeAttribute("empLangId"); %>
<% session.removeAttribute("languageData");%>
<% session.removeAttribute("languageScore");%>
<jsp:include page="../footerCV.jsp" />
