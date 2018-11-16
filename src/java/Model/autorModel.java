/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entidades.Categoria;
import Entidades.autor;
import Entidades.libro;
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
public class autorModel {
     public List<autor>  listarAutor() throws ClassNotFoundException, SQLException {
          List<autor> lis=new ArrayList();
          
           
        try {
            String Query = "select * from autor ";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);
         
            while (rs.next()) {
                 
                autor cl=new autor();
                cl.setId_autor(rs.getInt("id_autor"));
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
         public String ultimoAutor() throws ClassNotFoundException, SQLException {
          String index="";
          
           
        try {
            String Query = "select max(id_autor) as id from autor;";

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
         
             public void nuevoAutor(autor c) throws ClassNotFoundException, SQLException{
            String query="INSERT INTO Autor(id_autor,nombre,nacionalidad) values(null,?,null)";
            PreparedStatement st=Conexion.obtener().prepareStatement(query);
           
            st.setString(1, c.getNombre());
           
                      
            
            st.executeUpdate();
           
             Conexion.cerrar();
       }
    
}
