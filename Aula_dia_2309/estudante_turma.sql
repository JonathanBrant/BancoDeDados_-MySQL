/*
create table if not exists digitalhouse.turma(
	id int primary key auto_increment,
    serie varchar(50)
);    

create table if not exists digitalhouse.estudante(
	id int primary key auto_increment,
    matricula varchar(10) not null,
    nome varchar(150) not null,
    id_turma int not null,
    foreign key (id_turma) references turma(id)
    );
    
drop table turma;
drop table estudante;

*/

/*
create table if not exists digitalhouse.turma(
	id int primary key auto_increment,
    serie varchar(20)
);

alter table turma add column turno varchar(10) not null after serie;

create table if not exists digitalhouse.estudante(
	id int primary key auto_increment,
    matricula varchar(10) not null,
    nome varchar(150) not null,
    id_turma int not null,
    foreign key (id_turma) references turma(id)
);

create table if not exists digitalhouse.estudante_turma (
	id_estudante int,
    id_turma int,
    primary key(id_estudante, id_turma),
    foreign key (id_estudante) references estudante(id),
    foreign key (id_turma) references turma(id)
);

use digitalhouse;
select * from estudante;
*/


drop table digitalhouse.estudante;
drop table digitalhouse.estudante_turma;
drop table digitalhouse.turma;
create schema if not exists digitalhouse;
create table if not exists digitalhouse.turma (
	id int primary key auto_increment,
    serie varchar(20),
    turno varchar(10)
);
create table if not exists digitalhouse.estudante (
	id int primary key auto_increment,
    matricula varchar(10) not null,
    nome varchar(150) not null
);
create table if not exists digitalhouse.estudante_turma (
	id_estudante int,
    id_turma int,
    primary key (id_estudante, id_turma),
    foreign key (id_estudante) references estudante(id),
    foreign key (id_turma) references turma(id)
);

create table if not exists digitalhouse.turno (
	id int primary key auto_increment,
    nome varchar(5) not null
);

alter table digitalhouse.turma add column id_turno int;
alter table digitalhouse.turma add constraint foreign key (id_turno) references digitalhouse.turno(id);

