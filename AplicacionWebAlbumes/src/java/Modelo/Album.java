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
public class Album {
    
    private int Codigo_Album;
    private String Nombre_Album;
    private String Descripcion_Album;
    private int Year_Album;
    
    public Album () {
    }

    public Album (int Codigo_AlbumIn) {

          this.Codigo_Album = Codigo_AlbumIn;
    }
    
    public int getCodigo_Album() {
              return this.Codigo_Album;
    }
    
    public void setCodigo_Album(int Codigo_AlbumIn) {
          this.Codigo_Album = Codigo_AlbumIn;
    }

    public String getNombre_Album() {
          return this.Nombre_Album;
    }
    
    public void setNombre_Album(String Nombre_AlbumIn) {
          this.Nombre_Album = Nombre_AlbumIn;
    }

    public String getDescripcion_Album() {
          return this.Descripcion_Album;
    }
    
    public void setDescripcion_Album(String Descripcion_AlbumIn) {
          this.Descripcion_Album = Descripcion_AlbumIn;
    }
    
    public int getYear_Album() {
          return this.Year_Album;
    }
    
    public void setYear_Album(int Year_AlbumIn) {
          this.Year_Album = Year_AlbumIn;
    }
    
    public void setAll(int Codigo_AlbumIn, String Nombre_AlbumIn, String Descripcion_AlbumIn,
          int Year_AlbumIn) {
          this.Codigo_Album = Codigo_AlbumIn;
          this.Nombre_Album = Nombre_AlbumIn;
          this.Descripcion_Album = Descripcion_AlbumIn;
          this.Year_Album = Year_AlbumIn;
    }

    public int existeAlbum (String codigo_album) throws ClassNotFoundException, SQLException
    {
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        
        try
        {
            cn=ControlPersistencia.conectarBasedeDatos();
            if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos!!!");
            String sql="SELECT * FROM album WHERE codigo_album=?";
            pr=cn.prepareStatement(sql);
            if(pr == null) throw new SQLException("Error en la preparacion de la sentencia sql!!!");
            pr.setInt(1, Integer.parseInt(codigo_album));
            rs=pr.executeQuery();
            if(rs == null) throw new SQLException("Error en la ejecucion de la sentencia sql!!!");

            int numeroregistros = ControlPersistencia.getRowCount(rs);
            
            if(numeroregistros == 0) return 0;
            else return 1;
        }
       catch(SQLException e)
       {
//          VariablesGlobales.mensaje = e.getMessage(); 
          return -1;
       }
    }

    public boolean registrarAlbum() throws ClassNotFoundException
    {
        Connection cn=null;
        PreparedStatement pr=null;
        int rs=0;
        
        try 
        {
          cn=ControlPersistencia.conectarBasedeDatos();
          if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos");
          String sql="INSERT INTO album (codigo_album, nombre_album, descripcion_album, year_album) VALUES (?,?,?,?);";
          pr=cn.prepareStatement(sql);
          if(pr == null) throw new SQLException("Error en la Preparacion de la Sentencia SQL");          
          pr.setInt(1,Codigo_Album);
          pr.setString(2,Nombre_Album);
          pr.setString(3,Descripcion_Album);
          pr.setInt(4,Year_Album);
          rs=pr.executeUpdate();
          if(rs == 2) throw new SQLException("Error en la Ejecucion de la Sentencia SQL");
          return true;
        } catch (SQLException e) {
           VariablesGlobales.mensaje = e.getMessage();
           return false;
        }
    
    }
   
    public ResultSet buscarAlbum (String campo_album, String seleccionar_campo_busqueda) throws ClassNotFoundException, SQLException
    {
        Connection cn=null ;
        PreparedStatement pr=null;
        ResultSet rs=null;
      
    try{
        cn=ControlPersistencia.conectarBasedeDatos();
        if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos!!!");
        
        String sql="SELECT * FROM album WHERE "+seleccionar_campo_busqueda+"=?";
        pr=cn.prepareStatement(sql);
        if(pr == null) throw new SQLException("Error en la preparacion de la sentencia sql!!!");
        
        if(seleccionar_campo_busqueda.equals("codigo_album")) pr.setInt(1, Integer.parseInt(campo_album));
        else pr.setString(1, campo_album);
        
        rs=pr.executeQuery();
        if(rs == null) throw new SQLException("Error en la ejecucion de la sentencia sql!!!");
                
      }catch(SQLException e)
      {
//          VariablesGlobales.mensaje = e.getMessage();
      }
  
        return rs;
    }
        
    public ResultSet mostrarAlbumes () throws ClassNotFoundException, SQLException
    {
        Connection cn=null ;
        PreparedStatement pr=null;
        ResultSet rs=null;
      
    try{
        cn=ControlPersistencia.conectarBasedeDatos();
        if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos!!!");
        String sql="SELECT * FROM album";
        pr=cn.prepareStatement(sql);
        if(pr == null) throw new SQLException("Error en la preparacion de la sentencia sql!!!");
        rs=pr.executeQuery();
        if(rs == null) throw new SQLException("Error en la ejecucion de la sentencia sql!!!");
                
      }catch(SQLException e)
      {
//          VariablesGlobales.mensaje = e.getMessage();
      }
  
        return rs;
    }
    
    public boolean editarAlbum() throws ClassNotFoundException
    {
        Connection cn=null;
        PreparedStatement pr=null;
        int rs=0;
 
        try 
        {
          cn=ControlPersistencia.conectarBasedeDatos();
          if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos");
          String sql="UPDATE album SET nombre_album=?, descripcion_album=?, year_album=? WHERE codigo_album=?;";
          pr=cn.prepareStatement(sql);
          if(pr == null) throw new SQLException("Error en la Preparacion de la Sentencia SQL");          
          pr.setString(1,Nombre_Album);
          pr.setString(2,Descripcion_Album);
          pr.setInt(3,Year_Album);
          pr.setInt(4,Codigo_Album);
          rs=pr.executeUpdate();
          if(rs == 2) throw new SQLException("Error en la Ejecucion de la Sentencia SQL");
          return true;
        } catch (SQLException e) {
           VariablesGlobales.mensaje = e.getMessage();
           return false;
        }
    }
        
     public boolean eliminarAlbum(int codigo_album) throws ClassNotFoundException
    {
        Connection cn=null;
        PreparedStatement pr=null;
        int rs=0;
 
        try 
        {
          cn=ControlPersistencia.conectarBasedeDatos();
          if(cn == null) throw new SQLException("Error en la Conexion a la Base de Datos");
          String sql="DELETE FROM album WHERE codigo_album=?;";
          pr=cn.prepareStatement(sql);
          if(pr == null) throw new SQLException("Error en la Preparacion de la Sentencia SQL");          
          pr.setInt(1,codigo_album);
          rs=pr.executeUpdate();
          if(rs == 2) throw new SQLException("Error en la Ejecucion de la Sentencia SQL");
          return true;
        } catch (SQLException e) {
//           VariablesGlobales.mensaje = e.getMessage();
           return false;
        }
    }
  
}//Fin class Album