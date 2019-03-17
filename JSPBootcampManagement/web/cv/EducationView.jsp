<%-- 
    Document   : EducationView
    Created on : Mar 14, 2019, 11:11:57 AM
    Author     : Lusiana
--%>
<%@page import="models.Province"%>
<%@page import="models.District"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Education"%>
<%@page import="java.util.List"%>
<%@page import="controllers.EducationController"%>
<%@page import="controllers.EducationControllerInterface"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
    <script>
        $(document).ready(function () {
            $('#provinsi').change(function () {
                var provinsi_id = $(this).val();

                $.ajax({
                    type: 'POST',
                    url: '../EducationServlet',
                    data: 'prov_id' = '+provinsi_id',
                            success: function (response) {
                                $('#kota').html(response);

                            }
                })
            })
        })
    </script>


    <body bgcolor='#F0FFFF'> 

        <div class="container">

            <div class="form-group">
                <label>Education</label>
                <select class="form-control" name="provinsi" id="provinsi">
                    <% for (Province elem : (List<Province>) session.getAttribute("data")) {
                            out.print("<option "
                                    + "value=\"" + elem.getId() + "\" "
                                    + ">"
                                    + elem.getName() + "</option>");
                        }%>

                </select>

            </div>
            
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>
