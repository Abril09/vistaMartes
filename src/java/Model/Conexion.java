/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author programar
 */
public class Conexion {
   
     private static Connection cnx=null;
     
    public static Connection obtener() throws ClassNotFoundException, SQLException{
     
    if(cnx==null){
    try{ 
        Class.forName("org.sqlite.JDBC");
        cnx=(Connection) DriverManager.getConnection("jdbc:sqlite:C:\\Users\\programar\\Documents\\NetBeansProjects\\Trabajomartes\\Recursos\\Libros");
        
        }catch(SQLException ex){
        throw new SQLException(ex);
        }catch(ClassNotFoundException ex){
            throw new ClassCastException(ex.getMessage());
           
        }    
    }    
    return cnx;
    }
    
    public static void cerrar() throws SQLException{
    if(cnx!=null){
        
        cnx.close();
        cnx=null;
    
    }
    
}
    
}
