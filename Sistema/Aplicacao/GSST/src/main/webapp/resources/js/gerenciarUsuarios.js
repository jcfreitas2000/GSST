/*
 Autor: José Carlos de Freitas
 Data: 09/09/2016, 17:17:13
 Arquivo: gerenciarUsuários
 */

$("#tableUsuarios").DataTable({
    "ajax": "usuarios",
    "responsive": true,
    "columns": [
        {"data": "id"},
        {"data": "cpf"},
        {"data": "nome"},
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
        }
    ],
    "order": [[2, "asc"]]
});