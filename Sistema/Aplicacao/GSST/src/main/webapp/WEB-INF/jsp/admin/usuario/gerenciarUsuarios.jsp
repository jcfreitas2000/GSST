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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.12/r-2.1.0/datatables.min.css"/>
    </head>
    <body>
        <div class="wraper">
            <!--Cabeçalho-->
            <%@include file="/WEB-INF/jsp/estrutura/cabecalho.jsp" %>

            <!--Conteúdo-->
            <div class="conteudo">

                <h2>Gerenciar Usuários</h2>

                <div class="clearfix">
                    <div class="pull-right">
                        <a id="editar-usuario" href="#" class="btn btn-primary" disabled="disabled"><span class="fa fa-pencil-square-o" aria-hidden="true"></span> Editar usuário</a>
                        <a href="novo" class="btn btn-primary"><span class="fa fa-user-plus" aria-hidden="true"></span> Novo usuário</a>
                    </div>
                </div>

                <div>
                    ${msgUsuario.getAlert()}
                </div>

                <div class="box">
                    <table id="tableUsuarios" class="table table-striped table-bordered display responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr id="linha">
                                <th>ID</th>
                                <th>CPF</th>
                                <th>Nome</th>
                                <th>Nível de Acesso</th>
                                <th>Ativo</th>
                                <th>Função</th>
                                <th>Setor</th>
                                <th>Chefe</th>
                                <th>E-mail</th>
                                <th>Contato</th>
                            </tr>
                        </thead>
                    </table>
                </div>

            </div><!--Conteúdo-->

            <!--Footer-->
            <%@include file="/WEB-INF/jsp/estrutura/rodape.jsp" %>
        </div>
        <!--ImportJS-->
        <%@include file="/WEB-INF/jsp/estrutura/importJs.jsp" %>
        <!--Imports para DataTable-->
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.12/r-2.1.0/datatables.min.js"></script>
        <!--Js da página-->
        <script src="${pageContext.request.contextPath}/resources/js/gerenciarUsuarios.js" type="text/javascript"></script>
    </body>
</html>
