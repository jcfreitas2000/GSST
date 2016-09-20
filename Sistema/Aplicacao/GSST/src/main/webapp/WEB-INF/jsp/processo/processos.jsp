<%-- 
    Autor: José Carlos de Freitas
    Data: 11/07/2016, 12:09:22
    Arquivo: processos
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Processos</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    </head>
    <body>
        <!-- Modal para filtro -->
        <div class="modal fade modal-nrs" id="modal-filtro" tabindex="-1" role="dialog" aria-labelledby="modal-nrs-label">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <form:form action="${pageContext.request.contextPath}/user/processos/filtrar/" id="frmFiltro" commandName="filtro" method="POST">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <form:label path="idMaquina">Máquina</form:label>
                                        <form:select path="idMaquina" id="select-maquina" cssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="Filtre por máquina">
                                            <option value="0">-- Selecione uma máquina --</option>
                                            <form:options items="${maquinas}" itemValue="idMaquina" itemLabel="numPatrimonio"/>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <form:label path="localizacao" for="localizacao">Localização</form:label>
                                        <form:input id="localizacao" type="text" path="localizacao" cssClass="form-control" placeholder="Localização" data-toggle="tooltip" data-placement="bottom" title="Digite a localização da máquina" />
                                        <form:errors path="localizacao" cssStyle="color:red"/>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <form:label path="setor" for="setor">Setor</form:label>
                                        <form:input id="setor" type="text" path="setor" cssClass="form-control" placeholder="Setor" data-toggle="tooltip" data-placement="bottom" title="Digite o setor da máquina" />
                                        <form:errors path="setor" cssStyle="color:red"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="box-separator">Referentes à mim</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="checkbox">
                                        <label for="tudo" data-toggle="tooltip" data-placement="bottom" title="Exibir todos">
                                            <input id="tudo" type="checkbox" />
                                            Todos
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="checkbox">
                                        <form:label path="relatadoPorMim" for="relatadoPorMim" data-toggle="tooltip" data-placement="bottom" title="Exibir processos relatados por mim">
                                            <form:checkbox id="relatadoPorMim" path="relatadoPorMim" />
                                            Relatados por mim
                                        </form:label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="checkbox">
                                        <form:label path="minhaResponsabilidade" for="minhaResponsabilidade" data-toggle="tooltip" data-placement="bottom" title="Exibir processos atribuídos à mim">
                                            <form:checkbox id="minhaResponsabilidade" path="minhaResponsabilidade" />
                                            Atribuídos à mim
                                        </form:label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="checkbox">
                                        <form:label path="resolvidoPorMim" for="resolvidoPorMim" data-toggle="tooltip" data-placement="bottom" title="Exibir processos resolvidos por mim">
                                            <form:checkbox id="resolvidoPorMim" path="resolvidoPorMim" />
                                            Resolvidos por mim
                                        </form:label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="box-separator">Datas</div>
                                </div>
                            </div>
                            <div id="datas">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <form:label path="relatadoEmInicial" for="relatadoEmInicial">Relatado em (inicial)</form:label>
                                            <form:input id="relatadoEmInicial" type="text" path="relatadoEmInicial" cssClass="form-control" placeholder="Data inicial" data-toggle="tooltip" data-placement="bottom" title="Filtro para data inicial" readonly="true" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <form:label path="relatadoEmFinal" for="relatadoEmFinal">Relatado em (final)</form:label>
                                            <form:input id="relatadoEmFinal" type="text" path="relatadoEmFinal" cssClass="form-control" placeholder="Data final" data-toggle="tooltip" data-placement="bottom" title="Filtro para data final" readonly="true" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <form:label path="prazoInicial" for="prazoInicial">Prazo (inicial)</form:label>
                                            <form:input id="prazoInicial" type="text" path="prazoInicial" cssClass="form-control" placeholder="Data inicial" data-toggle="tooltip" data-placement="bottom" title="Filtro para data inicial" readonly="true" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <form:label path="prazoFinal" for="prazoFinal">Prazo (final)</form:label>
                                            <form:input id="prazoFinal" type="text" path="prazoFinal" cssClass="form-control" placeholder="Data final" data-toggle="tooltip" data-placement="bottom" title="Filtro para data final" readonly="true" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <form:label path="resolvidoEmInicial" for="resolvidoEmInicial">Resolvido em (inicial)</form:label>
                                            <form:input id="resolvidoEmInicial" type="text" path="resolvidoEmInicial" cssClass="form-control" placeholder="Data inicial" data-toggle="tooltip" data-placement="bottom" title="Filtro para data inicial" readonly="true" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <form:label path="resolvidoEmFinal" for="resolvidoEmFinal">Resolvido em (final)</form:label>
                                            <form:input id="resolvidoEmFinal" type="text" path="resolvidoEmFinal" cssClass="form-control" placeholder="Data final" data-toggle="tooltip" data-placement="bottom" title="Filtro para data final" readonly="true" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <span class="fa fa-times" aria-hidden="true"></span> Fechar
                        </button>
                        <button form="frmFiltro" class="btn btn-primary" type="submit">
                            <span class="fa fa-search" aria-hidden="true"></span> Filtrar
                        </button>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/user/processos/">
                            <span class="fa fa-eraser" aria-hidden="true"></span> Limpar
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Processos 
                    <c:if test="${requestScope['javax.servlet.forward.request_uri'].contains('filtrar')}">
                        <small style="color: #f39c12;">(Filtros ativos)</small>
                    </c:if>
                </h2>

                <div class="clearfix">
                    <div class="pull-left">
                        <button class="btn btn-default" data-toggle="modal" data-target="#modal-filtro">
                            <span class="fa fa-search" aria-hidden="true"></span> Filtrar 
                        </button>
                    </div>
                    <div class="pull-right">
                        <a href="${pageContext.request.contextPath}/user/processos/novo" class="btn btn-primary"><span class="fa fa-tasks" aria-hidden="true"></span> Novo processo</a>
                    </div>
                </div>

                <div>
                    ${msgProcesso.getAlert()}
                </div>

                <div class="row">
                    <c:choose>
                        <c:when test="${processos == '[]'}">
                            <div class="col-xs-12">
                                <div class="alert alert-warning">
                                    <h4>Não há processos</h4>
                                    Não há processos cadastrados.
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${processos}" var="p">
                                <div class="col-xs-12 col-sm-6 col-md-4 ${p.estado}">
                                    <a href="${pageContext.request.contextPath}/user/processos/visualizar/${p.idProcesso}/">
                                        <div class="box box-padronizar">
                                            <span class="fa ${p.estado.equals('resolvido') ? 'fa fa-check-circle':'fa-exclamation-circle'}" aria-hidden="true"></span>
                                            <div class="box-hidden">
                                                <h4>Processo ${p.idProcesso}</h4>
                                                <b>Máquina:</b> ${p.maquina.descricao} (${p.maquina.numPatrimonio})<br>
                                                <c:choose>
                                                    <c:when test="${p.numFotos > 0}">
                                                        <img width="100%" src="${pageContext.request.contextPath}/processoFoto?processo=${p.idProcesso}&img=1&mod=t" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <b>Localizada:</b> ${p.localizacao}<br>
                                                        <b>Setor:</b> ${p.setor}<br>
                                                        <b>Medida Corretiva:</b> ${p.medidaCorretiva.length() > 20 ? p.medidaCorretiva.substring(0, 20).trim().concat('...') : p.medidaCorretiva}<br>
                                                        <b>Relatado por:</b> ${p.funcionarioByIdRelator.nome}<br>
                                                        <b>Relatado em:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.data}" /><br>
                                                        <c:if test="${p.funcionarioByIdRespCorrecao.nome != null}">
                                                            <b>Resp. correção:</b> ${p.funcionarioByIdRespCorrecao.nome}<br>
                                                        </c:if>
                                                        <c:if test="${p.prazo != null}">
                                                            <b>Meta de correção:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.prazo}" />
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:if test="${processos != '[]'}">
                    <div class="clearfix">
                        <div class="pull-left">
                            Exibindo ${num*porPagina-porPagina+1}-${(num*porPagina) > total ? total : (num*porPagina)} de ${total} registros.
                        </div>
                        <div class="pull-right">
                            <c:if test="${num-2 > 1}">
                                <a href="1" class="btn btn-default">Primeira</a>
                            </c:if>
                            <div class="btn-group" role="group" aria-label="...">
                                <a href="${num-1}" class="btn btn-default ${num-1 > 0 && num-1 < count ? '' : 'disabled'}">Anterior</a>
                                <c:if test="${num-2 > 0 && num-2 < count}">
                                    <a href="${num-2}" class="btn btn-default">${num-2}</a>
                                </c:if>
                                <c:if test="${num-1 > 0 && num-1 < count}">
                                    <a href="${num-1}" class="btn btn-default">${num-1}</a>
                                </c:if>

                                <a href="${num}" class="btn btn-primary">${num}</a>

                                <c:if test="${num+1 > 0 && num+1 <= count}">
                                    <a href="${num+1}" class="btn btn-default">${num+1}</a>
                                </c:if>
                                <c:if test="${num+2 > 0 && num+2 <= count}">
                                    <a href="${num+2}" class="btn btn-default">${num+2}</a>
                                </c:if>
                                <a href="${num+1}" class="btn btn-default ${num+1 > 0 && num+1 <= count ? '' : 'disabled'}">Seguinte</a>
                            </div>
                            <c:if test="${num+2 < count}">
                                <a href="${count}" class="btn btn-default">Última</a>
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </div><!--Fim conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <script src="${pageContext.request.contextPath}/resources/js/processos.js" type="text/javascript"></script>
    </body>
</html>
