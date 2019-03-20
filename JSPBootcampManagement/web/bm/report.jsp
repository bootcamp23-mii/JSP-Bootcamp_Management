<%-- 
    Document   : report
    Created on : Mar 18, 2019, 6:44:46 AM
    Author     : FES
--%>

<%@page import="java.util.List"%>
<%@page import="models.Employee"%>
<%@page import="models.Participant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
        <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
        <title>Report</title>
        <%            boolean isParticipantListEmpty = session.getAttribute("dataEmployee") == null;
//            boolean isSelectParticipantEmpty = request.getAttribute("dataParticipantReport") == null;
//            boolean isGetEvaluationEmpty = request.getAttribute("idParticipantReport") == null;
//            boolean isGetScoreEmpty = request.getAttribute("idParticipantReport") == null;
            if (isParticipantListEmpty //|| isSelectParticipantEmpty //                    || isGetEvaluationEmpty 
                    //                    || isGetScoreEmpty
                    ) {
                response.sendRedirect("../ReportServlet");
            }
        %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../NavbarTrainer.jsp"%>
            <div class="main">
                <div class="container">
                    <div class="container-fluid">
                        <div id="login-row" class="row justify-content-center align-items-center">
                            <div id="login-column" class="col-md-3">
                            </div>
                            <div id="login-column" class="col-md-6">
                                <div id="login-box" class="col-md-12">
                                    <form id="login-form" class="form" action="../ReportServlet" method="post">
                                        <h3 class="text-center text-info">Generate Report</h3>
                                        <label data-error="wrong" data-success="true">Employee</label>
                                        <select class="form-control" id="cbParticipant" name="cbParticipant">
                                            asdasdasd
                                            asdasdas
                                            dasdasd
                                            asdasdas
                                            d
                                            <%
                                                if (!isParticipantListEmpty) {
                                                    for (Employee dataE2 : (List<Employee>) session.getAttribute("dataEmployee")) {
                                            %>
                                            <option value="<%=dataE2.getId()%>"><%out.print(dataE2.getId() + " - " + dataE2.getName());%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                        <br>
                                        <div class="form-group">
                                            <input type="submit" name="submit" class="btn btn-info btn-md" value="Select">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="login-column" class="col-md-3">
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <div class="col-md-12 content-center">
                            <button id="btGenerate" class="btn btn-md" >Generate PDF</button>
                        </div>
                        <br>
                        <div class="col-md-10" style="border: solid">
                            <div class="loadContent">
                                <div class="col-md-2">
                                </div>
                                <%
                                    //                                        if (!isSelectParticipantEmpty) {
                                    //                                            Participant participant = (Participant) request.getAttribute("dataParticipantReport");
                                %>
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-7">
                                </div>
                                <%//}%>
                                <div class="col-md-2">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
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
    </body>
</html>
<%@include file="newFooter.jsp" %>
