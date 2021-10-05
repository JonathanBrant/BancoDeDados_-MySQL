/*
insert into ecommerce.cliente (nome, cpf, email, username, senha) 
values ('Isabelle Sousa', '368.912.069-10', 'isabele@sousa.com', 'isa', 'isasousa');

insert into ecommerce.cliente (nome, cpf, email, username, senha) 
values ('Estevan Pereira', '973.591.461-19', 'estevan@pereira.com', 'estevan', 'estevanpereira');

insert into ecommerce.cliente_telefone (id_cliente, ddd, numero, tipo) values ( 18, '(67)', '7149-6981', 'celular');
insert into ecommerce.cliente_telefone (id_cliente, ddd, numero, tipo) values ( 19, '(27)', '6862-7194', 'residencial');

insert into cliente_endereco (id_cliente, cep, rua, numero, bairro, cidade, UF ) 
values(18, '79033-410', 'Herculano Metello Peres', 1002, 'Conj.Residencial Mata do Jacinto', 'Campo Grande', 'MS');

insert into cliente_endereco (id_cliente, cep, rua, numero, bairro, cidade, UF ) 
values(19, '29112-250', 'Alecrim', 1094, 'Novo México', 'Vila Velha', 'ES');

update ecommerce.cliente set nascimento = '1968-02-08' where id = 18;
update ecommerce.cliente set nascimento = '1992-10-17' where id = 19;

*/

select * from  ecommerce.cliente;
select * from  ecommerce.cliente_telefone;

select * from ecommerce.cliente_end_cobranca;

select * from ecommerce.cliente c 
inner join ecommerce.cliente_telefone ctf on (c.id = ctf.id_cliente)
inner join ecommerce.cliente_endereco cec on (c.id = cec.id_cliente);



# DIA 27 DE SETEMBRO

select * from cliente_telefone;

select produto.id, produto.preco as 'Preço Unitário',
produto_pedido.quantidade, produto.preco*produto_pedido.quantidade
as Total from produto inner join produto_pedido
on produto_pedido.id_produto = produto.id;
	/*MOSTRAR O CÓDIGO DO PEDIDO E O CÓDIGO DO CLIENTE (3 TABELAS = produto, pedido e produto_pedido)*/
select pedido.id, pedido.id_cliente, produto.nome, produto.preco, produto_pedido.quantidade
from pedido inner join produto_pedido on pedido.id = produto_pedido.id_pedido
inner join produto on produto.id = produto_pedido.id_produto;

select pedido.id, pedido.id_cliente, produto.nome, produto.preco, produto_pedido.quantidade
from pedido inner join produto_pedido on pedido.id = produto_pedido.id_pedido
inner join produto on produto.id = produto_pedido.id_produto;

SELECT pedido.id, pedido.id_cliente, cliente.nome,produto.nome 
AS produto, produto.preco, produto_pedido.quantidade, produto.preco*produto_pedido.quantidade AS total
FROM cliente 
INNER JOIN pedido ON cliente.id=pedido.id_cliente 
INNER JOIN produto_pedido ON pedido.id=produto_pedido.id_pedido
INNER JOIN produto ON produto_pedido.id_produto=produto.id

/*
select produto.codigo, produto.preco as 'Preço Unitário', produto_pedido.quantidade, 
    format (convert(decimal(10,2),produto.preco*produto_pedido.quantidade),'C','PT-BR')
    as Total from produto inner join produto_pedido
    on produto_pedido.id_produto = produto.id;
    */
    
    