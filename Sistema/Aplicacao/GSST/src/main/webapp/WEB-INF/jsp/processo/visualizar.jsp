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
        <div class="modal fade" id="modal-resolucao" tabindex="-1" role="dialog" aria-labelledby="modal-nrs-label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modal-nrs-label">
                            Resolver processo
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form id="frmResolucao" action="resolver" method="POST">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label for="resolucao">Descrição da resolução</label>
                                        <textarea id="resolucao" name="resolucao" placeholder="Descrição da resolução" class="form-control" required="required" data-toggle="tooltip" data-placement="bottom" title="Descreva os passos efetuados para resolução deste processo"></textarea>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="alert alert-danger"><h4>ATENÇÃO</h4>A resolução do processo é irreversível.</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        <button form="frmResolucao" type="submit" class="btn btn-primary">Resolver</button>
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
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-resolucao" ${usuarioLogado.nivelAcesso == 'admin' || usuarioLogado.idFuncionario == p.funcionarioByIdRelator.idFuncionario || usuarioLogado.idFuncionario == p.funcionarioByIdRespCorrecao.idFuncionario ? '' : 'disabled data-toggle="tooltip" data-placement="bottom" title="Apenas os reponsáveis pelo processo tem permissão para resolvê-lo"'}>
                                <span class="fa fa-check" aria-hidden="true"></span> Resolver processo
                            </button>
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
                        <div class="col-xs-12">
                            <b>Máquina:</b> ${p.maquina.descricao} (${p.maquina.numPatrimonio})
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            <b>Localizada:</b> ${p.localizacao}
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <b>Setor:</b> ${p.setor}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            <b>Relatado por:</b> ${p.funcionarioByIdRelator.nome}
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <b>Relatado em:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.data}" />
                        </div>
                    </div>
                    <div class="row">
                        <c:if test="${p.funcionarioByIdRespCorrecao.nome != null}">
                            <div class="col-sm-6 col-xs-12">
                                <b>Reponsável pela correção:</b> ${p.funcionarioByIdRespCorrecao.nome}
                            </div>
                        </c:if>
                        <c:if test="${p.prazo != null}">
                            <div class="col-sm-6 col-xs-12">
                                <b>Meta de correção:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.prazo}" />
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${p.estado.equals('resolvido')}">
                        <div class="row">
                            <div class="col-sm-6 col-xs-12">
                                <b>Rosolvido por:</b> ${p.funcionarioByIdResolucao.nome}
                            </div>
                            <div class="col-sm-6 col-xs-12">
                                <b>Resolvido em:</b> <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.dataResolucao}" />
                            </div>
                        </div>
                    </c:if>

                    <div class="box-separator">
                        Normas em não conformidade
                    </div>

                    <ul class="list-group">
                        <c:forEach var="nr" items="${p.getNrs()}">
                            <a target="nr" href="<%=request.getContextPath()%>/user/normas-regulamentadoras/${nr.getNumero().replace(".","-")}">
                                <li class="list-group-item">
                                    Norma Regulamentadora Nº ${nr.getNumero()} - ${nr.getDescricao()}
                                </li>
                            </a>
                        </c:forEach>
                    </ul>

                    <div class="box-separator">Medida Corretiva</div>
                    <p>${p.medidaCorretiva.replaceAll('\\n','</p><p>')}</p>

                    <c:if test="${p.estado.equals('resolvido')}">
                        <div class="box-separator">Descrição da resolução</div>
                        <p>${p.resolucao.replaceAll('\\n','</p><p>')}</p>
                    </c:if>

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
                    direction: "horizontal"
                });
            });
        </script>
    </body>
</html>