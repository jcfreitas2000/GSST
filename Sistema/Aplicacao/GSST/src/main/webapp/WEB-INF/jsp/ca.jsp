<%-- 
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 20:30:04
    Arquivo: ca
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Certificado de Aprovação</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Certificado de Aprovação</h2>

                <p>
                    Todo EPI nacional ou importado antes de ser comercializado deve adquirir o 
                    respectivo C.A. (certificado de aprovação).
                    O C.A. é a garantia dada pelo Ministério do Trabalho para que o EPI seja considerado 
                    de qualidade, e apto para uso.
                </p>
                <p>
                    Antes de ser colocado a venda todo EPI é submetido a vários testes para garantir durabilidade, 
                    conforto e proteção fornecida pelo equipamento, e se após os testes for aprovado, recebe 
                    seu respectivo CA e autorização para ser comercializado.
                </p>
                <p>
                    Abaixo pode ser feita a consulta pelo C.A.:
                </p>

                <div class="box box-center">
                    <div class="form-group">
                        <label for="ca">Pesquisar CA</label>
                        <input type="text" class="form-control" id="ca" placeholder="Pesquisar CA">
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary btn-logar" value="Pesquisar CA" onclick="var i = $('#ca').val();if(i>0)window.open('https://consultaca.com/' + i, '_blank');">
                    </div>
                </div>

            </div>

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
