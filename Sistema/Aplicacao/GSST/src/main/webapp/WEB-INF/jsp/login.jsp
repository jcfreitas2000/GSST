<%-- 
    Autor: José Carlos de Freitas
    Data: 10/07/2016, 23:46:16
    Arquivo: index
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GSST - Segurança é vida</title>

        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Bootstrap 3.3.6 -->
        <link href="resources/plugins/bootstrap-3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--Folha de estilos-->
        <link href="resources/css/estilos.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <img class="img-center" src="resources/imagens/logo.png" alt="gsst"/>
            <div class="text-center">
                <h2>
                    Bem vindo ao sistema GSSTSV 
                    <small><br>Faça login para continuar</small>
                </h2>
            </div>

            <!--Conteúdo-->
            <section class="container">
                <div class="box box-center">
                    <form action="index" method="POST">
                        <div class="form-group">
                            <label for="login">Login</label>
                            <input type="text" class="form-control" id="login" placeholder="Login">
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha</label>
                            <input type="password" class="form-control" id="senha" placeholder="Senha">
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-logar" value="Logar">
                        </div>
                    </form>
                    <div class="text-right">
                        <a href="#">Problemas para conectar?</a>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
