/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.bm;

import controllers.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import models.BatchClass;
import models.Employee;
import models.Participant;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "ParticipantServlet", urlPatterns = {"/ParticipantServlet"})
public class ParticipantServlet extends HttpServlet {

    private ParticipantControllerInterface c = new ParticipantController(HibernateUtil.getSessionFactory());
    private BatchClassControllerInterface cb = new BatchClassController(HibernateUtil.getSessionFactory());
    private EmployeeControllerInterface ce = new EmployeeController(HibernateUtil.getSessionFactory());

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
            List<BatchClass> batchclassList = cb.getAll();
            List<Employee> employeeList = ce.getAll();
            for (int i = 0; i < employeeList.size(); i++) {
                for (BatchClass data : batchclassList) {
                    if (employeeList.get(i).getId().equals(data.getTrainer().getId())) {
                        employeeList.remove(i);
                    }
                }
            }
            request.getSession().setAttribute("dataEmployee", employeeList);
            request.getSession().setAttribute("dataBatchClass", batchclassList);
            request.getSession().setAttribute("dataParticipant", c.searchWD(""));
            response.sendRedirect("bm/participant.jsp");
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
                Participant data = c.getByid(request.getParameter("id"));
                c.delete(data.getId(), data.getGrade(), data.getBatchClass().getId(), data.getEmployee().getId());
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
        if (c.save(request.getParameter("cbId"), "", request.getParameter("cbBatchClass"), request.getParameter("cbId"))) {
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
