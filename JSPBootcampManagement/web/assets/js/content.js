/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function () {
    $("#bbb").on("click", function () {
        $("#loadthis").load("Admin.jsp");
    });
    $("#nav-org").on("click", function () {
        $("#loadthis").load("OrganizationServlet");
    });
    $("#nav-ach").on("click", function () {
        $("#loadthis").load("AchievementServlet");
    });
    $("#nav-cert").on("click", function () {
        $("#loadthis").load("EmployeeCertificationServlet");
    });
    $("#nav-batch").on("click", function () {
        $("#loadthis").load("BatchClassServlet");
    });
    $("#nav-err").on("click", function () {
        $("#loadthis").load("ErrorBankServlet");
    });
    $("#nav-eval").on("click", function () {
        $("#loadthis").load("EvaluationServlet");
    });
    $("#nav-part").on("click", function () {
        $("#loadthis").load("ParticipantServlet");
    });
    $("#nav-report").on("click", function () {
        $("#loadthis").load("ReportServlet");
    });
    $("#nav-access").on("click", function () {
        $("#loadthis").load("EmployeeAccessServlet");
    });
    $("#nav-lock").on("click", function () {
        $("#loadthis").load("EmployeeLockerServlet");
    });
    $("#nav-place").on("click", function () {
        $("#loadthis").load("PlacementServlet");
    });
});

