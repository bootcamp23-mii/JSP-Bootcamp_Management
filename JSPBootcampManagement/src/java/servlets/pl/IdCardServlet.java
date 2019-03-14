/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.pl;

import controllers.BatchClassController;
import controllers.BatchClassControllerInterface;
import controllers.EmployeeAccessController;
import controllers.EmployeeAccessControllerInterface;
import controllers.IdCardController;
import controllers.IdCardControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BatchClass;
import models.Employee;
import models.IdCard;
import tools.HibernateUtil;

/**
 *
 * @author Firsta
 */
public class IdCardServlet extends HttpServlet {
    
    IdCardControllerInterface icci = new IdCardController(HibernateUtil.getSessionFactory());
    EmployeeAccessControllerInterface eaci = new EmployeeAccessController(HibernateUtil.getSessionFactory());
    BatchClassControllerInterface bcci = new BatchClassController(HibernateUtil.getSessionFactory());
    
    List<IdCard> data = null;
    List<Employee> employees = null;
    List<BatchClass> classes = null;
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
            String action = request.getParameter("action");
            if(action != null){
                if(action.equalsIgnoreCase("delete")){
                    icci.delete(request.getParameter("id"), "", "", "", "");
                } else if (action.equalsIgnoreCase("update")){
                    IdCard idCard = icci.getByid(request.getParameter("id"));
                    request.getSession().setAttribute("idcardId", idCard.getId());
//                    request.getSession().setAttribute("idcardReveive", idCard.getReceiveDate());
//                    request.getSession().setAttribute("idcardReturn", idCard.getReturnDate());
//                    request.getSession().setAttribute("idcardNote", idCard.getNote());
//                    request.getSession().setAttribute("idcardEmployee", idCard.getEmployee().getId());
                }
            }
            processRequest(request, response);
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
