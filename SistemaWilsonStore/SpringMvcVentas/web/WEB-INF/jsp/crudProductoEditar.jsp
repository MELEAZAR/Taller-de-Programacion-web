
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

                <h2>${ accion } ESTUDIANTE</h2>    


                <form method="post" action="crudProductoGrabar.htm">

                    <input type="hidden" name="idprod" value="${bean.idprod}"/>
                    <input type="hidden" name="accion" value="${accion}"/>

                    <fieldset >

                        <div>
                            <label class="form-field">Código:</label>
                            <span class="form-field">${bean.idprod}</span>
                        </div>
                        <div style="clear: both;"></div>
                        <div>
                            <label class="form-field">Categoria:</label>
                            <input class="form-field" ${disabled} type="text" name="idcat" value="${bean.idcat}">
                        </div>
                        <div style="clear: both;"></div>
                        <div>
                            <label class="form-field">Nombre:</label>
                            <input class="form-field" ${disabled} type="text" name="nombre" value="${bean.nombre}">
                        </div>
                        <div style="clear: both;"></div>

                        <div>
                            <label class="form-field">precio :</label>
                            <input  class="form-field" ${disabled} type="text" name="precio" value="${bean.precio}">
                        </div>
                        <div style="clear: both;"></div>

                        <div>
                            <label class="form-field">Stock :</label>
                            <input class="form-field" ${disabled} type="text" name="stock" value="${bean.stock}">
                        </div>
                        <div style="clear: both;"></div>

                    </fieldset>

                    <fieldset >
                        <legend>Acciones</legend>

                        <input class="btnMain" type="submit" value="Procesar" />

                    </fieldset>

                </form>    

            </section>
            <jsp:include page="footer.jsp" />

        </div>

    </body>
</html>
