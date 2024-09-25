CREATE DATABASE sprint1;
use sprint1;
-- exercício 1 
 
CREATE TABLE atleta (
	idAtleta int primary key,
    nome varchar(40),
    modalidade varchar (40),
    qtdMedalha int);
    
insert into atleta values
	(1, 'Camila', 'Atletismo', 5),
    (2, 'Carlos', 'Judô', 0),
    (3, 'Giulia', 'Atletismo', 6),
    (4, 'Matheus', 'Patinação no Gelo', 10),
    (5, 'Bruna', 'Patinação no Gelo', 10),
    (6, 'Wesley', 'Natação', 4),
    (7, 'Karla', 'Natação', 4),
    (8, 'Roberto', 'Judô', 3),
    (9, 'Kaique', 'Tênis', 1),
    (10, 'Julio', 'Tênis', 7);

-- exibir todos os dados da tabela    
SELECT * From atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
SELECT nome, qtdMedalha FROM atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade
SELECT * FROM atleta WHERE modalidade = 'natação';

-- Exibir os dados da tabela ordenados pela modalidade
SELECT * FROM atleta ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente
SELECT * FROM atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM atleta WHERE nome LIKE '%S%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
SELECT * FROM atleta WHERE nome LIKE 'K%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o
SELECT * FROM atleta WHERE nome LIKE '%O';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r
SELECT * FROM atleta WHERE nome LIKE '%R_';

-- penúltima letra do nome sendo i 
SELECT * FROM atleta WHERE nome LIKE '%I_';

-- Eliminar a tabela :(
DROP TABLE atleta;

	-- exercício 2

CREATE TABLE Musica (
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

INSERT INTO Musica VALUES
	(1, 'I Need U', 'BTS', 'KPOP'),
    (2, 'SuperShy', 'NewJeans', 'KPOP'),
    (3, 'Prada', 'Japa', 'TRAP'),
    (4, 'Everyday', 'Ariana Grande', 'POP'),
    (5, 'Medo Bobo', 'Maiara e Maraisa', 'Sertanejo'),
    (6, 'Thunderstruck', 'AC/DC', 'ROCK'),
    (7, 'Fire', 'BTS', 'KPOP'),
    (8, 'Novidade na Área', 'Livinho', 'FUNK'),
    (9, 'Whitle', 'BLACKPINK', 'KPOP'),
    (10, 'Toxic', 'Britiney Spears', 'POP');
    
-- Exibir todos os dados da tabela
SELECT * FROM Musica;

-- Exibir apenas os títulos e os artistas das músicas
SELECT titulo, artista FROM Musica;

-- Exibir apenas os dados das músicas de um determinado gênero
SELECT * FROM Musica WHERE genero = 'KPOP';

-- Exibir apenas os dados das músicas de um determinado artista
SELECT * FROM Musica WHERE artista = 'BTS';

-- Exibir os dados da tabela ordenados pelo título da música
SELECT * FROM Musica ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
SELECT * FROM Musica ORDER BY artista DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE 'S%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
SELECT * FROM Musica WHERE artista LIKE '%E';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Musica WHERE genero LIKE '_O%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE '%D_';

-- Elimine a tabela
DROP TABLE Musica;

	-- Exercício 3 

CREATE TABLE Filme (
	idFilme int primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40));
    
INSERT INTO Filme VALUES 
	(1, 'Barbie', 'Comédia', 'Greta Gerwig'),
    (2, 'Orgulho e Preconceito', 'Romance', 'Freddie Araújo'),
    (3, 'Adoráveis Mulheres', 'Romance', 'Greta Gerwig'),
    (4, 'Valente', 'Drama', 'Brenda Chapman'),
    (5, 'As Branquelas', 'Comédia', 'Keenen Ivory Wayans'),
    (6, 'A Freira', 'Terror', 'Corin Hardy'),
    (7, 'Sweeney Todd: O Barbeiro Demoníaco da Rua Fleet', 'Drama', 'Tim Burton'),
    (8, 'Noiva Cadáver', 'Fantasia', 'Tim Burton'),
    (9, 'A Fantástica Fabrica de Chocolate', 'Fantasia', 'Tim Burton'),
    (10, 'Annabelle', 'Terror', 'John R. Leonetti');
    
-- Exibir todos os dados da tabela
SELECT * FROM Filme;

-- Exibir apenas os títulos e os diretores dos filmes.
SELECT titulo, diretor FROM Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
SELECT * FROM Filme WHERE genero = "Drama";

-- Exibir apenas os dados dos filmes de um determinado diretor.
SELECT * FROM Filme WHERE diretor = "Tim Burton";

-- Exibir os dados da tabela ordenados pelo título do filme.
SELECT * FROM Filme ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT * FROM Filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
SELECT * FROM Filme WHERE titulo LIKE 'A%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
SELECT * FROM Filme WHERE diretor LIKE '%G';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Filme WHERE genero LIKE '_E%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Filme WHERE titulo LIKE '%T_';

-- Elimine a tabela.
DROP TABLE Filme;

	-- Exercício 4
    
CREATE TABLE Professor(
	idProfessor int primary key,
    nome varchar(50),
    especialidade varchar(40),
    dtNasc date
    );
    
INSERT INTO Professor VALUES
	(1, "Maria Soares", "Português", '1971-04-19'),
    (2, 'Sofia Marques', 'Geografia', '1981-07-10'),
    (3, 'Paulo Costa', 'Eduacação Física', '1975-04-12'),
    (4, 'Luísa Pereira', 'Inglês', '1988-02-20'),
    (5, 'André Almeida', 'Biologia', '1976-09-01'),
    (6, 'Carla Ferreira', 'Química', '1983-06-26'),
    (7, 'Pedro Rocha', 'Física', '1990-09-15'),
    (8, 'Ana Oliveira', 'Português', '1972-05-11'),
    (9, 'João Santos', 'História', '1985-07-22'),
    (10, 'Maria Silva', 'Matemática', '1978-03-10');
    
-- Exibir todos os dados da tabela.
SELECT * FROM Professor;

-- Exibir apenas as especialidades dos professores.
SELECT especialidade FROM Professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM Professor WHERE especialidade = 'Português';

-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM Professor ORDER BY nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM Professor ORDER BY dtNasc DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE 'M%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%S';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '_A%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%R_';

-- Elimine a tabela.
DROP TABLE Professor;

	-- Exercício 5
    
CREATE TABLE Curso(
	idCurso int primary key,
    nome varchar(50),
    sigla varchar(3),
    coordenador varchar(40)
    );
    
INSERT INTO Curso VALUES
	(1, 'Engenharia Civil', 'CE', 'Carlos Oliveira'),
    (2, 'Administração de Empresa', 'AE', 'Lia Lima'),
    (3, 'Medicina', 'MED', 'Luis Fernandes'),
    (4, 'Ciência da Computação', 'CCO', 'Ana Rodrigues'),
    (5, 'Direito', 'DIR', 'Pedro Silva'),
    (6, 'Psicológia', 'PSI', 'Giulia Carvalho'),
    (7, 'Arquiterura e Urbanismo','UA', 'Andrez Martins'),
    (8, 'Economia', 'ECO', 'Ricardo Almeida'),
    (9, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Carla Pães'),
    (10, 'Educação Física', 'EF', 'Paulo Mendes');
    
-- Exibir todos os dados da tabela.
SELECT * FROM Curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso WHERE sigla = 'DIR';

-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE 'E%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%O';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_I%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%A_';

-- Elimine a tabela.
DROP TABLE Curso;
	
	-- Execício 6 :)
    
CREATE TABLE Revista(
	idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30)
    );
    
INSERT INTO Revista (nome, categoria) VALUES
	('Vogue', ''),
    ('Time', ''),
    ('Época', ''),
    ('Forbes', '');
    
-- Exibir todos os dados da tabela.
SELECT * FROM Revista;

-- Atualize os dados das categorias das 4 revistas inseridas. 
UPDATE Revista SET categoria = 'Moda' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista = 2;
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista = 3;
UPDATE Revista SET categoria = 'Economia' WHERE idRevista = 4;

-- Exibir os dados da tabela novamente para verificar se atualizou corretamente.
 SELECT * FROM Revista;

-- Insira mais 3 registros completos.
INSERT INTO Revista (nome, categoria) VALUES
	('Rolling Stone', 'Música'),
    ('Nature', 'Ciência'),
    ('Veja', 'Política, Economia, Cultura'),
    ('Contigo', 'Celebridades');

-- Exibir novamente os dados da tabela.
SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
DESCRIBE Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);

-- Exibir os dados da tabela.
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;

-- Excluir o banco de dados sprint1.
DROP DATABASE sprint1;