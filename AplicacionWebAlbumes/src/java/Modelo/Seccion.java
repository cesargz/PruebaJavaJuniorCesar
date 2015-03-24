/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Persistencia.ControlPersistencia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Variables.VariablesGlobales;

/**
 *
 * @author César
 */
public class Seccion {
    
    private int Codigo_Seccion;
    private int Orden_Seccion;
    private String Nombre_Seccion;
    private int NumeroHojas_Seccion;
    private int Codigo_Album;
        
    public Seccion () {

    }

    public Seccion (int Orden_SeccionIn) {

          this.Orden_Seccion = Orden_SeccionIn;

    }

    public int getCodigo_Seccion() {
              return this.Codigo_Seccion;
    }
    
    public void setCodigo_Seccion(int Codigo_SeccionIn) {
          this.Codigo_Seccion = Codigo_SeccionIn;
    }
    
    
    public int getOrden_Seccion() {
              return this.Orden_Seccion;
    }
    
    public void setOrden_Seccion(int Orden_SeccionIn) {
          this.Orden_Seccion = Orden_SeccionIn;
    }

    public String getNombre_Seccion() {
          return this.Nombre_Seccion;
    }
    
    public void setNombre_Seccion(String Nombre_SeccionIn) {
          this.Nombre_Seccion = Nombre_SeccionIn;
    }

    public int getNumeroHojas_Seccion() {
          return this.NumeroHojas_Seccion;
    }
    
    public void setNumeroHojas_Seccion(int NumeroHojas_SeccionIn) {
          this.NumeroHojas_Seccion = NumeroHojas_SeccionIn;
    }

    public int getCodigo_Album() {
          return this.Codigo_Album;
    }
    
    public void setCodigo_Album(int Codigo_AlbumIn) {
          this.Codigo_Album = Codigo_AlbumIn;
    }

    public void setAll_Uno(int Orden_SeccionIn, String Nombre_SeccionIn, int NumeroHojas_SeccionIn,
          int Codigo_AlbumIn) {
          this.Orden_Seccion = Orden_SeccionIn;
          this.Nombre_Seccion = Nombre_SeccionIn;
          this.NumeroHojas_Seccion = NumeroHojas_SeccionIn;
          this.Codigo_Album = Codigo_AlbumIn;
    }
    
    public void setAll_Dos(int Codigo_SeccionIn, int Orden_SeccionIn, String Nombre_SeccionIn, int NumeroHojas_SeccionIn,
          int Codigo_AlbumIn) {
          this.Codigo_Seccion = Codigo_SeccionIn;  
          this.Orden_Seccion = Orden_SeccionIn;
          this.Nombre_Seccion = Nombre_SeccionIn;
          this.NumeroHojas_Seccion = NumeroHojas_SeccionIn;
          this.Codigo_Album = Codigo_AlbumIn;
    }

    public int existeSeccion (String nombre_seccion, String codigo_album_seleccionado) throws ClassNotFoundException, SQLException
    {
        Connection cn=null ;
        PreparedStatement pr=null;
        ResultSet rs=null;
      
        try{
            cn=ControlPersistencia.conectarBasedeDatos();
            if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos!!!");
            String sql="SELECT * FROM seccion WHERE nombre_seccion=? AND codigo_album=?";
            pr=cn.prepareStatement(sql);
            if(pr == null) throw new SQLException("Error en la preparacion de la sentencia sql!!!");
            pr.setString(1, nombre_seccion);
            pr.setInt(2, Integer.parseInt(codigo_album_seleccionado));
            rs=pr.executeQuery();
            if(rs == null) throw new SQLException("Error en la ejecucion de la sentencia sql!!!");

            int numeroregistros = ControlPersistencia.getRowCount(rs);

                if(numeroregistros == 0) return 0;
                else return 1;

          }catch(SQLException e)
          {
//              VariablesGlobales.mensaje = e.getMessage();
              return -1;
          }
    }
    
    public int numeroSeccionesAlbum (String codigo_album_seleccionado) throws ClassNotFoundException, SQLException
    {
        Connection cn=null ;
        PreparedStatement pr=null;
        ResultSet rs=null;
      
    try{
        cn=ControlPersistencia.conectarBasedeDatos();
        if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos!!!");
        String sql="SELECT * FROM seccion WHERE codigo_album=?";
        pr=cn.prepareStatement(sql);
        if(pr == null) throw new SQLException("Error en la preparacion de la sentencia sql!!!");
        pr.setInt(1, Integer.parseInt(codigo_album_seleccionado));
        rs=pr.executeQuery();
        if(rs == null) throw new SQLException("Error en la ejecucion de la sentencia sql!!!");
        
        int numeroregistros = ControlPersistencia.getRowCount(rs);
        return numeroregistros;

      }catch(SQLException e)
      {
//          VariablesGlobales.mensaje = e.getMessage();
          return -1;
      }
    }

    public boolean registrarSeccion() throws ClassNotFoundException
    {
        Connection cn=null;
        PreparedStatement pr=null;
        int rs=0;
        
        try 
        {
          cn=ControlPersistencia.conectarBasedeDatos();
          if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos");
          String sql="INSERT INTO seccion (orden_seccion, nombre_seccion, numerohojas_seccion, codigo_album) VALUES (?,?,?,?);";
          pr=cn.prepareStatement(sql);
          if(pr == null) throw new SQLException("Error en la Preparacion de la Sentencia SQL");          
          pr.setInt(1,Orden_Seccion);
          pr.setString(2,Nombre_Seccion);
          pr.setInt(3,NumeroHojas_Seccion);
          pr.setInt(4,Codigo_Album);
          rs=pr.executeUpdate();
          if(rs == 2) throw new SQLException("Error en la Ejecucion de la Sentencia SQL");
          return true;
        } catch (SQLException e) {
           VariablesGlobales.mensaje = e.getMessage();
          return false;
        }
    }
   
        
    public ResultSet mostrarSeccionesAlbum (String codigo_album_seleccionado) throws ClassNotFoundException, SQLException
    {
        Connection cn=null ;
        PreparedStatement pr=null;
        ResultSet rs=null;
      
    try{
        cn=ControlPersistencia.conectarBasedeDatos();
        if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos!!!");
        String sql="SELECT * FROM seccion WHERE codigo_album=?";
        pr=cn.prepareStatement(sql);
        if(pr == null) throw new SQLException("Error en la preparacion de la sentencia sql!!!");
        pr.setInt(1, Integer.parseInt(codigo_album_seleccionado));
        rs=pr.executeQuery();
        if(rs == null) throw new SQLException("Error en la ejecucion de la sentencia sql!!!");
                
      }catch(SQLException e)
      {
//          VariablesGlobales.mensaje = e.getMessage();
      }
  
        return rs;
    }

}//Fin class Seccion