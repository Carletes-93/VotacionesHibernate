<%-- 
    Document   : vistaError
    Created on : 18-dic-2016, 18:22:17
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Integer codigo = (Integer) session.getAttribute("error");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Se ha producido un error</h1>
                        <% if (codigo == 1){%>
                        <h4>Error</h4>
                        <p>Error al registrar el votante en la base de datos.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 2){%>
                        <h4>Error</h4>
                        <p>El votante no ha sido dado de alta en la base de datos.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 3){%>
                        <h4>Error /h4>
                        <p>El votante ya ha votado y no puede ser dado de baja.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 4){%>
                        <h4>Error</h4>
                        <p>Error al cargar los partidos de la base de datos.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 5){%>
                        <h4>Error</h4>
                        <p>El votante no puede votar porque no ha sido dado de alta en la base de datos.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 6){%>
                        <h4>Error</h4>
                        <p>El votante no puede registrar su voto porque ya ha votado.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 7){%>
                        <h4>Error</h4>
                        <p>Error al registrar el voto en la base de datos.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 8){%>
                        <h4>Error</h4>
                        <p>Error al mostrar el censo.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 9){%>
                        <h4>Error</h4>
                        <p>Error al mostrar el resultado de las elecciones.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
                        <% if (codigo == 10){%>
                        <h4>Error</h4>
                        <p>Error al cambiar la contraseña.</p>
                        <h5>Codigo de error: <% out.print(codigo); %></h5>
                        <% }%>
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
