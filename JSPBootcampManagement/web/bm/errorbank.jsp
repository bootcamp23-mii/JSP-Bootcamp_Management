<%-- 
    Document   : errorbank
    Created on : Mar 15, 2019, 10:41:21 AM
    Author     : FES
--%>

<%@page import="java.util.Date"%>
<%@page import="models.Classes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.ErrorBank"%>
<%@page import="java.util.List"%>
<%@page import="models.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
        <title>Error Bank</title>
        <script>
            $(document).ready(function () {
            $('#errorBankTable').DataTable();
            });
        </script>
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
            boolean isEmployeeListEmpty = session.getAttribute("dataEmployee") == null;
            boolean isErrorBankListEmpty = session.getAttribute("dataErrorBank") == null;
            boolean isClassListEmpty = session.getAttribute("dataClass") == null;
            if (isLogin||isErrorBankListEmpty ||  isEmployeeListEmpty || isClassListEmpty) {
                response.sendRedirect("../ErrorBankServlet");
            }
        %>
    </head>
    <body>
        <%@include file="../NavbarTrainer.jsp"%>
        <h1>Error Bank</h1>
        <!--show table-->
        <p>
            <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">
                Insert Data
            </a>
        </p>
        <table class="table table-striped" id="errorBankTable" cellspacing='30' align ='center' border="1">
            <thead class="active">
                <tr>
                    <th>No.</th>
                    <th>Description</th>
                    <th>Solution</th>
                    <th>Class</th>
                    <th>Submit Date</th>
                    <th>Submiter</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%                    
                    int i = 1;
                    String tempID = "";
                    String tempBatchClass = "";
                    if (!isErrorBankListEmpty) {
                        for (ErrorBank dataEB : (List<ErrorBank>) session.getAttribute("dataErrorBank")) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=dataEB.getDescription()%></td>
                    <td><%=dataEB.getSolution()%></td>
                    <td><%=dataEB.getClasses().getName()%></td>
                    <td><%=dateFormat.format(dataEB.getSubmitDate())%></td>
                    <td><%=dataEB.getEmployee().getName()%></td>
                    <td>


                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                                onclick="selectDropDown('<%=dataEB.getId()%>','<%=dataEB.getEmployee().getId()%>','<%=dataEB.getClasses().getId()%>',
                                            '<%=dateFormatChoose.format(dataEB.getSubmitDate())%>','<%=dataEB.getDescription()%>','<%=dataEB.getSolution()%>')" 
                                >Edit</button>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <!--end of show table-->
        <!--show save form modal-->
        <form action="../ErrorBankServlet" method="POST">
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
                            <!--select employee-->
                            <label data-error="wrong" data-success="true">Employee</label>
                            <select class="form-control" id="cbId" name="cbId">
                                <%
                                    if (!isEmployeeListEmpty) {
                                        for (Employee dataE2 : (List<Employee>) session.getAttribute("dataEmployee")) {
                                %>
                                <option value="<%=dataE2.getId()%>"><%=dataE2.getId() + " - " + dataE2.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <!--end of select employee-->
                            <label data-error="wrong" data-success="true">Class</label>
                            <!--select class-->
                            <label data-error="wrong" data-success="true">Employee</label>
                            <select class="form-control" id="cbClass" name="cbClass">
                                <%
                                    if (!isClassListEmpty) {
                                        for (Classes dataC2 : (List<Classes>) session.getAttribute("dataClass")) {
                                %>
                                <option value="<%=dataC2.getId()%>"><%=dataC2.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <!--end of select class-->
                            <label data-error="wrong" data-success="true">Submit Date</label>
                            <input type="date" class="form-control" id="inSubmitDate" name="inSubmitDate" value="<%=dateFormatChoose.format(new Date())%>">
                            <input type="hidden" id="hdId" name="hdId" value="">
                            <label data-error="wrong" data-success="true">Description</label>
                            <textarea class="form-control" id="inDescription" name="inDescription"></textarea>
                            <label data-error="wrong" data-success="true">Solution</label>
                            <textarea class="form-control" id="inSolution" name="inSolution"></textarea>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Save" name="save"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--end of show save form modal-->
        <script>
            $('#modalForm').on('show.bs.modal', function (event) {}
        </script>
        <script  type="text/javascript">
            function selectDropDown(id,empid,classes,inSubmitDate,inDescription,inSolution){
            document.getElementById('hdId').value = id
            document.getElementById('cbId').value = empid
            document.getElementById('cbClass').value = classes
            document.getElementById('inSubmitDate').value = inSubmitDate
            document.getElementById('inDescription').value = inDescription
            document.getElementById('inSolution').value = inSolution
            }
        </script>
    </body>
    <%@include file="newFooter.jsp" %>
</html>
