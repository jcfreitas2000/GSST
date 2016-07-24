<%-- 
    Autor: Jos� Carlos de Freitas
    Data: 19/07/2016, 20:30:04
    Arquivo: ca
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Certificado de Aprova��o</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <h2>Certificado de Aprova��o</h2>

                <p>
                    Todo EPI nacional ou importado antes de ser comercializado deve adquirir o 
                    respectivo C.A. (certificado de aprova��o).
                    O C.A. � a garantia dada pelo Minist�rio do Trabalho para que o EPI seja considerado 
                    de qualidade, e apto para uso.
                </p>
                <p>
                    Antes de ser colocado a venda todo EPI � submetido a v�rios testes para garantir durabilidade, 
                    conforto e prote��o fornecida pelo equipamento, e se ap�s os testes for aprovado, recebe 
                    seu respectivo CA e autoriza��o para ser comercializado.
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
