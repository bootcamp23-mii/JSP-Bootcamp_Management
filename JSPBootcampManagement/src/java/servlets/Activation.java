/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.ActivationController;
import controllers.ActivationControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "Activation", urlPatterns = {"/Activation"})
public class Activation extends HttpServlet {
    ActivationControllerInterface c = new ActivationController(HibernateUtil.getSessionFactory());
    EmployeeControllerInterface ce = new EmployeeController(HibernateUtil.getSessionFactory());
    private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
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
            response.sendRedirect("/JSPBootcampManagement");
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
        if (c.completeActivation(request.getParameter("id"), request.getParameter("code"))) {
            Employee emp = ce.getByid(request.getParameter("id"));
            ce.save(emp.getId(), emp.getName(), emp.getBirthDate(), emp.getGender(), emp.getMarriedStatus(), emp.getAddress(), emp.getEmail(), emp.getPhone(), emp.getOnboardDate(), emp.getPassword(), emp.getSecurityQestion(), emp.getSecurityAnswer(), emp.getHiringLocation().getId(), emp.getBirthPlace().getId(), emp.getReligion().getId(), emp.getVillage().getId());
            javax.swing.JOptionPane.showMessageDialog(null, "Congratulation. Your account has actived.");
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
        processRequest(request, response);
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
