package pe.egcc.ventas.model;

import java.io.Serializable;

public class Empleado implements Serializable {

    private static final long serialVersionUID = 6086247716333627610L;

    
   //------------------------------------COLEGIO
        //EMPLEADO

private String  idemp   ; 
private String nombre;
private String apellido;
private String email;
private String telefono;

             //USUARIO;
//private String idemp;
    private String usuario;
    private String clave;
    private String estado;
          //PERMISO;
//private String  idemp;
    private String int_moducodigo;
    private String vch_permestado;
   //MODULO;
//private String int_moducodigo;
    private int vch_modunombre;
    private String vch_moduestado;


    public Empleado() {
    }

  
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getInt_moducodigo() {
        return int_moducodigo;
    }

    public void setInt_moducodigo(String int_moducodigo) {
        this.int_moducodigo = int_moducodigo;
    }

    public String getVch_permestado() {
        return vch_permestado;
    }

    public void setVch_permestado(String vch_permestado) {
        this.vch_permestado = vch_permestado;
    }

    public int getVch_modunombre() {
        return vch_modunombre;
    }

    public void setVch_modunombre(int vch_modunombre) {
        this.vch_modunombre = vch_modunombre;
    }

    public String getVch_moduestado() {
        return vch_moduestado;
    }

    public void setVch_moduestado(String vch_moduestado) {
        this.vch_moduestado = vch_moduestado;
    }

    public String getIdemp() {
        return idemp;
    }

    public void setIdemp(String idemp) {
        this.idemp = idemp;
    }

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

}
