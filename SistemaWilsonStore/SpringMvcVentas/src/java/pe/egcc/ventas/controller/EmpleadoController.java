package pe.egcc.ventas.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import pe.egcc.ventas.model.Empleado;
import pe.egcc.ventas.model.Combo;
import pe.egcc.ventas.service.ComboService;
import pe.egcc.ventas.service.EmpleadoService;
import pe.egcc.ventas.Util.VentasUtil;

@Controller
@SessionAttributes(value = {"empSession", "usuSession", "permisos"})
public class EmpleadoController {

    @Autowired
    private EmpleadoService empleadoService;
    
    @Autowired
    private ComboService comboService;

    @RequestMapping(value = "crudEmpleado.htm", method = RequestMethod.GET)
    public String crudEmpleado(Model model) {
        String destino = "crudEmpleado";
//        if (!model.containsAttribute("usuario")) {
//            destino = "error/error";
//        }
        return destino;
    }
        @RequestMapping(value = "conEmpleado.htm", method = RequestMethod.GET)
    public String empleado(Model model) {
        String destino = "conEmpleado";
//        if (!model.containsAttribute("usuario")) {
//            destino = "error/error";
//        }
        return destino;
    }
        @RequestMapping(value = "conEmpleado.htm", method = RequestMethod.POST)
    public String conEmpleado(
            @RequestParam("nombre") String nombre,
            @RequestParam("apellido") String apellido,
            Model model) {
        List<Empleado> lista = empleadoService.conEmpleados1(nombre, apellido);
        model.addAttribute("lista", lista);
        model.addAttribute("nombre", nombre);
        model.addAttribute("apellido", apellido);

        String destino = "conEmpleado";
//        if (!model.containsAttribute("usuario")) {
//            destino = "error/error";
//        }
        return destino;
    }

      @RequestMapping(value = "conEmpleadosV1.htm", method = RequestMethod.POST)
  public String conEmpleadoV1(
          @RequestParam("criterio") String criterio,
          Model model){
    // Proceso
    List<Map<String,Object>> lista;
    lista = empleadoService.conEmpleado1(criterio);
    // Reporte
    //model.addAttribute("menuClientes1", "cssLinkMenuActivo");
    model.addAttribute("criterio", criterio);
    model.addAttribute("lista", lista);
    return "conEmpleado1";
  }
  
    @RequestMapping(value = "Empleado.htm", method = RequestMethod.POST)
  public String conCliente(@RequestParam("codigo") String codigo, Model model){
    // Proceso
    Empleado bean = empleadoService.getEmpleado(codigo);
    model.addAttribute("codigo", codigo);
    if(bean == null){
      model.addAttribute("error", "Código no existe.");
    } else {
      model.addAttribute("bean", bean);
    }
    return "Empleado";
  }
  
    @RequestMapping(value = "conEmpleadosV2.htm", method = RequestMethod.GET)
  public String conClienteV2(Model model){
    
    // Proceso Caso 1
    List<Map<String,Object>> lista;
    lista = empleadoService.conEmpleado1("");
    
    // Proceso Caso 2
    // List<Cliente> lista;
    // lista = clienteService.conClientes2("");
    
    // Reporte
    model.addAttribute("lista", lista);
    //model.addAttribute("menuClientes2", "cssLinkMenuActivo");
    return "conEmpleados2";
  }
    @RequestMapping(value = "conEmpleadosV2.htm", method = RequestMethod.POST)
  public String conEmpleadosV2(
          @RequestParam("criterio") String criterio,
          Model model){
    

    // Proceso Caso 1
    // List<Map<String,Object>> lista;
    // lista = clienteService.conClientes1(criterio);
    
    // Proceso Caso 2
    List<Empleado> lista;
    lista = empleadoService.conEmpleado2(criterio);
   
    // Reporte
   // model.addAttribute("menuClientes2", "cssLinkMenuActivo");
    model.addAttribute("criterio", criterio);
    model.addAttribute("lista", lista);
    return "conEmpleados2";
  }
   @RequestMapping(value = "conEmpleadosV3.htm", method = RequestMethod.GET)
  public String conClienteV3(Model model){
    
    // Proceso Caso 1
    List<Combo> sucursales;
    sucursales = comboService.getSeccion();
   
    // Reporte
    model.addAttribute("sucursales", sucursales);
    //model.addAttribute("menuClientes3", "cssLinkMenuActivo");
    return "conEmpleados3";
  }
  
    @RequestMapping(value = "conEmpleadosV3.htm", method = RequestMethod.POST)
  public String conClienteV3(
          @RequestParam("sucursal") String sucursal,
          Model model){
       
    // Proceso
    
    List<Combo> sucursales;
    sucursales = comboService.getSeccion();
    VentasUtil.selectComboOption(sucursales, sucursal);
    
    
    List<Empleado> lista;
    lista = empleadoService.conEmpleado3(sucursal);
    
    
    // Reporte
    model.addAttribute("menuClientes3", "cssLinkMenuActivo");
    model.addAttribute("criterio", sucursal);
    model.addAttribute("sucursales", sucursales);
    model.addAttribute("lista", lista);
    return "Empleados3";
  }
  
  //---------------------------------CRUD------------------------------
  
  
  @RequestMapping(value = "crudEmpleadoConsultar.htm", method = RequestMethod.POST)
  public String crudEmpleadoConsultar(
          @ModelAttribute Empleado bean,
          @RequestParam("btnBuscar") String buscar,
          Model model){
    
    String destino;
    //model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    if( buscar.equals("Buscar") ){
      
      destino = "crudEmpleado";
      List<Empleado> lista = empleadoService.getEmpleados(bean);
      model.addAttribute("lista", lista);
      
    } else {
      
      Empleado beanEmpleado = new Empleado();
      beanEmpleado.setIdemp(VentasUtil.CRUD_NUEVO);
      
      destino = "crudEmpleadoEditar";
      model.addAttribute("accion", VentasUtil.CRUD_NUEVO);
      model.addAttribute("bean", beanEmpleado);
      
    }
    
    return destino;
  }
  
  @RequestMapping(value = "crudEmpleadoEditar.htm", method = RequestMethod.GET)
  public String crudEmpleadoEditar(
          @RequestParam("IDEMP") String codigo,
          Model model){
    
    String destino;
    //model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    // Proceso
    Empleado beanEmpleado = empleadoService.getEmpleado(codigo);
    
    // Reporte
    destino = "crudEmpleadoEditar";
    model.addAttribute("accion", VentasUtil.CRUD_EDITAR);
    model.addAttribute("bean", beanEmpleado);
    
    return destino;
  }
  @RequestMapping(value = "crudEmpleadoEliminar.htm", method = RequestMethod.GET)
  public String crudEmpleadoEliminar(
          @RequestParam("IDEMP") String codigo,
          Model model){
    
    String destino;
  //  model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    // Proceso
    Empleado beanEmpleado = empleadoService.getEmpleado(codigo);
    
    // Reporte
    destino = "crudEmpleadoEditar";
    model.addAttribute("accion", VentasUtil.CRUD_ELIMINAR);
    model.addAttribute("bean", beanEmpleado);
    model.addAttribute("disabled", "disabled");
    
    
    return destino;
  }
  
  
  @RequestMapping(value = "crudEmpleadoGrabar.htm", method = RequestMethod.POST)
  public String crudClienteGrabar(
          @RequestParam("accion") String accion,
          @ModelAttribute Empleado empleado,
          Model model){
    
    String destino;
    //model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    // Proceso
    String mensaje = "";
    String error = "";
    try {
      switch(accion){
        case VentasUtil.CRUD_NUEVO:
          empleadoService.crear(empleado);
          mensaje = "Empleado creado con código " + empleado.getIdemp() + ".";
          break;
         case VentasUtil.CRUD_EDITAR:
          empleadoService.update(empleado);
          mensaje = "Empleado editado con código " ;
          break;
         case VentasUtil.CRUD_ELIMINAR:
          empleadoService.delete(empleado.getIdemp());
          mensaje = "Empleado eliminado con código ";
          break;         
          
      }
    } catch (Exception e) {
      error = e.getMessage();
    }
        
    // Reporte
    destino = "mensaje";
    model.addAttribute("titulo", accion + " EMPLEADO");
    model.addAttribute("mensaje", mensaje);
    model.addAttribute("error", error);
 
    
    return destino;
  }
  
}
