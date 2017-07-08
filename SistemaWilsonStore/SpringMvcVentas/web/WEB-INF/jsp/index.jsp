<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIO</title>
        <link href="<c:url  value='/css/estilos.css' />"rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div  class="bodyLogin">
            <form action="logon.htm" method="post">
                <h2>LOGIN</h2>
                <input type="text" placeholder="&#128272; USUARIO" name="usuario"class="input-100">
                <input type="password" placeholder="&#128272; CLAVE" name="clave"class="input-100">
                <input type="submit" value="Ingresar al Sistema" class="btn-enviar">            
            <div class="divError">
                    ${error}
                </div>
            </form>
        </div>
    </body>
</html>
