<%-- 
    Autor: José Carlos de Freitas
    Data: 11/07/2016, 12:09:22
    Arquivo: processos
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Segurança é vida</title>

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

                ${msgProcesso.getAlert()}
                <div class="row">
                    <c:choose>
                        <c:when test="${processos == null}">
                            <div class="col-xs-12">
                                <div class="alert alert-warning">
                                    <h4>Não há processos</h4>
                                    Não há processos cadastrados.
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${processos}" var="p">
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <a href="visualizar/${p.idProcesso}">
                                        <div class="box">
                                            <c:if test="${p.numFotos > 0}">
                                                <img width="100%" src="<%=request.getContextPath()%>/processoFoto?processo=${p.idProcesso}&img=1&mod=t" />
                                            </c:if>
                                            ${p.idProcesso}<br>
                                            Máquina: ${p.maquina.descricao} (${p.maquina.numPatrimonio})<br>
                                            Localizada: ${p.localizacao}<br>
                                            Setor: ${p.setor}<br>
                                            Medida Corretiva: ${p.medidaCorretiva}<br>
                                            Relato por ${p.funcionarioByIdRelator.nome}
                                            em <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.data}" /><br>
                                            Reponsável pela correção: ${p.funcionarioByIdRespCorrecao.nome} até <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.prazo}" />
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="clearfix">
                    <div class="pull-left">
                        <c:if test="${num-2 > 1}">
                            <a href="1" class="btn btn-default">1</a>
                        </c:if>
                        &nbsp;&nbsp;&nbsp;
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
                        &nbsp;&nbsp;&nbsp;
                        <c:if test="${num+2 <= count}">
                            <a href="${count}" class="btn btn-default">${count}</a>
                        </c:if>
                    </div>
                    <div class="pull-right">
                        <a href="novo" class="btn btn-primary">Novo processo</a>
                    </div>
                </div>
            </div><!--Fim conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
