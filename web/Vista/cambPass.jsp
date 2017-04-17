<%-- 
    Document   : cambPass
    Created on : 20-feb-2017, 13:20:06
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar Contraseña</title>
        <link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="../MiCSS/css.css" type="text/css" rel="stylesheet">
        <script src="../MiJS/js.js"></script>
    </head>
    <body>
        <div class="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Cambiar Contraseña del votante</h1>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <form role="form" class="form-horizontal" id="form" action="controladorConfCambPass">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="passnueva">Contraseña Nueva</label>
                                        <div class="col-md-8">
                                            <input type="password" name="PASSN" class="form-control" id="passnueva" placeholder="Contraseña Nueva" minlength=4 required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="passnuevaconf">Repita Contraseña Nueva</label>
                                        <div class="col-md-8">
                                            <input type="password" name="PASSNC" class="form-control" id="passnuevaconf" placeholder="Repita Contraseña Nueva" minlength=4 required>
                                        </div>
                                    </div>
                                    <button type="submit" name="action" value="Cambiar" id="camb" class="btn btn-default btnvot">Cambiar Contraseña</button>
                                </form>
                            </div>
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
