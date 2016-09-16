<%-- 
    Document   : frmUsuario
    Created on : 08/09/2016, 23:16:50
    Author     : josec
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Adicionar novo usu�rio</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <c:choose>
                    <c:when test="${usuario.idFuncionario > 0}">
                        <h2>Editar usu�rio</h2>
                    </c:when>
                    <c:otherwise>
                        <h2>Adicionar novo usu�rio</h2>
                    </c:otherwise>
                </c:choose>

                <div id="editar-dados" class="box">
                    <div class="box-title">
                        <c:choose>
                            <c:when test="${usuario.idFuncionario > 0}">
                                Editar usu�rio - ${usuario.funcionario.nome}
                            </c:when>
                            <c:otherwise>
                                Adicionar novo usu�rio
                            </c:otherwise>
                        </c:choose>
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
                                    <form:input id="nome" type="text" path="funcionario.nome" cssClass="form-control" placeholder="Nome" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o nome" />
                                    <form:errors path="funcionario.nome" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.email" for="email">E-mail</form:label>
                                    <form:input id="email" type="email" path="funcionario.email" cssClass="form-control" placeholder="E-mail" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o e-mail" />
                                    <form:errors path="funcionario.email" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.cpf" for="cpf">CPF</form:label>
                                    <form:input id="cpf" type="text" path="funcionario.cpf" cssClass="form-control" placeholder="CPF" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o CPF (Deve conter 11 n�meros)" pattern="\d{11}" />
                                    <form:errors path="funcionario.cpf" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.funcao" for="funcao">Fun��o</form:label>
                                    <form:input id="funcao" type="text" path="funcionario.funcao" cssClass="form-control" placeholder="Fun��o" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite a fun��o" />
                                    <form:errors path="funcionario.funcao" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.setor" for="setor">Setor</form:label>
                                    <form:input id="setor" type="text" path="funcionario.setor" cssClass="form-control" placeholder="Setor" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o setor" />
                                    <form:errors path="funcionario.setor" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.funcionario.idFuncionario" for="select-chefe">Selecione o chefe</form:label>
                                    <form:select path="funcionario.funcionario.idFuncionario" id="select-chefe" cssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="Selecione o chefe desse funcion�rio">
                                        <form:option value="${0}" label="-- Selecione um chefe --"/>
                                        <form:options items="${funcionarios}" itemValue="idFuncionario" itemLabel="nome"/>
                                    </form:select>
                                    <form:errors path="funcionario.funcionario.idFuncionario" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="nivelAcesso" for="nivelAcesso">Selecione o n�vel de acesso</form:label>
                                    <form:select path="nivelAcesso" id="nivelAcesso" cssClass="form-control" required="required" data-toggle="tooltip" data-placement="bottom" title="Selecione o n�vel de acesso do funcion�rio">
                                        <form:option value="${0}" label="-- Selecione um n�vel --"/>
                                        <form:option value="admin" label="Administrador"/>
                                        <form:option value="comum" label="Comum"/>
                                    </form:select>
                                    <form:errors path="nivelAcesso" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="ativo" for="ativo">Ativo</form:label>
                                    <form:checkbox id="ativo" path="ativo" cssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="O usu�rio pode acessar o sistema?" />
                                </div>
                            </div>
                        </div>
                        <div class="box-separator">Endere�o</div>
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <div class="form-group">
                                    <form:label path="funcionario.logradouro" for="logradouro">Rua</form:label>
                                    <form:input id="logradouro" type="text" path="funcionario.logradouro" cssClass="form-control" placeholder="Rua" data-toggle="tooltip" data-placement="bottom" title="Digite o endere�o" />
                                    <form:errors path="funcionario.logradouro" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6 col-md-2">
                                <div class="form-group">
                                    <form:label path="funcionario.numero" for="numero">N�mero</form:label>
                                    <form:input id="numero" type="text" path="funcionario.numero" cssClass="form-control" placeholder="N�mero" data-toggle="tooltip" data-placement="bottom" title="Digite o n�mero" />
                                    <form:errors path="funcionario.numero" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionario.bairro" for="bairro">Bairro</form:label>
                                    <form:input id="bairro" type="text" path="funcionario.bairro" cssClass="form-control" placeholder="Bairro" data-toggle="tooltip" data-placement="bottom" title="Digite o bairro" />
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
                        </div>
                        <div class="row text-center">
                            <button type="submit" class="btn btn-primary">
                                <span class="fa fa-floppy-o" aria-hidden="true"></span> Salvar
                            </button>
                            <a href="<%=request.getContextPath()%>/admin/gerenciar-usuarios/" id="btn-cancelar-maquina" type="button" class="btn btn-default"><span class="fa fa-times" aria-hidden="true"></span> Cancelar</a>
                        </div>
                    </form:form>
                </div>

            </div><!--Conte�do-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
