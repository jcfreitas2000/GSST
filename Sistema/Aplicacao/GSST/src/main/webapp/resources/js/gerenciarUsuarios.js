/*
 Autor: José Carlos de Freitas
 Data: 09/09/2016, 17:17:13
 Arquivo: gerenciarUsuários
 */

$(document).ready(function () {
    $("#tableUsuarios").DataTable({
        "ajax": "usuarios",
        "language": {
            "url": "http://cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese.json"
        },
        "responsive": true,
        "columns": [
            {"data": "id"},
            {"data": "cpf"},
            {"data": "nome"},
            {"data": "nivelAcesso"},
            {"data": "ativo"},
            {"data": "funcao"},
            {"data": "setor"},
            {"data": "chefe"},
            {"data": "email"},
            {"data": "contato"}
        ],
        "columnDefs": [
            {
                "targets": [0],
                "visible": false
            }, {
                "targets": [4],
                "sClass": "text-center"
            }
        ],
        "order": [[2, "asc"]]
    });

    var table = $('#tableUsuarios').DataTable();
    $('#tableUsuarios tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            $("#editar-usuario").attr("disabled", "disabled");
        } else {
            if (!$(this).hasClass("child")) {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
                $("#editar-usuario").attr("href", "editar-usuario?id=" + table.row(this).data().id);
                $("#editar-usuario").removeAttr("disabled");
            }
        }
    });
    $('#tableUsuarios tbody').on("dblclick", "tr", function () {
        window.location = "editar-usuario?id=" + table.row(this).data().id;
    });
});