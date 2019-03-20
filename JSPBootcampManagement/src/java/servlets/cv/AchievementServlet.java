/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.cv;

import controllers.AchievementController;
import controllers.AchievementControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.Session;
import controllers.SessionControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Achievement;
import tools.HibernateUtil;

/**
 *
 * @author Lusiana
 */

public class AchievementServlet extends HttpServlet {

    AchievementControllerInterface ac = new AchievementController(HibernateUtil.getSessionFactory());
    List<Achievement> dataach = null;
    EmployeeControllerInterface ec = new EmployeeController(HibernateUtil.getSessionFactory());
    SessionControllerInterface sess = new Session();

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
                if (sess.admin(id)) {
                    dataach = ac.searchWD(id);
                    request.getSession().setAttribute("data", dataach);
                    request.getSession().setAttribute("emp", id);
                    response.sendRedirect("cv/AchievementView.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
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
                Achievement data = ac.getByid(request.getParameter("id"));
                ac.deleteSoft(data.getId(), data.getName(), data.getEmployee().getId());
            } else if (action.equalsIgnoreCase("update")) {
                Achievement achievement = ac.getByid(request.getParameter("id"));
                request.getSession().setAttribute("achId", achievement.getId());
                request.getSession().setAttribute("achName", achievement.getName());
                request.getSession().setAttribute("emp", achievement.getEmployee().getId());
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
        if (ac.save(request.getParameter("achId"), request.getParameter("achName"), request.getParameter("emp")) != null) {
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
