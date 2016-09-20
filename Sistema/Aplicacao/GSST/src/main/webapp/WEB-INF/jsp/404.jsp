<%-- 
    Autor: Jos� Carlos de Freitas
    Data: 23/07/2016, 23:36:16
    Arquivo: nr
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

                <h2>404 - P�gina n�o encontrada</h2>
                <p>Essa n�o � a p�gina que voc� est� procurando.</p>

                <div class="text-center">
                    <a class="btn btn-default btn-lg" href="${pageContext.request.contextPath}/user/processos/">Processos</a>
                    <a class="btn btn-default btn-lg" href="${pageContext.request.contextPath}/user/normas-regulamentadoras">Normas Regulamentadoras</a>
                </div>
                
            </div>

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <script src="${pageContext.request.contextPath}/resources/js/processos.js" type="text/javascript"></script>
    </body>
</html>
