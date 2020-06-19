-- Cria um banco de Dados.
create database ordem_de_serviço_1;
drop database ordem_de_serviço;

-- acesso o banco de Dados.

use ordem_de_serviço_1;
show databases;
use phpmyadmin;

-- *********************************************************************************************************************
-- Cadastro de Usuário
-- **********************************************************************************************************************

-- Cria tabela / Create
create table tbusuario (
iduser int primary key,
usuario varchar(50) not null,
fone varchar(50),
loguin varchar(15) not null unique,
senha varchar (15) not null
);

-- Descrevendo a tabela.
describe tbusuario;

-- Inserindo dados na tabela / Readtbusuario
insert into tbusuario ( iduser, usuario, fone, loguin, senha)
values (1, 'Angela','(31)98888-6666', 'Angel', '1234' );

insert into tbusuario ( iduser, usuario, fone, loguin, senha)
values (2, 'Augusto','(31)98888-5555', 'AAAA', '5678' );

insert into tbusuario ( iduser, usuario, fone, loguin, senha)
values (3, 'Marcos','(31)97777-6666', 'Marc', '1010' );

insert into tbusuario ( iduser, usuario, fone, loguin, senha)
values (4, 'Aldo','(31)9855-6886', 'Al', '1122' );

insert into tbusuario ( iduser, usuario, fone, loguin, senha)
values (5, 'Tomas','(31)95638-7777', 'Tom', '155' );

insert into tbusuario ( iduser, usuario, fone, loguin, senha)
values (10, 'Adiministrador','(31)98800-6622', 'Admin', '7777' );

select *from tbusuario where loguin = 'Angel' and senha = '1234';

-- Modificando dados na tabela / update
update tbusuario set fone = '(31)2222-2222' where iduser = 10; 

-- Deletando Registro da tabela / Delete
delete from tbusuario;

-- ****************************************************************************************************************
-- Cadastro de Clientes
-- ****************************************************************************************************************

create table tbClientes(
idClientes int primary key auto_increment,
nomeCliente varchar (50) not null,
endCliente varchar (100), 
foneCliente varchar (50) not null,
emailCliente varchar (50)
);

-- Inserindo dados
insert into tbClientes(nomeCliente, endCliente, foneCliente, emailCliente)
values ('Carlos', 'rua Florinda', '(31)95555-3333', 'carlos@hotmail.com');

insert into tbClientes(nomeCliente, endCliente, foneCliente, emailCliente)
values ('Lucas', 'rua Flor Bela', '(31)95622-8933', 'lucas@hotmail.com');

insert into tbClientes(nomeCliente, endCliente, foneCliente, emailCliente)
values ('Lola', 'rua Kwait', '(31)91254-3113', 'lola@hotmail.com');

insert into tbClientes(nomeCliente, endCliente, foneCliente, emailCliente)
values ('Leonardo', 'rua Valoreque', '(31)94578-3344', 'leonardo@hotmail.com');

insert into tbClientes(nomeCliente, endCliente, foneCliente, emailCliente)
values ('Fabiola', 'rua sete', '(31)97788-52943', 'fabiola@hotmail.com');

select * from tbClientes;

-- **********************************************************************************************************************
-- Tabela Ordem de Serviços
-- **********************************************************************************************************************

-- Criandoa a Ordem de Serviço
create table tbOS(
os int primary key auto_increment,
data_OS timestamp default current_timestamp,
equipamento varchar (150) not null,
defeito varchar(150) not null,
serviço varchar(150),
tecnico varchar (30),
valor decimal(10,2),
idCli int not null,
foreign key(idCli) references tbClientes (idClientes)
);


insert into tbOS(equipamento, defeito, serviço, tecnico, valor, idCli)
values ('notebook core i3', 'Não liga','Troca da Fonte', 'José', '120.40', 3);

insert into tbOS(equipamento, defeito, serviço, tecnico, valor, idCli)
values ('notebook core i5', 'Tela escura','Troca da placa VGA', 'Simão', '220.50', 2);

insert into tbOS(equipamento, defeito, serviço, tecnico, valor, idCli)
values ('notebook core i3', 'Aquecendo muito','Troca da ventuinha', 'Luis', '111.10', 3);

insert into tbOS(equipamento, defeito, serviço, tecnico, valor, idCli)
values ('notebook core i7', 'Não inicia o Windows','Instalado Programa Windows 10', 'Junior', '192.70', 4);

insert into tbOS(equipamento, defeito, serviço, tecnico, valor, idCli)
values ('notebook core i5', 'Não liga','Troca do plug da Fonte', 'Souza', '45.90', 5);

select* from tbOS;
describe tbOS;

-- **********************************************************************************************************************
-- Tabela Funcionarios
-- **********************************************************************************************************************

create table tbFuncionarios( 
idFunc int primary key auto_increment,
NomeFunc varchar(150) not null,
endFunc varchar (150) not null,
dataContratado varchar (50) not null,
profissao varchar(50),
os int not null,
foreign key (os) references tbOs (os)
);
 
 insert into tbFuncionarios(nomeFunc, endFunc, dataContratado, profissao, os)
 values ('José', 'rua bom Jesus', '23/05/2009', 'Técnico Eletronico', 2);
 
 insert into tbFuncionarios(nomeFunc, endFunc, dataContratado, profissao, os)
 values ('Simão', 'rua Florianopolis', '20/05/2011', 'Técnico Eletronico', 2);
 
 insert into tbFuncionarios(nomeFunc, endFunc, dataContratado, profissao, os)
 values ('Luis', 'rua Cascavel', '22/08/2015', 'Técnico Eletronico', 3);
 
 insert into tbFuncionarios(nomeFunc, endFunc, dataContratado, profissao, os)
 values ('junior', 'rua Bom jardim', '13/01/2012', 'Técnico Eletronico', 4);
 
 insert into tbFuncionarios(nomeFunc, endFunc, dataContratado, profissao, os)
 values ('Souza', 'rua Portugual', '09/06/2019', 'Técnico Eletronico', 5);
  
 select * from tbFuncionarios;
 describe  tbFuncionarios;
 
-- ************************************************************************************************************************************************
-- O codigo abaixo traz a informação de 2 tabelas
-- ************************************************************************************************************************************************

select 
O.os, equipamento, defeito,serviço, valor,
C.nomeCliente,foneCliente
from tbOS as O
inner join tbClientes as C
on (O.os = C.idClientes);

show databases;
use phpmyadmin;
use ordem_de_serviço;