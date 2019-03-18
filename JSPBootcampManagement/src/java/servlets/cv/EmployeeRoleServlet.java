/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cv;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.EmployeeRoleController;
import controllers.EmployeeRoleControllerInterface;
import controllers.RoleController;
import controllers.RoleControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.EmployeeRole;
import models.Role;
import tools.HibernateUtil;

/**
 *
 * @author gerydanu
 */
@WebServlet(name = "EmployeeRoleServlet", urlPatterns = {"/EmployeeRoleServlet"})
public class EmployeeRoleServlet extends HttpServlet {
    
    EmployeeRoleControllerInterface erc = new EmployeeRoleController(HibernateUtil.getSessionFactory());
    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
    RoleControllerInterface rc = new RoleController(HibernateUtil.getSessionFactory());
    List<EmployeeRole> emproledata = null;
    List<Employee> employeedata = null;
    List<Role> roledata = null;
    

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
            request.getSession().setAttribute("empRoleData", erc.getAll());
            request.getSession().setAttribute("employeeData", ec.searchWD(""));
            request.getSession().setAttribute("roleData", rc.getAll());
            response.sendRedirect("cv/EmployeeRoleView.jsp");
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
