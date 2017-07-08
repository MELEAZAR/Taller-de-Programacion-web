package pe.egcc.ventas.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import pe.egcc.ventas.model.Empleado;
import pe.egcc.ventas.service.VentasService;

@Controller
@SessionAttributes(value = {"empSession", "usuSession", "permisos"})
public class VentasController {

    @Autowired
    private VentasService colegioService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "index";
    }

    @RequestMapping(value = "index.htm", method = RequestMethod.GET)
    public String login2(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "index";
    }

    

    @RequestMapping(value = "salir.htm", method = RequestMethod.GET)
    public String salir(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "index";
    }
    @RequestMapping(value = "home.htm", method = RequestMethod.GET)
    public String home(SessionStatus sessionStatus) {
        return "main";
    }

//    @RequestMapping(value = "empleado.htm", method = RequestMethod.GET)
//    public String empleado(Model model) {
//        
//        String destino = "empleado";
//        
//        if( ! model.containsAttribute("usuario") ){
//            destino = "error/error";
//        }
//        
//        return destino;
//    }
//    
//    @RequestMapping(value = "empleado.htm", method = RequestMethod.POST)
//    public String empleado(
//            @RequestParam("nombre") String nombre, 
//            @RequestParam("apellido") String apellido,
//            Model model) {
//        
//        // Para probar el control de errores.
//        int b = 0;
//        int a = 7 / b;
//        
//        List<Empleado> lista = ventaService.conEmpleados(nombre, apellido);
//        model.addAttribute("lista", lista);
//        model.addAttribute("nombre", nombre);
//        model.addAttribute("apellido", apellido);
//        return "empleado";
//    }
//    
//    @RequestMapping(value = "producto.htm", method = RequestMethod.GET)
//    public String producto() {
//        return "producto";
//    }
//    @RequestMapping(value = "logon.htm", method = RequestMethod.POST)
//    public String logon(
//            @RequestParam("usuario") String usuario,
//            @RequestParam("clave") String clave,
//            Model model) {
//        String destino;
//        try {
//            Empleado bean = ventaService.validaUsuario(usuario, clave);
//            if (bean == null) {
//                throw new Exception("Datos Incorrectos");
//            }
//            model.addAttribute("usuario", bean);
//            destino = "main";
//        } catch (Exception e) {
//            model.addAttribute("error", e.getMessage());
//            destino = "index";
//        }
//        return destino;
//    }
    //-------------
    @RequestMapping(value = "/logon.htm", method = RequestMethod.POST)
    public String logon1(
            @RequestParam("usuario") String usuario,
            @RequestParam("clave") String clave,
            Model model) {

        String destino;
        try {

            // Proceso
            Empleado bean = colegioService.validaUsuario(usuario, clave);
            if (bean == null) {
                throw new Exception("Datos incorrectos");
            }
            destino = "main";
            model.addAttribute("empSession", bean);
            model.addAttribute("usuSession", usuario);

            // Cargar permisos
            model.addAttribute("permisos",
                    colegioService.leerPermisos(String.valueOf(bean.getIdemp())));

        } catch (Exception e) {

            destino = "index";
            model.addAttribute("error", e.getMessage());

        }

        return destino;
    }

}
