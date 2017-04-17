/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import Dao.NewHibernateUtil;
import Dao.Operaciones;
import Pojo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;

/**
 *
 * @author carlos
 */
public class controladorConfVoto extends HttpServlet {

    private SessionFactory SessionBuilder;

    @Override
    public void init() throws ServletException {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("votar");
        String voto = request.getParameter("partido");

        switch (action) {
            case "Votar":
                Operaciones objop = new Operaciones();
                boolean cond;
                HttpSession session = request.getSession(true);
                Votante objvotante = (Votante) session.getAttribute("votante");

                cond = objop.votar(SessionBuilder, objvotante, voto);

                if (cond) {
                    response.sendRedirect("Vista/vistaVotar.jsp");
                } else {
                    session.setAttribute("error", 7);
                    response.sendRedirect("Vista/vistaError.jsp");
                }
                break;
            case "Volver":
                response.sendRedirect("index.jsp");
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
