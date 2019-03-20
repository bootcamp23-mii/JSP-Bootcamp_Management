/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.bm;

import controllers.AspectController;
import controllers.AspectControllerInterface;
import controllers.ScoreController;
import controllers.ScoreControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import models.Score;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "ScoreServlet", urlPatterns = {"/ScoreServlet"})
public class ScoreServlet extends HttpServlet {

    private ScoreControllerInterface c = new ScoreController(HibernateUtil.getSessionFactory());
    private AspectControllerInterface ca = new AspectController(HibernateUtil.getSessionFactory());
    private static String tempIdEva;
    
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
            request.getSession().setAttribute("dataScore", c.searchWD(tempIdEva));
            request.getSession().setAttribute("dataAspectList", ca.getAll());
            response.sendRedirect("bm/score.jsp");
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
        if (action.equalsIgnoreCase("select")) {
            tempIdEva = request.getParameter("idEva");
        } else if (action.equalsIgnoreCase("delete")) {
            Score data = c.getByid(request.getParameter("id"));
//                javax.swing.JOptionPane.showMessageDialog(null, request.getParameter("id"));
                c.deleteSoft(data.getId(), data.getRating(), data.getAspect().getId(), data.getEvaluation().getId());
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
        String tempId = "";
        List<Score> tempScore = (List<Score>) request.getSession().getAttribute("dataScore");
        for (Score data : tempScore) {
            if (data.getAspect().getId().equals(request.getParameter("cbAspect"))&&data.getEvaluation().getId().equalsIgnoreCase(tempIdEva)) {
                tempId = data.getId();
            }
        }
//        JOptionPane.showMessageDialog(null, tempId+tempIdEva);
        c.save(tempId, request.getParameter("inRating"), request.getParameter("cbAspect"), tempIdEva);
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
