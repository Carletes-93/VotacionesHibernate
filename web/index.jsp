<%-- 
    Document   : index
    Created on : 07-feb-2017, 13:06:52
    Author     : carlos
    Pruebaaa rama carlos!
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Elecciones Generales 2016</h1>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <form role="form" class="form-horizontal" id="form" action="dispatcher">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nif">NIF</label>
                                        <div class="col-md-8">
                                            <input type="text" name="NIF" class="form-control" id="nif" placeholder="NIF" minlength=9 maxlength=9 required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="pass">Contraseña</label>
                                        <div class="col-md-8">
                                            <input type="password" name="PASS" class="form-control" id="pass" placeholder="Contraseña" minlength=4 required>
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="Alta" id="alta" class="btn btn-default btnvot">Alta</button>
                                    <button type="submit" name="action" value="Baja" id="baja" class="btn btn-default btnvot">Baja</button>
                                    <button type="submit" name="action" value="Votar" id="votar" class="btn btn-primary btnvot">Votar</button>
                                    <button type="submit" name="action" value="CambiarPass" id="cambpass" class="btn btn-warning btnvot">Cambiar Contraseña</button>
                                </form>
                            </div>
                            <div class="col-md-6 col-md-offset-3">
                                <form role="form" class="form-horizontal" action="dispatcher">
                                    <button type="submit" name="action" value="Censo" id="censo" class="btn btn-info btnfin">Censo</button>
                                    <button type="button" id="crresc" class="btn btn-primary btnfin" onclick="cerrarEscrutinio()">Cerrar Escrutinio</button>
                                </form>
                            </div>
                            <div class="col-md-4 col-md-offset-4">
                                <form role="form" class="form-horizontal" action="dispatcher">
                                    <button type="submit" name="action" value="Resultados" class="btn btn-success btn-block btnres" id="result" style="visibility: hidden;">Resultados</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- JavaScript Bootstrap --%>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </body>
</html>
