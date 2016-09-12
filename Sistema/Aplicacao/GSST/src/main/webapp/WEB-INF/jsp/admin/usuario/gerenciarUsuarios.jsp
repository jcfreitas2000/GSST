<%-- 
    Autor: Jos� Carlos de Freitas
    Data: 07/09/2016, 15:08:18
    Arquivo: gerenciarUsuarios
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>GSST - Gerenciar Usu�rios</title>

        <%@include file="/WEB-INF/jsp/estrutura/importMetaCss.jsp" %>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.12/r-2.1.0/datatables.min.css"/>
    </head>
    <body>
        <div class="wraper">
            <!--Cabe�alho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conte�do-->
            <div class="conteudo">

                <h2>Gerenciar Usu�rios</h2>

                <div class="clearfix">
                    <div class="pull-right">
                        <a href="novo" class="btn btn-primary"><span class="fa fa-plus" aria-hidden="true"></span> Novo usu�rio</a>
                    </div>
                </div>
                
                <div class="box margin-top">
                    <table id="tableUsuarios" class="table table-striped table-bordered display responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr id="linha">
                                <th>ID</th>
                                <th>CPF</th>
                                <th>Nome</th>
                                <th>Fun��o</th>
                                <th>Setor</th>
                                <th>Chefe</th>
                                <th>E-mail</th>
                                <th>Contato</th>
                            </tr>
                        </thead>
                    </table>
                </div>

            </div><!--Conte�do-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <!--Imports para DataTable-->
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.12/r-2.1.0/datatables.min.js"></script>
        <!--Js da p�gina-->
        <script src="<%=request.getContextPath()%>/resources/js/gerenciarUsuarios.js" type="text/javascript"></script>
    </body>
</html>
