<%-- 
    Document   : Navbar
    Created on : Mar 20, 2019, 3:30:47 PM
    Author     : Lusiana
--%>

<%@page import="controllers.EmployeeControllerInterface"%>
<%@page import="controllers.EmployeeController"%>
<%@page import="models.Employee"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.Session"%>
<%@page import="controllers.SessionControllerInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="../assets/img/logos.png" alt="Bootcamp Management" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <form class="navbar-form navbar-left">
                <div class="input-group">
                    <input type="text" value="" class="form-control" placeholder="Search dashboard...">
                    <span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
                </div>
            </form>

            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Basic Use</a></li>
                            <li><a href="#">Working With Data</a></li>
                            <li><a href="#">Security</a></li>
                            <li><a href="#">Troubleshooting</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../assets/img/user.png" class="img-circle" alt="Avatar"> <span><% if (session.getAttribute("login") != null) {
                                String pro = (String) session.getAttribute("login");
                                EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
                                Employee e = ec.getByid(pro);
                                out.print(e.getName());
                            }%></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
                            <li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
                            <li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
                            <li><a href="../LogoutServlet" ><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
                        </ul>
                    </li>
                    <!-- <li>
                            <a class="update-pro" href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
                    </li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="home.jsp" class=""><i class="lnr lnr-dice"></i> <span>Home</span></a></li>
                    <% if (session.getAttribute("login") != null) {
                            SessionControllerInterface sesi = new Session();
                            String id = (String) session.getAttribute("login");

                            if (sesi.trainer(id)) {%> 
                    <li>
                        <a href="#subPages2" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Kelola CV</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages2" class="collapse ">
                            <ul class="nav">
                                <ul class="nav">
                                    <li><a href="../EducationHistoryServlet" class=""><i class="lnr lnr-home"></i> <span>Education History</span></a></li>
                                    <li><a href="../OrganizationServlet" class=""><i class="lnr lnr-code"></i> <span>Organization</span></a></li>
                                    <li><a href="../AchievementServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Achievement</span></a></li>
                                    <li><a href="../EmployeeCertificationServlet" class=""><i class="lnr lnr-cog"></i> <span>Certification</span></a></li>
                                    <li><a href="../EmployeeLanguageServlet" class=""><i class="lnr lnr-home"></i> <span>Language</span></a></li>
                                    <li><a href="../EmployeeRoleServlet" class=""><i class="lnr lnr-code"></i> <span>Role</span></a></li>
                                    <li><a href="../EmployeeSkillServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Skill</span></a></li>
                                    <li><a href="../WorkExperienceServlet" class=""><i class="lnr lnr-cog"></i> <span>Work Experience</span></a></li>
                                </ul>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPages3" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Bootcamp</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages3" class="collapse ">
                            <ul class="nav">
                                <ul class="nav">
                                    <li><a href="../BatchClassServlet" class=""><i class="lnr lnr-home"></i> <span>Batch Class</span></a></li>
                                    <li><a href="../ErrorBankServlet" class=""><i class="lnr lnr-code"></i> <span>Error Bank</span></a></li>
                                    <li><a href="../EvaluationServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Evaluation</span></a></li>
                                    <li><a href="../ParticipationServlet" class=""><i class="lnr lnr-cog"></i> <span>Participant</span></a></li>
                                    <li><a href="../ReportServlet" class=""><i class="lnr lnr-cog"></i> <span>Report</span></a></li>
                                </ul>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#subPages4" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Equipment</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages4" class="collapse ">
                            <ul class="nav">
                                <ul class="nav">
                                    <li><a href="../EmployeeAccessServlet" class=""><i class="lnr lnr-home"></i> <span>Access Card</span></a></li>
                                    <li><a href="../EmployeeLockerServlet" class=""><i class="lnr lnr-code"></i> <span>Locker</span></a></li>
                                    <li><a href="../IdCardServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Id Card</span></a></li>
                                </ul>
                            </ul>
                        </div>
                    </li><li><a href="../PlacementServlet" class=""><i class="lnr lnr-dice"></i> <span>Placement</span></a></li>
                    <%} else if (sesi.admin(id)) {%>
                    <li>
                        <a href="#subPages7" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Kelola CV</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages7" class="collapse ">
                            <ul class="nav">
                                <ul class="nav">
                                    <li><a href="../EducationHistoryServlet" class=""><i class="lnr lnr-home"></i> <span>Education History</span></a></li>
                                    <li><a href="../OrganizationServlet" class=""><i class="lnr lnr-code"></i> <span>Organization</span></a></li>
                                    <li><a href="../AchievementServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Achievement</span></a></li>
                                    <li><a href="../EmployeeCertificationServlet" class=""><i class="lnr lnr-cog"></i> <span>Certification</span></a></li>
                                    <li><a href="../EmployeeLanguageServlet" class=""><i class="lnr lnr-home"></i> <span>Language</span></a></li>
                                    <li><a href="../EmployeeRoleServlet" class=""><i class="lnr lnr-code"></i> <span>Role</span></a></li>
                                    <li><a href="../EmployeeSkillServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Skill</span></a></li>
                                    <li><a href="../WorkExperienceServlet" class=""><i class="lnr lnr-cog"></i> <span>Work Experience</span></a></li>
                                </ul>
                            </ul>
                        </div>
                    </li>
                    <li><a href="../RegistrationServlet" class=""><i class="lnr lnr-dice"></i> <span>Registration</span></a></li>
                    <%} else if (sesi.user(id)) {%> 
                    <li>
                        <a href="#subPages5" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Kelola CV</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                        <div id="subPages5" class="collapse ">
                            <ul class="nav">
                                <ul class="nav">
                                    <li><a href="../EducationHistoryServlet" class=""><i class="lnr lnr-home"></i> <span>Education History</span></a></li>
                                    <li><a href="../OrganizationServlet" class=""><i class="lnr lnr-code"></i> <span>Organization</span></a></li>
                                    <li><a href="../AchievementServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Achievement</span></a></li>
                                    <li><a href="../EmployeeCertificationServlet" class=""><i class="lnr lnr-cog"></i> <span>Certification</span></a></li>
                                    <li><a href="../EmployeeLanguageServlet" class=""><i class="lnr lnr-home"></i> <span>Language</span></a></li>
                                    <li><a href="../EmployeeRoleServlet" class=""><i class="lnr lnr-code"></i> <span>Role</span></a></li>
                                    <li><a href="../EmployeeSkillServlet" class=""><i class="lnr lnr-chart-bars"></i> <span>Skill</span></a></li>
                                    <li><a href="../WorkExperienceServlet" class=""><i class="lnr lnr-cog"></i> <span>Work Experience</span></a></li>
                                </ul>
                            </ul>
                        </div>
                    </li>
                    <%}}%>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->

</html>


