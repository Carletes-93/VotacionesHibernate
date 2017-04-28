/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import Dao.NewHibernateUtil;
import Dao.Operaciones;
import Pojo.Candidato;
import Pojo.Partido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class controladorResultados extends HttpServlet {

    private SessionFactory SessionBuilder;

    @Override
    public void init() throws ServletException {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int totalVotos = 0;
        int totalVotantes = 0;
        Operaciones objop = new Operaciones();
        ArrayList<Partido> aPartidosFin = new ArrayList();
        ArrayList<Candidato> aCandidatosFin = new ArrayList();
        HttpSession session = request.getSession(true);

        aPartidosFin = objop.cogerPartidosOrden(SessionBuilder);
        totalVotos = objop.cogerTotalVotos(SessionBuilder);
        totalVotantes = objop.cogerTotalVotantes(SessionBuilder);
        aCandidatosFin = objop.cogerCandidatos(SessionBuilder, aPartidosFin);

        
        session.setAttribute("resultado_partidos", aPartidosFin);
        session.setAttribute("total_votos", totalVotos);
        session.setAttribute("total_votantes", totalVotantes);
        
        response.sendRedirect("Vista/vistaResultados.jsp");
        
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
