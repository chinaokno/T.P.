<%-- 
    Document   : carga
    Created on : 12 nov 2022, 19:33:51
    Author     : Sebastian
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = null;  
            String selectSucur = "SELECT direc_sucur FROM tb_sucur WHERE id_sucur=?";
            String selectProd = "SELECT tb_prod.nom_prod AS Producto,"
                    + "          tb_prod.cost_prod AS Precio,"
                    + "          tb_sucur.nom_sucur AS Sucursal"
                    + "          from tb_prod_sucur"
                    + "          join tb_sucur"
                    + "          on tb_prod_sucur.id_sucur = tb_sucur.id_sucur AND tb_sucur.id_sucur=?"
                    + "          join tb_prod"
                    + "          on tb_prod_sucur.id_prod = tb_prod.id_prod";
            
            
            PreparedStatement consultaSucur = null;
            PreparedStatement consultaProd = null;
            ResultSet listaSucur = null;
            ResultSet listaProd = null;
            try{    
            
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsptprueba", "root", "");
            
            consultaProd = conexion.prepareStatement(selectProd);
            consultaSucur = conexion.prepareStatement(selectSucur);
           
            consultaSucur.setString(1, request.getParameter("id"));
            consultaProd.setString(1, request.getParameter("id"));
            
            listaSucur = consultaSucur.executeQuery();
            listaSucur.next();        
            listaProd = consultaProd.executeQuery();      
            
            out.print("<h1>" + listaSucur.getString("direc_sucur") + "</h1>");
            while(listaProd.next()){
            %>
            <ul>
                <li>Nombre: <%out.print(listaProd.getString("Producto"));%></li>               
            </ul>
           <%
           }
           } catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaProd + "</br>");
                    out.println(consultaSucur + "</br>");
                  
                  } finally {
                        try {           
                            consultaProd.close();
                            consultaSucur.close(); 
                            consexion.close();
                     } catch (Exception e) {
                       }
                 }
           
            


        %>
    </body>
</html>
