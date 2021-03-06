/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ece356;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kentma
 */
public class DBTestServlet extends HttpServlet {

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
        
        String url;
        try {
            UserDBAO.testConnection();
            url = "/dbtest.jsp";
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBTestServlet.class.getName()).log(Level.SEVERE, null, ex);
            url = "/error.jsp";
            request.setAttribute("exception", ex);
            
        } catch (SQLException ex) {
            url = "/error.jsp";
            request.setAttribute("exception", ex);
            Logger.getLogger(DBTestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
