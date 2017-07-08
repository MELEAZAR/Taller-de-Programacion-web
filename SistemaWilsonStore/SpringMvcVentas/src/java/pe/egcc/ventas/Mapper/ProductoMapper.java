/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.egcc.ventas.Mapper;

/**
 *
 * @author darwin
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import pe.egcc.ventas.model.Producto;
public class ProductoMapper implements RowMapper<Producto>{
    @Override
    public Producto mapRow(ResultSet rs, int i) throws SQLException {
        Producto bean1 = new Producto();
        bean1.setIdprod(rs.getString("idprod"));
        bean1.setIdcat(rs.getString("idcat"));
        bean1.setNombre(rs.getString("nombre"));
        bean1.setPrecio(rs.getString("precio"));
        bean1.setStock(rs.getString("stock"));
        return bean1;
    }
}
