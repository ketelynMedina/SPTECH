create database sprint_1;
use sprint_1;

CREATE TABLE professor(
	idProfessor int primary key,
    nome varchar(50),
    sobrenome varchar(30),
    especialidade1 varchar(40),
    especialidade2 varchar(40)
    );
    
INSERT INTO professor VALUES
	(1, "Maria", "Soares", "Português", 'Inglês'),
    (2, 'Sofia', 'Marques', 'Geografia', 'SEM'),
    (3, 'Paulo', 'Costa', 'Eduacação Física', 'SEM'),
    (4, 'Luísa', 'Pereira', 'Inglês', 'Português'),
    (5, 'André', 'Almeida', 'Biologia', 'Ciências'),
    (6, 'Carla', 'Ferreira', 'Química', 'Física'),
    (7, 'Pedro', 'Rocha', 'Física', 'Química'),
    (8, 'Ana', 'Oliveira', 'Português', 'Artes'),
    (9, 'João', 'Santos', 'História', 'Literatura'),
    (10, 'Maria', 'Silva', 'Matemática', 'Cálculo');
    
CREATE TABLE disciplina(
	idDisc int primary key,
    nomeDisc varchar(45)
);

INSERT INTO disciplina VALUES
	(1, "Português"),
    (2, 'Matématica'),
    (3, 'Ed. Física'),
    (4, 'Ciências'),
    (5, 'Artes');
   
INSERT INTO disciplina VALUES
	(6, "Inglês", null);
    
-- 1 professor leciona n disciplinas
-- 1 disciplina é lecionada por 1 professor
-- prof 1 n disc

alter table disciplina add column fkProfessor int;
alter table disciplina add constraint fkp foreign key (fkProfessor) references fkProfessor (idProfessor);

update disciplina set fkProfessor = 1 where idDisc = 1; -- por
update disciplina set fkProfessor = 10 where idDisc = 2; -- mate
update disciplina set fkProfessor = 3 where idDisc = 3; -- edf
update disciplina set fkProfessor = 7 where idDisc = 4; -- cie
update disciplina set fkProfessor = 8 where idDisc = 5; -- artes
update disciplina set fkProfessor = 1 where idDisc = 6; -- ingles

select * from professor;
select * from disciplina;

-- Exibir os professores e suas respectivas disciplinas;
select * from professor join disciplina on fkProfessor = idProfessor;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor;
select d.nomeDisc as Disciplina, p.Nome as Professor from disciplina as d join professor as p on fkProfessor = idProfessor;

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome;
select p.idProfessor as 'Identificação do Professor', p.Nome as Nome, p.sobrenome as Sobrenome, 
p.especialidade1 as 'Primeira Especialidade', p.especialidade2 as 'Segunda Especialidade', d.nomeDisc as 'Disciplina dada'
from professor as p join disciplina as d on fkProfessor = idProfessor
 where sobrenome = 'Soares';

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado 
	-- professor, ordenado de forma crescente pela especialidade1
select p.especialidade1 as 'Primeira Especialidade', d.nomeDisc as Disciplina from Professor as p join
disciplina as d on fkProfessor = idProfessor where nome = 'Ana';

drop database sprint_1;

-- 02
create database sprint_2;
use sprint_2;

create table curso (
	idCurso int primary key,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(50)
);

insert into curso values
	(1, 'Análise e Desenvolvimento de Sistema', 'ADS', 'Roberta Cristina'),
    (2, 'Ciência da Computação', 'CCO', 'Felipe Silva'),
    (3, 'Sistema da Informação', 'SIS', 'Carla Rodrigues');
    
-- aluno 1 curso
-- curso n alunos

create table aluno (
	idAluno int primary key,
    nome varchar(50),
    cpf char(11),
    fkCurso int,
    constraint fkc foreign key (fkCurso) references curso(idCurso)
);

insert into aluno values
	(100, 'Laura Bernades', '39827654430', 2),
    (101, 'Bruno Marques', '31827654430', 1),
    (102, 'Murilo Silva', '38827154430', 1),
    (103, 'Simone Bernades', '36827154430', 2),
    (104, 'Julio Soares', '32827615430', 3);
    
alter table aluno add column mensalidade varchar(20);
alter table aluno add constraint chkMensalidade check (mensalidade in('Em Dia', 'Atrasada'));

update aluno set mensalidade = 'Em Dia' where idAluno in (100,102,103,104);
update aluno set mensalidade = 'Atrasada' where idAluno = 101;
    
select * from curso join aluno on fkCurso = idCurso;

select a.nome as Aluno, c.nome as Curso, a.mensalidade as 'Status da Mensalidade' from
aluno as a join curso as c on fkCurso = idCurso where mensalidade = 'Atrasada';