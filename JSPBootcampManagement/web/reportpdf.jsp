<%-- 
    Document   : trypdf
    Created on : Mar 19, 2019, 7:59:56 PM
    Author     : FES
--%>

<%@page import="models.Score"%>
<%@page import="java.util.List"%>
<%@page import="models.Evaluation"%>
<%@page import="models.Participant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Report</title>
        <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
    </head>
    <body>
        <div id="loadContent">
            <h1 style="text-align: center">Report</h1>
            <br>
            <table border="0">
                <%
                    boolean isSelectParticipantEmpty = session.getAttribute("dataParticipantReport") == null;
                    if (!isSelectParticipantEmpty) {
                        Participant participant = (Participant) session.getAttribute("dataParticipantReport");
//                        javax.swing.JOptionPane.showMessageDialog(null, participant);
%>
                <tbody>
                    <tr>
                        <th>NIK</th>
                        <td><%=participant.getId()%></td>
                    </tr>
                    <tr>
                        <th>Nama</th>
                        <td><%=participant.getEmployee().getName()%></td>
                    </tr>
                    <tr>
                        <th>Batch</th>
                        <td><%=participant.getBatchClass().getBatch().getName()%></td>
                    </tr>
                    <tr>
                        <th>Trainer</th>
                        <td><%=participant.getBatchClass().getTrainer().getName()%></td>
                    </tr>
                    <tr>
                        <th>Grade</th>
                        <td><%=participant.getGrade()%></td>
                    </tr>
                    <%} else {
                            response.sendRedirect("../ReportServlet");
                        }%>
                </tbody>
            </table>
            <br>
            <%
                boolean isEvaluationEmpty = session.getAttribute("dataEvaluation") == null;
                if (!isEvaluationEmpty) {
                    List<Evaluation> evaluationList = (List<Evaluation>) session.getAttribute("dataEvaluation");
                    for (Evaluation dataEvaluation : evaluationList) {
                        out.print("<div>" + dataEvaluation.getTopic().getName());
                        for (Evaluation dataLesson : evaluationList) {
                            if (dataLesson.getTopic().getId().equals(dataEvaluation.getTopic().getName())) {
                                out.print(dataLesson.getLesson().getName());
                                for (Score dataScore : dataLesson.getScoreList()) {
                                    if (dataScore.getEvaluation().getId().equals(dataLesson.getId())) {
                                        out.print(dataScore.getAspect().getName()+": "+dataScore.getRating());
                                    }
                                }
                            }
                        }
                        out.print("<div>");
                    }
                } else {
                    response.sendRedirect("../ReportServlet");
                }%>
        </div>
        <button id="btGenerate">Generate PDF</button>
    </body>
        <script>
            var doc = new jsPDF();
            var specialElementHandlers = {
                '#editor': function (element, renderer) {
                    return true;
                }
            };
    
            $('#btGenerate').click(function () {
                doc.fromHTML($('#loadContent').html(), 15, 15, {
                    'width': 170,
                    'elementHandlers': specialElementHandlers
                });
                doc.save('sample-file.pdf');
            });
        </script>
</html>
