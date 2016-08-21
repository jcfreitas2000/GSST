/*
	Script de criação banco de dados gsst
	Autor: José Carlos de Freitas
	Data: 17:00:00, 21/07/2016
*/

BEGIN;

CREATE TABLE empresa(
	id_empresa serial primary key,
	nome text not null
);

CREATE TABLE unidade(
	id_unidade serial primary key,
	nome text not null,
	cnpj text not null unique,
	ie text unique,
	logradouro text,
	numero text,
	bairro text,
	complemento text,
	contato text,
	email text unique,
	num_funcionarios int not null,
	id_empresa int not null
		REFERENCES empresa (id_empresa)
		on delete cascade
		on update cascade
);

CREATE TABLE funcionario(
	id_funcionario serial primary key,
	nome text not null,
	funcao text not null,
	cpf text unique,
	email text unique,
	contato text,
	setor text,
	logradouro text,
	numero text,
	bairro text,
	complemento text,
	id_chefe int
		REFERENCES funcionario (id_funcionario)
		on delete cascade
		on update cascade,
	id_unidade int
		REFERENCES unidade (id_unidade)
		on delete cascade
		on update cascade
);

CREATE TABLE usuario(
	id_funcionario serial primary key
		REFERENCES funcionario (id_funcionario)
		on delete cascade
		on update cascade,
	senha text not null,
	ativo boolean not null default false,
	nivel_acesso text
);

CREATE TABLE valores(
	id_valores serial primary key,
	tipo char(1) not null,
	nivel int not null,
	valor decimal(8,2) not null
);

CREATE TABLE nr(
	id_nr serial primary key,
	numero text not null unique,
	descricao text,
	tipo char(1),
	nivel int,
	data_insercao timestamp default now(),
	id_nr_item int
		REFERENCES nr (id_nr)
		on delete cascade
		on update cascade
);

CREATE TABLE maquina(
	id_maquina serial primary key,
	num_patrimonio text unique,
	descricao text,
	id_unidade int not null
		REFERENCES unidade (id_unidade)
		on delete cascade
		on update cascade
);

CREATE TABLE processo(
	id_processo serial primary key,
	localizacao text,
	setor text,
	medida_corretiva text,
	data timestamp default now(),
	prazo date,
	multa decimal(10,2),
	num_fotos int,
	estado text,
	id_relator int not null
		REFERENCES funcionario (id_funcionario)
		on delete cascade
		on update cascade,
	id_resp_correcao int
		REFERENCES funcionario (id_funcionario)
		on delete cascade
		on update cascade,
	id_maquina int not null
		REFERENCES maquina (id_maquina)
		on delete cascade
		on update cascade
);

CREATE TABLE processo_nr(
	id_processo int
		REFERENCES processo (id_processo)
		on delete cascade
		on update cascade,
	id_nr int
		REFERENCES nr (id_nr)
		on delete cascade
		on update cascade,
	CONSTRAINT processo_nr_pkey primary key (id_processo, id_nr)
);

COMMIT;