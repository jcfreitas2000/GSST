<%-- 
    Autor: José Carlos de Freitas
    Data: 07/09/2016, 15:08:18
    Arquivo: gerenciarUsuarios
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Gerenciar Usuários</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
    </head>
    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Gerenciar Usuários</h2>

                <table id="usuarios">
                    <tr>
                        <td>CPF</td>
                        <td>Nome</td>
                        <td>Setor</td>
                    </tr>
                </table>

            </div><!--Conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
    </body>
</html>
