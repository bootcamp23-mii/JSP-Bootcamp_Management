/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cv;

import controllers.EducationController;
import controllers.EducationControllerInterface;
import controllers.EducationHistoryController;
import controllers.EducationHistoryControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Education;
import models.EducationHistory;
import models.Employee;
import tools.HibernateUtil;

/**
 *
 * @author Lusiana
 */
public class EducationHistoryServlet extends HttpServlet {

    EducationHistoryControllerInterface ehc = new EducationHistoryController(HibernateUtil.getSessionFactory());
    List<EducationHistory> data = null;
    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
    List<Employee> dataemp = null;
    EducationControllerInterface edc = new EducationController(HibernateUtil.getSessionFactory());
    List<Education> dataedu = null;

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
            /* TODO output your page here. You may use following sample code. */
            data = ec.getByid("14201").getEducationHistoryList();
            dataedu = edc.getAll();
            request.getSession().setAttribute("data", data);
            request.getSession().setAttribute("emp", "14201");
            request.getSession().setAttribute("dataedu", dataedu);
            response.sendRedirect("cv/EducationHistoryView.jsp");
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
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equalsIgnoreCase("delete")) {
                ehc.delete(request.getParameter("id"), "", "", "");
            } else if (action.equalsIgnoreCase("update")) {
                EducationHistory educationHistory = ehc.getByid(request.getParameter("id"));
                request.getSession().setAttribute("eduId", educationHistory.getId());
                request.getSession().setAttribute("eduGpa", educationHistory.getGpa());
                request.getSession().setAttribute("edu", educationHistory.getEducation().getId());
                request.getSession().setAttribute("emp", educationHistory.getEmployee().getId());
            }
        }
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
        if (ehc.save(request.getParameter("eduId"), request.getParameter("eduGpa"), request.getParameter("edu"), request.getParameter("emp")) != null) {
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
