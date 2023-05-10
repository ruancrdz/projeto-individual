-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/
create database GYM;
use GYM;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
email varchar(45),
senha varchar(45)
);

create table dados (
idDados int auto_increment,
idade int,
peso decimal,
altura decimal,
caloriaIdeal decimal,
fkUsuario int,
constraint fkUsuarioDados foreign key (fkUsuario) references usuario(idUsuario),
constraint pkComposta primary key (idDados, fkUsuario)
);


create table refeicoes (
idRefeicoes int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
calorias decimal,
dt date,
-- dt datetime default current_timestamp,
fkUsuario int,
constraint fkUsuarioRefeicoes foreign key (fkUsuario) references usuario(idUsuario)
);

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
