/*
 Autor: José Carlos de Freitas
 Data: 23/07/2016, 18:24:11
 Arquivo: processos
 */

$(document).ready(function () {
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

    if ($("#open-nr").val()) {
        $('#modal-nrs').modal('show');
    }
});

function ajaxNr(id) {
    $.ajax({
        type: "GET",
        url: "nr?nr=" + id,
        success: function (data) {
            $("modal-nrs .modal-body:first-child").html(data);
        },
        error: function (e) {
            alert('Error: ' + e);
        }
    });
}