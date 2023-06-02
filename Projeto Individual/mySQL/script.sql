create database GYM;
use GYM;

create table usuario (
nome varchar(45),
sobrenome varchar(45),
email varchar(45) primary key,
senha varchar(256)
);

create table dados (
idDados int auto_increment,
idade int,
peso int,
altura int,
genero char(1),
caloriaIdeal int,
aguaIdeal int,
fkUsuarioDados varchar(45),
foreign key (fkUsuarioDados) references usuario(email),
primary key (idDados, fkUsuarioDados)
);

create table historico (
idHistorico int auto_increment,
dtHora datetime default current_timestamp,
fkUsuarioHistorico varchar(45),
foreign key (fkUsuarioHistorico) references usuario(email),
primary key (idHistorico, fkUsuarioHistorico)
);

select * from usuario;	

select * from dados;

select * from historico;

-- NOME / EMAIL / SENHA / IDADE / PESO / ALTURA / CALORIA IDEAL
create view vw_udh as
select concat(usuario.nome, " ",usuario.sobrenome) as nome	,
	   usuario.email,
	   usuario.senha,
	   dados.idade,
	   dados.peso,
	   dados.altura,
	   dados.caloriaIdeal,
       dados.aguaIdeal,
       historico.dtHora
from usuario join dados on email = fkUsuarioDados join historico on email =fkUsuarioHistorico;

select * from vw_udh;