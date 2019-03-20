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
import controllers.ParticipantController;
import controllers.ParticipantControllerInterface;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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
import models.Participant;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;
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
            List<BatchClass> batchclassList = cb.getAll();
            List<Employee> employeeList = new ArrayList<>();
            String tempId = (String) request.getSession().getAttribute("login");
//            javax.swing.JOptionPane.showMessageDialog(null, request.getServerName());

            for (BatchClass batchClass : batchclassList) {
                if (batchClass.getTrainer().getId().equals(tempId)) {
                    for (Participant participant : cp.searchWD("")) {
//                        javax.swing.JOptionPane.showMessageDialog(null, participant.getBatchClass().getId()+" "+batchClass.getId());
                        if (participant.getBatchClass().getId().equals(batchClass.getId())) {
                            for (Employee employee : ce.searchWD("")) {
                                if (employee.getId().equals(participant.getId())) {
                                    employeeList.add(employee);
                                }
                            }
                        }
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
        Connection conn = null;
        try {
            conn = HibernateUtil.getSessionFactory().getSessionFactoryOptions().getServiceRegistry().getService(ConnectionProvider.class).getConnection();
            //        if (request.getSession().getAttribute("dataParticipantReport")!=null) {
//            request.getSession().setAttribute("dataParticipantReport", cp.getByid(request.getParameter("cbParticipant")));
//        }
//            String fileName = "/src/java/reports/score.jrxml";
//            String filetoFill = "/src/java/reports/score.jasper";
            String fileName = request.getSession().getServletContext().getRealPath("/score.jrxml");
            String filetoFill = request.getSession().getServletContext().getRealPath("/score.jasper");
//            JasperCompileManager.compileReport(fileName);
            InputStream isfileName = new FileInputStream(new File(fileName));
//            InputStream isfiletoFill = new FileInputStream(new File(filetoFill));
//            JasperCompileManager.compileReport(isfileName);
            JasperReport jasperReport = JasperCompileManager.compileReport(isfileName);
            Map param = new HashMap();
            param.put("setId", "14303");
//            JasperFillManager.fillReport(filetoFill, param, conn);
//            JasperFillManager.fillReport(isfiletoFill, param, conn);
//            javax.swing.JOptionPane.showMessageDialog(null, conn);
//            JasperPrint jp = JasperFillManager.fillReport(filetoFill, param, conn);
            JasperPrint jp = JasperFillManager.fillReport(jasperReport, param, conn);
            JasperExportManager.exportReportToPdfStream(jp, response.getOutputStream());
            response.getOutputStream().flush();
            response.getOutputStream().close();
            
//            JasperViewer.viewReport(jp, false); 
            processRequest(request, response); 
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (conn!=null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReportServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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
