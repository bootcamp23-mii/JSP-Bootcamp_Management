/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.bm;

import controllers.ClassesController;
import controllers.ClassesControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.ErrorBankController;
import controllers.ErrorBankControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.ErrorBank;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "ErrorBankServlet", urlPatterns = {"/ErrorBankServlet"})
public class ErrorBankServlet extends HttpServlet {

    private ErrorBankControllerInterface c = new ErrorBankController(HibernateUtil.getSessionFactory());
    private EmployeeControllerInterface ce = new EmployeeController(HibernateUtil.getSessionFactory());
    private ClassesControllerInterface cc = new ClassesController(HibernateUtil.getSessionFactory());

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
            request.getSession().setAttribute("dataErrorBank", c.getAll());
            request.getSession().setAttribute("dataEmployee", ce.searchWD(""));
            request.getSession().setAttribute("dataClass", cc.getAll());
            response.sendRedirect("bm/errorbank.jsp");
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
                ErrorBank data = c.getByid(request.getParameter("id"));
                c.delete(data.getId(), data.getSubmitDate(), data.getDescription(), data.getSolution(), data.getClasses(), data.getEmployee());
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
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {

            String tempID = "";
            if (request.getParameter("hdId")!=null)tempID=request.getParameter("hdId");
            if (c.save(tempID, dateFormat.parse(request.getParameter("inSubmitDate")), request.getParameter("inDescription"), 
                    request.getParameter("inSolution"), request.getParameter("cbClass"), request.getParameter("cbId"))) {
                processRequest(request, response);
            }
        } catch (ParseException ex) {
            Logger.getLogger(ErrorBankServlet.class.getName()).log(Level.SEVERE, null, ex);
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
