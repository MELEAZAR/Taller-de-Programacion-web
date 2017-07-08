/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.egcc.ventas.service;

/**
 *
 * @author darwin
 */
import java.util.List;
import java.util.Map;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import pe.egcc.ventas.model.Producto;
import pe.egcc.ventas.Mapper.ProductoMapper;

@Service
public class ProductoService extends AbstractJdbcSupport{
     private final String SQL_SELECT = "select "
            + "idprod, "
            + "idcat, "
            + "nombre, "
            + "precio, "
            + "stock "
            + "from producto ";

    private final String SQL_UPDATE = "update producto set "
            + "idcat, "
            + "nombre, "
            + "precio, "
            + "stock "
            + "where idprod= ? ";

    private final String SQL_DELETE = "delete from producto "
            + "where idprod = ? ";
    //---------------------CRUD-------------------------
    
public Producto getProducto(String codigo) {
        Producto bean = null;
        String sql = SQL_SELECT
                + "where idprod = ? ";
        try {
            bean = jdbcTemplate.queryForObject(sql, new ProductoMapper(), codigo);
        } catch (EmptyResultDataAccessException e) {
        }
        return bean;
    }

    public List<Producto> getProductos(Producto bean) {
        List<Producto> lista;
        String sql = SQL_SELECT
                + "where idprod like concat('%',?,'%') "                
                + "and nombre like concat('%',?,'%') ";
        lista = jdbcTemplate.query(sql, new ProductoMapper(),
                bean.getIdprod(), bean.getNombre());
        return lista;
    }

    @Transactional(propagation = Propagation.REQUIRED,
            rollbackFor = Exception.class)
    public void crear(Producto producto) {
        // Leer el contador
        String sql = "select int_contitem cont, int_contlongitud size "
                + "from contador "
                + "where vch_conttabla = 'producto' "
                + "for update";
        Map<String, Object> rec = jdbcTemplate.queryForMap(sql);
        int cont = Integer.parseInt(rec.get("cont").toString());
        int size = Integer.parseInt(rec.get("size").toString());

        System.out.println("CONT: " + cont);

        try {
            Thread.currentThread().sleep(2000);
        } catch (Exception e) {
        }

        // Generar Codigo
        cont++;
        String codigo = String.format("%" + size + "s", cont).replace(' ', '0');

        // Actualizar el contador
        sql = "update contador set int_contitem = ? "
                + "where vch_conttabla = 'producto'";
        jdbcTemplate.update(sql, cont);

        // Insertar empleado
        sql = "insert into producto(idprod, idcat, "
                + "nombre, precio, stock) "
                + "values(?,?,?,?,?)";
        jdbcTemplate.update(sql, codigo, producto.getIdcat(), producto.getNombre(),
                producto.getPrecio(), producto.getStock());

        producto.setIdprod(codigo);

    }

     //------------------------------------------------------------------ACTUALIZAR
    @Transactional(propagation = Propagation.REQUIRED,
            rollbackFor = Exception.class)
    public void update(Producto producto) {

        int filas = jdbcTemplate.update(SQL_UPDATE, producto.getIdcat(), producto.getNombre(),
                producto.getPrecio(), producto.getStock(), producto.getIdprod());

        if (filas != 1) {
            throw new RuntimeException("Error en el proceso.");
        }

    }
 //DELETE

    @Transactional(propagation = Propagation.REQUIRED,
            rollbackFor = Exception.class)
    public void delete(String codigo) {

        int filas = jdbcTemplate.update(SQL_DELETE, codigo);

        if (filas == 0) {
            throw new RuntimeException("El Producto no existe.");
        }

    }
    //---------------CONSULTAS-------------------
}
