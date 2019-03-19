/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cv;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.OrganizationController;
import controllers.OrganizationControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.Organization;
import org.hibernate.Hibernate;
import tools.HibernateUtil;

/**
 *
 * @author Lusiana
 */
public class OrganizationServlet extends HttpServlet {

    OrganizationControllerInterface oc = new OrganizationController(HibernateUtil.getSessionFactory());
    List<Organization> dataorg = null;
    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());

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
            if (request.getSession().getAttribute("login") != null) {
                String id = (String) request.getSession().getAttribute("login");
                dataorg = oc.searchWD(id);
                request.getSession().setAttribute("data", dataorg);
                request.getSession().setAttribute("emp", "14201");
                response.sendRedirect("cv/OrganizationView.jsp");
            } else if (request.getSession().getAttribute("login") == null) {
                response.sendRedirect("index.jsp");
            }
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
                Organization data = oc.getByid(request.getParameter("id"));
                oc.deleteSoft(data.getId(), data.getName(), data.getEmployee().getId());
            } else if (action.equalsIgnoreCase("update")) {
                Organization organization = oc.getByid(request.getParameter("id"));
                request.getSession().setAttribute("orgId", organization.getId());
                request.getSession().setAttribute("orgName", organization.getName());
                request.getSession().setAttribute("emp", organization.getEmployee().getId());
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
        if (oc.save(request.getParameter("orgId"), request.getParameter("orgName"), request.getParameter("emp")) != null) {
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
