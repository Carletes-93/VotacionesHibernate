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
public class controladorCambiarPass extends HttpServlet {

    private SessionFactory SessionBuilder;

    @Override
    public void init() throws ServletException {
        SessionBuilder = NewHibernateUtil.getSessionFactory();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        MD5 passcrypt = new MD5();
        String pass;
        pass = passcrypt.getMD5(request.getParameter("PASS"));
        
        Operaciones objop = new Operaciones();
        Votante objvotante = new Votante(request.getParameter("NIF"), pass);
        Votante votante_cambpass = new Votante();

        votante_cambpass = objop.comprobarVotante(SessionBuilder, objvotante);
        
        String cond;

        if (votante_cambpass != null) {
            cond = "Existe";
        } else {
            cond = "No existe";
        }

        if (cond.equals("Existe")) {
            HttpSession session = request.getSession(true);
            session.setAttribute("votante", votante_cambpass);
            response.sendRedirect("Vista/cambPass.jsp");
        }
        if ("No existe".equals(cond)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("error", 2);
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
