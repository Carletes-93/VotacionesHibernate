<%-- 
    Document   : vistaCenso
    Created on : 17-dic-2016, 19:31:25
    Author     : carlos
--%>

<%@page import="Pojo.Votante"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Votante> aVotantes = (ArrayList<Votante>) session.getAttribute("censo"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Censo</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Censo</h1>
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        <table class="table table-hover">
                            <tbody>
                                <% for (int i = 0; i < aVotantes.size(); i++) { %>
                                <tr>
                                    <td class="success">
                                        NIF:
                                    </td>
                                    <td>
                                        <% out.print(aVotantes.get(i).getNif()); %>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <div class="col-md-4 col-md-offset-4">
                            <a href="../index.jsp" class="btn btn-info btn-lg" role="button">Volver</a>
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
