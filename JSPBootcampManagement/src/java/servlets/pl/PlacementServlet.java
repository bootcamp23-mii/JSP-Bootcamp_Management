/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.pl;

import controllers.CompanyController;
import controllers.CompanyControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.PlacementController;
import controllers.PlacementControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Company;
import models.Employee;
import models.Placement;
import tools.HibernateUtil;

/**
 *
 * @author Firsta
 */
public class PlacementServlet extends HttpServlet {

    PlacementControllerInterface pci = new PlacementController(HibernateUtil.getSessionFactory());
    List<Placement> placement = null;
    CompanyControllerInterface cci = new CompanyController(HibernateUtil.getSessionFactory());
    List<Company> company = null;
    EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
    List<Employee> employee = null;

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
            placement = pci.getAll();
            company = cci.getAll();
            employee = eci.getAll();

            request.getSession().setAttribute("placement", placement);
            request.getSession().setAttribute("company", company);
            request.getSession().setAttribute("employee", employee);
            response.sendRedirect("pl/PlacementView1.jsp");
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
            if (action.equalsIgnoreCase("update")) {
                Placement p = pci.getById(request.getParameter("id"));
                request.getSession().setAttribute("plaId", p.getId());
                request.getSession().setAttribute("plaDescription", p.getDescription());
                request.getSession().setAttribute("plaAddress", p.getAddress());
                request.getSession().setAttribute("plaDepartment", p.getDepartment());
                request.getSession().setAttribute("plaStart", p.getStartDate());
                request.getSession().setAttribute("plaFinish", p.getFinishDate());
                request.getSession().setAttribute("plaCompany", p.getCompany().getId());
                request.getSession().setAttribute("plaEmployee", p.getEmployee().getId());
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
        if (pci.save(request.getParameter("plaId"), request.getParameter("plaDescription"),
                request.getParameter("plaAddress"), request.getParameter("plaDepartment"),
                request.getParameter("plaStart"), request.getParameter("plaFinish"), request.getParameter("plaCompany"), request.getParameter("plaEmployee")) != null) {
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
