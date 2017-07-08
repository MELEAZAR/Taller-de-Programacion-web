<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DIVISION POR CERO</title>
    </head>
    <body>
        <h1>DIVISION POR CERO</h1>
        
        <div>
            Se ha encontrado un bug.<br/>
            No se puede dividir por cero.
        </div>
        
        <a href="index.htm">Iniciar sesión</a>
        
        <script>
            
            setTimeout(function(){
                window.location = "index.htm";                
            },3000);
            
        </script>
    </body>
</html>
