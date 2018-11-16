package Conexiones;

public class Trabajador {

    private String rut;
    private String Perfil_idPerfil;
    private String Nombre_usuario;
    private String Password;
    private String nombre;
    private String apellido;
    private String direccion;
    private String fecNac;
    private String telefono;
    private Boolean Estado;
    
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return apellido;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getFecNac() {
        return fecNac;
    }
    public void setFecNac(String fecNac) {
        this.fecNac = fecNac;
    }
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getPerfil_idPerfil() {
        return Perfil_idPerfil;
    }
    public void setPerfil_idPerfil(String Perfil_idPerfil) {
        this.Perfil_idPerfil = Perfil_idPerfil;
    }
    public String get_rut() {
        return rut;
    }
    public void set_rut(String Perfil_rut) {
        this.rut = Perfil_rut;
    }
    public String getPassword() {
        return Password;
    }
    public void setPassword(String Password) {
        this.Password = Password;
    }
    public String getNombre_usuario() {
        return Nombre_usuario;
    }
    public void setNombre_usuario(String Nombre_usuario) {
        this.Nombre_usuario = Nombre_usuario;
    }
    public Boolean getEstado() {
        return Estado;
    }
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }
   
    
   

}
