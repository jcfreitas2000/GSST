<%-- 
    Autor: José Carlos de Freitas
    Data: 23/07/2016, 23:36:16
    Arquivo: nrAux
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mapa">
    <span class="fa fa-chevron-circle-right" aria-hidden="true"></span> <a href="#" onclick="resetNr()">Normas Regulamentadoras</a> 
    <c:forEach var="num" items="${mapa}">
        <span class="fa fa-chevron-circle-right" aria-hidden="true"></span> <a href="#" onclick="ajaxNr('${num.replace(".","-")}')">NR ${num}</a> 
    </c:forEach>
    <span class="fa fa-chevron-circle-right" aria-hidden="true"></span> NR ${nr.getNumero()}
</div>

<input id="nr-num" type="hidden" value="${nr.getNumero()}">
<h2>Norma Regulamentadora ${nr.getNumero()}</h2>
<p>${nr.getDescricao()}</p>

<ul class="list-group">
    <c:forEach var="aux" items="${nr.getNrs()}">
        <a href="#" onclick="ajaxNr('${aux.getNumero().replace(".","-")}')">
            <li class="list-group-item">
                <span class="badge">${aux.getNrs().size()}</span>
                Norma Regulamentadora Nº ${aux.getNumero()} - ${aux.getDescricao()}
            </li>
        </a>
    </c:forEach>
</ul>