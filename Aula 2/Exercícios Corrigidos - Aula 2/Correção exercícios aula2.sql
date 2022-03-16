create database aula2;
use aula2;

--Ex1
create table matriculas(
idmat		int			not null,
nome		varchar(40) not null,
endereco	varchar(40)	not null,
cidade		varchar(20)	not null,
idcur		int			not null
);

insert into matriculas values (111,'Rodolfo Hindenbrugo','Rua Joaquim Rondina, 293','Bauru',1);

select * from matriculas;

-- nao considera o 0 a esquerda
insert into matriculas values (00222,'Margarida Petunia','Rua 7 de Outubro, 293','Osasco',0001);
select * from matriculas;

-- informa��o maior que o campo
insert into matriculas values (222,'Margarida Petunia','Rua 7 de Outubro, 293','Santa Cruz do Rio Pardo',1);
select * from matriculas;

--Ex2
create table vendas(
produto		varchar(30)		not null,
marca		varchar(20)		null,
cor			varchar(15)		null,
preco		decimal(7,2)	not null,
quant		int				not null,
valortotal	decimal(9,2)	not null,  -- dica sempre maior que o preco
datfabri	datetime		not null
);

insert into vendas values('Mouse','dell','preto',22.99,99,2276.01,'01/01/2022');
insert into vendas values('HD','sata',null,199.99,3,599.97,'03/01/2022'); 
insert into vendas values('Mouse Pad',null,'azul',15,6,90,'06/01/2022'); 
insert into vendas values('Teclado',null,null,15,6,90,'06/01/2022'); 

-- alguns erros
-- espa�o n�o � nulo
insert into vendas values('Mem�ria','','',15,6,90,'06/01/2022');
-- data com erro
insert into vendas values('Mem�ria','','',15,6,90,'29/02/2022');
-- data com erro - a revanche
insert into vendas values('Mem�ria','','',15,6,90,'10/13/2022');
-- data com erro - o retorno
insert into vendas values('Mem�ria','','',15,6,90,'29/02/22');

select * from vendas;

-- fazendo calculos com valores num�ricos
select preco, quant, preco * quant 'total'
from vendas;

-- fazendo calculos com datas
select datfabri, datfabri + 30 'Validade'
from vendas;

--Ex3
create table produtos(
produto		varchar(40)		not null,
cor			varchar(15)		null,
tamanho		varchar(3)		null,
preco		decimal(7,2)	not null   
);

insert into produtos values('camisa','azul','GG',99.99);
insert into produtos values('bone',null,null,70);
insert into produtos values('batom','vermelho',null,9.99);
insert into produtos values('cinto',null,'M',59.99);

select * from produtos;

--Ex4
create table usuarios(
iduser	int				not null,
nome	varchar(40)		not null,
datnasc	datetime		null,
fonecel	varchar(20)		null,
cpf		varchar(15)		null,
cep		varchar(9)		null
);

insert into usuarios values(1,'jose','20/10/1970','98787-8787','123123456-27','17120-000');
insert into usuarios values(2,'maria',null,null,null,null);
insert into usuarios values(3,'jana','30/10/1999',null,null,null);
insert into usuarios values(4,'durvalina','21/12/2020','98888-7777',null,null);
insert into usuarios values(5,'antonio','01/01/2000','014 3262-8890','123456789-90',null);
insert into usuarios values(1,'juca','05/10/1990','98877-9090','098987765-11','17128-014');

select * from usuarios;
