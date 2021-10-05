create schema carro;

use carro;

create table carro.Carro (
	id int primary key auto_increment,
    marca varchar(25) not null,
    modelo varchar(25) not null,
    ano varchar(4) not null,
    preco decimal(10,2) not null
);

describe carro.carro;

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Ford","Fiesta","2010",12000)​

INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("GM","Opalla","1973",65000)
​
UPDATE carro.carro SET modelo='Opala' WHERE id=4
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("GM","Opalla","1973",65000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","147","1971",55000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Ford","Landau","1976",80000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","Palio","2002",11000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","Palio","1970",11000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Fiat","Palio","1979",11000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Harley Davidson","V-Rod","2013",50000)
​
INSERT INTO carro.carro (marca, modelo, ano, preco)
VALUES ("Harley Davidson","Sportster Iron 883","2017",60000)
​
INSERT INTO carro.carro 
VALUES (default,"Volkswagen","Fusca","1963",120000)
​
INSERT INTO carro.carro 
VALUES (default,"Volkswagen","Kombi","1965",80000)
​
# inserindo omitindo todos os campos
INSERT INTO carro.carro
VALUES (default,"Fiat","Palio","2015",22000)
​
# alterar campo ano para gravar valor default 2015
ALTER TABLE carro.carro CHANGE COLUMN ano ano varchar(4) not null default '2015'
​
# inserindo omitindo o valor do campo ano
INSERT INTO carro.carro (marca, modelo, preco)
VALUES ("Volkswagen","Gol",23000)

select * from carro;

# cliente deseja veículo da Ford com preço máximo de 15000,00
SELECT * FROM carro.carro
WHERE carro.marca='Ford' AND preco <= 15000
​
# cliente deseja carro dos anos 2000 OU com preço até 12000,00
SELECT * FROM carro.carro
WHERE carro.ano BETWEEN '2000' AND '2009' OR carro.preco <= 12000
​
# CLIENTE DESEJA OS 3 CARROS MAIS BARATOS independente de marca
SELECT * FROM carro.carro
ORDER BY carro.preco ASC LIMIT 3;
​
# cliente excêntrica deseja os 5 carros mais caros
SELECT * FROM carro.carro
ORDER BY carro.preco DESC LIMIT 5;
​
UPDATE carro.carro 
SET carro.ano='2009' 
WHERE carro.id=9; 
​
UPDATE carro.carro SET carro.ano='2011' WHERE carro.id=8;
​
# consultando todos os dados cadastrados na tabela Carro
SELECT * FROM carro.carro
ORDER BY carro.preco DESC, carro.marca;
​
# todos os produtos Harley Davidson tiveram um aumento de 10%
UPDATE carro.carro 
SET carro.preco=carro.preco*1.1 
WHERE carro.marca="Harley Davidson";
​
# todos os produtos Harley Davidson tiveram um aumento de 10%
UPDATE carro.carro 
SET carro.preco=carro.preco*1.1 
WHERE carro.marca="Harley Davidson";
​
SELECT * FROM carro.carro
WHERE carro.ano < "1970"
ORDER BY carro.ano
​
SELECT * FROM carro.carro
ORDER BY carro.marca;
​
START TRANSACTION;
SET autocommit = OFF;
	DELETE FROM carro.carro
	WHERE carro.marca="Fiat";
COMMIT;
    
# excluir carros fabricados na década de 1930
DELETE FROM carro.carro
WHERE carro.ano < "1940";
# WHERE carro.ano BETWEEN "1930" AND "1939";

#soma de todos os precos dos carros 
SELECT sum(preco) AS Total FROM carro.carro;

#Soma de todos os precos dos carros com id par
SELECT sum(preco) AS Total FROM carro.carro WHERE mod(id,2)=0;
SELECT sum(preco) AS Total FROM carro.carro WHERE id%2=0;

#Soma de todos os precos dos carros com id impar
SELECT sum(preco) AS Total FROM carro.carro WHERE mod(id,2)!=0;
SELECT sum(preco) AS Total FROM carro.carro WHERE id%2!=0;

#media dos precos de todos os carros
SELECT avg(preco) AS Media FROM carro.carro;

#media dos precos dos carros com id par
SELECT avg(preco) AS Media FROM carro.carro WHERE id%2=0;

#media dos precos da marca harley daividson
select avg(preco) as média from carro.carro where carro.marca like '%david%';


select * from carro.carro where carro.ano between '1960' and '1969' order by carro.preco limit 1;

#carro mais barato = década 60 - 1960 até 1969
select * from carro.carro where carro.ano between '1960' and '1969' order by carro.preco limit 1;

# agrupa de acordo com o parametro
select carro.marca, count(carro.marca) from carro.carro group by carro.marca;

#quando trabalharmos com group by não podemos utilizar where, neste caso usamos having
select carro.marca, count(carro.marca) as estoque from carro.carro group by carro.marca order by estoque desc, carro.marca limit 2;

#marca que possui o menor estoque
select carro.marca, count(carro.marca) as estoque from carro.carro group by carro.marca order by estoque asc, carro.marca limit 3;

#veiculos ford
select carro.marca, carro.ano, count(*) as estoque from carro.carro group by carro.marca, carro.ano having carro.marca="ford" order by carro.ano asc;

select carro.marca, carro.ano, carro.modelo, count(*) as Estoque from carro.carro where carro.modelo='Palio' group by carro.marca,
carro.ano having carro.marca='Fiat' order by carro.ano;




