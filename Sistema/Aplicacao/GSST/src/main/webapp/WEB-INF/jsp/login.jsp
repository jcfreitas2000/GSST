<%-- 
    Autor: José Carlos de Freitas
    Data: 10/07/2016, 23:46:16
    Arquivo: index
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Segurança é vida</title>
        
        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>

    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <img class="img-center" src="<%=request.getContextPath()%>/resources/imagens/logo.png" alt="gsst"/>
            <div class="text-center">
                <h2>
                    Bem vindo ao sistema GSSTSV 
                    <small><br>Faça login para continuar</small>
                </h2>
            </div>

            <!--Conteúdo-->
            <section class="container">
                <div class="box box-center">
                    ${mensagem.getMensagem()}
                    <form action="login" method="POST">
                        <div class="form-group">
                            <label for="login">Login</label>
                            <input type="email" class="form-control" name="funcionario.email" id="login" placeholder="Login" value="${email}" required />
                            <form:errors path="usuario.funcionario.email" cssStyle="color:red"/>
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha</label>
                            <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha" required />
                            <form:errors path="usuario.senha" cssStyle="color:red"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-logar" value="Logar" />
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
