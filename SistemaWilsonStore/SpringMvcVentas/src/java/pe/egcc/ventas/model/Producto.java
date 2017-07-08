/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.egcc.ventas.model;

/**
 *
 * @author darwin
 */
public class Producto {

    private String idprod;
    private String idcat;
    private String nombre;
    private String precio;
    private String stock;

    public Producto() {
    }

    public String getIdprod() {
        return idprod;
    }

    public void setIdprod(String idprod) {
        this.idprod = idprod;
    }

    public String getIdcat() {
        return idcat;
    }

    public void setIdcat(String idcat) {
        this.idcat = idcat;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

}
