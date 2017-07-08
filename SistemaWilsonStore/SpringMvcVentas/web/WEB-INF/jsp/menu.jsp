<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="menu">

	<ul>

		<li><a href="home.htm">Home</a></li>
		
		
    <c:if test="${ permisos != null }">

      <!-- Procesos -->
      <c:if test="${ permisos.op1 == 'ACTIVO' }">
				<li><a href="#" >Procesos</a>
					<ul>
						<li><a href="#">Proceso 1</a></li>
						<li><a href="#">Proceso 2</a></li>
						<li><a href="#">Proceso 3</a></li>
						<li><a href="#">Proceso 4</a></li>
					</ul>
				</li>
			</c:if>
			
			<!-- Tablas -->
			<c:if test="${ permisos.op2 == 'ACTIVO' }">
				<li><a href="#" ${ menuTablas }>Tablas</a>
					<ul>
						<li><a href="crudProducto.htm">Producto</a></li>
						<li><a href="crudEmpleado.htm">Empleado</a></li>
						<li><a href="#">tabla?</a></li>
					</ul>
				</li>
			</c:if>
			
			
	    <!-- Consultas -->
	    <c:if test="${ permisos.op3 == 'ACTIVO' }">
		    <li><a href="#" ${ menuGenerales }>Consultas</a>
		      <ul>
		        <li><a href="conEmpleado.htm">Con. Empleado</a></li>
		        <li><a href="#">Consulta 2</a></li>
		        <li><a href="#">Consulta 3</a></li>
		      </ul>
		    </li>
	    </c:if>
	    
	    
	    <!-- Reportes -->
	    <c:if test="${ permisos.op4 == 'ACTIVO' }">
		    <li><a href="#">Reportes</a>
		      <ul>
		        <li><a href="#">Reporte 1</a></li>
		        <li><a href="#">Reporte 2</a></li>
		        <li><a href="#">Reporte 3</a></li>
		      </ul>
		    </li>
	    </c:if>
	     
	     
	    <!-- Util -->    
	    <c:if test="${ permisos.op5 == 'ACTIVO' }">
		    <li><a href="#">Util</a>
		      <ul>
		        <li><a href="#">Util 1</a></li>
		        <li><a href="#">Util 2</a></li>
		        <li><a href="#">Util 3</a></li>
		      </ul>
		    </li>
	    </c:if>
	    
	    
	    <!-- Seguridad -->
	    <c:if test="${ permisos.op6 == 'ACTIVO' }">
		    <li><a href="#">Seguridad</a>
		      <ul>
		        <li><a href="#">Seguridad 1</a></li>
		        <li><a href="#">Seguridad 2</a></li>
		        <li><a href="#">Seguridad 3</a></li>
		      </ul>
		    </li>
	    </c:if>


    </c:if>


	</ul>

</div>

