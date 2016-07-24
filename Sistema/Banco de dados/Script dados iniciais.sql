/*
	Script de dados iniciais banco de dados gsst
	Autor: José Carlos de Freitas
	Data: 17:00:00, 21/07/2016
*/

BEGIN;

--Inserção da empresa
INSERT INTO public.empresa(
            nome)
    VALUES ('GSST');

--Inserção da unidade
INSERT INTO public.unidade(
            nome, cnpj, email, num_funcionarios, id_empresa)
    VALUES ('gsst', '1234567890', 'gsst@gmail.com', 2, (SELECT id_empresa FROM empresa WHERE nome ilike 'GSST'));

--Inserção dos funcionários
INSERT INTO public.funcionario(
            nome, funcao, cpf, email, contato, logradouro, 
            numero, bairro, id_unidade)
    VALUES ('José Carlos de Freitas', 'Desenvolvedor', '', 'jcfreitas2000@hotmail.com', '17981008663', 'rua Nhandeara',
            '2665', 'Eldorado', (SELECT id_unidade FROM unidade WHERE email ilike 'gsst@gmail.com'));
            
INSERT INTO public.funcionario(
            nome, funcao, cpf, email, contato, logradouro, 
            numero, bairro, id_unidade)
    VALUES ('Weylon Cassini', 'Desenvolvedor', '12345678901', 'weylon.cassini@hotmail.com', '', '',
            '', '', (SELECT id_unidade FROM unidade WHERE email ilike 'gsst@gmail.com'));

--Inserção dos usuários dos funcionários
INSERT INTO public.usuario(
            id_funcionario, senha, ativo, nivel_acesso)
    VALUES ((SELECT id_funcionario FROM funcionario WHERE email ilike 'jcfreitas2000@hotmail.com'), '123', true, 'admin');
    
INSERT INTO public.usuario(
            id_funcionario, senha, ativo, nivel_acesso)
    VALUES ((SELECT id_funcionario FROM funcionario WHERE email ilike 'weylon.cassini@hotmail.com'), '123', true, 'admin');

--Inserção das máquinas
INSERT INTO public.maquina(
            num_patrimonio, descricao, id_unidade)
    VALUES ('1', 'Máquina teste', (SELECT id_unidade FROM unidade WHERE email ilike 'gsst@gmail.com'));
    
INSERT INTO public.maquina(
            num_patrimonio, descricao, id_unidade)
    VALUES ('2', 'Máquina teste', (SELECT id_unidade FROM unidade WHERE email ilike 'gsst@gmail.com'));
    
INSERT INTO public.maquina(
            num_patrimonio, descricao, id_unidade)
    VALUES ('3', 'Máquina teste', (SELECT id_unidade FROM unidade WHERE email ilike 'gsst@gmail.com'));
    
INSERT INTO public.maquina(
            num_patrimonio, descricao, id_unidade)
    VALUES ('4', 'Máquina teste', (SELECT id_unidade FROM unidade WHERE email ilike 'gsst@gmail.com'));

COMMIT;