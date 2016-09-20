<%-- 
    Autor: José Carlos de Freitas
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
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>404 - Página não encontrada</h2>
                <p>Essa não é a página que você está procurando.</p>

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
