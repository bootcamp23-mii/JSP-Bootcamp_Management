<%-- 
    Document   : evaluation
    Created on : Mar 16, 2019, 12:26:52 PM
    Author     : FES
--%>

<%@page import="models.Aspect"%>
<%@page import="models.Score"%>
<%@page import="models.Participant"%>
<%@page import="models.Batch"%>
<%@page import="models.Topic"%>
<%@page import="models.Lesson"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.Evaluation"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <script>
        $(document).ready(function () {
            $('#ScoreTable').DataTable();
            $('#EvaluationTable').DataTable();
        });
    </script>
    <%
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
        boolean isEvaluationListEmpty = session.getAttribute("dataEvaluation") == null;
        boolean isBatchListEmpty = session.getAttribute("dataBatch") == null;
        boolean isParticipantListEmpty = session.getAttribute("dataParticipant") == null;
        boolean isScoreListEmpty = session.getAttribute("dataScore") == null;
        boolean isLessonListEmpty = session.getAttribute("dataLesson") == null;
        boolean isAspectListEmpty = session.getAttribute("dataAspect") == null;
        boolean isTopicListEmpty = session.getAttribute("dataTopic") == null;
        if (isEvaluationListEmpty || isBatchListEmpty || isParticipantListEmpty || isScoreListEmpty || isLessonListEmpty || isAspectListEmpty || isTopicListEmpty) {
            response.sendRedirect("../EvaluationServlet");
        }
    %>
    <div class="col-md-12">
        <!-- RECENT PURCHASES -->
        <div class="panel">
            <div class="panel-body">
                <h1>Evaluation</h1>
                <!--show table evaluation-->
                <p>
                    <a class="btn btn-success" data-target="#modalForm" data-toggle="modal">
                        Insert Evaluation
                    </a>
                </p>
                <table class="table table-striped" id="EvaluationTable" cellspacing='30' align ='center' border="1">
                    <thead class="active">
                        <tr>
                            <th>No.</th>
                            <th>Participant</th>
                            <th>Date</th>
                            <th>Lesson</th>
                            <th>Topic</th>
                            <th>Daily Score</th>
                            <th>Note</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                    int i = 1;
                            if (!isEvaluationListEmpty) {
                                for (Evaluation data : (List<Evaluation>) session.getAttribute("dataEvaluation")) {
                        %>
                        <tr>
                            <td><%=i++%></td>
                            <td><%=data.getParticipant().getId() + " - " + data.getParticipant().getName()%></td>
                            <td><%=dateFormat.format(data.getEvaluationdate())%></td>
                            <td><%=data.getLesson().getClasses().getName() + " - " + data.getLesson().getName()%></td>
                            <td><%=data.getTopic().getName()%></td>
                            <td><%if (data.getIsDaily().intValue() == 0) {
                                    out.print("no");
                                } else {
                                    out.print("yes");
                                }%></td>
                            <td><%=data.getNote()%></td>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalForm" 
                                        onclick="selectDropDown('<%=data.getId()%>', '<%=data.getParticipant().getId()%>', '<%=dateFormatChoose.format(data.getEvaluationdate())%>'
                                                        , '<%=data.getLesson().getId()%>', '<%=data.getTopic().getId()%>', '<%=data.getIsDaily().intValue()%>', '<%=data.getNote()%>')"
                                        >Edit
                                </button>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalFormScore" 
                                        onclick="selectDropDownScore('<%=data.getId()%>')"
                                        >Score
                                </button>

                                <a class="btn btn-danger" href="../EvaluationServlet?action=deleteEva&id=<%= data.getId()%>">Hapus</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                <!--end of show table evaluation-->
                <!--show save evaluation form modal-->
                <form action="../EvaluationServlet" method="POST">
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
                                    <input type="hidden" id="formName" name="formName" value="evaluation">
                                    <!--input Emp-->
                                    <label data-error="wrong" data-success="true">Participant</label>
                                    <select class="form-control" id="cbIdEmployee" name="cbIdEmployee">
                                        <%
                                            if (!isParticipantListEmpty) {
                                                for (Participant data : (List<Participant>) session.getAttribute("dataParticipant")) {
                                        %>
                                        <option value="<%=data.getId()%>"><%=data.getId()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                    <!--end of input Emp-->
                                    <!--input Evaluation Date-->
                                    <label data-error="wrong" data-success="true">Evaluation Date</label>
                                    <input type="date" class="form-control" id="inEvaluationDate" name="inEvaluationDate" value="<%=dateFormatChoose.format(new Date())%>">
                                    <!--end of input Evaluation Date-->
                                    <!--select lesson-->
                                    <label data-error="wrong" data-success="true">Lesson</label>
                                    <select class="form-control" id="cbLesson" name="cbLesson">
                                        <%
                                            if (!isLessonListEmpty) {
                                                for (Lesson data : (List<Lesson>) session.getAttribute("dataLesson")) {
                                        %>
                                        <option value="<%=data.getId()%>"><%=data.getClasses().getName() + " - " + data.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                    <!--end of select lesson-->
                                    <!--select topic-->
                                    <label data-error="wrong" data-success="true">Topic</label>
                                    <select class="form-control" id="cbTopic" name="cbTopic">
                                        <%
                                            if (!isTopicListEmpty) {
                                                for (Topic data : (List<Topic>) session.getAttribute("dataTopic")) {
                                        %>
                                        <option value="<%=data.getId()%>"><%=data.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                    <!--end of select topic-->
                                    <!--select Is Daily-->
                                    <label data-error="wrong" data-success="true">Daily Score</label>
                                    <select class="form-control" id="cbIsDaily" name="cbIsDaily">
                                        <option value="0">no</option>
                                        <option value="1">yes</option>
                                    </select>
                                    <!--end of select Is Daily-->
                                    <!--select note-->
                                    <label data-error="wrong" data-success="true">Note</label>
                                    <textarea class="form-control" id="inNote" name="inNote"></textarea>
                                    <!--end of select note-->
                                    <input type="hidden" id="hdId" name="hdId">
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Save" name="save"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!--end of show save evaluation form modal-->

                <!--show score modal-->
                <form action="../EvaluationServlet" method="POST">
                    <div class="modal fade" id="modalFormScore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                        <input type="hidden" id="formName" name="formName" value="score">
                                        <input type="hidden" id="hdIdEva" name="hdIdEva">
                                        <!--select aspect-->
                                        <label data-error="wrong" data-success="true">Aspect</label>
                                        <select class="form-control" id="cbAspect" name="cbAspect">
                                            <%
                                                if (!isTopicListEmpty) {
                                                    for (Aspect data : (List<Aspect>) session.getAttribute("dataAspect")) {
                                            %>
                                            <option value="<%=data.getId()%>"><%=data.getName()%></option>
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
                                        <input type="hidden" id="hdIdScore" name="hdIdScore">
                                    </div>
                                    <p></p>
                                    <!--end of input score-->
                                    <!--show table score-->
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
                                            <%
                                                i = 1;
                                                if (!isEvaluationListEmpty) {
                                                    for (Score data : (List<Score>) session.getAttribute("dataScore")) {
                                            %>
                                            <tr>
                                                <td><%=i++%></td>
                                                <td><%=data.getAspect().getName()%></td>
                                                <td><%=data.getRating()%></td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" onclick="ScoreEdit('<%=data.getId()%>', '<%=data.getAspect().getId()%>', '<%=data.getRating()%>')"
                                                            >Select
                                                    </button>

                                                    <a class="btn btn-danger" href="../EvaluationServlet?action=deleteSc&id=<%= data.getId()%>">Hapus</a>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <!--end of show table score-->
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Save" name="save"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!--end of show score modal-->
            </div>
        </div>
    </div>
    <script>
        $('#modalForm').on('show.bs.modal', function (event) {}
    </script>
    <script>
        $('#modalFormScore').on('show.bs.modal', function (event) {}
    </script>
    <script  type="text/javascript">
        function selectDropDown(id, empID, evaDate, lesson, topic, isDaily, note)
        {
            document.getElementById('hdId').value = id
            document.getElementById('cbIdEmployee').value = empID;
            document.getElementById('inEvaluationDate').value = evaDate
            document.getElementById('cbLesson').value = lesson
            document.getElementById('cbTopic').value = topic
            document.getElementById('cbIsDaily').value = isDaily
            document.getElementById('inNote').value = note
        }
    </script>
    <script>
        function selectDropDownScore(id) {
            document.getElementById('hdIdEva').value = id
        }
    </script>
    <script>
        function ScoreEdit(id, aspect, rating, eva) {
            document.getElementById('hdIdScore').value = id
            document.getElementById('cbAspect').value = aspect
            document.getElementById('inRating').value = rating
        }
    </script>
    <script>
        var slider = document.getElementById("inRating");
        var output = document.getElementById("resultSlider");
        output.innerHTML = slider.value;

        slider.oninput = function () {
            output.innerHTML = this.value;
        }
    </script>
</html>
