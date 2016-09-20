<%-- 
    Autor: José Carlos de Freitas
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
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Normas Regulamentadoras <a href="http://www.mtps.gov.br" target="mtps"><small><span class="fa fa-info-circle pointer" aria-hidden="true" data-toggle="tooltip" data-placement="bottom" title="Extraído de http://www.mtps.gov.br no dia 19 de julho de 2016"></span></small></a></h2>
                <p>As Normas Regulamentadoras (NR), relativas à segurança e saúde do trabalho, são de observância obrigatória pelas empresas privadas e públicas e pelos órgãos públicos da administração direta e indireta, bem como pelos órgãos dos Poderes Legislativo e Judiciário, que possuam empregados regidos pela Consolidação das Leis do Trabalho (CLT).</p>
                <p>O não cumprimento das disposições legais e regulamentares sobre segurança e saúde no trabalho acarretará ao empregador a aplicação das penalidades previstas na legislação pertinente.</p>

                <ul class="list-group">
                    <c:forEach var="nr" items="${nrs}">
                        <a href="${pageContext.request.contextPath}/user/normas-regulamentadoras/${nr.getNumero().replace(".","-")}">
                            <li class="list-group-item">
                                <span class="badge">${nr.getNrs().size()}</span>
                                Norma Regulamentadora Nº ${nr.getNumero()} - ${nr.getDescricao()}
                            </li>
                        </a>
                    </c:forEach>
                </ul>

            </div>
            <!--/Conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
