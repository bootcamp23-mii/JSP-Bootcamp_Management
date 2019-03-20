/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.ActivationController;
import controllers.ActivationControllerInterface;
import controllers.DistrictController;
import controllers.DistrictControllerInterface;
import controllers.EmployeeAccessController;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.ReligionController;
import controllers.ReligionControllerInterface;
import controllers.VillageController;
import controllers.VillageControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.District;
import models.Employee;
import models.Religion;
import models.Village;
import tools.BCrypt;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {

    EmployeeControllerInterface emp = new EmployeeController(HibernateUtil.getSessionFactory());
    List<Employee> dataemp = null;
    
    DistrictControllerInterface dc = new DistrictController(HibernateUtil.getSessionFactory());
    List<District> datadist = null;
    
    VillageControllerInterface vc = new VillageController(HibernateUtil.getSessionFactory());
    List<Village> datavil = null;
    
    ReligionControllerInterface rc = new ReligionController(HibernateUtil.getSessionFactory());
    List<Religion> datareligion = null;

    ActivationControllerInterface ac = new ActivationController(HibernateUtil.getSessionFactory());

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            datadist = dc.getAll();
            datavil = vc.getAll();
            datareligion = rc.getAll();
            request.getSession().setAttribute("dataemp", dataemp);
            request.getSession().setAttribute("datadist", datadist);
            request.getSession().setAttribute("datavil", datavil);
            request.getSession().setAttribute("datareligion", datareligion);
            response.sendRedirect("Registration.jsp");
            BCrypt.hashpw("abc", BCrypt.gensalt());

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (emp.insert("", request.getParameter("empName"), request.getParameter("birthdate"), request.getParameter("gender"), request.getParameter("marriedstatus"), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone"), request.getParameter("onBoard"), BCrypt.hashpw(request.getParameter("phone"), BCrypt.gensalt()), "your phone number", request.getParameter("phone"), request.getParameter("hiringloc"), request.getParameter("birthplace"), request.getParameter("religion"), request.getParameter("village"))!= null) {
            Employee newEmployee = emp.searchWD(request.getParameter("gender")).get(0);
            ac.requestActivation(newEmployee.getId());
            processRequest(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
