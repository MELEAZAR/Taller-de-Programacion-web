/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.egcc.ventas.controller;

/**
 *
 * @author darwin
 */import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import pe.egcc.ventas.Util.VentasUtil;
import pe.egcc.ventas.service.ProductoService;
import pe.egcc.ventas.service.ComboService;
import pe.egcc.ventas.model.Producto;

@Controller
@SessionAttributes(value = {"empSession", "usuSession", "permisos"})
public class ProductoController {
    
     @Autowired
    private ComboService comboService;
    
    @Autowired
    private ProductoService productoService;
    
      @RequestMapping(value = "crudProducto.htm", method = RequestMethod.GET)
    public String crudProducto(Model model) {
        String destino = "crudProducto";
//        if (!model.containsAttribute("usuario")) {
//            destino = "error/error";
//        }
        return destino;
    }
    
     @RequestMapping(value = "crudProductoConsultar.htm", method = RequestMethod.POST)
  public String crudProductoConsultar(
          @ModelAttribute Producto bean,
          @RequestParam("btnBuscar") String buscar,
          Model model){
    
    String destino;
    //model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    if( buscar.equals("Buscar") ){
      
      destino = "crudProducto";
      List<Producto> lista = productoService.getProductos(bean);
      model.addAttribute("lista", lista);
      
    } else {
      
      Producto beanProducto = new Producto();
      beanProducto.setIdprod(VentasUtil.CRUD_NUEVO);
      
      destino = "crudProductoEditar";
      model.addAttribute("accion", VentasUtil.CRUD_NUEVO);
      model.addAttribute("bean", beanProducto);
      
    }
    
    return destino;
  }
  
  @RequestMapping(value = "crudProductoEditar.htm", method = RequestMethod.GET)
  public String crudProductoEditar(
          @RequestParam("idprod") String codigo,
          Model model){
    
    String destino;
    //model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    // Proceso
    Producto beanProducto = productoService.getProducto(codigo);
    
    // Reporte
    destino = "crudProductoEditar";
    model.addAttribute("accion", VentasUtil.CRUD_EDITAR);
    model.addAttribute("bean", beanProducto);
    
    return destino;
  }
  @RequestMapping(value = "crudProductoEliminar.htm", method = RequestMethod.GET)
  public String crudProductoEliminar(
          @RequestParam("idprod") String codigo,
          Model model){
    
    String destino;
  //  model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    // Proceso
    Producto beanEmpleado = productoService.getProducto(codigo);
    
    // Reporte
    destino = "crudProductoEditar";
    model.addAttribute("accion", VentasUtil.CRUD_ELIMINAR);
    model.addAttribute("bean", beanEmpleado);
    model.addAttribute("disabled", "disabled");
    
    
    return destino;
  }
  
  
  @RequestMapping(value = "crudProductoGrabar.htm", method = RequestMethod.POST)
  public String crudEstudianteGrabar(
          @RequestParam("accion") String accion,
          @ModelAttribute Producto producto,
          Model model){
    
    String destino;
    //model.addAttribute("crudClientes", "cssLinkMenuActivo");
    
    // Proceso
    String mensaje = "";
    String error = "";
    try {
      switch(accion){
        case VentasUtil.CRUD_NUEVO:
          productoService.crear(producto);
          mensaje = "Producto creado con código " + producto.getIdprod() + ".";
          break;
         case VentasUtil.CRUD_EDITAR:
          productoService.update(producto);
          mensaje = "Producto editado con código " ;
          break;
         case VentasUtil.CRUD_ELIMINAR:
          productoService.delete(producto.getIdprod());
          mensaje = "Producto eliminado con código ";
          break;         
          
      }
    } catch (Exception e) {
      error = e.getMessage();
    }
        
    // Reporte
    destino = "mensaje";
    model.addAttribute("titulo", accion + " Producto");
    model.addAttribute("mensaje", mensaje);
    model.addAttribute("error", error);
 
    
    return destino;
  }
  
    
}
