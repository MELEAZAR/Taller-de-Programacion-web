<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CRUD DE CLIENTES</title>
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
    
    <h2>${titulo}</h2>
    
    <c:if test="${not empty mensaje}">
      <div class="cssMsgInfo">${mensaje}</div>
    </c:if>
    
    <c:if test="${not empty error}">
      <div class="cssMsgError">${error}</div>
    </c:if>
    
    </section>
            <jsp:include page="footer.jsp" />

        </div>
  </body>
</html>
