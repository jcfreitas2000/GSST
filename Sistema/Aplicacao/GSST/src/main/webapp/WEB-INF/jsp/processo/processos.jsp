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
        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Processos</h2>

                <div class="clearfix">
                    <div class="pull-left">
                        <!--                        <div class="dropdown">
                                                    <button class="btn btn-default dropdown-toggle" type="button" id="filtrar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                        <span class="fa fa-search" aria-hidden="true"></span> Filtrar 
                                                        <span class="caret"></span>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="filtrar">
                                                        teste
                                                    </div>
                                                </div>-->

                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="fa fa-search" aria-hidden="true"></span> Filtrar 
                                <span class="caret"></span>
                            </button>
                            <div class="box dropdown-menu">
                                <div class="dropdown-menu-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="fa fa-user" aria-hidden="true"></span> ${usuarioLogado.funcionario.nome}
                                        </div>
                                    </div>
                                </div>
                                <div class="dropdown-menu-footer clearfix text-center">
                                    <button class="btn btn-primary" type="submit"><span class="fa fa-search" aria-hidden="true"></span> Filtrar</button>
                                    <a class="btn btn-default" href="."><span class="fa fa-eraser" aria-hidden="true"></span> Limpar</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="pull-right">
                        <a href="novo" class="btn btn-primary"><span class="fa fa-tasks" aria-hidden="true"></span> Novo processo</a>
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
                                    <a href="visualizar/${p.idProcesso}/">
                                        <div class="box box-padronizar">
                                            <span class="fa ${p.estado.equals('resolvido') ? 'fa fa-check-circle':'fa-exclamation-circle'}" aria-hidden="true"></span>
                                            <div class="box-hidden">
                                                <h4>Processo ${p.idProcesso}</h4>
                                                <b>Máquina:</b> ${p.maquina.descricao} (${p.maquina.numPatrimonio})<br>
                                                <c:choose>
                                                    <c:when test="${p.numFotos > 0}">
                                                        <img width="100%" src="<%=request.getContextPath()%>/processoFoto?processo=${p.idProcesso}&img=1&mod=t" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <b>Localizada:</b> ${p.localizacao}<br>
                                                        <b>Setor:</b> ${p.setor}<br>
                                                        <b>Medida Corretiva:</b> ${p.medidaCorretiva.length() > 40 ? p.medidaCorretiva.substring(0, 40).trim().concat('...') : p.medidaCorretiva}<br>
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
                                <a href="1" class="btn btn-default">1</a>
                            </c:if>
                            <div class="btn-group" role="group" aria-label="...">
                                <a href="${num-1}" class="btn btn-default" ${num-1 > 0 && num-1 < count ? '' : 'disabled'}>Anterior</a>
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
                                <a href="${num+1}" class="btn btn-default" ${num+1 > 0 && num+1 <= count ? "" : "disabled"}>Seguinte</a>
                            </div>
                            <c:if test="${num+2 < count}">
                                <a href="${count}" class="btn btn-default">${count}</a>
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
        <script src="<%=request.getContextPath()%>/resources/plugins/niceScroll/jquery.nicescroll.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $(".box-padronizar").niceScroll({autohidemode: false, zindex: 999, cursorcolor: "#999", cursorwidth: 7});
            });
        </script>
    </body>
</html>
