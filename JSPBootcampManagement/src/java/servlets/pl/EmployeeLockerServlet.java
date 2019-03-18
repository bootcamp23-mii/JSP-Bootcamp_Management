/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.pl;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.EmployeeLockerController;
import controllers.EmployeeLockerControllerInterface;
import controllers.LockerController;
import controllers.LockerControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.EmployeeLocker;
import models.Locker;
import tools.HibernateUtil;

/**
 *
 * @author Firsta
 */
public class EmployeeLockerServlet extends HttpServlet {

    private EmployeeLockerControllerInterface elci = new EmployeeLockerController(HibernateUtil.getSessionFactory());
    private List<EmployeeLocker> locker = null;
    private EmployeeControllerInterface eci = new EmployeeController(HibernateUtil.getSessionFactory());
    private List<Employee> employee = null;
    private LockerControllerInterface lci = new LockerController(HibernateUtil.getSessionFactory());
    private List<Locker> lockers = null;
//    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
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
            locker = elci.getAll();
            employee = eci.getAll();
            lockers = lci.getAll();

            request.getSession().setAttribute("locker", locker);
            request.getSession().setAttribute("employee", employee);
            request.getSession().setAttribute("lockers", lockers);
            response.sendRedirect("pl/EmployeeLockerView1.jsp");
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
                elci.delete(request.getParameter("id"), "0000-00-00", "0000-00-00", "", "", "");
            } else if (action.equalsIgnoreCase("update")) {
                EmployeeLocker el = elci.getById(request.getParameter("id"));
                request.getSession().setAttribute("empId", el.getId());
                request.getSession().setAttribute("empReceive", el.getReceiveDate());
                request.getSession().setAttribute("empReturn", el.getReturnDate());
                request.getSession().setAttribute("empNote", el.getNotes());
                request.getSession().setAttribute("empLocker", el.getLocker().getId());
                request.getSession().setAttribute("empEmployee", el.getEmployee().getId());
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
        if(elci.save(request.getParameter("empId"), request.getParameter("empReceive"), request.getParameter("empReturn"), request.getParameter("empNote"), 
                request.getParameter("empEmployee"), request.getParameter("empLocker")) !=null) {
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
