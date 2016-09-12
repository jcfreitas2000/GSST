<%-- 
    Autor: José Carlos de Freitas
    Data: 19/07/2016, 15:38:15
    Arquivo: cabecalho
--%>

<nav class="navbar navbar-default navbar-green">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/user/index">GSST</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="${requestScope['javax.servlet.forward.request_uri'].contains("processos") ? "active" : ""}"><a href="<%=request.getContextPath()%>/user/processos/">Processos</a></li>
                <li class="${requestScope['javax.servlet.forward.request_uri'].contains("normas-regulamentadoras") ? "active" : ""}"><a href="<%=request.getContextPath()%>/user/normas-regulamentadoras">Normas Regulamentadoras</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-user" aria-hidden="true"></span> <span class="caret"></span></a>
                    <div class="box dropdown-menu">
                        <div class="dropdown-menu-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <span class="fa fa-user" aria-hidden="true"></span> ${usuarioLogado.funcionario.nome}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <span class="fa fa-industry" aria-hidden="true"></span> ${usuarioLogado.funcionario.unidade.nome}
                                </div>
                            </div>
                            <c:if test="${usuarioLogado.nivelAcesso == 'admin'}">
                                <div class="row">
                                    <div class="col-md-12">
                                        <a href="<%=request.getContextPath()%>/admin/gerenciar-usuarios/"><span class="fa fa-users" aria-hidden="true"></span> Gerenciar usuários</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div class="dropdown-menu-footer clearfix">
                            <div class="pull-left">
                                <a href="<%=request.getContextPath()%>/user/editar-dados/"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Editar dados</a>
                            </div>
                            <div class="pull-right">
                                <a class="btn btn-primary" href="<%=request.getContextPath()%>/logoff">Logoff</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>