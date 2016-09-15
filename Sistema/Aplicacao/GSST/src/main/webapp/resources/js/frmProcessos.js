/*
 Autor: José Carlos de Freitas
 Data: 23/07/2016, 18:24:11
 Arquivo: processos
 */
var nr = null;
var json = {};

$(document).ready(function () {
    $("#prazo").datepicker({
        beforeShowDay: $.datepicker.noWeekends,
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: "dd/mm/yy",
        minDate: 0
    });

    if (window.location.hash == "#adicionarMaquina") {
        $("#maquina").show();
        $("#processo").hide();

        $("#frmMaquina").trigger("reset");
        $("#numPatrimonio").focus();
    }

    //Pega o valor default do modal de nrs
    nr = $("#modal-nrs .modal-body:first").html();

    //Exibe formulário para cadastro de máquina
    $("#btn-maquina").click(function () {
        $("#maquina").show();
        $("#processo").hide();

        $("#frmMaquina").trigger("reset");
        $("#numPatrimonio").focus();
    });

    //Esconde formulário de máquina e exibe o de processo
    $("#btn-cancelar-maquina").click(function () {
        $("#maquina").hide();
        $("#processo").show();
    });

    //Adiciona NR a lista de NRs
    $("#adicionar-nr").click(function () {
        adicionarNr();
    });

    //Reseta model quando ele fecha
    $('#modal-nrs').on('hidden.bs.modal', function () {
        resetNr();
    });

    $("#frmProcesso").submit(function () {
        if ($.isEmptyObject(json)) {
            $("#erro-nr").show();

            return false;
        }

        $("#arrayNrs").val(jsonToArray(json));

        return true;
    });
});

//Carrega uma nova Nr
function ajaxNr(id) {
    $("#adicionar-nr").hide();
    $("#loading-nr").show();

    $("#modal-nrs").modal("show");
    $("#modal-nrs .modal-body:first").load("nr/" + id, function () {
        if (!(id in json)) {
            $("#adicionar-nr").show();
            $("#loading-nr").hide();
        }
    });
}

//Reseta para as principais Nrs
function resetNr() {
    $("#modal-nrs .modal-body:first").html(nr);
    $("#adicionar-nr").hide();
}

function adicionarNr() {
    $("#erro-nr").hide();

    var nrNum = $("#nr-num").val().replace(/\./g, '-');
    $("#modal-nrs").modal("hide");
    json[nrNum] = nrNum;
    $("#lista-nrs").append("<li class='list-group-item red-list'>\n\
                            <span onclick=\"removerNr($(this).parent(), '" + nrNum + "')\" class=\"badge\">\n\
                                <span class='fa fa-times-circle'></span>\n\
                            </span>\n\
                            <a href='#' onclick=\"ajaxNr('" + nrNum + "')\">"
            + $("#modal-nrs h2:first").html()
            + "</a></li>");
}

function removerNr(html, num) {
    delete json[num];
    html.remove();
}

//Cria String json array do array
function jsonToArray(json) {
    var array = [];
    $.each(json, function (i, value) {
        array.push(value);
    });
    return JSON.stringify(array);
}