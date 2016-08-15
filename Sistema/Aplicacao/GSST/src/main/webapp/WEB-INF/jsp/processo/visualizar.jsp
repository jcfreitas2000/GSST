<%-- 
    Autor: José Carlos de Freitas
    Data: 14/08/2016, 12:56:42
    Arquivo: visualizar
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Segurança é vida</title>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
        <link href="<%=request.getContextPath()%>/resources/plugins/slick-1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="<%=request.getContextPath()%>/resources/plugins/slick-1.6.0/slick.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Processos</h2>
                <div class="box">
                    <div class="box-title">
                        Processo ${p.idProcesso}
                    </div>

                    Localização: ${p.localizacao}<br>
                    Setor: ${p.setor}<br>
                    Medida Corretiva: ${p.medidaCorretiva}<br>
                    Relatado em: <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.data}" /><br>
                    Prazo: <fmt:formatDate pattern="dd/MM/yyyy" type="date" value="${p.prazo}" />

                    <div id="largura">
                        <div class="carrosel">
                            <c:forEach begin="1" end="${p.numFotos}" var="i">
                                <img class="imagem" src="<%=request.getContextPath()%>/processoFoto?processo=${p.idProcesso}&img=${i}" />
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div><!--Fim conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <script src="<%=request.getContextPath()%>/resources/plugins/slick-1.6.0/slick.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/js/responsiveSlick.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.carrosel').slick({
                    dots: true,
                    infinite: true,
                    speed: 500,
                    fade: true,
                    arrows: true,
                    accessibility: true,
                    adaptiveHeight: true,
                    centerMode: true,
                    mobileFirst: true,
                    cssEase: 'linear'
                });
            });
        </script>
    </body>
</html>