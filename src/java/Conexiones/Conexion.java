package Conexiones;
import com.mysql.jdbc.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class Conexion {

    /**
     * @return the perfil
     */
    public String getPerfil() {
        return perfil;
    }

    /**
     * @param perfil the perfil to set
     */
    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }
    private static Connection cnx=null;
public static Connection obtener() throws ClassNotFoundException, SQLException{
    if (cnx==null) {
        try{
    Class.forName("com.mysql.jdbc.Driver"); 
    cnx=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "root");
    }catch(SQLException ex){
       throw new SQLException(ex);
    }catch(ClassNotFoundException ex){
    throw new ClassCastException(ex.getMessage());   
    }}
    return cnx;
    }
    public static void cerrar() throws SQLException{
    if (cnx!=null){
        cnx.close();
    }}
    Boolean tipo=true;
    public void nuevoUsuario(String txtUser, String txtRut, String txtNombre, String txtApellido, String txtDireccion, String txtFec_Nac, Integer txtTelefono, String txtPassword, Integer cmbPerfil) throws ClassNotFoundException, SQLException{
    String query="INSERT INTO Trabajador(Rut, Perfil_idPerfil, usuario , contraseña , nombre , apellido , direccion , fecNac, telefono, estado) values('"+txtRut+"',"+cmbPerfil+",'"+txtUser+"','"+txtPassword+"','"+txtNombre+"','"+txtApellido+"','"+txtDireccion+"','"+txtFec_Nac+"','"+txtTelefono+"',"+tipo+")";
    Statement st= obtener().createStatement();
    st.executeUpdate(query); 
    cerrar(); 
    cnx=null; 
    }
       public void nuevoUsuariodesc(String txtRut, String descrip) throws ClassNotFoundException, SQLException{
    String query2="INSERT INTO trab_desc (Trabajador_Rut, observacion) values ('"+txtRut+"','"+descrip+"')";
    Statement st2= obtener().createStatement();
    st2.executeUpdate(query2); 
    cerrar(); 
    cnx=null; 
    }
    
    public ArrayList<Usuario> verUsuario() throws ClassNotFoundException, SQLException{
    ArrayList<Usuario> users=new ArrayList<>();
    String query="SELECT * FROM Perfil, Trabajador, trab_desc WHERE (Perfil.idPerfil=Trabajador.Perfil_idPerfil) and (Trabajador.rut=trab_desc.Trabajador_Rut) and estado=true order by Trabajador.nombre";    
    Statement st= obtener().createStatement();
    ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        Usuario u = new Usuario();//
        u.set_rut(rs.getString("rut"));//
        u.setPerfil_idPerfil(rs.getString("descripcion"));
        u.setNombre_usuario(rs.getString("usuario"));
        u.setPassword(rs.getString("contraseña"));
        u.setNombre(rs.getString("nombre"));
        u.setApellido(rs.getString("apellido"));
        u.setDireccion(rs.getString("direccion"));
        u.setFecNac(rs.getString("fecNac"));
        u.setTelefono(rs.getString("telefono"));
        u.setEstado(rs.getBoolean("estado"));
        u.setDescripcion(rs.getString("observacion"));
        users.add(u);  
    }
    cerrar();
    cnx=null;
    return users;}
    public ArrayList<Usuario> verUsuario_desactivados() throws ClassNotFoundException, SQLException{
    ArrayList<Usuario> users=new ArrayList<>();
    String query="SELECT * FROM Perfil, Trabajador, trab_desc WHERE (Perfil.idPerfil=Trabajador.Perfil_idPerfil) and (Trabajador.rut=trab_desc.Trabajador_Rut) and estado=false order by Trabajador.nombre";    
    Statement st= obtener().createStatement();
    ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        Usuario u = new Usuario();//
        u.set_rut(rs.getString("rut"));//
        u.setPerfil_idPerfil(rs.getString("descripcion"));
        u.setNombre_usuario(rs.getString("usuario"));
        u.setPassword(rs.getString("contraseña"));
        u.setNombre(rs.getString("nombre"));
        u.setApellido(rs.getString("apellido"));
        u.setDireccion(rs.getString("direccion"));
        u.setFecNac(rs.getString("fecNac"));
        u.setTelefono(rs.getString("telefono"));
        u.setEstado(rs.getBoolean("estado"));
        u.setDescripcion(rs.getString("observacion"));
        users.add(u);  
    }
    cerrar();
    cnx=null;
    return users;
}
    
    public ArrayList<Usuario> UsuarioLogin() throws ClassNotFoundException, SQLException{
    ArrayList<Usuario> users=new ArrayList<>();
    String query="SELECT * FROM Trabajador";    
    Statement st= obtener().createStatement();
    ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        Usuario u = new Usuario();
        u.setNombre_usuario(rs.getString("usuario"));
        u.setPassword(rs.getString("contraseña"));
        u.setPerfil_idPerfil(rs.getString("Perfil_idPerfil"));
        u.setEstado(rs.getBoolean("estado"));
        users.add(u);  
    }
    cerrar();
    cnx=null;
    return users;
    
}
public void editarUser(String id, String nombre, String apellido, String direccion, String fecNac, Integer telefono, Integer Perfil, Boolean estadobool) throws ClassNotFoundException, SQLException{
    String query="UPDATE Trabajador SET nombre='"+nombre+"' , apellido='"+apellido+"' , direccion='"+direccion+"' , fecNac='"+fecNac+"', telefono='"+telefono+"', Perfil_idPerfil='"+Perfil+"' , estado="+estadobool+" where rut='"+id+"'";    
    Statement st= obtener().createStatement();
    st.executeUpdate(query); //agregar los throws y java.statement
    cerrar(); // cierra la conexion
    cnx=null; //limpia la conexion
    }
public void editarUserdesc(String id, String Desc) throws ClassNotFoundException, SQLException{
    String query="UPDATE trab_desc SET observacion='"+Desc+"'where Trabajador_Rut='"+id+"'";    
    Statement st= obtener().createStatement();
    st.executeUpdate(query); //agregar los throws y java.statement
    cerrar(); // cierra la conexion
    cnx=null; //limpia la conexion
    }
   public ArrayList<Usuario> verUsuarioById(String id) throws ClassNotFoundException, SQLException{
    ArrayList<Usuario> users=new ArrayList<>();
    String query="SELECT * FROM Trabajador, trab_desc WHERE rut='"+id+"' and (Trabajador.rut=trab_desc.Trabajador_Rut)";    
    Statement st= obtener().createStatement();
    ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        Usuario u = new Usuario();
        u.setNombre_usuario(rs.getString("usuario"));
        u.set_rut(rs.getString("rut"));
        u.setPassword(rs.getString("contraseña"));
        u.setNombre(rs.getString("nombre"));
        u.setApellido(rs.getString("apellido"));
        u.setDireccion(rs.getString("direccion"));
        u.setTelefono(rs.getString("telefono"));
        u.setFecNac(rs.getString("fecNac"));        
        u.setPerfil_idPerfil(rs.getString("Perfil_idPerfil"));
        u.setEstado(rs.getBoolean("estado"));
        u.setDescripcion(rs.getString("observacion"));
        users.add(u);
    }     
    cerrar();
    cnx=null;
    return users;
}

public void contraseñas(String pass, String id) throws ClassNotFoundException, SQLException{
String query="UPDATE Trabajador SET contraseña='"+pass+"' where rut='"+id+"'";    
    Statement st= obtener().createStatement();
    st.executeUpdate(query); //agregar los throws y java.statement
    cerrar(); // cierra la conexion
    cnx=null; //limpia la conexion
} 
 public ArrayList<String> SacarusuarioId(String id) throws ClassNotFoundException, SQLException{
    ArrayList<String> users=new ArrayList<>();
    String query="SELECT * FROM Trabajador WHERE rut='"+id+"'";    
    Statement st= obtener().createStatement();
    ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        users.add(rs.getString("usuario"));
        users.add(rs.getString("rut"));
   }     
    cerrar();
    cnx=null;
    return users;
}
    public ArrayList<String> compuser() throws ClassNotFoundException, SQLException{
    ArrayList<String> users=new ArrayList<>();
    String query="SELECT usuario FROM Trabajador";    
    Statement st= obtener().createStatement();
    ResultSet rs=st.executeQuery(query);
    while(rs.next()){
        users.add(rs.getString("usuario"));
    }
    cerrar();
    cnx=null;
    return users;
}
    private String perfil; 
}



