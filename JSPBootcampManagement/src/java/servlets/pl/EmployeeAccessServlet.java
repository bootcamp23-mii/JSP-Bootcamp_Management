/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.pl;

import controllers.AccessCardController;
import controllers.AccessCardControllerInterface;
import controllers.EmployeeAccessController;
import controllers.EmployeeAccessControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.AccessCard;
import models.Employee;
import models.EmployeeAccess;
import tools.HibernateUtil;

/**
 *
 * @author Firsta
 */
public class EmployeeAccessServlet extends HttpServlet {

    private EmployeeAccessControllerInterface eaci = new EmployeeAccessController(HibernateUtil.getSessionFactory());
    private List<EmployeeAccess> accesses = null;
    private EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
    private List<Employee> employee = null;
    private AccessCardControllerInterface acci = new AccessCardController(HibernateUtil.getSessionFactory());
    private List<AccessCard> accessCard = null;
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
            accesses = eaci.getAll();
            employee = eci.getAll();
            accessCard = acci.getAll();

            request.getSession().setAttribute("accesses", accesses);
            request.getSession().setAttribute("employee", employee);
            request.getSession().setAttribute("accessCard", accessCard);
            response.sendRedirect("pl/EmployeeAccessView1.jsp");

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
                eaci.delete(request.getParameter("id"), "0000-00-00", "0000-00-00", "", "", "");
            } else if (action.equalsIgnoreCase("update")) {
                EmployeeAccess ea = eaci.getById(request.getParameter("id"));
                request.getSession().setAttribute("emId", ea.getId());
                request.getSession().setAttribute("emReceive", ea.getReceiveDate());
                request.getSession().setAttribute("emReturn", ea.getReturnDate());
                request.getSession().setAttribute("emNote", ea.getNotes());
                request.getSession().setAttribute("emNumber", ea.getAccessCard().getId());
                request.getSession().setAttribute("emEmployee", ea.getEmployee().getId());
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
        if (eaci.save(request.getParameter("emId"), request.getParameter("emReceive"), request.getParameter("emReturn"),
                request.getParameter("emNote"), request.getParameter("emNumber"), request.getParameter("emEmployee")) != null) {
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
