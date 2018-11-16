/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

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
public class libroModel {
     public libro verLibro(String isbn) throws ClassNotFoundException, SQLException {
          libro cl = new libro();
           
        try {
            String Query = "SELECT * FROM ISBN_libro  where Isbn="+isbn ;

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);
         
            while (rs.next()) {
                
                cl.setId_ejemplar(rs.getInt("id"));
                cl.setIsbn(rs.getString("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
                
                
             

                
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();

        }

           
    return cl;
    }
     //metodo filtra por titulo de libro con like//
   public List<libro> buscarLibro(String busqueda) throws ClassNotFoundException, SQLException {
        List<libro> list = new ArrayList();
        try {
            String Query = "select * from librosBiblioteca where  titulo like '%"+busqueda+"%'"+" or autor like '%"+busqueda+"%'"+" or Estado like '%"+busqueda+"%'"+" or ISBN like '%"+busqueda+"%'"+" or id_ejemplar like '%"+busqueda+"%'"+" or Categoria like '%"+busqueda+"%'"+" or ubicacion like '%"+busqueda+"%'"+"group by id_ejemplar";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);

            while (rs.next()) {
                libro cl = new libro();
                cl.setId_ejemplar(rs.getInt("id_ejemplar"));
                cl.setIsbn(rs.getString("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                cl.setEstado(rs.getString("Estado"));
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
              cl.setUbicacion(rs.getString("ubicacion"));

                list.add(cl);
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();
            

        }

           
    return list;
    }
     public List<libro> listarLibros() throws ClassNotFoundException, SQLException {
        List<libro> list = new ArrayList();
        try {
            String Query = "select * from librosBiblioteca ";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);

            while (rs.next()) {
                libro cl = new libro();
                cl.setId_ejemplar(rs.getInt("id_ejemplar"));
                cl.setIsbn(rs.getString("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                cl.setEstado(rs.getString("Estado"));
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
              cl.setUbicacion(rs.getString("ubicacion"));

                list.add(cl);
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();
            

        }

           
    return list;
    }
       public void nuevoTipoCliente(libro c) throws ClassNotFoundException, SQLException{
     String query="INSERT INTO libro_Ejemplar(id_ejemplar,ubicacion, id_estado,id_libro) values(null,?,?,?)";
            PreparedStatement st=Conexion.obtener().prepareStatement(query);
           
            st.setString(1, c.getUbicacion());
            st.setInt(2,1);
            st.setInt(3,c.getId_ejemplar());
                      
            
            st.executeUpdate();
           
    Conexion.cerrar();
       }
        public void nuevoISBN(libro c) throws ClassNotFoundException, SQLException{
     String query="INSERT INTO Libro_isbn(id_libro,ISBN, titulo,id_cat,id_autor,id_editorial) values(null,?,?,?,?,?)";
            PreparedStatement st=Conexion.obtener().prepareStatement(query);
           int id_cat=Integer.parseInt(c.getCategoria());
           int id_autor=Integer.parseInt(c.getAutor());
           int id_editorial=Integer.parseInt(c.getEditorial());
            st.setString(1, c.getIsbn());
            st.setString(2, c.getTitulo());
             st.setInt(3,id_cat);
            st.setInt(4,id_autor);
            st.setInt(5,id_editorial);          
            
            st.executeUpdate();
           
    Conexion.cerrar();
       }
       
          public String ultimoIsbn() throws ClassNotFoundException, SQLException {
          String index="";
          
           
        try {
            String Query = "select max(id_libro) as id from libro_isbn;";

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
          
     
          public String ultimoEjemplar() throws ClassNotFoundException, SQLException {
          String index="";
          
           
        try {
            String Query = "select max(id_ejemplar) as id from libro_ejemplar;";

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
       public int borrarEjemplar(int id) throws ClassNotFoundException, SQLException{
           int respuesta=0;
           try{
        String query="delete from libro_ejemplar where id_ejemplar="+id;
            PreparedStatement st=Conexion.obtener().prepareStatement(query);
                                       
            st.executeUpdate();
           respuesta=1;
           }
         catch(Exception e){
         }finally{
           Conexion.cerrar();
           }
           return respuesta;
           
    
       }
       
         public libro LibroActualizar(String busqueda) throws ClassNotFoundException, SQLException {
        libro cl = new libro();
        try {
            String Query = "select * from librosBiblioteca where  id_ejemplar="+busqueda;

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);

            
                
                cl.setId_ejemplar(rs.getInt("id_ejemplar"));
                cl.setIsbn(rs.getString("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                cl.setEstado(rs.getString("Estado"));
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
              cl.setUbicacion(rs.getString("ubicacion"));

               
            
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();
            

        }

           
    return cl;
    }
       
public void actualizarLibro(libro c) throws ClassNotFoundException, SQLException{
     String query="UPDATE libro_Ejemplar SET id_Estado='"+c.getEstado()+"',ubicacion='"+c.getUbicacion()+"' WHERE id_ejemplar ='"+c.getId_ejemplar()+"'";
            PreparedStatement st=Conexion.obtener().prepareStatement(query);
          
            st.executeUpdate();
            
            
    Conexion.cerrar();
       }
       

}
