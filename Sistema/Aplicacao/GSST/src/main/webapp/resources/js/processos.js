/*
 Autor: José Carlos de Freitas
 Data: 16/09/2016, 22:10:27
 Arquivo: processos
 */

$(document).ready(function () {

    $("#datas input").each(function () {
        $(this).datepicker({
            showOtherMonths: true,
            selectOtherMonths: true,
            dateFormat: "dd/mm/yy"
        });
    });

    $("#tudo").change(function () {
        if (this.checked) {
            $("input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });
        } else {
            $("input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
});