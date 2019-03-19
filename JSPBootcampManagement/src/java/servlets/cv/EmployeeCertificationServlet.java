/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cv;

import controllers.CertificateController;
import controllers.CertificateControllerInterface;
import controllers.EmployeeCertificationController;
import controllers.EmployeeCertificationControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Certificate;
import models.Employee;
import models.EmployeeCertification;
import tools.HibernateUtil;

/**
 *
 * @author Lusiana
 */
public class EmployeeCertificationServlet extends HttpServlet {

    EmployeeCertificationControllerInterface ecc = new EmployeeCertificationController(HibernateUtil.getSessionFactory());
    List<EmployeeCertification> datacert = null;

    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
    List<Employee> dataemp = null;

    CertificateControllerInterface cc = new CertificateController(HibernateUtil.getSessionFactory());
    List<Certificate> datace = null;

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
            /* TODO output your page here. You may use following sample code. */
            if (request.getSession().getAttribute("login") != null) {
                String id = (String) request.getSession().getAttribute("login");
                datacert = ecc.searchWD(id);
                datace = cc.getAll();
                request.getSession().setAttribute("data", datacert);
                request.getSession().setAttribute("emp", id);
                request.getSession().setAttribute("datace", datace);
                response.sendRedirect("cv/EmployeeCertificationView.jsp");
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
                EmployeeCertification data = ecc.getByid(request.getParameter("id"));
                ecc.deleteSoft(data.getId(), data.getCertificatedate().toString(), data.getCertificatenumber(), data.getCertificate().getId(), data.getEmployee().getId());
            } else if (action.equalsIgnoreCase("update")) {
                EmployeeCertification employeeCertification = ecc.getByid(request.getParameter("id"));
                request.getSession().setAttribute("certId", employeeCertification.getId());
                request.getSession().setAttribute("certDate", employeeCertification.getCertificatedate());
                request.getSession().setAttribute("certNum", employeeCertification.getCertificatenumber());
                request.getSession().setAttribute("cert", employeeCertification.getCertificate().getId());
                request.getSession().setAttribute("emp", employeeCertification.getEmployee().getId());
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

        if (ecc.save(request.getParameter("certId"), request.getParameter("certDate"), request.getParameter("certNum"), request.getParameter("cert"), request.getParameter("emp")) != null) {
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
