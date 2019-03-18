<%-- 
    Document   : IdCardView
    Created on : Mar 18, 2019, 8:22:00 AM
    Author     : Firsta
--%>

<%@page import="models.IdCard"%>
<%@page import="models.IdCard"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <script>
            $(document).ready(function () {
                $('#tableid').DataTable();
            });
        </script>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">

                        <div class="modal fade" id="modalid" tabindex="-1" role="dialog" 
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <form action="../IdCardServlet" method="POST">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h3 class="modal-title">Id Card</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label>ID</label>
                                                <input class="form-control" type="text" id="id-r" name="idcardId" value="<%= (session.getAttribute("idcardId") != null) ? session.getAttribute("idcardId") : ""%>"/>
                                            </div>
                                            <div class="form-group">
                                                <label>RECEIVE DATE</label>
                                                <input type="date" class="form-control" id="receivedate-r" name="idcardReceive" value="<%= (session.getAttribute("idcardReceive") != null) ? dateFormatChoose.format(session.getAttribute("idcardReceive")) : dateFormatChoose.format(new Date())%>">
                                            </div>
                                            <div class="form-group">
                                                <label>RETURN DATE</label>
                                                <input type="date" class="form-control" id="returndate-r" name="idcardReturn" value="<%= (session.getAttribute("idcardReturn") != null) ? dateFormatChoose.format(session.getAttribute("idcardReturn")) : dateFormatChoose.format(new Date())%>">
                                            </div>
                                            <div class="form-group">
                                                <label>NOTE</label>
                                                <input class="form-control" type="text" id="note-r" name="idcardNote" value="<%= (session.getAttribute("idcardNote") != null) ? session.getAttribute("idcardNote") : ""%>"/>
                                            </div>
                                            <div class="form-group">
                                                <label>EMPLOYEE</label>
                                                <select class="form-control" id="employee-r" name="idcardEmployee">
                                                    <% for (Employee elem : (List<Employee>) session.getAttribute("employees")) {
                                                            out.print("<option "
                                                                    + "value=\"" + elem.getId() + "\" "
                                                                    + (elem.getId().equals(session.getAttribute("idcardEmployee")) ? "selected" : "") + ">"
                                                                    + elem.getName() + "</option>");
                                                        }%>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" value="Save" name="save" class="btn btn-success">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- END MULTI CHARTS -->

                        <div class="col-md-12">
                            <!-- RECENT PURCHASES -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Id Card</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>

                                <div class="panel-body">
                                    <a class="btn btn-success" data-target="#modalid" data-toggle="modal">Input Id Card</a>
                                </div>

                                <div class="panel-body">
                                    <table class="table table-hover" id="tableid" tcellspacing='30' align='center'>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Id</th>
                                                <th>Receive Date</th>
                                                <th>Return Date</th>
                                                <th>Note</th>
                                                <th>Employee</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int j = 1;
                                                for (IdCard elem : (List<IdCard>) session.getAttribute(
                                                        "idcard")) {%>
                                            <tr>
                                                <td><%= j++%></td>
                                                <td><%= elem.getId()%></td>
                                                <td><%= dateFormat.format(elem.getReceiveDate())%></td>
                                                <td><%= dateFormat.format(elem.getReturnDate())%></td>
                                                <td><%= elem.getNote()%></td>
                                                <td><%= elem.getEmployee().getName()%></td>
                                                <td>
                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modaledu" 
                                                            data-getid="<%= elem.getId()%>" data-getreceive="<%= dateFormat.format(elem.getReceiveDate())%>" 
                                                            data-getreturn="<%= dateFormat.format(elem.getReturnDate())%>" data-getnote="<%= elem.getNote()%>" 
                                                            data-getemployee="<%= elem.getEmployee().getId()%>" ><span class="glyphicon glyphicon-pencil"></span></a></button>

                                                    <button type="button" class="btn btn-danger"><a href="../IdCardServlet?action=delete&id=<%= elem.getId()%>"><span class="glyphicon glyphicon-remove"></span></a></button>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div>
                                    </div>
                                </div>       
                            </div>
                            <!-- END RECENT PURCHASES -->         
                        </div>
                    </div>
                                        
                    <script>
                        $('#modaledu').on('show.bs.modal', function (event) {
                            var button = $(event.relatedTarget) // Button that triggered the modal
                            var id = button.data('getid') // Extract info from data-* attributes
                            var receivedate = button.data('getreceive')
                            var returndate = button.data('getreturn')
                            var note = button.data('getnote')
                            var employeeid = button.data('getemployee')// Extract info from data-* attributes
                            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                            var modal = $(this)
                            modal.find('#id-r').val(id)
                            modal.find('#receivedate-r').val(receivedate)
                            modal.find('#returndate-r').val(returndate)
                            modal.find('#note-r').val(note)
                            modal.find('#employee-r').val(employeeid)
                        })
                    </script>
                    
                    <!-- END MAIN -->
                    <% session.removeAttribute(
                                "idcardId"); %>
                    <% session.removeAttribute(
                                "idcardReceive");%>
                    <% session.removeAttribute(
                                "idcardReturn");%>
                    <% session.removeAttribute(
                                "idcardNote");%>
                    <% session.removeAttribute(
                                "idcardEmployee");%>
                </div>
            </div>
        </div>
    </body>
</html>
