package pe.egcc.ventas.service;

import pe.egcc.ventas.model.Empleado;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

@Service
public class VentasService extends AbstractJdbcSupport {

    private final String SQL_SELECT = "select "
            + "idemp,    "
            + "nombre, "
            + "apellido, "
            + "email, "
            + "telefono "
            + "from empleado ";

    private final String SQL_INSERT = "insert into "
            + "empleado (idemp, nombre, apellido,"
            + " email, telefono) "
            + "values(?,?,?,?,?)";

    private final String SQL_INSERT_PERMISOS = "insert into "
            + "empleado (idemp, int_moducodigo, vch_permestado ) "
            + "values(?,?,?)";

    private final String SQL_UPDATE = "update empleado set "
            + "nombre= ?, "
            + "apellido = ?, "
            + "email = ?, "
            + "telefono = ?, "
            + "where idemp = ? ";

    private final String SQL_DELETE = "delete from empleado "
            + "where idemp = ? ";

//    public Empleado validaUsuario(String usuario, String clave) {
//        Empleado bean = null;
//        try {
//            String sql = "select idemp,nombre,apellido,email,telefono "
//                    + "from empleado  "
//                    + "where idemp =  "
//                    + "(select idemp from usuario  "
//                    + "where usuario = ?  "
//                    + "and clave = SHA(?) "
//                    + "and estado = 1)";
//            bean = (Empleado) jdbcTemplate.queryForObject(sql,
//                    new BeanPropertyRowMapper(Empleado.class), usuario, clave);
//        } catch (EmptyResultDataAccessException e) {
//        }
//        return bean;
//    }
    public Empleado validaUsuario(String usuario, String clave) {
        Empleado bean = null;
        try {
            String sql = SQL_SELECT
                    + "where idemp =  "
                    + "(select idemp from usuario  "
                    + "where usuario = ?  "
                    + "and clave = SHA(?) "
                    + "and estado = 1)";
            bean = jdbcTemplate.queryForObject(sql,
                    new BeanPropertyRowMapper<Empleado>(Empleado.class),
                    usuario, clave);

        } catch (EmptyResultDataAccessException e) {
        }
        return bean;
    }

    public Map<String, String> leerPermisos(String codEmp) {

        Map<String, String> permisos = new HashMap<>();

        // Recupero la lista
        String sql = "select int_moducodigo cod, vch_permestado estado "
                + "from permiso where idemp = ?";
        List<Map<String, Object>> lista = jdbcTemplate.queryForList(sql, codEmp);

        // Pasar la lista a un Map
        for (Map<String, Object> map : lista) {
            permisos.put(
                    "op" + map.get("cod").toString(),
                    map.get("estado").toString());
        }

        return permisos;
    }

    public List<Empleado> conEmpleados(String nombre, String apellido) {
        List<Empleado> lista;
        String sql = SQL_SELECT
                + "where nombre like concat('%',?,'%')  "
                + "and apellido like concat('%',?,'%') ";
        lista = jdbcTemplate.query(sql,
                new BeanPropertyRowMapper(Empleado.class), nombre, apellido);
        return lista;
    }

}
