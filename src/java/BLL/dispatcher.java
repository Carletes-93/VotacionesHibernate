/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import Dao.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;

/**
 *
 * @author carlos
 */

public class dispatcher extends HttpServlet {

    private SessionFactory Conex;
    
    @Override
    public void init() throws ServletException {
        Conex = NewHibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ServletContext servletcont = getServletContext();
        RequestDispatcher requestdisp;
        
        switch(request.getParameter("action")){
            case "Alta":
                requestdisp = servletcont.getRequestDispatcher("/controladorAlta");
                requestdisp.forward(request, response);
                break;
            case "Baja":
                requestdisp = servletcont.getRequestDispatcher("/controladorBaja");
                requestdisp.forward(request, response);
                break;
            case "Votar":
                requestdisp = servletcont.getRequestDispatcher("/controladorVotar");
                requestdisp.forward(request, response);
                break;
            case "Censo":
                requestdisp = servletcont.getRequestDispatcher("/controladorCenso");
                requestdisp.forward(request, response);
                break;
            case "Resultados":
                requestdisp = servletcont.getRequestDispatcher("/controladorResultados");
                requestdisp.forward(request, response);
                break;
                case "CambiarPass":
                requestdisp = servletcont.getRequestDispatcher("/controladorCambiarPass");
                requestdisp.forward(request, response);
                break;
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
