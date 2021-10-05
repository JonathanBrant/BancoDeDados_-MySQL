create schema if not exists loja;
use loja;

create table if not exists loja.produto (
	id int primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(250),
    quantidade_estoque int not null
);

create table if not exists loja.pedido(
	id int primary key auto_increment,
    data_solicitacao date not null,
    valor_total decimal(10,2),
    status varchar(20)
);

create table if not exists loja.produto_pedido(
	id_pedido int,
    id_produto int,
    primary key(id_pedido, id_produto),
    foreign key (id_pedido) references pedido(id),
    foreign key (id_produto) references produto(id)    
);

create table if not exists loja.nota_fiscal(
	id int primary key auto_increment,
    numero int not null,
    id_pedido int not null,
    foreign key (id_pedido) references pedido(id)
);

alter table produto add column preco decimal(10,2) not null after descricao;
rename table loja.pedidos to loja.pedido;	

