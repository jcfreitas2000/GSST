<%-- 
    Autor: Jos� Carlos de Freitas
    Data: 19/07/2016, 16:23:12
    Arquivo: normasRegulamentadoras
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Normas Regulamentadoras</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <h2>Normas Regulamentadoras <a href="http://www.mtps.gov.br" target="mtps"><small><span class="fa fa-info-circle pointer" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Extra�do de http://www.mtps.gov.br no dia 19 de julho de 2016"></span></small></a></h2>
                <p>As Normas Regulamentadoras (NR), relativas � seguran�a e sa�de do trabalho, s�o de observ�ncia obrigat�ria pelas empresas privadas e p�blicas e pelos �rg�os p�blicos da administra��o direta e indireta, bem como pelos �rg�os dos Poderes Legislativo e Judici�rio, que possuam empregados regidos pela Consolida��o das Leis do Trabalho (CLT).</p>
                <p>O n�o cumprimento das disposi��es legais e regulamentares sobre seguran�a e sa�de no trabalho acarretar� ao empregador a aplica��o das penalidades previstas na legisla��o pertinente.</p>

                <ul class="list-group">
                    <c:forEach var="nr" items="${nrs}">
                        <a href="${pageContext.request.contextPath}/user/normas-regulamentadoras/${nr.getNumero().replace(".","-")}">
                            <li class="list-group-item">
                                <span class="badge">${nr.getNrs().size()}</span>
                                Norma Regulamentadora N� ${nr.getNumero()} - ${nr.getDescricao()}
                            </li>
                        </a>
                    </c:forEach>
                </ul>

            </div>
            <!--/Conte�do-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
