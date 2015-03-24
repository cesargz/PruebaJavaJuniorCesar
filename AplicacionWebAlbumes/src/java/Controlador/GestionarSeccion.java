/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Seccion;
import Variables.VariablesGlobales;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Cesar
 */
public class GestionarSeccion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Seccion seccion = new Seccion();
        String bandera = request.getParameter("bandera");
        String mensaje ="";
        
        if(bandera.equals("RegistrarSeccion"))
        {
          VariablesGlobales.nombre_sesion = "RegistrarSeccion";  
          String nombre_seccion = request.getParameter("tfNombre_Seccion");
          String codigo_album_seleccionado = request.getParameter("select_Codigo_Album");
          int existe_seccion = seccion.existeSeccion(nombre_seccion,codigo_album_seleccionado);
          switch(existe_seccion)
          {
             case 0:
                 int numero_secciones_album = seccion.numeroSeccionesAlbum(codigo_album_seleccionado);
                 int orden_seccion=0;
                 if(numero_secciones_album!=-1)
                 {
                     orden_seccion = numero_secciones_album + 1;
                     String numerohojas_seccion = request.getParameter("tfNumeroHojas_Seccion");
                     seccion.setAll_Uno(orden_seccion, nombre_seccion, Integer.parseInt(numerohojas_seccion), Integer.parseInt(codigo_album_seleccionado));
                     if(seccion.registrarSeccion()) mensaje = "Seccion Registrada Exitosamente!!!";
                     else mensaje = VariablesGlobales.mensaje;
//                         mensaje = "Error al Registrar Seccion en la Base de Datos!!!";
                 }
                 else mensaje = "Error al Consultar el Numero de Secciones en la Base de Datos!!!";
//                      mensaje = VariablesGlobales.mensaje;
             break;
             case 1:
                     mensaje = "La Seccion: "+nombre_seccion+" Ya Existe en la Base de Datos!!!";
             break;
             case -1:              
//                  mensaje = VariablesGlobales.mensaje;
                    mensaje = "Error al Buscar Seccion en la Base de Datos";
             break;    
           }
            
          out.print("<script>");
          out.print("alert('"+mensaje+"');");
          out.print("</script>");
          out.print("<meta http-equiv='refresh'; content='0;URL=./vista/pagRegistrarSeccionAlbum.jsp'>");

        }//Fin Registrar Seccion
        

        if(bandera.equals("MostrarSeccionesAlbum"))
        {
          String codigo_album_seleccionado = request.getParameter("select_Codigo_Album");
          ResultSet rs = seccion.mostrarSeccionesAlbum(codigo_album_seleccionado);
          HttpSession sesion=request.getSession(true);
          sesion.setAttribute("sesion_mostrar_secciones_album", rs);
          response.sendRedirect("./vista/pagMostrarSeccionesAlbum.jsp");
       
        }//Fin Mostrar Secciones Album
        
    }// Fin void processRequest

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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GestionarSeccion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GestionarSeccion.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GestionarSeccion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GestionarSeccion.class.getName()).log(Level.SEVERE, null, ex);
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
