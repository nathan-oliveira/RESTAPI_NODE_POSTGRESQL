create schema drugstore;

create table drugstore.nivel_usuario (
	id serial not null,
	nome varchar(255) not null,
	constraint pk_idnivelusuario primary key(id)
);

create table drugstore.usuarios (
	id serial not null,
	nome varchar(255) not null,
	cpf varchar(14) not null,
	email varchar(255) not null,
	senha varchar(40) not null,
	telefone varchar(16) not null,
	id_nivel integer not null,
	dtcreated timestamp default current_timestamp,
	constraint pk_idusuarios primary key(id),
	constraint fk_niveluser foreign key(id_nivel) references drugstore.nivel_usuario(id)
);

create table drugstore.historico_caixa (
	id serial not null,
	valor Numeric(7,2) not null,
	data date not null,
	id_usuario integer not null,
	constraint pk_idhistcaixa primary key(id),
	constraint fk_histusercaixa foreign key(id_usuario) references drugstore.usuarios(id)
);

create table drugstore.fornecedor (
	id serial not null,
	nome varchar(255) not null,
	empresa varchar(255) not null,
	constraint pf_idfornecedor primary key(id)
);

create table drugstore.categoria (
	id serial not null,
	nome varchar(255) not null,
	constraint pk_idcategoria primary key(id)
);

create table drugstore.produtos (
	id serial not null,
	nome varchar(255) not null,
	preco Numeric(7,2) not null,
	validade date not null,
	qtde_estoque integer not null,
	id_categoria integer not null,
	id_fornecedor integer not null,
	constraint pk_idprodutos primary key(id),
	constraint fk_prodforn foreign key(id_fornecedor) references drugstore.fornecedor(id),
	constraint fk_prodcatg foreign key(id_categoria) references drugstore.categoria(id)
);

create table drugstore.historico_caixa_produto (
	id serial not null,
	quantidade integer not null,
	id_historico integer not null,
	id_produto integer not null,
	constraint pk_idhistcaixaprod primary key(id),
	constraint fk_prodcaixa foreign key(id_produto) references drugstore.produtos(id),
	constraint fk_histcatg foreign key(id_historico) references drugstore.historico_caixa(id)
);

create table drugstore.historico_compras (
	id serial not null,
	data date not null,
	id_usuario integer not null,
	id_produto integer not null,
	constraint pk_histcompras primary key(id),
	constraint fk_prodhist foreign key(id_produto) references drugstore.produtos(id),
	constraint fk_fkusercompras foreign key(id_usuario) references drugstore.usuarios(id)
);

