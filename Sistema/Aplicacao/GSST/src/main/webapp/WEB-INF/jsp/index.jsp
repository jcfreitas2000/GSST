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
        <!-- Modal para escolha de NRs -->
        <div class="modal fade" id="modal-nrs" tabindex="-1" role="dialog" aria-labelledby="modal-nrs-label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modal-nrs-label">${nr == null ? "Normas Regulamentadoras" : "Norma Regulamentadora N�  ".concat(nr.getNumero())}</h4>
                    </div>
                    <div class="modal-body">
                        <ul class="list-group">
                            <c:forEach var="nr" items="${nrs}">
                                <a href="#" onclick="ajaxNr(${nr.getNumero().replace(".","-")})">
                                    <li class="list-group-item">
                                        <span class="badge">${nr.getNrs().size()}</span>
                                        Norma Regulamentadora N� ${nr.getNumero()} - ${nr.getDescricao()}
                                    </li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary">Adicionar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <h2>Processos</h2>

                <div id="maquina" style="display: none;" class="box">
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
                            <input id="btn-cancelar-maquina" type="button" class="btn btn-default" value="Cancelar" />
                        </div>
                    </form:form>
                </div>

                <div id="processo" class="box">
                    <div class="box-title">
                        Processo
                    </div>
                    <form:form action="salvar-processo" id="frmProcesso" commandName="Processo" method="POST">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="maquina">Selecione a m�quina</form:label>
                                        <div class="input-group">
                                        <form:select path="maquina" id="select-maquina" cssClass="form-control" required="required" data-toggle="tooltip" data-placement="bottom" title="Selecione a m�quina">
                                            <option value="0">Selecione uma m�quina</option>
                                            <form:options items="${maquinas}" itemValue="idMaquina" itemLabel="numPatrimonio"/>
                                        </form:select>
                                        <span class="input-group-btn">
                                            <button id="btn-maquina" type="button" class="btn btn-primary">
                                                <span class="fa fa-plus" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div>
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
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <form:label path="nrs">Selecione a Norma Regulamentadora</form:label>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal-nrs">
                                            Launch demo modal
                                        </button>
                                    <form:errors path="nrs" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <form:label path="medidaCorretiva" for="medidaCorretiva">Medida Corretiva</form:label>
                                    <form:textarea id="medidaCorretiva" type="text" path="medidaCorretiva" cssClass="form-control" placeholder="Medida Corretiva" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite a medida corretiva para o processo" />
                                    <form:errors path="medidaCorretiva" cssStyle="color:red"/>
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
        <script src="<%=request.getContextPath()%>/resources/js/processos.js" type="text/javascript"></script>
    </body>
</html>
