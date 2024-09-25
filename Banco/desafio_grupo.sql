-- criando banco de dados
create database adsc;
use adsc;

-- criando tabelas : banco, conta, cliente.
	-- banco tem n contas de n clientes 
	-- conta 1 banco
	-- cliente n contas em 1 banco
    
create table banco (
	idBanco int primary key auto_increment,
	nome varchar(50),
    cnpj char(14),
    tipo varchar(20)
);

create table conta (
	idConta int primary key auto_increment,
	nConta varchar(20),
    tipo varchar(30),
    agencia char(5)
); 

create table cliente (
	idCliente int primary key auto_increment,
    nome varchar(50),
    estadoCivil varchar(30),
    cpf char(11)
);

-- adicionando a chave estrangeira nas tabelas e configurando-as
alter table banco add column fkcliente int; 
alter table banco add constraint fkc foreign key (fkcliente) references cliente (idCliente);

alter table banco add column fkconta int;
alter table banco add constraint fk foreign key (fkconta) references conta (idConta);

alter table cliente add column fkSuaConta int;
alter table cliente add constraint fkcs foreign key (fkSuaConta) references conta (idConta);

-- vendo as tabelas completas
select*from banco;
select*from conta;
select*from cliente;

-- adicionando ilimitações em colunas das tabelas banco, conta e cliente
alter table conta add constraint tpc check (tipo in('corrente', 'poupança', 'conjunto'));
alter table banco add constraint tpb check (tipo in('físico', 'digital'));
alter table cliente add constraint est check (estadoCivil in('solteiro', 'casado', 'divorciado', 'viúvo'));

-- inserindo valores nas tabelas
insert into cliente (idCliente, nome, estadoCivil, cpf)values 
	(null, 'Felipino', 'solteiro', '57346189350'),
    (null, 'Felipina', 'solteiro', '57424619022'),
    (null, 'Julius', 'casado', '33933154677'),
    (null, 'Cesar', 'viúvo', '22241567599'),
    (null, 'Gabriel', 'solteiro', '00101154377'),
    (null, 'Noel', 'divorciado', '85790422213');
    
insert into conta (idConta, nConta, tipo, agencia) values
	(null, '234516789101112', 'corrente', '192'),
    (null, '234516789101133', 'poupança', '223'),
    (null, '234516789101114', 'corrente', '110'),
    (null, '234516789107772', 'conjunto', '321'),
    (null, '234516783301112', 'corrente', '231'),
    (null, '234516789106662', 'poupança', '321'),
    (null, '234516789107111', 'poupança', '110');
    
insert into banco (idBanco, nome, cnpj, tipo) values 
	(null, 'Banco do Brasil', '63728198304613', 'físico'),
    (null, 'Itaú', '54432217859075', 'físico'),
    (null, 'Nubank', '11143567754310', 'digital');
    
-- revendo as tabelas
select*from cliente; 
select*from conta;
select*from banco;

-- atualizando as chaves estrangeiras
update cliente set fkSuaConta = 4 where idCliente in (1,2);
update cliente set fkSuaConta = 1 where idCliente = 5;
update cliente set fkSuaConta = 2 where idCliente = 6;
update cliente set fkSuaConta = 3 where idCliente = 3;
update cliente set fkSuaConta = 7 where idCliente = 3;
update cliente set fkSuaConta = 6 where idCliente = 4;

update banco set fkconta = 4 where idBanco = 1;
update banco set fkconta = 1 where idBanco = 1;
update banco set fkconta = 2 where idBanco = 2;
update banco set fkconta = 3 where idBanco = 3;
update banco set fkconta = 7 where idBanco = 2;
update banco set fkconta = 6 where idBanco = 3;

update banco set fkcliente = 1 where idBanco = 1;
update banco set fkcliente = 2 where idBanco = 1;
update banco set fkcliente = 5 where idBanco = 1;
update banco set fkcliente = 6 where idBanco = 2;
update banco set fkcliente = 3 where idBanco = 3;
update banco set fkcliente = 3 where idBanco = 2;
update banco set fkcliente = 4 where idBanco = 3;

