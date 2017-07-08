<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTAS DE EMPLEADOS</title>
    </head>
    <body>
        <h1>CONSULTAS DE EMPLEADOS</h1>
        <jsp:include page="menu.jsp" />
        <fieldset>
            <legend>Criterio</legend>
            <form method="post" action="empleado.htm">
                <table>
                    <tr>
                        <td>
                            <label>Nombre</label><br/>
                            <input type="text" name="nombre" value="${nombre}"/>
                        </td>
                        <td>
                            <label>Apellido</label><br/>
                            <input type="text" name="apellido" value="${apellido}"/>
                        </td>
                        <td>
                            <input style="padding: 10px 25px;"
                                type="submit" value="Consultar" />
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
        <div>
            <h1>RESULTADO</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>APELLIDO</th>
                        <th>EMAIL</th>
                        <th>TELEFONO</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach items="${lista}" var="r">
                        <tr>
                            <td>${r.idemp}</td>
                            <td>${r.nombre}</td>
                            <td>${r.apellido}</td>
                            <td>${r.email}</td>
                            <td>${r.telefono}</td>
                        </tr>
                    </c:forEach>
                </tbody>
                
            </table>
        </div>
    </body>
</html>
