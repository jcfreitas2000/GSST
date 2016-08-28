<%-- 
    Autor: José Carlos de Freitas
    Data: 11/07/2016, 12:09:22
    Arquivo: cadastrarProcesso
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Segurança é vida</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <!-- Modal para escolha de NRs -->
        <div class="modal fade" id="modal-nrs" tabindex="-1" role="dialog" aria-labelledby="modal-nrs-label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modal-nrs-label">${nr == null ? "Normas Regulamentadoras" : "Norma Regulamentadora Nº  ".concat(nr.getNumero())}</h4>
                    </div>
                    <div class="modal-body">
                        <ul class="list-group">
                            <c:forEach var="nr" items="${nrs}">
                                <a href="#" onclick="ajaxNr('${nr.getNumero().replace(".","-")}')">
                                    <li class="list-group-item">
                                        <span class="badge">${nr.getNrs().size()}</span>
                                        Norma Regulamentadora Nº ${nr.getNumero()} - ${nr.getDescricao()}
                                    </li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        <button id="adicionar-nr" type="button" class="btn btn-primary" style="display: none;">Adicionar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Processos</h2>

                <div id="maquina" style="display: none;" class="box">
                    <div class="box-title">
                        Máquina
                    </div>
                    <form:form action="salvar-maquina" id="frmMaquina" commandName="maquina" method="POST">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="numPatrimonio" for="numPatrimonio">Número de patrimônio</form:label>
                                    <form:input id="numPatrimonio" type="text" path="numPatrimonio" cssClass="form-control" placeholder="Número de pratrimônio" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o número de patrimônio da máquina" />
                                    <form:errors path="numPatrimonio" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="descricao" for="descricao">Descrição</form:label>
                                    <form:textarea id="descricao" type="text" path="descricao" cssClass="form-control" placeholder="Descrição" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite a descrição da máquina" />
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
                    <form:form action="salvar-processo" id="frmProcesso" commandName="processo" enctype="multipart/form-data" method="POST">
                        <div class="row">
                            <div class="col-sm-12">
                                ${msgProcesso.getAlert()}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="maquina.idMaquina">Selecione a máquina</form:label>
                                        <div class="input-group">
                                        <form:select path="maquina.idMaquina" id="select-maquina" cssClass="form-control" required="required" data-toggle="tooltip" data-placement="bottom" title="Selecione a máquina">
                                            <option value="">-- Selecione uma máquina --</option>
                                            <form:options items="${maquinas}" itemValue="idMaquina" itemLabel="numPatrimonio"/>
                                        </form:select>
                                        <span class="input-group-btn">
                                            <button id="btn-maquina" type="button" class="btn btn-primary">
                                                <span class="fa fa-plus" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div>
                                    <form:errors path="maquina.idMaquina" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Adicionar fotos</label>
                                    <input id="imagens" name="imagens" type="file" multiple />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="localizacao" for="localizacao">Localização</form:label>
                                    <form:input id="localizacao" type="text" path="localizacao" cssClass="form-control" placeholder="Localização" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite a localização da máquina" />
                                    <form:errors path="localizacao" cssStyle="color:red"/>
                                </div>
                            </div>  
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="setor" for="setor">Setor</form:label>
                                    <form:input id="setor" type="text" path="setor" cssClass="form-control" placeholder="Setor" required="required" data-toggle="tooltip" data-placement="bottom" title="Digite o setor da máquina" />
                                    <form:errors path="setor" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <input type="hidden" id="arrayNrs" name="arrayNrs" />
                                    <label>
                                        Selecione as Normas Regulamentadoras
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-nrs">
                                            <span class="fa fa-plus" aria-hidden="true"></span>
                                        </button>
                                    </label>
                                    <ul id="lista-nrs" class="list-group">

                                    </ul>
                                    <div id="erro-nr" style="display: none;" class="alert alert-danger">
                                        Adicione ao menos uma Norma Relugamentadora
                                    </div>
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
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="funcionarioByIdRespCorrecao.idFuncionario" for="funcionarioByIdRespCorrecao">Funcionário responsável</form:label>
                                    <form:select path="funcionarioByIdRespCorrecao.idFuncionario" id="funcionarioByIdRespCorrecao" cssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="Selecione o funcionário responsável por corrigir esse processo.">
                                        <option value="${0}">-- Selecione um funcionário --</option>
                                        <form:options items="${funcionarios}" itemValue="idFuncionario" itemLabel="nome"/>
                                    </form:select>
                                    <form:errors path="funcionarioByIdRespCorrecao.idFuncionario" cssStyle="color:red"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <form:label path="prazo" for="prazo">Prazo para correção</form:label>
                                    <form:input id="prazo" type="text" path="prazo" cssClass="form-control" placeholder="Prazo para correção" data-toggle="tooltip" data-placement="bottom" title="Digite o prazo para correção do processo" readonly="true" />
                                    <form:errors path="prazo" cssStyle="color:red"/>
                                </div>
                            </div>
                        </div>
                        <div class="row text-center">
                            <input type="submit" class="btn btn-primary" value="Salvar" />
                            <a href="." class="btn btn-default">Cancelar</a>
                        </div>
                    </form:form>
                </div>
            </div><!--Fim conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <!--JS da página-->
        <script src="<%=request.getContextPath()%>/resources/js/frmProcessos.js" type="text/javascript"></script>
    </body>
</html>
