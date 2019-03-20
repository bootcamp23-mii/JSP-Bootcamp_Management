<%-- 
    Document   : trypdf
    Created on : Mar 19, 2019, 7:59:56 PM
    Author     : FES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
    </head>
    <body>
        <div id="loadContent" class="center-block">
            <h1 class="title">Hello World!</h1>
            <h1>Hello World!</h1>
            <h1>Hello World!</h1>
            <h1>Hello World!</h1>
            <%=session.getAttribute("login")%>
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
