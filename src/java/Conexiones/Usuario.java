package Conexiones;

public class Usuario {

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the Estado
     */
    public Boolean getEstado() {
        return Estado;
    }

    public void setEstado(Boolean asd) {
        Estado = asd;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * @return the fecNac
     */
    public String getFecNac() {
        return fecNac;
    }

    /**
     * @param fecNac the fecNac to set
     */
    public void setFecNac(String fecNac) {
        this.fecNac = fecNac;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the Perfil_idPerfil
     */
    public String getPerfil_idPerfil() {
        return Perfil_idPerfil;
    }

    /**
     * @param Perfil_idPerfil the Perfil_idPerfil to set
     */
    public void setPerfil_idPerfil(String Perfil_idPerfil) {
        this.Perfil_idPerfil = Perfil_idPerfil;
    }

    /**
     * @return the idUsuario
     */
    public String getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the Perfil_rut
     */
    public String get_rut() {
        return rut;
    }

    /**
     * @param Perfil_rut the Perfil_rut to set
     */
    public void set_rut(String Perfil_rut) {
        this.rut = Perfil_rut;
    }

    /**
     * @return the Password
     */
    public String getPassword() {
        return Password;
    }

    /**
     * @param Password the Password to set
     */
    public void setPassword(String Password) {
        this.Password = Password;
    }

    /**
     * @return the Nombre_usuario
     */
    public String getNombre_usuario() {
        return Nombre_usuario;
    }

    /**
     * @param Nombre_usuario the Nombre_usuario to set
     */
    public void setNombre_usuario(String Nombre_usuario) {
        this.Nombre_usuario = Nombre_usuario;
    }

    /**
     * @return the Estado
     */

    /**
     * @return the tipo
     */
    public Integer getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }
    
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
    private Integer tipo;
    private String idUsuario;
    private String descripcion;
}
