CREATE DATABASE sprint2;
USE sprint2;


create table atleta(
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int 
) auto_increment = 001;

drop table atleta;

INSERT INTO atleta VALUES
	(null, 'Caio', 'Natação', 3),
    (null, 'Sabrina', 'Natação', 0),
    (null, 'Marcos', 'Hipismo', 2),
    (null, 'Jorge', 'Hipismo', 2),
    (null, 'Gabriela', 'Judo', 5),
    (null, 'Vagner', 'Judo', 8),
    (null, 'Ana', 'Judo', 10);
    
CREATE table Pais(
	idPais int primary key auto_increment,
    nome varchar(30),
    capital varchar(40)
);

INSERT INTO Pais VALUES
	(null, 'Brasil', 'Brasília'),
    (null, 'França', 'Paris'),
    (null, 'Coreia do Sul', 'Seul'),
    (null, 'Japão', 'Tokyo');
    
-- 1 pais tem 1 ou mais atletas 1:N
-- 1 atleta é de somente 1 pais 1:1

ALTER TABLE atleta ADD COLUMN fkPais int;
ALTER TABLE atleta ADD constraint fkPa foreign key (fkPais) references pais (idPais);

describe atleta;

select * from atleta;
select * from pais; -- 1 br, 2 fr, 3 cs, 4 jp

UPDATE atleta SET fkPais = 1 WHERE idAtleta IN (5,6);
UPDATE atleta SET fkPais = 2 WHERE idAtleta = 3;
UPDATE atleta SET fkPais = 4 WHERE idAtleta = 7;
UPDATE atleta SET fkPais = 3 Where idAtleta IN (1,4);
UPDATE atleta SET fkPais = 4 WHERE idAtleta = 2;

-- Exibir os atletas e seu respectivo país
SELECT * FROM atleta, pais;
SELECT a.nome, a.modalidade, a.qtdMedalha, p.nome, p.capital FROM 
	atleta AS a JOIN pais AS p ON idPais = fkPais;
    
-- exibir apenas o nome do atleta e o nome do respectivo país
SELECT a.nome AS nomeAtleta, p.nome AS País FROM 
	atleta AS a JOIN pais AS p ON idPais = fkPais;
    
-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital
SELECT a.idAtleta AS 'id do Atleta', a.nome AS 'Nome',
	a.modalidade AS 'Modalidade', a.qtdMedalha AS 'Quantidade de Medalha',
    p.nome AS 'País', p.capital AS 'Capital do País' FROM 
    atleta AS a JOIN pais AS p ON fkPais = idPais WHERE
    p.capital = 'Tokyo';
    
drop table atleta, pais;

-- 2.

CREATE TABLE musica (
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
); 

INSERT INTO musica VALUES 
	(null, 'Desce Licor', 'Trasha e Tracie', 'RAP'),
    (null, 'Stigma', 'BTS', 'POP'),
    (null, 'Blood, Sweat & Tears', 'BTS', 'POP'),
    (null, 'Brinks', 'Kyan', 'RAP'),
    (null, 'VVS', 'Japa', 'TRAP'),
    (null, 'Womanizer', 'Britiney Spears', 'POP');
    
CREATE TABLE album (
	idAlbum int primary key auto_increment,
    nome varchar(40),
    tipo varchar(40),
    dtLancamento date,
    constraint chkTipo check (tipo in ('digital' , 'físico'))
); 

INSERT INTO album VALUES 
	(null, 'WINGS', 'físico', '2016-10-10'),
    (null, 'Adeus Tokyo Part II', 'digital', '2022-09-30'),
    (null, 'Circus', 'físico', '2008-10-03'),
    (null, 'Yin Yang', 'digital', '2023-06-08');
    
-- 1 album pode ter n musicas / 1 musica pode ter 1 album

-- Exibir todos os dados das tabelas separadamente;
SELECT * FROM musica;
SELECT * FROM album;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio;
ALTER TABLE musica ADD COLUMN fkAlbum int;
ALTER TABLE musica ADD constraint fkAl foreign key (fkAlbum) references album(idAlbum);

-- Atualizar os álbuns de cada música;
-- wings
UPDATE musica SET fkAlbum = 1 WHERE idMusica IN (2,3);
-- tokyo
UPDATE musica SET fkAlbum = 2 WHERE idMusica = 5;
-- circus
UPDATE musica SET fkAlbum = 3 WHERE idMusica = 6;
-- yin
UPDATE musica SET fkAlbum = 4 WHERE idMusica = 1;

-- Exibir as músicas e seus respectivos álbuns;
SELECT m.titulo, a.nome AS 'Album' FROM musica AS m JOIN album AS a ON fkAlbum = idAlbum;
 
-- Exibir somente o título da música e o nome do seu respectivo álbum;
SELECT m.titulo, a.nome AS 'Album' FROM musica AS m JOIN album AS a ON fkAlbum = idAlbum 
WHERE nome = 'WINGS';

-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo
SELECT m.idMusica, m.titulo, m.artista, m.genero, a.nome AS 'Album', a.tipo AS 'Tipo do Album'
FROM musica AS m JOIN album AS a ON fkAlbum = idAlbum 
WHERE tipo = 'físico';