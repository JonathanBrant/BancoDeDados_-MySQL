insert into digitalhouse.turma (id, serie, turno) values (1, '8 ano', 'manhã');
insert into digitalhouse.turma (serie, turno) values ('6 ano', 'manhã');
insert into digitalhouse.turma (id, serie, turno) values (4, '7 ano', 'manhã');
insert into digitalhouse.estudante(matricula, nome) values ('123456', 'Fulano de Tal');
insert into digitalhouse.estudante(matricula, nome) values ('123458', 'Beltrano de Tal');
insert into digitalhouse.estudante_turma (id_estudante, id_turma) values (1, 1);
insert into digitalhouse.estudante_turma (id_estudante, id_turma) values (1, 2);

insert into digitalhouse.turno (nome) values('Manhã');
insert into digitalhouse.turno (nome) values('Tarde');
insert into digitalhouse.turno (nome) values('Tarde');

alter table turma drop column turno;

select * from turma;
select * from estudante;
select * from estudante_turma;
select * from turno;
select * from estudante.turma where turno = 'manhã';

#Inner JOIN
select * from digitalhouse.estudante e 
inner join digitalhouse.estudante_turma et on (e.id = et.id_estudante)
inner join digitalhouse.turma trm on (et.id_turma = trm.id)
inner join digitalhouse.turno trn on (trm.id_turno = trn.id); 

#LEFT JOIN
select * from digitalhouse.estudante e 
left join digitalhouse.estudante_turma et on (e.id = et.id_estudante)
left join digitalhouse.turma trm on (et.id_turma = trm.id)
left join digitalhouse.turno trn on (trm.id_turno = trn.id); 

update digitalhouse.turma set id_turno = 1 where turno = 'Manhã';
update digitalhouse.turma set id_turno = 2 where turno = 'Tarde';

delete from digitalhouse.turno where id = 3;

insert into digitalhouse.turma (serie, turno) values ('6 ano', 'Manhã');
insert into digitalhouse.turma (serie, turno) values ('5 ano', 'manha');
insert into digitalhouse.turma (serie, turno) values ('4 ano', 'Tarde');