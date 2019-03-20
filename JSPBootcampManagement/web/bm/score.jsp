<%-- 
    Document   : score
    Created on : Mar 20, 2019, 2:29:33 PM
    Author     : FES
--%>

<%@page import="models.Aspect"%>
<%@page import="java.util.List"%>
<%@page import="models.Score"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="newHeader.jsp"%>
<%@include file="newFooter.jsp" %>
<html>
    <head>
        <script>
            $(document).ready(function () {
            $('#ScoreTable').DataTable();
            });
        </script>
        <%            boolean isScoreEmpty = session.getAttribute("dataScore") == null;
            boolean isAspectListEmpty = session.getAttribute("dataAspectList") == null;
            if (isScoreEmpty || isAspectListEmpty) {
                response.sendRedirect("../ScoreServlet");
            }
        %>
    </head>
    <body>
        <%@include file="../NavbarAdmin.jsp"%>
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="panel">
                            <div class="panel-body">
                                <h1>Score</h1>
                                <!--show table score-->
                                <p>
                                    <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">
                                        Insert Score
                                    </a>
                                </p>
                                <table class="table table-striped" id="EvaluationTable" cellspacing='30' align ='center' border="1">
                                    <thead class="active">
                                        <tr>
                                            <th>No.</th>
                                            <th>Aspect</th>
                                            <th>Rating</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                    int i = 1;
                                            if (!isScoreEmpty) {
                                                for (Score data : (List<Score>) session.getAttribute("dataScore")) {
                                        %>
                                        <tr>
                                            <td><%=i++%></td>
                                            <td><%=data.getAspect().getName()%></td>
                                            <td><%=data.getRating()%></td>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" onclick="ScoreEdit('<%=data.getId()%>', '<%=data.getAspect().getId()%>', '<%=data.getRating()%>')"
                                                        >Select
                                                </button>
                                                <a class="btn btn-danger" href="../ScoreServlet?action=delete&id=<%= data.getId()%>">Hapus</a>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <!--end of show table score-->
                                <!--show save score form modal-->
                                <form action="../ScoreServlet" method="POST">
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
                                                    <!--input score-->
                                                    <div>
                                                        <!--select aspect-->
                                                        <label data-error="wrong" data-success="true">Aspect</label>
                                                        <select class="form-control" id="cbAspect" name="cbAspect">
                                                            <%
                                                                if (!isAspectListEmpty) {
                                                                    for (Aspect dataA : (List<Aspect>) session.getAttribute("dataAspectList")) {
                                                            %>
                                                            <option value="<%=dataA.getId()%>"><%=dataA.getName()%></option>
                                                            <%
                                                                    }
                                                                }
                                                            %>
                                                        </select>
                                                        <!--end of select aspect-->
                                                        <!--select rating-->
                                                        <label data-error="wrong" data-success="true">Rating</label>
                                                        <input type="range" min="0" max="100" value="0" class="form-control" id="inRating" name="inRating">
                                                        <p>Value: <span id="resultSlider"></span></p>
                                                        <!--end of select rating-->
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="submit" class="btn btn-success" value="Save" name="save"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!--end of show save score form modal-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script>
        $('#modalForm').on('show.bs.modal', function (event) {}
    </script>
    <script>
        function ScoreEdit(id, aspect, rating, eva) {
        document.getElementById('cbAspect').value = aspect
                document.getElementById('inRating').value = rating
                var output = document.getElementById("resultSlider")
                output.innerHTML = rating
        }
    </script>
    <script>
        var slider = document.getElementById("inRating")
                var output = document.getElementById("resultSlider")
                output.innerHTML = slider.value

                slider.oninput = function () {
                output.innerHTML = this.value
                }
    </script>
</html>
