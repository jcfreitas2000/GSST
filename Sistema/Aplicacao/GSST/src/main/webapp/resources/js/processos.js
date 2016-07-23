/*
 Autor: José Carlos de Freitas
 Data: 23/07/2016, 18:24:11
 Arquivo: processos
 */

$("#btn-maquina").click(function(){
    $("#maquina").show();
    $("#processo").hide();

    $("#frmMaquina").trigger("reset");
    $("#numPatrimonio").focus();
});

$("#btn-cancelar-maquina").click(function(){
    $("#maquina").hide();
    $("#processo").show();
});