<%-- 
    Document   : participant
    Created on : Mar 14, 2019, 11:55:07 AM
    Author     : FES
--%>

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
            if (isParticipantListEmpty) {
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
                <%
                    int i = 1;
                    if (!isParticipantListEmpty) {
                        for (Participant data : (List<Participant>) session.getAttribute("dataParticipant")) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=data.getEmployee().getName()%></td>
                    <td><%=data.getBatchClass().getTrainer().getName()%></td>
                    <td><%=data.getBatchClass().getBatch().getName()%></td>
                    <td><%=data.getBatchClass().getClasses().getName()%></td>
                    <td><%=data.getBatchClass().getRoom().getName()%></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalRegion" 
                                data-getid="<%= data.getId()%>" data-getname="<%= data.getBatchClass()%>">Edit</button>
                        <a class="btn btn-danger" href="ParticipantServlet?action=delete&<%= data.getId()%>">Hapus</a>
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
        <form action="ParticipantServlet" method="POST">
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
                            <label data-error="wrong" data-success="true">ID</label>
                            <input type="text" name="regionId" class="form-control" value="<%if (session.getAttribute("regionId") != null) {
                                    out.print(session.getAttribute("participantName"));
                                }%>">
                            
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Save" name="save"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--end of show save form modal-->
<%String aaaa="";%>
    </body>
     <script>
        $('#modalRegion').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var id = button.data('getid')
            var name = button.data('getname')
            var modal = $(this.)
            modal.find('#id-r').(id)
            modal.find('#name-r').val(name)
        }
                
            )
    </script>
    <%@include file="../footer.jsp" %>
</html>
