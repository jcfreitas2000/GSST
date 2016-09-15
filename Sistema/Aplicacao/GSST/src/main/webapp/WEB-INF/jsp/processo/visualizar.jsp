<%-- 
    Autor: José Carlos de Freitas
    Data: 14/08/2016, 12:56:42
    Arquivo: visualizar
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Processo ${p.idProcesso}</title>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
        <link href="<%=request.getContextPath()%>/resources/plugins/FlexSlider-2.6.2/flexslider.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Modal para resolução de processos -->
        <div class="modal fade" id="modal-nrs" tabindex="-1" role="dialog" aria-labelledby="modal-nrs-label">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modal-nrs-label">
                            ${nr == null ? "Normas Regulamentadoras" : "Norma Regulamentadora Nº  ".concat(nr.getNumero())}
                            <img id="loading-nr" src="<%=request.getContextPath()%>/resources/imagens/loading.gif" style="display: none;">
                        </h4>
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

                <c:if test="${p.estado.equals('pendente')}">
                    <div class="clearfix">
                        <div class="pull-right">
                            <a href="resolver" class="btn btn-primary" ${usuarioLogado.nivelAcesso == 'admin' || usuarioLogado.idFuncionario == p.funcionarioByIdRelator.idFuncionario || usuarioLogado.idFuncionario == p.funcionarioByIdRespCorrecao.idFuncionario ? '' : 'disabled data-toggle="tooltip" data-placement="bottom" title="Apenas os reponsáveis pelo processo tem permissão para resolvê-lo"'}><span class="fa fa-check" aria-hidden="true"></span> Resolver processo</a>
                        </div>
                    </div>
                </c:if>
                
                <div>
                    ${msgProcesso.getAlert()}
                </div>

                <div class="box clearfix">
                    <div class="box-title">
                        Processo ${p.idProcesso}
                        <div class="pull-right ${p.estado}">
                            <span class="fa ${p.estado.equals('resolvido') ? 'fa fa-check-circle':'fa-exclamation-circle'}" aria-hidden="true"></span>
                            <b>${p.estado.toUpperCase()}</b>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <b>Máquina:</b> ${p.maquina.descricao} (${p.maquina.numPatrimonio})
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <b>Localizada:</b> ${p.localizacao}
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <b>Setor:</b> ${p.setor}
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <b>Medida Corretiva:</b> ${p.medidaCorretiva}
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <b>Relatado por:</b> ${p.funcionarioByIdRelator.nome}
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <b>Relatado em:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.data}" />
                        </div>
                        <c:if test="${p.funcionarioByIdRespCorrecao.nome != null}">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <b>Reponsável pela correção:</b> ${p.funcionarioByIdRespCorrecao.nome}
                            </div>
                        </c:if>
                        <c:if test="${p.prazo != null}">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <b>Meta de correção:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.prazo}" />
                            </div>
                        </c:if>
                    </div>

                    <div class="box-separator">
                        Normas em não conformidade
                    </div>

                    <ul class="list-group">
                        <c:forEach var="aux" items="${p.getNrs()}">
                            <a href="#">
                                <li class="list-group-item">
                                    Norma Regulamentadora Nº ${aux.getNumero()} - ${aux.getDescricao()}
                                </li>
                            </a>
                        </c:forEach>
                    </ul>

                    <c:if test="${p.numFotos > 0}">
                        <div class="margin-top clearfix">
                            <div class="slider">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <c:forEach begin="1" end="${p.numFotos}" var="i">
                                            <li>
                                                <img src="<%=request.getContextPath()%>/processoFoto?processo=${p.idProcesso}&img=${i}" />
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div><!--Fim conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <script src="<%=request.getContextPath()%>/resources/plugins/FlexSlider-2.6.2/jquery.flexslider-min.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.flexslider').flexslider({
                    direction: "horizontal",
                    itemMargin: 5
                });
            });
        </script>
    </body>
</html>