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
            dateFormat: "dd/mm/yy",
            showButtonPanel: true,
            currentText: 'Hoje',
            closeText: '<span class="fa fa-eraser" aria-hidden="true"></span> Limpar',
            onClose: function () {
                var event = arguments.callee.caller.caller.arguments[0];
                // If "Clear" gets clicked, then really clear it
                if ($(event.delegateTarget).hasClass('ui-datepicker-close')) {
                    $(this).val('');
                }
            }
        });
        if ($(this).attr("id").indexOf("prazo") === -1) {
            $(this).datepicker("option", "maxDate", 0);
        }
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