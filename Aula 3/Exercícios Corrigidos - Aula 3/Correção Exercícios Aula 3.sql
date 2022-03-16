create database fib;
use fib;

-- NAO TEM NA LISTA
-- ATEN��O - quando criamos a tabela sem NULL ou NOT NULL
-- o padr�o � considerar o campo NULL

create table clientes(
idcli	int			,
cliente	varchar(40)	,
fone	varchar(18)
);

insert into clientes values(null,null,null);
select * from clientes;
drop table clientes;

-- 1 Criar a tabela do exemplo desta aula
create table clientes(
idcli	int			not null,  
cliente varchar(40)	not null,
fone	varchar(18)	not null
primary key(idcli)
);

-- 2 Inserir 2 registros na tabela
insert into clientes values (1,'Antonio Antenor','014 99878-1010');
insert into clientes values (2,'Juniorclay Juvencio','014 3262-3432');
insert into clientes values (3,'Mariovaldo','014 99878-1111');
insert into clientes values (4,'Marcicleyson','014 3262-2121');

-- 3 Verificar os registros
select * from clientes;

-- 4 Dropar a tabela criada
drop table clientes;

-- 5 Inserir 2 campos � sendo 1 deles com a constraints NULL
create table clientes(
idcli	int			not null,
cliente	varchar(40)	not null,
cidade	varchar(40)	not null,
fone	varchar(18)	null,
email	varchar(40) null
primary key(idcli)
);

-- 6 Inserir um registro com todos os campos preenchidos
insert into clientes values (1,'Katarina Kempes','Itajai','014 3262-9090','kata@rina.com.br');
select * from clientes;

-- 7 Inserir um registro com campo NULL
insert into clientes values (2,'Tulio Tiburcio','Itu','014 99090-1234',null);
insert into clientes values (3,'Zezao Zica','Jau',null,'zezao@uol.com.br');
insert into clientes values (4,'Zezinho Zinho','Bauru',null,null);
select * from clientes;

-- 8 Testar chave prim�ria for�ando o erro
insert into clientes values (1,'Maria Mariana','Agudos','021 3278-9393','mari@uol.com.br');
insert into clientes values (5,'Maria Mariana','Agudos','021 3278-9393','mari@uol.com.br');
-- dados truncados
insert into clientes values (6,'Ursula Umbelina dos Santos Neves Oliveira Sampaio Sobrinho','Agudos','021 3278-9393','mari@uol.com.br');
-- campos a mais
insert into clientes values (7,'Antenor Antonio','Agudos','021 3278-9393','mari@uol.com.br',1232);
-- campos a menos
insert into clientes values (7,'Antenor Antonio','Agudos','021 3278-9393');

-- 9 Testar chave prim�ria composta for�ando o erro
drop table clientes;

create table clientes(
idcli	int			not null,
cliente	varchar(40)	not null,
cidade	varchar(40)	not null,
fone	varchar(18)	null,
email	varchar(40) not null
primary key(idcli,email)
);

-- OK
insert into clientes values (1,'Katarina Kempes','Itajai','014 3262-9090','kata@rina.com.br');
-- OK troquei codigo
insert into clientes values (2,'Katarina Kempes','Itajai','014 3262-9090','kata@rina.com.br');
-- OK troquei email
insert into clientes values (1,'Katarina Kempes','Itajai','014 3262-9090','kata@terra.com.br');
-- ERRO mesmo codigo E mesmo email
insert into clientes values (1,'Maria Getulina','Bauru',null,'kata@rina.com.br');
select * from clientes;

-- 10 Dropar a tabela criada
drop table clientes;

-- 11 Modificar o campo codcli para IDENTITY e criar a tabela novamente
create table clientes(
idcli	int		identity	not null,
cliente	varchar(40)			not null,
cidade	varchar(40)			not null,
fone	varchar(18)			null,
email	varchar(40)			not null
primary key(cliente)
);

-- 12 Inserir um registro
insert into clientes values ('Katarina Kempes','Itajai','014 3262-9090','kata@rina.com.br');

-- ERRO
insert into clientes values ('Katarina Kempes','Itajai',null,'kata@rina.com.br');

-- 13 Inserir um registro com campo NULL
insert into clientes values ('Antonia','Itajai',null,'antonia@bol.com.br');

-- 14 Verificar os registros cadastrados
select * from clientes;

-- 15 for�ando erro chave primaria com identity
insert into clientes values ('Katarina Kempes','Bauru','099 98787-9090','kempes@bol.com.br');
insert into clientes values ('Umbelina','Bauru','099 98711-9090','umbelina@bol.com.br');
select * from clientes;

-- 16 Criar o banco de dados HOSPITAL
create database hospital;
use hospital;

-- 17 Criar as tabelas MEDICO, PACIENTE, CONSULTA com campos a sua escolha
-- m�nimo 6 em cada tabela � todas as tabelas devem ter chave prim�ria
-- e identity- mas uma delas deve ter chave composta
-- Inserir 2 registros em cada tabela 

create table medico(
idmedico		int identity not null,
medico			varchar(50)  not null,
idade			int          not null,
especialidade	varchar(50)  not null,
telefone		varchar(20)  null,
cidade			varchar(40)  null
primary key(idmedico)
);

insert into medico values ('Marco','53','oftamologista','014 99823-2328','Bauru');
insert into medico values ('Antunes','75','dermatologista','014 3239-3439','Agudos');

create table paciente(
idpaciente  int identity  not null,
paciente	varchar(50)   not null,
idade		int           not null,
telefone    varchar(20)   not null,
cpf         varchar(20)   not null,
cidade      varchar(30)   not null
primary key(idpaciente)
);

insert into paciente values('Maricona Mariquinha','27','014 99832-2323','081897908-90','Lins');
insert into paciente values('Mirtis Cintia','35',' 011 9983-2323','234897126-11','Ubatuba');

create table consulta(
idconsulta  int identity  not null,
idpaciente  int           not null,
idmedico    int           not null,
dtconsulta	datetime      not null,
endereco    varchar(50)   not null,
cpfpaciente	varchar(20)   not null
primary key(cpfpaciente,idmedico)
);

insert into consulta values (1,1,'10/03/2021','rua das flores 90','087654123-27');
-- erro mesmo medico com mesmo paciente
insert into consulta values (2,1,'11/03/2021','rua das flores 100','087654123-27');

-- nao tem como ter erro de chave primaria na tabela m�dico e paciente
-- o codigo � identity e � a chave primaria

-- 22
create table ficha(
cpf			varchar(20)	not null,  
rg			varchar(20)	not null,  
nome		varchar(40)	not null,
idade		int			not null, 
peso		decimal(7,3)not null,	-- peso 999.999
altura		decimal(4,2)not null,	-- altura 9.99  
chuteira	int			not null,
salario		decimal(9,2)not null,	-- salario 999,999.99
bonus		decimal(9,2)not null,	-- bonus 999,999.99
desconto	decimal(8,2)not null,	-- desconto 99,999.99
dtnasc		datetime	not null,
posicao		varchar(20)	not null,
clube		varchar(20)	not null,
num_camisa	int			not null
primary key(cpf)
);

insert into ficha values ('123456789-90','98657234-X','Jos� da Silva Xavier',
20,78,1.80,48,2738.90,1000,32.9,'28/02/2009','Goleiro','Palmeiras',1);
select * from ficha;
