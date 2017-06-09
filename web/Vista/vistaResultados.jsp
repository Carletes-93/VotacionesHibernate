<%-- 
    Document   : vistaResultados
    Created on : 18-dic-2016, 16:59:53
    Author     : carlos
--%>

<%@page import="Pojo.Candidato"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pojo.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Partido> aPartidosResultados = (ArrayList<Partido>) session.getAttribute("resultado_partidos");
    ArrayList<Candidato> aCandidatosResultados = (ArrayList<Candidato>) session.getAttribute("resultado_candidatos");
    int totalvotos = Integer.parseInt(session.getAttribute("total_votos").toString());
    int totalvotantes = Integer.parseInt(session.getAttribute("total_votantes").toString());
    double porcentaje;
    float porcentajeganador = (float) aPartidosResultados.get(0).getNumVotos() / (float) totalvotos * 100;
    double abs = Math.abs((((float) totalvotos / (float) totalvotantes) * 100) - 100);
    DecimalFormat df = new DecimalFormat("0.00");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Resultados Elecciones generales 2016</h1>
                        <h5>100% Escrutado</h5>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <p><b>Total votantes del censo:</b> <% out.print(totalvotantes);%></p>
                        </div>
                        <div class="col-md-4">
                            <p><b>Total votos registrados:</b> <% out.print(totalvotos);%></p>
                        </div>
                        <div class="col-md-4">
                            <p><b>Abstención:</b> <% out.print(df.format(abs));%>%</p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-2 col-md-offset-1">
                            <img src="<% out.print(aPartidosResultados.get(0).getLogo()); %>" class="img-rounded img-win" alt="<% out.print(aPartidosResultados.get(0).getNombre()); %>">
                        </div>
                        <div class="col-md-8">
                            <h4><% out.print(aPartidosResultados.get(0).getNombre()); %> ha ganado las elecciones con un <% out.print(df.format(porcentajeganador)); %>% de los votos.</h4>
                        </div>
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        <table class="table table-hover">
                            <thead>
                                Resultados 2016 por partidos
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < aPartidosResultados.size(); i++) { %>
                                <tr>
                                    <td class="success" style="width: 40%;">
                                        <img src="<% out.print(aPartidosResultados.get(i).getLogo()); %>" alt="<% out.print(aPartidosResultados.get(i).getNombre()); %>" class="img-rounded img-tabla"> 
                                    </td>
                                    <td>
                                        <% out.print(aPartidosResultados.get(i).getNombre()); %>
                                    </td>
                                    <td>
                                        Votos: <% out.print((int)aPartidosResultados.get(i).getNumVotos()); %>
                                    </td>
                                    <td>
                                        Porcentaje: 
                                        <%
                                            porcentaje = (float) aPartidosResultados.get(i).getNumVotos() / (float) totalvotos * 100;
                                            out.print(df.format(porcentaje));
                                        %>
                                        %
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <table class="table table-hover">
                            <thead>
                                Candidatos elegidos
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < aCandidatosResultados.size(); i++) { %>
                                <tr>
                                    <td class="success">
                                        <% out.print(i); %>
                                    </td>
                                    <td>
                                        <% out.print(aCandidatosResultados.get(i).getNombre()); %>
                                    </td>
                                    <td style="width: 40%">
                                        <img src="<% out.print(aPartidosResultados.get(i).getLogo()); %>" alt="<% out.print(aPartidosResultados.get(i).getNombre()); %>" class="img-rounded img-tabla">
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>

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
