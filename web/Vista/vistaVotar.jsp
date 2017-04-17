<%-- 
    Document   : vistaVotar
    Created on : 17-dic-2016, 18:53:00
    Author     : carlos
--%>

<%@page import="Pojo.Votante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Votante objvotante = (Votante) session.getAttribute("votante");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voto Correcto</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>El votante con NIF: <% out.print(objvotante.getNif());%> ha votado correctamente.</h1>
                        <h3>Gracias por votar.</h3>
                        <a href="../index.jsp" class="btn btn-success btn-lg" role="button">Volver</a>
                    </div>
                </div>
            </div>
        </div>
        <%-- JavaScript Bootstrap --%>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </body>
</html>
