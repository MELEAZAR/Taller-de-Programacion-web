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

        <script src="jQuery/jquery-1.12.0.min.js" type="text/javascript"></script>
        <script src="jQuery/tableToExcel.js" type="text/javascript"></script>
        <script src="jQuery/jspdf.js" type="text/javascript"></script>
        <script src="jQuery/jquery-2.1.3.js" type="text/javascript"></script>
        <script src="jQuery/pdfFromHTML.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="contenedor">
            <div class="cabecera">
                <jsp:include page="cabecera.jsp"/>
                <jsp:include page="menu.jsp"/>
            </div>
            <section class="section_formPrincipal">                

                <form method="post" action="conEmpleado.htm" class="form-MEDIO">
                    <h2 class="tituloForm">"CONSULTAR &nbsp; EMPLEADO"</h2>
                    <table class="tablaForm">
                        <tr>
                            <td>
                                <label style="margin-bottom: -5px;">Nombre</label><br/>
                                <input type="text" name="nombre" value="${nombre}" class="input-cajaTe"/>
                            </td>
                            <td>
                                <label style="margin-bottom: -5px;">Apellido</label><br/>
                                <input type="text" name="apellido" value="${apellido}" class="input-cajaTe"/>
                            </td>
                            <td >
                                <label  ></label><br/>
                                <input style="padding: 10px 25px;"
                                       type="submit" value="Consultar" class="btn-enviar100"/>
                            </td>
                            <td>
                                <label  ></label><br/>
                                <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Exportar a Excel">
                            </td>
                        </tr>
                    </table>
                </form>
                <div>
                    <h3 style="padding-left: 5px;margin-bottom: -1px; color: blue; font-weight: bold;">RESULTADO</h3>
                    <div id="HTMLtoPDF" >
                        <div class="tableR" >
                            <table class="table table-hover" id="testTable"   >
                                <thead>
                                    <tr class="info">
                                        <th class="success">CODIGO</th>
                                        <th>NOMBRE</th>
                                        <th>APELLIDOS</th>
                                        <th>EMAIL</th>
                                        <th>TELEFONO</th>                                    
                                    </tr>
                                </thead>

                                <tbody >
                                    <c:forEach items="${lista}" var="r">
                                        <tr class="danger">
                                            <td class="success">${r.idemp}</td>
                                            <td>${r.nombre}</td>
                                            <td>${r.apellido}</td>
                                            <td>${r.email}</td>
                                            <td>${r.telefono}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
