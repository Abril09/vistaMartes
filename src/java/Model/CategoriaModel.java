/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entidades.Categoria;
import Entidades.libro;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author programar
 */
public class CategoriaModel {
      public List<Categoria>  listarCategorias() throws ClassNotFoundException, SQLException {
          List<Categoria> lis=new ArrayList();
          
           
        try {
            String Query = "select * from categoria ";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);
         
            while (rs.next()) {
                 
                Categoria cl=new Categoria();
                cl.setId_categoria(rs.getInt("id_cat"));
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
    
}
