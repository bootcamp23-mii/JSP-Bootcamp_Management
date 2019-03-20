<%-- 
    Document   : Navbar
    Created on : Mar 19, 2019, 9:18:16 AM
    Author     : Lusiana
--%>

<%@page import="java.util.List"%>
<%@page import="models.BatchClass"%>
<%@page import="controllers.BatchClassController"%>
<%@page import="controllers.BatchClassControllerInterface"%>
<%@page import="controllers.EmployeeControllerInterface"%>
<%@page import="controllers.EmployeeController"%>
<%@page import="models.Employee"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="tools.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <div id="wrapper">
        <!-- NAVBAR -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="brand">
                <a href="index.html"><img src="assets/img/logos.png" alt="Bootcamp Management" class="img-responsive logo"></a>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/user.png" class="img-circle" alt="Avatar"> <span><% if (session.getAttribute("login") != null) {
                                    String pro = (String) session.getAttribute("login");
                                    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
                                    Employee e = ec.getByid(pro);
                                    out.print(e.getName());
                                }%></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
                                <li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
                                <li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
                                <li><a href="LogoutServlet" ><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
                                <li>
                                    <a href="#" id="bbb">
                                        <i class="fas fa-user-plus"></i>Education History</a>
                                </li>
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
                        <li><a href="#" id="nav-dash" class=""><i class="lnr lnr-alarm"></i> <span>Dashboard</span></a></li>
                        <li>
                            <a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>CV</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                            <div id="subPages" class="collapse ">
                                <ul class="nav">
                                    <li><a href="#" id="nav-edu-his"  class=""><i class="lnr lnr-home"></i> <span>Education History</span></a></li>
                                    <li><a href="#" id="nav-org" class=""><i class="lnr lnr-code"></i> <span>Organization</span></a></li>
                                    <li><a href="#" id="nav-ach" class=""><i class="lnr lnr-chart-bars"></i> <span>Achievement</span></a></li>
                                    <li><a href="#" id="nav-cert" class=""><i class="lnr lnr-cog"></i> <span>Certification</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <a href="#subPages2" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Bootcamp</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                            <div id="subPages2" class="collapse ">
                                <ul class="nav">
                                    <li><a href="#" id="nav-batch"  class=""><i class="lnr lnr-home"></i> <span>Batch Class</span></a></li>
                                    <li><a href="#" id="nav-err" class=""><i class="lnr lnr-code"></i> <span>Error Bank</span></a></li>
                                    <li><a href="#" id="nav-eval" class=""><i class="lnr lnr-chart-bars"></i> <span>Evaluation</span></a></li>
                                    <li><a href="#" id="nav-part" class=""><i class="lnr lnr-cog"></i> <span>Participant</span></a></li>
                                    <li><a href="#" id="nav-report" class=""><i class="lnr lnr-cog"></i> <span>Report</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <a href="#subPages3" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Equipment</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                            <div id="subPages3" class="collapse ">
                                <ul class="nav">
                                    <li><a href="#" id="nav-access"  class=""><i class="lnr lnr-home"></i> <span>Access Card</span></a></li>
                                    <li><a href="#" id="nav-lock" class=""><i class="lnr lnr-code"></i> <span>Locker</span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#" id="nav-place" class=""><i class="lnr lnr-alarm"></i> <span>Placement</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>

        <!-- END LEFT SIDEBAR -->

</html>
