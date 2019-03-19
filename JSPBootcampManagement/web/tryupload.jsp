<%-- 
    Document   : tryupload
    Created on : Mar 18, 2019, 3:44:37 PM
    Author     : FES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Try upload</h1>
        <form action="UploadServlet" method="POST" >
            <input type="hidden" id="empID" name="empID" value="14303">
            <input type="hidden" id="ss" name="ss" value="C:\Users\Kirizu\Documents\NetBeansProjects\Project 3\backup">
            <input type="file" id="inFile" name="inFile" webkitRelativePath >
            <label for="inFile">Upload file</label>
            <input type="submit" value="go">
        </form>
        <script type="text/javascript">
            
        </script>
    </body>
</html> 
