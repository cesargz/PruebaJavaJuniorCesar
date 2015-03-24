/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Album;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Variables.VariablesGlobales;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Persistencia.ControlPersistencia;

/**
 *
 * @author Cesar
 */
public class GestionarAlbum extends HttpServlet {

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
      
        Album album = new Album();
        String bandera = request.getParameter("bandera");
        String mensaje ="";
        
        if(bandera.equals("RegistrarAlbum"))
        {
          VariablesGlobales.nombre_sesion = "RegistrarAlbum";  
          String codigo_album = request.getParameter("tfCodigo_Album");
          int existe_album = album.existeAlbum(codigo_album);
         
          switch(existe_album)
          {
             case 0:
                 String nombre_album = request.getParameter("tfNombre_Album");
                 String descripcion_album = request.getParameter("tfDescripcion_Album");
                 String year_album = request.getParameter("tfYear_Album");

                 album.setAll(Integer.parseInt(codigo_album), nombre_album, descripcion_album, Integer.parseInt(year_album));

                 if(album.registrarAlbum()) mensaje = "Album Registrado Exitosamente!!!";
                 else mensaje=VariablesGlobales.mensaje;
                 //mensaje = "Error al Registrar Album en la Base de Datos!!!";
                 
             break;
             case 1:
                     mensaje = "El Album con Codigo "+codigo_album+" Ya Existe en la Base de Datos!!!";
             break;
             case -1:              
//                  mensaje=VariablesGlobales.mensaje;
                    mensaje = "Error al Buscar Album en la Base de Datos";
             break;    
           }
            
          out.print("<script>");
          out.print("alert('"+mensaje+"');");
          out.print("</script>");
          out.print("<meta http-equiv='refresh'; content='0;URL=./vista/pagRegistrarAlbum.jsp'>");
        
        }//Fin Registrar Album
        
        if(bandera.equals("BuscarAlbum"))
        {
          VariablesGlobales.nombre_sesion = "BuscarAlbum";  
          String seleccionar_campo_busqueda = request.getParameter("select_Campo_Busqueda");
          String campo_album = request.getParameter("tfCampo_Album");
          ResultSet rs = album.buscarAlbum(campo_album, seleccionar_campo_busqueda);
          HttpSession sesion=request.getSession(true);
          sesion.setAttribute("album", rs);
          response.sendRedirect("./vista/pagMostrarAlbumes.jsp");
       
        }//Fin Buscar Album
        
        if(bandera.equals("EditarAlbum"))
        {
          VariablesGlobales.nombre_sesion = "EditarAlbum";  
          String nombre_album = request.getParameter("tfNombre_Album");
          String descripcion_album = request.getParameter("tfDescripcion_Album");
          String year_album = request.getParameter("tfYear_Album");
          HttpSession sesion_editar_album = request.getSession(true);
          Album a = (Album)sesion_editar_album.getAttribute("sesion_editar_album");
          int numero_registros = 0;
         
          if(a.getNombre_Album().equals(nombre_album))
          {
              album.setAll(a.getCodigo_Album(), nombre_album, descripcion_album, Integer.parseInt(year_album));
              if(album.editarAlbum())
                 mensaje = "Album Editado Exitosamente!!!";
              else mensaje = VariablesGlobales.mensaje;
//                  mensaje = "Error al Editar Album en la Base de Datos!!!";
             
           }else
           {
              ResultSet rs = a.buscarAlbum(nombre_album,"nombre_album");
              if(rs!=null)
              {
                 numero_registros = ControlPersistencia.getRowCount(rs);
                 if(numero_registros == 0)
                 {
                     album.setAll(a.getCodigo_Album(), nombre_album, descripcion_album, Integer.parseInt(year_album));
                     if(album.editarAlbum())
                        mensaje = "Album Editado Exitosamente!!!";
                     else mensaje = VariablesGlobales.mensaje; 
//                         mensaje = "Error al Editar Album en la Base de Datos!!!";
                 
                 }else mensaje = "El Album "+nombre_album+" ya esta Registrado en la Base de Datos!!!";
                 
               }else mensaje = "Error al buscar en la Base de Datos!!!";
//                       mensaje = VariablesGlobales.mensaje;
           }
            out.print("<script>");
            out.print("alert('"+mensaje+"');");
            out.print("</script>");
            out.print("<meta http-equiv='refresh'; content='0;URL=./vista/pagMostrarAlbumes.jsp'>");
                      

         }//Fin Editar Album
        
        if(bandera.equals("EliminarAlbum"))
        {
            String indiceEliminar = request.getParameter("indiceEliminar");
            HttpSession seselim_albumes = request.getSession(true);
            Vector <Album> albumes = (Vector <Album>)seselim_albumes.getAttribute("seselim_albumes");
            album = albumes.elementAt(Integer.parseInt(indiceEliminar));
            if(album.eliminarAlbum(album.getCodigo_Album()))
                mensaje = "Album Eliminado Exitosamente!!!";
            else mensaje = "Error al Eliminar Album en la Base de Datos!!!";
            
            out.print("<script>");
            out.print("alert('"+mensaje+"');");
            out.print("</script>");
            out.print("<meta http-equiv='refresh'; content='0;URL=./vista/pagMostrarAlbumes.jsp'>");

        }//Fin Eliminar Album
        
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
            Logger.getLogger(GestionarAlbum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GestionarAlbum.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GestionarAlbum.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GestionarAlbum.class.getName()).log(Level.SEVERE, null, ex);
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
