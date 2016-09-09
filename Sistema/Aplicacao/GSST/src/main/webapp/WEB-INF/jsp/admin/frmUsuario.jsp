<%-- 
    Document   : frmUsuario
    Created on : 08/09/2016, 23:16:50
    Author     : josec
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Adicionar novo usuário</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Adicionar novo usuário</h2>

                <div id="editar-dados" class="box">
                    <div class="box-title">
                        Adicionar novo usuário
                    </div>
                    <form:form action="salvar-usuario" id="frmUsuario" commandName="usuario" method="POST">
                        <div class="row">
                            <div class="col-sm-12">
                                ${msgUsuario.getAlert()}
                            </div>
                        </div>
                        <form:input id="idFuncionario" type="hidden" path="idFuncionario" required="required" />
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.nome" for="nome">Nome</form:label>
                                    <form:input id="nome" type="text" path="funcionario.nome" cssClass="form-control" placeholder="Nome" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite seu nome" />
                                    <form:errors path="funcionario.nome" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.email" for="email">E-mail</form:label>
                                    <form:input id="email" type="email" path="funcionario.email" cssClass="form-control" placeholder="E-mail" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite seu e-mail" />
                                    <form:errors path="funcionario.email" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <div class="form-group">
                                    <form:label path="funcionario.logradouro" for="logradouro">Rua</form:label>
                                    <form:input id="logradouro" type="text" path="funcionario.logradouro" cssClass="form-control" placeholder="Rua" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite seu endereço" />
                                    <form:errors path="funcionario.logradouro" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6 col-md-2">
                                <div class="form-group">
                                    <form:label path="funcionario.numero" for="numero">Número</form:label>
                                    <form:input id="numero" type="text" path="funcionario.numero" cssClass="form-control" placeholder="Número" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite seu número" />
                                    <form:errors path="funcionario.numero" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.bairro" for="bairro">Bairro</form:label>
                                    <form:input id="bairro" type="text" path="funcionario.bairro" cssClass="form-control" placeholder="Bairro" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite seu bairro" />
                                    <form:errors path="funcionario.bairro" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.complemento" for="complemento">Complemento</form:label>
                                    <form:input id="complemento" type="text" path="funcionario.complemento" cssClass="form-control" placeholder="Complemento" data-toggle="tooltip" data-placement="bottom" title="Digite o complemento" />
                                    <form:errors path="funcionario.complemento" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.contato" for="contato">Contato</form:label>
                                    <form:input id="contato" type="text" path="funcionario.contato" cssClass="form-control" placeholder="Contato" data-toggle="tooltip" data-placement="bottom" title="Digite um meio de contato" />
                                    <form:errors path="funcionario.contato" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="senha" for="senha">Senha</form:label>
                                    <form:input id="senha" type="password" path="senha" cssClass="form-control" placeholder="Senha" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite sua senha" />
                                    <form:errors path="senha" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="box-separator">Nova Senha</div>
                        <div id="nova-senha-erro" class="alert alert-danger" style="display: none;">A nova senha deve ser igual à sua confirmação</div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="nova-senha">Senha</label>
                                    <input id="nova-senha" name="nova-senha" type="password" class="form-control" placeholder="Nova Senha" data-toggle="tooltip" data-placement="bottom" title="Caso queira modificar sua senha, digite a nova senha" />
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="confirmar-nova-senha">Confirmar nova senha</label>
                                    <input id="confirmar-nova-senha" name="confirmar-nova-senha" type="password" class="form-control" placeholder="Confirmar nova senha" data-toggle="tooltip" data-placement="bottom" title="Confirme a nova senha" />
                                </div>
                            </div>
                        </div>
                        <div class="row text-center">
                            <input type="submit" class="btn btn-primary" value="Salvar" />
                            <a href="<%=request.getContextPath()%>" id="btn-cancelar-maquina" type="button" class="btn btn-default">Cancelar</a>
                        </div>
                    </form:form>
                </div>

            </div><!--Conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
