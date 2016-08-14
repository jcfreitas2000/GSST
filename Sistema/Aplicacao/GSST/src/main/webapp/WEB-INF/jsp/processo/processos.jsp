<%-- 
    Autor: Jos� Carlos de Freitas
    Data: 11/07/2016, 12:09:22
    Arquivo: processos
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Seguran�a � vida</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <h2>Processos</h2>

                <div class="row">
                    <c:forEach items="${processos}" var="p">
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="box">
                                ${p.idProcesso}<br>
                                Localiza��o: ${p.localizacao}<br>
                                Setor: ${p.setor}<br>
                                Medida Corretiva: ${p.medidaCorretiva}<br>
                                Relatado em: ${p.data}<br>
                                Prazo: ${p.prazo}
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="text-right">
                    <a href="novo" class="btn btn-primary">Novo processo</a>
                </div>
            </div><!--Fim conte�do-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
