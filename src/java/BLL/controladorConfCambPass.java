/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import Dao.MD5;
import Dao.NewHibernateUtil;
import Dao.Operaciones;
import Pojo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
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
public class controladorConfCambPass extends HttpServlet {

    private SessionFactory SessionBuilder;

    @Override
    public void init() throws ServletException {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String pass = request.getParameter("PASSN");
        String passconf = request.getParameter("PASSNC");

        if (pass.equals(passconf)) {
            HttpSession session = request.getSession(true);
            Votante objvotante = (Votante) session.getAttribute("votante");
            
            MD5 passcrypt = new MD5();
            pass = passcrypt.getMD5(pass);
            objvotante.setPass(pass);

            Votante votante_cambiar = (Votante) objvotante;

            Operaciones objop = new Operaciones();

            Boolean cond;

            cond = objop.cambiarPassVotante(SessionBuilder, votante_cambiar);

            if (cond) {
                response.sendRedirect("Vista/cambioPassCorrecto.jsp");
            } else {
                session.setAttribute("error", 10);
                response.sendRedirect("Vista/vistaError.jsp");
            }
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("error", 10);
            response.sendRedirect("Vista/vistaError.jsp");
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
