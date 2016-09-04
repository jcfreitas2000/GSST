/*
 Autor: José Carlos de Freitas
 Data: 04/09/2016, 13:14:51
 Arquivo: editarDados
 */

$(document).ready(function () {

    $("#editar-dados").submit(function (e) {
        if ($("#nova-senha").val() != $("#confirmar-nova-senha").val()) {
            $("#nova-senha").val("");
            $("#confirmar-nova-senha").val("");

            $("#nova-senha-erro").show();
            $("#nova-senha").focus();
            
            e.preventDefault();
        }
    });
});