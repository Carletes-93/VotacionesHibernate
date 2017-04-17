<%-- 
    Document   : confBaja
    Created on : 15-dic-2016, 19:04:04
    Author     : carlos
--%>

<%@page import="Pojo.Votante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar Baja</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <% Votante objvotante = (Votante) session.getAttribute("votante");%>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>¿Quieres dar de baja el siguiente votante?</h1>
                        <h3>NIF: <% out.print(objvotante.getNif());%></h3>
                        <div class="col-md-6 col-md-offset-3">
                            <form role="form" class="form-horizontal" action="../controladorConfBaja">
                                <button type="submit" name="confBaja" value="Si" class="btn btn-info btnfin">Si</button>
                                <button type="submit" name="confBaja" value="No" class="btn btn-info btnfin">No</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- JavaScript Bootstrap --%>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </body>
</html>
