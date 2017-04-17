<%-- 
    Document   : eleccionVoto
    Created on : 16-dic-2016, 10:35:39
    Author     : carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Pojo.Partido"%>
<%@page import="Pojo.Votante"%>
<% Votante objvotante = (Votante) session.getAttribute("votante");%>
<% ArrayList<Partido> aPartidos = (ArrayList<Partido>) session.getAttribute("partidos"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Votar</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Selecciona el partido que quieres votar</h1>
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        <form role="form" class="form-horizontal" action="../controladorConfVoto">
                            <div class="form-group">
                                <table class="table table-hover">
                                    <thead>
                                        Selecciona un partido:
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < aPartidos.size(); i++) { %>
                                        <tr>
                                            <td class="success">
                                                <% out.print(aPartidos.get(i).getNombre()); %> 
                                            </td>
                                            <td>
                                                <img src="<% out.print(aPartidos.get(i).getLogo()); %>" alt="<% out.print(aPartidos.get(i).getNombre()); %>" class="img-rounded" style="width: 30%;">
                                            </td>
                                            <td>
                                                <input type="radio" name="partido" value="<% out.print(aPartidos.get(i).getNombre()); %>" required>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-4 col-md-offset-4">
                                <button type="submit" name="votar" value="Votar" class="btn btn-success btn-block btnfin">Votar</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        <form role="form" class="form-horizontal" action="../controladorConfVoto">
                            <div class="col-md-4 col-md-offset-4">
                                <button type="submit" name="votar" value="Volver" class="btn btn-success btn-block btnfin">Volver</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%-- JavaScript Bootstrap --%>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </body>
</html>
