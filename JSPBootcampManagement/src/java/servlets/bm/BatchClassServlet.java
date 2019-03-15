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
import tools.HibernateUtil;
import models.*;

/**
 *
 * @author FES
 */
@WebServlet(name = "BatchClassServlet", urlPatterns = {"/BatchClassServlet"})
public class BatchClassServlet extends HttpServlet {

    private BatchClassControllerInterface c = new BatchClassController(HibernateUtil.getSessionFactory());
    private EmployeeControllerInterface ce = new EmployeeController(HibernateUtil.getSessionFactory());
    private BatchControllerInterface cb = new BatchController(HibernateUtil.getSessionFactory());
    private ClassesControllerInterface cc = new ClassesController(HibernateUtil.getSessionFactory());
    private RoomControllerInterface cr = new RoomController(HibernateUtil.getSessionFactory());
    private ParticipantControllerInterface cp = new ParticipantController(HibernateUtil.getSessionFactory());

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
            List<Employee> empList = ce.searchWD("");
            List<Participant> pList = cp.searchWD("");
            for (Participant data : pList) {
                for (int i = 0; i < empList.size(); i++) {
                    if (empList.get(i).getId().equals(data.getId())) {
                        empList.remove(i);
                    }
                }
            }
            request.getSession().setAttribute("dataBatchClass", c.searchWD(""));
            request.getSession().setAttribute("dataEmployee", empList);
            request.getSession().setAttribute("dataBatch", cb.search(""));
            request.getSession().setAttribute("dataClass", cc.search(""));
            request.getSession().setAttribute("dataRoom", cr.search(""));
            response.sendRedirect("bm/batchclass.jsp");
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
                BatchClass data = c.getByid(request.getParameter("id"));
                
                c.deleteSoft(data.getId(), data.getBatch().getId(), data.getClasses().getId(), data.getTrainer().getId(), data.getRoom().getId());
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
        
        if (c.save(request.getParameter("hdId"), request.getParameter("cbBatch"), request.getParameter("cbClass"), 
                request.getParameter("cbTrainer"), request.getParameter("cbRoom"))) {
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
