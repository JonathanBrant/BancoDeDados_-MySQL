CREATE TABLE IF NOT EXISTS ecommerce.produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    nome VARCHAR(30) NOT NULL,
    preco DECIMAL(10 , 2 ),
    descricao VARCHAR(500),
    quantidade_estoque INT
);

CREATE TABLE IF NOT EXISTS ecommerce.cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(45),
    email VARCHAR(45),
    usuario VARCHAR(45),
    senha VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS ecommerce.pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    forma_pagamento VARCHAR(20),
    status_pedido VARCHAR(20),
    data_pedido DATETIME,
    data_previsao_entrega DATE,
    data_entrega DATETIME,
    FOREIGN KEY (id_cliente)
        REFERENCES cliente (id)
);

CREATE TABLE IF NOT EXISTS ecommerce.produto_pedido (
    quantidade INT,
    id_pedido INT,
    id_produto INT,
    PRIMARY KEY (id_pedido , id_produto),
    FOREIGN KEY (id_pedido)
        REFERENCES pedido (id),
    FOREIGN KEY (id_produto)
        REFERENCES produto (id)
);


CREATE TABLE IF NOT EXISTS ecommerce.endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    rua VARCHAR(50),
    numero INT,
    complemento VARCHAR(25),
    cep VARCHAR(8),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente)
        REFERENCES cliente (id)
);

CREATE TABLE IF NOT EXISTS ecommerce.telefone (
    id_cliente INT,
    FOREIGN KEY (id_cliente)
        REFERENCES cliente (id),
    ddd VARCHAR(3),
    numero VARCHAR(9),
    tipo VARCHAR(15)
);

describe cliente;
describe endereco;
describe telefone;
use digitalhouse;
use ecommerce;

ALTER TABLE ecommerce.telefone ADD column id INT PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE `ecommerce`.`cliente` ADD COLUMN `nascimento` DATE NOT NULL AFTER `senha`;

insert into ecommerce.cliente (nome, cpf, email) values ('Isabelle Sousa', '368.912.069-10', 'isabelle@teste.com');
insert into ecommerce.cliente (nome, cpf, email) values ('Estevan Pereira', '973.591.461-19', 'estevan@teste.com');

delete from ecommerce.cliente WHERE id = 2;
select * from ecommerce.cliente;
select * from ecommerce.endereco;
select * from ecommerce.telefone;
select * from ecommerce.cliente inner join ecommerce.endereco on cliente.id = endereco.id_cliente;

UPDATE ecommerce.cliente SET nascimento = "1968-02-08" WHERE id = 1;
UPDATE ecommerce.endereco SET id_cliente = 1 WHERE id = 1;
UPDATE ecommerce.endereco SET id_cliente = 3 WHERE id = 2;
UPDATE ecommerce.cliente SET nascimento = "1992-10-17" WHERE id = 3;

INSERT INTO ecommerce.endereco (rua, numero, complemento, cep, bairro, cidade, estado) VALUES ('Rua Herculano Metello Peres',  1002, '', '79033410', 'Conj. Residencial Mata do Jacinto', 'Campo Grande', 'MS');
INSERT INTO ecommerce.endereco (rua, numero, complemento, cep, bairro, cidade, estado) VALUES ('Rua Alecrim',  1094, '', '29112250', 'Novo México', 'Vila Velha', 'ES');

DESCRIBE ecommerce.telefone;
INSERT INTO ecommerce.telefone (ddd, numero, tipo) VALUES ('067', '7149-6981', 'fixo');
INSERT INTO ecommerce.telefone (ddd, numero, tipo) VALUES ('027', '6862-7194', 'fixo');
UPDATE ecommerce.telefone SET id_cliente = 3 WHERE id =2;
select * from ecommerce.telefone;
select * from ecommerce.telefone inner join ecommerce.endereco on cliente.id = endereco.id_cliente;



SELECT cliente.nome, cliente.cpf
FROM cliente;

SELECT cliente.id, cliente.nome FROM cliente INNER JOIN pedido ON cliente.id=pedido.id_cliente WHERE pedido.id_cliente=2

cliente        pedido
a              1
b              2
c              3
d
e
f


cliente     pedido
a              1
b              2
c              3  
               4


SELECT cliente.id, cliente.nome FROM cliente LEFT JOIN pedido ON cliente.id=pedido.id_cliente WHERE pedido.id_cliente=2

SELECT cliente.id, cliente.nome FROM cliente RIGHT JOIN pedido ON cliente.id=pedido.id_cliente WHERE pedido.id_cliente=2



2 tabelas = 1 INNER JOIN
3 tabelas = 2 INNER JOIN	 


SELECT produto.codigo,produto.preco AS Preço_Unitário,produto_pedido.quantidade, produto.preco*produto_pedido.quantidade AS Total FROM produto INNER JOIN produto_pedido ON produto_pedido.id_produto = produto.id



//MOSTRAR O CÓDIGO DO PEDIDO E O CÓDIGO DO CLIENTE (3 TABELAS= produto, pedido, produto_pedido)
SELECT pedido.id,pedido.id_cliente,produto.nome,produto.preco,produto_pedido.quantidade, produto.preco*produto_pedido.quantidade AS Total
FROM pedido INNER JOIN (produto INNER JOIN produto_pedido
ON produto.id=produto_pedido.id_pedido) ON pedido.id=produto_pedido.id_produto


//MOSTRAR O CÓDIGO DO PEDIDO E O CÓDIGO DO CLIENTE - NOME CLIENTE(4 TABELAS= produto, pedido, produto_pedido, cliente) - 3 INNER JOIN

SELECT pedido.id,pedido.id_cliente,cliente.nome AS Cliente, produto.nome AS Produto,produto.preco,produto_pedido.quantidade, produto.preco*produto_pedido.quantidade AS Total
FROM pedido INNER JOIN (produto INNER JOIN produto_pedido
ON produto.id=produto_pedido.id_pedido) ON pedido.id=produto_pedido.id_produto

//access
SELECT pedido.id, pedido.id_cliente, cliente.nome,produto.nome AS Produto, produto.preco, produto_pedido.quantidade, produto.preco*produto_pedido.quantidade AS Total
FROM cliente INNER JOIN (pedido INNER JOIN (produto INNER JOIN produto_pedido ON produto.id = produto_pedido.id_pedido) ON pedido.id = produto_pedido.id_produto) ON cliente.id = pedido.id_cliente
ORDER BY produto.nome,cliente.nome


//sql
SELECT pedido.id, pedido.id_cliente, cliente.nome,produto.nome AS Produto, produto.preco, produto_pedido.quantidade, produto.preco*produto_pedido.quantidade AS Total
FROM cliente 
INNER JOIN pedido ON cliente.id=pedido.id_cliente 
INNER JOIN produto_pedido ON pedido.id=produto_pedido.id_pedido
INNER JOIN produto ON produto_pedido.id_produto=produto.id 
ORDER BY Total DESC


SELECT nome FROM cliente WHERE id=2

SELECT nome FROM cliente WHERE nome LIKE "%bel%"

SELECT nome FROM produto WHERE nome LIKE "%cel%"


SELECT nome FROM produto WHERE nome LIKE "*cel*"















