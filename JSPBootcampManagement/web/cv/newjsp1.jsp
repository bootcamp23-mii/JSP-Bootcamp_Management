<%-- 
    Document   : newjsp1
    Created on : Mar 17, 2019, 12:14:36 PM
    Author     : Lusiana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<html>
<head>
<title>bbb</title>
</head>
<body>

<h1>bbb</h1>

<%
   Date dNow = new Date( );
   SimpleDateFormat ft = 
   new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
   out.print(dNow);
   out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
%>

</body>
</html>