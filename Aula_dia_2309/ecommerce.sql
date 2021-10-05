create schema ecommerce;
use ecommerce;

create table if not exists ecommerce.cliente(
	id int primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(14) not null,
    email varchar(50) not null,
    username varchar(20) not null,
    senha varchar(50) not null    
);

create table if not exists ecommerce.produto (
	id int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    descricao varchar (500) not null,
    quantidade_estoque int not null
);

create table if not exists ecommerce.cliente_telefone(
	id_cliente int not null,
    foreign key (id_cliente) references cliente(id),
	id int primary key auto_increment,
    ddd varchar(4),
    numero varchar(10) not null,
    tipo varchar(20) not null
   
);

create table if not exists ecommerce.cliente_end_entrega(
	id_cliente int not null,
    foreign key (id_cliente) references cliente(id),
	id int primary key auto_increment,
    rua varchar(50) not null,
    numero int not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    UF varchar(20) not null
);

create table if not exists ecommerce.cliente_end_cobranca(
	id_cliente int not null,
    foreign key (id_cliente) references cliente(id),
	id int primary key auto_increment,
    rua varchar(50) not null,
    numero int not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    UF varchar(20) not null
);

create table if not exists ecommerce.pedido(
	id_cliente int not null,
    foreign key (id_cliente) references cliente(id),
	id int primary key auto_increment,
    forma_pagto varchar(50) not null,
    status_compra varchar(50) not null,
    data_pedido date not null,
    data_prevista_entrega date not null,
    data_entrega date    
);

create table if not exists ecommerce.produto_pedido(
	id_pedido int,
    id_produto int,
    quantidade int not null,
    foreign key(id_pedido) references pedido(id),
    foreign key(id_produto) references produto(id)
);

insert into cliente (nome, cpf, email, username, senha) values ('Jonathan Brant', '111.222.333-00', 'jonathan@email.com', 'jbrant', 'boamestre'); 

insert into cliente_telefone (id_cliente, ddd, numero, tipo) values ( 1 ,'(24)', '99999-9999', 'residencial');



delete from cliente_telefone;

select nome from cliente;

