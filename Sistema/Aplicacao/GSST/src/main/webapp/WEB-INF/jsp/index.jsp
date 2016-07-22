<%-- 
    Autor: Jos� Carlos de Freitas
    Data: 11/07/2016, 12:09:22
    Arquivo: index
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Seguran�a � vida</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <h2>Processos</h2>

                <div id="adicionar-maquina" class="box hidden">
                    <div class="box-title">
                        Adicionar m�quina
                    </div>
                    <form:form action="salvar-maquina" id="frmMaquina" commandName="maquina" method="POST">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="numPatrimonio" for="numPatrimonio">N�mero de patrim�nio</form:label>
                                    <form:input id="numPatrimonio" type="text" path="numPatrimonio" cssClass="form-control" placeholder="N�mero de pratrim�nio" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o n�mero de patrim�nio da m�quina" />
                                    <form:errors path="numPatrimonio" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="descricao" for="descricao">Descri��o</form:label>
                                    <form:textarea id="descricao" type="text" path="descricao" cssClass="form-control" placeholder="Descri��o" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite a descri��o da m�quina" />
                                    <form:errors path="descricao" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="row text-center">
                            <input type="submit" class="btn btn-primary" value="Salvar" />
                            <input type="button" class="btn btn-default" value="Cancelar" />
                        </div>
                    </form:form>
                </div>

                <div class="box">
                    <div class="box-title">
                        Processo
                    </div>
                    <form:form action="salvar-processo" id="frmProcesso" commandName="processo" method="POST">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="maquina">Selecione a m�quina</form:label>
                                    <form:select path="maquina" id="select-maquina" cssClass="form-control" required="required" data-toggle="tooltip" data-placement="bottom" title="Selecione a m�quina">
                                        <form:option value="Selecione a m�quina" />
                                        <form:options items="${maquinas}" itemValue="idMaquina" itemLabel="numPatrimonio"/>
                                    </form:select>
                                    <form:errors path="maquina" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Adicionar fotos</label>
                                    <input id="input-1" type="file" class="file">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="localizacao" for="localizacao">Localiza��o</form:label>
                                    <form:input id="localizacao" type="text" path="localizacao" cssClass="form-control" placeholder="Localiza��o" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite a localiza��o da m�quina" />
                                    <form:errors path="localizacao" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="setor" for="setor">Setor</form:label>
                                    <form:input id="setor" type="text" path="setor" cssClass="form-control" placeholder="Setor" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o setor da m�quina" />
                                    <form:errors path="setor" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="row text-center">
                            <input type="submit" class="btn btn-primary" value="Salvar" />
                            <input type="button" class="btn btn-default" value="Cancelar" />
                        </div>
                    </form:form>
                </div>

            </div>

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
