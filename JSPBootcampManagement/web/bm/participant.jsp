<%-- 
    Document   : participant
    Created on : Mar 14, 2019, 11:55:07 AM
    Author     : FES
--%>

<%@page import="models.BatchClass"%>
<%@page import="models.Employee"%>
<%@page import="models.Participant"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../header.jsp" %>
        <script>
            $(document).ready(function () {
                $('#participantTable').DataTable();
            });
        </script>
        <%
            boolean isEmployeeListEmpty = session.getAttribute("dataEmployee") == null;
            boolean isBatchClassListEmpty = session.getAttribute("dataBatchClass") == null;
            boolean isParticipantListEmpty = session.getAttribute("dataParticipant") == null;
            if (isParticipantListEmpty || isBatchClassListEmpty || isEmployeeListEmpty) {
                response.sendRedirect("../ParticipantServlet");
            }

        %>
        <title>Participant</title>
    </head>
    <body>
        <h1>Participant</h1>
        <!--show table-->
        <p>
            <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">
                Insert Data
            </a>
        </p>
        <table class="table table-striped" id="participantTable" cellspacing='30' align ='center' border="1">
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
                <%                    int i = 1;
                    String tempID = "";
                    String tempBatchClass = "";
                    if (!isParticipantListEmpty) {
                        for (Participant dataP : (List<Participant>) session.getAttribute("dataParticipant")) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=dataP.getEmployee().getName()%></td>
                    <td><%=dataP.getBatchClass().getTrainer().getName()%></td>
                    <td><%=dataP.getBatchClass().getBatch().getName()%></td>
                    <td><%=dataP.getBatchClass().getClasses().getName()%></td>
                    <td><%=dataP.getBatchClass().getRoom().getName()%></td>
                    <td>
                        <%
                            if (!isEmployeeListEmpty) {
                                for (Employee dataE : (List<Employee>) session.getAttribute("dataEmployee")) {
                                    if (dataE.getId().equalsIgnoreCase(dataP.getId())) {
                                        tempID = dataP.getId();
                                    }
                                }
                            }
                            if (!isBatchClassListEmpty) {
                                for (BatchClass dataB : (List<BatchClass>) session.getAttribute("dataBatchClass")) {
                                    if (dataB.getId().equalsIgnoreCase(dataP.getBatchClass().getId())) {
                                        tempBatchClass = dataP.getBatchClass().getId();
                                    }
                                }
                            }
                        %>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                                onclick="selectDropDown('<%=tempID%>', '<%=tempBatchClass%>')"
                                >Edit</button>
                        <a class="btn btn-danger" href="../ParticipantServlet?action=delete&id=<%= dataP.getId()%>">Hapus</a>
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
        <form action="../ParticipantServlet" method="POST">
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
                                        for (Employee dataE2 : (List<Employee>) session.getAttribute("dataEmployee")) {
                                %>
                                <option value="<%=dataE2.getId()%>"><%out.print(dataE2.getId() + " - " + dataE2.getName());%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <label data-error="wrong" data-success="true">Batch Class</label>
                            <select class="form-control" id="cbBatchClass" name="cbBatchClass">
                                <%
                                    if (!isEmployeeListEmpty) {
                                        for (BatchClass dataB2 : (List<BatchClass>) session.getAttribute("dataBatchClass")) {
                                %>
                                <option value="<%=dataB2.getId()%>">
                                    <%out.print(dataB2.getBatch().getName() + " (" + dataB2.getClasses().getName() + ") "
                                                + dataB2.getTrainer().getName()
                                                + " - " + dataB2.getRoom().getName()
                                        );%></option>
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
        <!--end of show save form modal-->
        <script>
            $('#modalForm').on('show.bs.modal', function (event) {}
        </script>
        <script  type="text/javascript">
            function selectDropDown(id, batchClass)
            {
                document.getElementById('cbId').value = id
                document.getElementById('cbBatchClass').value = batchClass
            }
        </script>
    </body>
    <%@include file="../footer.jsp" %>
</html>
