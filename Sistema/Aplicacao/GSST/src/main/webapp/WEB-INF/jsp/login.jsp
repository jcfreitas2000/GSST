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
        <!-- Modal para recuperação de senha -->
        <div class="modal fade" id="modal-recupercao-senha" tabindex="-1" role="dialog" aria-labelledby="modal-nrs-label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modal-nrs-label">
                            Recuperar senha
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form id="frmRecuperaSenha" action="recuperar-senha" method="POST">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="recuperar-senha-email">E-mail</label>
                                        <input type="email" id="recuperar-senha-email" name="recuperar-senha-email" placeholder="E-mail" class="form-control" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite seu e-mail cadastrado" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        <button form="frmRecuperaSenha" type="submit" class="btn btn-primary">Enviar senha</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="wraper">
            <!--Cabeçalho-->
            <img class="img-center" src="${pageContext.request.contextPath}/resources/imagens/logo.png" alt="gsst"/>
            <div class="text-center">
                <h2>
                    Bem vindo ao sistema GSSTSV 
                    <small><br>Faça login para continuar</small>
                </h2>
            </div>

            <!--Conteúdo-->
            <section class="container">
                <div class="box box-center">
                    ${mensagem.getAlert()}
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
                            <button type="submit" class="btn btn-primary btn-logar">
                                <span class="fa fa-sign-in" aria-hidden="true"></span> Entrar
                            </button>
                        </div>
                    </form>
                    <div class="text-right">
                        <a href="#modal-recupercao-senha" data-toggle="modal" data-target="#modal-recupercao-senha">
                            Problemas para conectar?
                        </a>
                    </div>
                </div>
            </section>
        </div>

        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
