/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.bm;

import controllers.BatchClassController;
import controllers.BatchClassControllerInterface;
import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BatchClass;
import models.Employee;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import org.apache.catalina.Session;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import tools.HibernateUtil;

/**
 *
 * @author FES
 */
@WebServlet(name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

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
            throws ServletException, IOException, JRException, SQLException {
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
            response.sendRedirect("bm/report.jsp");
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
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(ReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            String fileName = "./src/reports/score.jrxml";
            String filetoFill = "./src/reports/score.jasper";
            JasperCompileManager.compileReport(fileName);
            Map param = new HashMap();
            param.put("setId", request.getParameter("cbParticipant"));
            Connection conn = HibernateUtil.getSessionFactory().getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
            JasperFillManager.fillReport(filetoFill, param, conn);
            javax.swing.JOptionPane.showMessageDialog(null, conn);
            JasperPrint jp = JasperFillManager.fillReport(filetoFill, param, conn);
            JasperViewer.viewReport(jp, false);
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(ReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReportServlet.class.getName()).log(Level.SEVERE, null, ex);
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
