package pe.egcc.ventas.Util;

import java.util.List;
import pe.egcc.ventas.model.Combo;

public class VentasUtil {
    
        private VentasUtil() {
    }

    public static void selectComboOption(List<Combo> lista, String codigo) {
        for (Combo combo : lista) {
            if (combo.getCodigo().equals(codigo)) {
                combo.setSelected("selected");
            }
        }
    }
    
    // CONSTANTES DEL CRUD
    
    public static final String CRUD_NUEVO = "NUEVO";
    public static final String CRUD_EDITAR = "EDITAR";
    public static final String CRUD_ELIMINAR = "ELIMINAR";
}
