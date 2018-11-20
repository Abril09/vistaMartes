/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidades.Categoria;
import Entidades.autor;
import Entidades.libro;
import Entidades.objeditorial;
import Model.CategoriaModel;
import Model.autorModel;
import Model.editorialModel;
import Model.libroModel;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;

/**
 *
 * @author programar
 */
@WebServlet(name = "LibrosController", urlPatterns = {"/Libros"})
public class LibrosController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
              String var=request.getParameter("action");
            switch (var) {
                case "cargar":
                    cargar(request,response);
                    break;
                case "buscar":
                     buscar(request,response);
                    break;
                 case "libro":
                     traerLibro(request,response);
                  break;
                 case "CrearEjemplar":
                     CrearejEjemplar(request,response);
                     break;
                 case "categorias":
                     categorias(request,response);
                     break;
                 case "autor":
                     autor(request,response);
                     break;
                   case "editorial":
                     editorial(request,response);
                     break;
                      case "borrar":
                       borrar(request,response);
                     break;
                     case "getLibro":
                       getLibro(request,response);
                     break;
                      case "actualizar":
                       Actualizar(request,response);
                     break;
                default:
                    throw new AssertionError();
            }
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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

     private void cargar(HttpServletRequest request, HttpServletResponse response) {
         
        try {
            //To change body of generated methods, choose Tools | Templates.
          
            PrintWriter out = response.getWriter();
          
            List <libro> l=new ArrayList<libro>();
            libroModel t=new libroModel();
            l=t.listarLibros();
            
            Gson n=new Gson();
            out.println(n.toJson(l));
            out.flush();
           
            
        } catch (IOException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
     private void buscar(HttpServletRequest request, HttpServletResponse response) {
         String pro =request.getParameter("id");
         
        try {
           
            PrintWriter out = response.getWriter();
            
            List <libro> l=new ArrayList<libro>();
            libroModel t=new libroModel();
            l=t.buscarLibro(pro);
            
            Gson n=new Gson();
            out.println(n.toJson(l));
            out.flush();
           
            
        } catch (IOException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void traerLibro(HttpServletRequest request, HttpServletResponse response) {
       String pro =request.getParameter("isbn");
        try{
            PrintWriter out = response.getWriter();
            libro l=new libro();
            libroModel t=new libroModel();
            l=t.verLibro(pro);
            Gson n=new Gson();
           
            out.println(n.toJson(l));
            out.flush();
        
        
        
        }catch(Exception e){}

    }

    private void CrearejEjemplar(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String ubicacion=request.getParameter("ubicacion");
            String id_ejemplar=request.getParameter("id_isbn");
            String titulo=request.getParameter("titulo");
            String categoria=request.getParameter("categoria");
            String autor=request.getParameter("autor");
            String editorial=request.getParameter("editorial");
            String op=request.getParameter("OP");
            String isbn=request.getParameter("ISBN");
            String id_edito=request.getParameter("id_editorial");
            String id_autor=request.getParameter("id_autor");
             
                    
            
        try {
            switch(op){
                
                case "1":
                    
                    try{
                    libroModel t=new libroModel();
                    libro l=new libro();
            
                    int id=Integer.parseInt(id_ejemplar);
                    l.setUbicacion(ubicacion);
                    l.setId_ejemplar(id);
                    t.nuevoTipoCliente(l);
               
                    response.sendRedirect("index.jsp?msg="+t.ultimoEjemplar());
                    
                    
                    
                    }
                    
                    catch(Exception e){
                    
                    
                    }
                    
                    break;
                case "2":
                    try{
                    List<autor> cat=new ArrayList();
                    autor  M=new autor();
                    autorModel N=new autorModel();
                    cat=N.listarAutor();
                    cat.contains(autor);
                    int indiceAutor=0;
                    int indiceEdit=0;
                    for (autor i: cat) {
                              if(i.getNombre().equalsIgnoreCase(autor)){
                              
                              M.setId_autor(i.getId_autor());
                              indiceAutor=1;
                              break;
                             }
                       
                    }
                    if(indiceAutor==0){
                        M.setNombre(autor);
                         N.nuevoAutor(M);
                        
                         M.setId_autor(Integer.parseInt(N.ultimoAutor()));
                    
                    }
                    
                     editorialModel eM=new editorialModel();
                     List<objeditorial> editoriales=new ArrayList();
                     objeditorial ed=new objeditorial();
                     editoriales=eM.listarAutor();
                     for (objeditorial i : editoriales) {
                         if(i.getNombre().equalsIgnoreCase(editorial)){
                             ed.setId_editorial(i.getId_editorial());
                             indiceEdit=1;
                             break;
                         
                         }
                        
                    }
                    
                    if(indiceEdit==0){
                        ed.setNombre(editorial);
                        eM.nuevoEditorial(ed);
                       
                        ed.setId_editorial(Integer.parseInt(eM.ultimoEditorial()));
                    
                    }
                    
                    libroModel ls=new libroModel();
                    libro libro=new libro();
                    libro.setAutor(String.valueOf(M.getId_autor()));
                    libro.setCategoria(categoria);
                    libro.setEditorial(String.valueOf(ed.getId_editorial()));
                    libro.setIsbn(isbn);
                    libro.setTitulo(titulo);
                    
                    ls.nuevoISBN(libro);
                    libroModel libroM=new libroModel();
                    libro lib=new libro();
            
                    int id_libro=Integer.parseInt(libroM.ultimoIsbn());
                    lib.setUbicacion(ubicacion);
                    lib.setId_ejemplar(id_libro);
                    libroM.nuevoTipoCliente(lib);
                    
                   response.sendRedirect("index.jsp?msg="+libroM.ultimoEjemplar());
                    }
                    
                    catch(Exception w){
                       response.sendRedirect("index.jsp?error=01"+w.getMessage().toString()+id_edito);
                      
                      
                      }
                    break;
                    
                case "3":
                    try{
                   
//                       
                       libroModel ls=new libroModel();
                       libro libro=new libro();
                       libro.setIsbn(isbn);
                       libro.setAutor(id_autor);
                       libro.setTitulo(titulo);
                       libro.setCategoria(categoria);
                       libro.setEditorial(id_edito);
                       libro.setEstado("1");
                      
                       ls.nuevoISBN(libro);
                        libro lib=new libro();
            
                        int id_libro=Integer.parseInt(ls.ultimoIsbn());
                        lib.setUbicacion(ubicacion);
                        lib.setId_ejemplar(id_libro);
                        ls.nuevoTipoCliente(lib);
                     response.sendRedirect("index.jsp?msg="+ls.ultimoEjemplar());
                    }
                    catch(Exception e){
                           
                        response.sendRedirect("index.jsp?error=2"+id_edito+"id"+id_autor+"ds"+categoria);
                        }
                    break;
            }
        
        }catch(Exception e){
             response.sendRedirect("index.jsp");
        }
    }

    private void categorias(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        try{
             PrintWriter out = response.getWriter();
            List<Categoria> lis=new ArrayList();
            Categoria l=new Categoria();
            CategoriaModel t=new CategoriaModel();
            lis=t.listarCategorias();
            Gson g=new Gson();
            out.print(g.toJson(lis));
             out.flush();
        }catch(Exception e){
             response.sendRedirect("index.jsp");
        }
        
    }

    private void autor(HttpServletRequest request, HttpServletResponse response) throws IOException {
      
        try{
            PrintWriter out = response.getWriter();
            autorModel M=new autorModel();
            List<autor> autor=new ArrayList();
            Gson g=new Gson();
            autor a=new autor();
            autor=M.listarAutor();
            out.print(g.toJson(autor));
             out.flush();
            
        } catch(Exception e){
             response.sendRedirect("index.jsp");
        }
    }

    private void editorial(HttpServletRequest request, HttpServletResponse response) throws IOException {
         try{
            PrintWriter out = response.getWriter();
            editorialModel M=new editorialModel();
            List<objeditorial> editoriales=new ArrayList();
            Gson g=new Gson();
            objeditorial a=new objeditorial();
            editoriales=M.listarAutor();
            out.print(g.toJson(editoriales));
             out.flush();
            
        } catch(Exception e){
            response.sendRedirect("index.jsp");
        }
    }

    private void borrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            
            String probar=request.getParameter("id_ejemplar");
            PrintWriter outs = response.getWriter();
            libroModel con=new libroModel();
            int id=Integer.parseInt(probar);
            int res=con.borrarEjemplar(id);
            
            outs.print("exitoso");
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LibrosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
      private void getLibro(HttpServletRequest request, HttpServletResponse response) {
       String pro =request.getParameter("idEjemplar");
        try{
            PrintWriter out = response.getWriter();
            libro l=new libro();
            libroModel t=new libroModel();
            l=t.LibroActualizar(pro);
            Gson n=new Gson();
           
            out.println(n.toJson(l));
            out.flush();
        
        
        
        }catch(Exception e){}

    }
      private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {

      String ubicacion=request.getParameter("ubicacion");
      String Estado=request.getParameter("idEstado");
      PrintWriter out = response.getWriter();
      
      String Id_ejemplar = request.getParameter("idEjemplar");
     
      int id=Integer.parseInt(Id_ejemplar);

        try{
               libro l=new libro();
               l.setId_ejemplar(0);
               libroModel t=new libroModel();
            
               l.setUbicacion(ubicacion);
               l.setEstado(Estado);
               l.setId_ejemplar(id);
            
               t.actualizarLibro(l);
              
                 out.print("1");
        
        
        }catch(Exception e){
            out.print("0");
        }

    }
    
}
