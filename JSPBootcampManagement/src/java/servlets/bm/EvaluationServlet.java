/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.bm;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import controllers.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "EvaluationServlet", urlPatterns = {"/EvaluationServlet"})
public class EvaluationServlet extends HttpServlet {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private EvaluationControllerInterface cEva = new EvaluationController(factory);
    private ScoreControllerInterface cSc = new ScoreController(factory);
    private ParticipantControllerInterface cp = new ParticipantController(factory);
    private BatchClassControllerInterface cb = new BatchClassController(factory);
    private RoomControllerInterface cr = new RoomController(factory);
    private LessonControllerInterface cl = new LessonController(factory);
    private AspectControllerInterface ca = new AspectController(factory);
    private TopicControllerInterface ct = new TopicController(factory);
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private static String tempTrainer;

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
            
            tempTrainer = String.valueOf(request.getSession().getAttribute("login"));
            List<Participant> listParticipant = cp.searchWD("");
//            for (int i = 0; i < listParticipant.size(); i++) {
//                if (!listParticipant.get(i).getBatchClass().getTrainer().getId().equals(tempTrainer)) {
//                    listParticipant.remove(i);
//                }
//            }
            request.getSession().setAttribute("dataParticipant", listParticipant);
            request.getSession().setAttribute("dataEvaluation", cEva.searchWD(""));
            request.getSession().setAttribute("dataScore", cSc.searchWD(""));
            request.getSession().setAttribute("dataLesson", cl.getAll());
            request.getSession().setAttribute("dataTopic", ct.getAll());
            request.getSession().setAttribute("dataAspect", ca.getAll());
            request.getSession().setAttribute("dataBatch", cb.getAll());
            response.sendRedirect("bm/evaluation.jsp");
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
            if (action.equalsIgnoreCase("deleteEva")) {
                Evaluation data = cEva.getByid(request.getParameter("id"));
                cEva.deleteSoft(data.getId(), data.getIsDaily(), data.getEvaluationdate(), data.getNote(), data.getParticipant().getId(), data.getLesson().getId(), data.getTopic().getId());
            }
            if (action.equalsIgnoreCase("deleteSc")) {
                Score data = cSc.getByid(request.getParameter("id"));
//                javax.swing.JOptionPane.showMessageDialog(null, request.getParameter("id"));
                cSc.deleteSoft(data.getId(), data.getRating(), data.getAspect().getId(), data.getEvaluation().getId());
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

        String formName = request.getParameter("formName");
        try {
            if (formName.equalsIgnoreCase("evaluation")) {
                String tempId = "";
                if (request.getParameter("hdId") != null) {
                    tempId = request.getParameter("hdId");
                }
                cEva.save(tempId, request.getParameter("cbIsDaily"), dateFormat.parse(request.getParameter("inEvaluationDate")),
                        request.getParameter("inNote"), request.getParameter("cbIdEmployee"), request.getParameter("cbLesson"), request.getParameter("cbTopic"));

            } else if (formName.equalsIgnoreCase("score")) {
                String tempId = "";
                if (request.getParameter("hdIdScore") != null) {
                    tempId = request.getParameter("hdIdScore");
                }
                cSc.save(tempId, request.getParameter("inRating"), request.getParameter("cbAspect"), request.getParameter("hdIdEva"));
            }
        } catch (ParseException ex) {
            Logger.getLogger(EvaluationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
