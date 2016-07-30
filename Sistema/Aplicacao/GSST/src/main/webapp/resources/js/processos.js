/*
 Autor: José Carlos de Freitas
 Data: 23/07/2016, 18:24:11
 Arquivo: processos
 */
var nr = null;

$(document).ready(function () {
    nr = $("#modal-nrs .modal-body:first").html();

    $("#btn-maquina").click(function () {
        $("#maquina").show();
        $("#processo").hide();

        $("#frmMaquina").trigger("reset");
        $("#numPatrimonio").focus();
    });

    $("#btn-cancelar-maquina").click(function () {
        $("#maquina").hide();
        $("#processo").show();
    });

    $("#adicionar-nr").click(function () {
        $("#modal-nrs").modal("hide");
        $("#nrs").append("<li>" + $("#modal-nrs h2:first").html() + "</li>");
    });
});

function ajaxNr(id) {
    $("#modal-nrs .modal-body:first").load("nr/" + id);
    $("#adicionar-nr").show();
}

function resetNr() {
    $("#modal-nrs .modal-body:first").html(nr);
    $("#adicionar-nr").hide();
}