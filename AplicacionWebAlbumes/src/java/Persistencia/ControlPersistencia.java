/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author César
 */
public class ControlPersistencia {
    
    public static Connection conectarBasedeDatos() throws ClassNotFoundException, SQLException
    {
            Class.forName("com.mysql.jdbc.Driver");
            String bd = "bdalbumes";
            String url="jdbc:mysql://localhost/"+bd;
            String usuario="root";
            String clave="root";
            return DriverManager.getConnection(url,usuario,clave);
               
    }
             
     public static Object getValueAt(ResultSet rs, int ri, int ci)
     {
        Object ob = null;
        try
        {
            rs.absolute(ri);
            ob = rs.getObject(ci);
        } catch (SQLException ex)
        {
           System.out.println("Excepcion en obtener valor de celda"+ex);
        }

        return ob;
     }
     
     public static int getRowCount(ResultSet rs)
     {
         int total = 0;
         try
         {
             rs.last();
             total = rs.getRow();
         } catch (SQLException ex)
         {
            System.out.println("Excepcion en obtener numero de filas "+ex);
         }

         return total;

     }
}
