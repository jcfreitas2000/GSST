<%-- 
    Autor: José Carlos de Freitas
    Data: 23/07/2016, 23:36:16
    Arquivo: nrAux
--%>

<div class="mapa">
    <span class="fa fa-chevron-circle-right" aria-hidden="true"></span> <a href="<%=request.getContextPath()%>/user/normas-regulamentadoras">Normas Regulamentadoras</a> 
    <c:forEach var="num" items="${mapa}">
        <span class="fa fa-chevron-circle-right" aria-hidden="true"></span> <a href="<%=request.getContextPath()%>/user/normas-regulamentadoras/${num.replace(".","-")}">NR ${num}</a> 
    </c:forEach>
    <span class="fa fa-chevron-circle-right" aria-hidden="true"></span> NR ${nr.getNumero()}
</div>

<h2>Norma Regulamentadora ${nr.getNumero()}</h2>
<p>${nr.getDescricao()}</p>

<ul class="list-group">
    <c:forEach var="nr" items="${nr.getNrs()}">
        <a href="<%=request.getContextPath()%>/user/normas-regulamentadoras/${nr.getNumero().replace(".","-")}">
            <li class="list-group-item">
                <span class="badge">${nr.getNrs().size()}</span>
                Norma Regulamentadora Nº ${nr.getNumero()} - ${nr.getDescricao()}
            </li>
        </a>
    </c:forEach>
</ul>