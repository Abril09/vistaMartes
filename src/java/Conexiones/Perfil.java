package Conexiones;

public class Perfil {

    /**
     * @return the rut
     */
    public String getRut() {
        return rut;
    }

    /**
     * @param rut the rut to set
     */
    public void setRut(String rut) {
        this.rut = rut;
    }

    /**
     *
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Apellido
     */
    public String getApellido() {
        return Apellido;
    }

    /**
     * @param Apellido the Apellido to set
     */
    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    /**
     * @return the Cuidad
     */
    public String getCuidad() {
        return Cuidad;
    }

    /**
     * @param Cuidad the Cuidad to set
     */
    public void setCuidad(String Cuidad) {
        this.Cuidad = Cuidad;
    }

    /**
     * @return the Comuna
     */
    public String getComuna() {
        return Comuna;
    }

    /**
     * @param Comuna the Comuna to set
     */
    public void setComuna(String Comuna) {
        this.Comuna = Comuna;
    }

    /**
     * @return the Direccion
     */
    public String getDireccion() {
        return Direccion;
    }

    /**
     * @param Direccion the Direccion to set
     */
    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    /**
     * @return the Fec_Nac
     */
    public String getFec_Nac() {
        return Fec_Nac;
    }

    /**
     * @param Fec_Nac the Fec_Nac to set
     */
    public void setFec_Nac(String Fec_Nac) {
        this.Fec_Nac = Fec_Nac;
    }

    /**
     * @return the telefono
     */
    public Integer getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }
    private String rut;
    private String Nombre;
    private String Apellido;
    private String Cuidad;
    private String Comuna;
    private String Direccion;
    private String Fec_Nac;
    private Integer telefono;
}
