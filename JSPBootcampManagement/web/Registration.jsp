<%-- 
    Document   : Registration
    Created on : Mar 20, 2019, 9:55:59 AM
    Author     : Lusiana
--%>

<%@page import="models.Religion"%>
<%@page import="models.Village"%>
<%@page import="java.util.List"%>
<%@page import="models.District"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="newHeader.jsp" %>
    </head>
    <script>
        $(document).ready(function () {
            $('#tablecert').DataTable();
        });
    </script>
    <%@include file="Navbar.jsp" %>
    <body>
        <%
            SimpleDateFormat dateFormatChoose = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <!-- MAIN -->
        <div class="main">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12">
                            <!-- MULTI CHARTS -->
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Registration</h3>
                                    <div class="right">
                                        <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                        <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form action="RegistrationServlet" method="POST">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" name="empId" value="<%= (session.getAttribute("certId") != null) ? session.getAttribute("certId") : ""%>"/>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control" id="name-e" name="empName" value=""/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Birth Date</label>
                                                    <input type="date" class="form-control" id="birth-e" name="birthdate" value="<%= (session.getAttribute("birthdate") != null) ? dateFormatChoose.format(session.getAttribute("birthdate")) : dateFormatChoose.format(new Date())%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Gender</label>
                                                    <select class="form-control" name="gender">
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Religion</label>
                                                    <select class="form-control" name="religion">
                                                        <% for (Religion elem : (List<Religion>) session.getAttribute("datareligion")) {
                                                                out.print("<option "
                                                                        + "value=\"" + elem.getId() + "\">"
                                                                        + elem.getName() + "</option>");
                                                            }%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select class="form-control" name="marriedstatus">
                                                        <option value="Single">Single</option>
                                                        <option value="Married">Married</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="textarea" class="form-control" name="address"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" class="form-control" name="email"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Phone</label>
                                                    <input type="text" class="form-control" name="phone"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>On Board Date</label>
                                                    <input type="date" class="form-control" id="onboard-e" name="onBoard" value="<%= (session.getAttribute("onBoard") != null) ? dateFormatChoose.format(session.getAttribute("onBoard")) : dateFormatChoose.format(new Date())%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Birth Place</label>
                                                    <select class="form-control" name="birthplace">
                                                        <% for (District elem : (List<District>) session.getAttribute("datadist")) {
                                                                out.print("<option "
                                                                        + "value=\"" + elem.getId() + "\">"
                                                                        + elem.getName() + "</option>");
                                                            }%>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Hiring Location</label>
                                                    <select class="form-control" name="hiringloc">
                                                        <% for (District elem : (List<District>) session.getAttribute("datadist")) {
                                                                out.print("<option "
                                                                        + "value=\"" + elem.getId() + "\">"
                                                                        + elem.getName() + "</option>");
                                                            }%>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Village</label>
                                                    <select class="form-control" name="village">
                                                        <% for (Village elem : (List<Village>) session.getAttribute("datavil")) {
                                                                out.print("<option "
                                                                        + "value=\"" + elem.getId() + "\">"
                                                                        + elem.getName() + "</option>");
                                                            }%>

                                                    </select>
                                                </div>
                                                <input type="hidden" class="form-control" hidden="true" name="emp" value="<%= (session.getAttribute("emp") != null) ? session.getAttribute("emp") : ""%>"/>

                                                <button type="submit" value="Save" name="save" class="btn btn-info">Save</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END MULTI CHARTS -->
                        </div>

                    </div>
                </div>
            </div>

            <%@include file="newFooter.jsp" %>
        </div>


        <!-- END MAIN -->
        <% session.removeAttribute(
                    "certId"); %>
        <% session.removeAttribute(
                    "certDate");%>
        <% session.removeAttribute(
                    "certNum");%>
        <% session.removeAttribute(
                    "cert");%>
</html>
