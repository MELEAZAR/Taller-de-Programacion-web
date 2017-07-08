<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>

  <table width="100%">
    <tr>
      <td><img src="<c:url value='/img/logo.png' />" alt="" /></td>
      <td>Usuario: ${ usuSession }</td>
      <td><a href="salir.htm">Salir</a></td>
    </tr>
  </table>
  
</div>