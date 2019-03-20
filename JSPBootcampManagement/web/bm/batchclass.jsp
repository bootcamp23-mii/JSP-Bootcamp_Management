<%-- 
    Document   : batchclass
    Created on : Mar 15, 2019, 10:40:26 PM
    Author     : FES
--%>

<%@page import="models.Room"%>
<%@page import="models.Classes"%>
<%@page import="models.Batch"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="models.BatchClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <script>
            $(document).ready(function () {
                $('#batchClassTable').DataTable();
            });
        </script>
        <%
            boolean isTrainerListEmpty = session.getAttribute("dataEmployee") == null;
            boolean isBatchClassListEmpty = session.getAttribute("dataBatchClass") == null;
            boolean isBatchListEmpty = session.getAttribute("dataBatch") == null;
            boolean isClassListEmpty = session.getAttribute("dataClass") == null;
            boolean isRoomListEmpty = session.getAttribute("dataRoom") == null;
            if (isTrainerListEmpty || isBatchClassListEmpty || isBatchListEmpty || isClassListEmpty || isRoomListEmpty) {
                response.sendRedirect("../BatchClassServlet");
            }

        %>
        <div class="panel">
            <div class="panel-body">
        <p>
            <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">
                Insert Data
            </a>
        </p>
        <table class="table table-striped" id="batchClassTable" cellspacing='30' align ='center' border="1">
            <thead class="active">
                <tr>
                    <th>No.</th>
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
                    if (!isBatchClassListEmpty) {
                        for (BatchClass dataBC : (List<BatchClass>) session.getAttribute("dataBatchClass")) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=dataBC.getTrainer().getName()%></td>
                    <td><%=dataBC.getBatch().getName()%></td>
                    <td><%=dataBC.getClasses().getName()%></td>
                    <td><%=dataBC.getRoom().getName()%></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                                onclick="selectDropDown('<%=dataBC.getId()%>', '<%=dataBC.getTrainer().getId()%>',
                                            '<%=dataBC.getBatch().getId()%>', '<%=dataBC.getClasses().getId()%>', 
                                            '<%=dataBC.getRoom().getId()%>')"
                                >Edit</button>
                        <a class="btn btn-danger" href="../BatchClassServlet?action=delete&id=<%= dataBC.getId()%>">Hapus</a>
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
        <form action="../BatchClassServlet" method="POST">
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
                            <input type="hidden" id="hdId" name="hdId" value="">
                            <label data-error="wrong" data-success="true">Trainer</label>
                            <select class="form-control" id="cbTrainer" name="cbTrainer">
                                <%
                                    if (!isTrainerListEmpty) {
                                        for (Employee dataT : (List<Employee>) session.getAttribute("dataEmployee")) {
                                %>
                                <option value="<%=dataT.getId()%>"><%=dataT.getId() + " - " + dataT.getName()%></option>
                                    <%
                                            }
                                        }
                                    %>
                            </select>
                            <label data-error="wrong" data-success="true">Batch</label>
                            <select class="form-control" id="cbBatch" name="cbBatch">
                                <%
                                    if (!isBatchListEmpty) {
                                        for (Batch dataB : (List<Batch>) session.getAttribute("dataBatch")) {
                                %>
                                <option value="<%=dataB.getId()%>"><%=dataB.getName()%></option>
                                    <%
                                            }
                                        }
                                    %>
                            </select>
                            <label data-error="wrong" data-success="true">Class</label>
                            <select class="form-control" id="cbClass" name="cbClass">
                                <%
                                    if (!isClassListEmpty) {
                                        for (Classes dataC : (List<Classes>) session.getAttribute("dataClass")) {
                                %>
                                <option value="<%=dataC.getId()%>"><%=dataC.getName()%></option>
                                    <%
                                            }
                                        }
                                    %>
                            </select>
                            <label data-error="wrong" data-success="true">Room</label>
                            <select class="form-control" id="cbRoom" name="cbRoom">
                                <%
                                    if (!isRoomListEmpty) {
                                        for (Room dataR : (List<Room>) session.getAttribute("dataRoom")) {
                                %>
                                <option value="<%=dataR.getId()%>"><%=dataR.getName()%></option>
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
            </div>
        </div>
        <!--end of show save form modal-->
        <script>
            $('#modalForm').on('show.bs.modal', function (event) {}
        </script>
        <script  type="text/javascript">
            function selectDropDown(id, trainer, batch, classes, room)
            {
                document.getElementById('hdId').value = id
                document.getElementById('cbTrainer').value = trainer
                document.getElementById('cbBatch').value = batch
                document.getElementById('cbClass').value = classes
                document.getElementById('cbRoom').value = room
            }
        </script>
</html>
