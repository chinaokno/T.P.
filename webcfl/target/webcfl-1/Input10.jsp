<%-- 
    Document   : Input10
    Created on : 23 nov. 2022, 11:29:55
    Author     : COMPU05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="carga.jsp">
            
        Producto </br>
        <input type = "text" name = "Nombre" /></br>
        </br>
        
        Descripcion </br>
        <input type = "text" name = "Descripcion" /></br>
        </br>
        
        
        Costo </br>
        <input type = "text" name = "Costo" /></br>
        <input type = "hidddn" name = "id_sucur" /></br>
        </br>
        
        Stock </br>
        <input type = "text" name = "Stock" /></br>
        </br>
        
        <input type="submit" value="Aceptar">
    </body>
</html>
