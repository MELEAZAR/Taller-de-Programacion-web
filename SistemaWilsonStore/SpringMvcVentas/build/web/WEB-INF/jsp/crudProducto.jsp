
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="menu/menu.css" />" 
              rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/estilos.css" />" 
              rel="stylesheet" type="text/css"/>
        <link href="<c:url  value='/bootstrap/css/bootstrap.min.css' />"rel="stylesheet" type="text/css"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <div class="contenedor">
            <div class="cabecera">
                <jsp:include page="cabecera.jsp"/>
                <jsp:include page="menu.jsp"/>
            </div>
            <section class="section_formPrincipal"> 
                <form method="post" action="crudProductoConsultar.htm" class="form-MEDIO">
                    <h2 class="tituloForm">MANTENIMIENTO DE PRODUCTO</h2>
                    <table class="tablaForm">
                        <tr>
                            <td>
                                <label style="margin-bottom: -3px;">CODIGO:</label><br/>
                                <input type="text" name="idprod" value="${idprod}" class="input-cajaTe"/>
                            </td>
                            <td>
                                <label style="margin-bottom: -3px;">NOMBRE:</label><br/>
                                <input  type="text" name="nombre"  value="${nombre}" class="input-cajaTe"/>
                            </td>
                            <td >
                                <label  ></label><br/>
                                <input type="submit" name="btnBuscar"  value="Buscar"  class="btn-enviar100"/>
                            </td>
                            <td >
                                <label  ></label><br/>
                                <input style="margin-left:  2px; " type="submit" name="btnBuscar"   value="Nuevo" class="btn-enviar100"/>
                            </td>
                        </tr>
                    </table>
                </form>

                <div >
                    <h2>RESULTADO</h2>
                    <div  class="tableR">
                        <table class="table table-hover">

                            <thead >
                                <tr class="info">
                                    <th>CODIGO</th>
                                    <th>CATEGORIA</th>
                                    <th>NOMBRE </th>
                                    <th>PRECIO</th>
                                    <th>STOCK</th>
                                    <th>ACCION</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach items="${lista}" var="r">

                                    <tr class="danger">

                                        <td>${r.idprod}</td>                                        
                                        <td>${r.idcat}</td>
                                        <td>${r.nombre}</td>
                                        <td>${r.precio}</td>
                                        <td>${r.stock}</td>
                                        <td>
                                            <a  href="crudProductoEditar.htm?idprod=${r.idprod}"><span class="glyphicon glyphicon-pencil"></span>&nbsp;</a>
                                            <a  href="crudProductoEliminar.htm?idprod=${r.idprod}">&nbsp;<span class="glyphicon glyphicon-trash"></span></a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>

                        </table>
                    </div>
                </div>

            </section>
            <jsp:include page="footer.jsp" />

        </div>
    </body>
</html>
