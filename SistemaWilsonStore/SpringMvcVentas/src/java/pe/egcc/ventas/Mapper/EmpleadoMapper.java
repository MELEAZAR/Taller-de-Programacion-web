
package pe.egcc.ventas.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import pe.egcc.ventas.model.Empleado;
public class EmpleadoMapper implements RowMapper<Empleado> {
    
        @Override
    public Empleado mapRow(ResultSet rs, int i) throws SQLException {
        Empleado bean1 = new Empleado();
        bean1.setIdemp(rs.getString("idemp"));
        bean1.setNombre(rs.getString("nombre"));
        bean1.setApellido(rs.getString("apellido"));
        bean1.setEmail(rs.getString("email"));
        bean1.setTelefono(rs.getString("telefono"));
        return bean1;
    }
}
