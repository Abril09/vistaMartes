/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entidades.autor;
import Entidades.objeditorial;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author programar
 */
public class editorialModel {
     public List<objeditorial>  listarAutor() throws ClassNotFoundException, SQLException {
          List<objeditorial> lis=new ArrayList();
          
           
        try {
            String Query = "select * from editorial ";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);
         
            while (rs.next()) {
                 
                objeditorial cl=new objeditorial();
                cl.setId_editorial(rs.getInt("id_editorial"));
                cl.setNombre(rs.getString("nombre"));
                
                
                
             lis.add(cl);

                
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();

        }

           
    return lis;
    } 
     
           public String ultimoEditorial() throws ClassNotFoundException, SQLException {
          String index="";
          
           
        try {
            String Query = "select max(id_editorial) as id from editorial;";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);
            index=rs.getString("id");
          
        } catch (Exception e) {
            //colcoar exepcion//
            

        } finally {
            Conexion.cerrar();

        }

           
    return index;
    }  
         
      public void nuevoEditorial(objeditorial c) throws ClassNotFoundException, SQLException{
            String query="INSERT INTO editorial(id_editorial,nombre) values(null,?)";
            PreparedStatement st=Conexion.obtener().prepareStatement(query);
           
            st.setString(1, c.getNombre());
           
                      
            
            st.executeUpdate();
           
             Conexion.cerrar();
       }
    
     
}
