drop database GYM;	
create database GYM;
use GYM;

create table usuario (
email varchar(45) primary key,
nome varchar(45),
sobrenome varchar(45),
senha varchar(256)
);

desc usuario;

create table dados (
idDados int auto_increment,
idade int,
peso int,
altura int,
genero char(1),
caloriaIdeal int,
aguaIdeal int,
fkUsuario varchar(45),
foreign key (fkUsuario) references usuario(email),
primary key (idDados, fkUsuario)
);

select * from usuario;	

select * from dados;

-- NOME / EMAIL / SENHA / IDADE / PESO / ALTURA / CALORIA IDEAL
create view vw_ud as
select concat(usuario.nome, " ",usuario.sobrenome) as nome	,
	   usuario.email,
	   usuario.senha,
	   dados.idade,
	   dados.peso,
	   dados.altura,
	   dados.caloriaIdeal,
       dados.aguaIdeal
from usuario join dados on email = fkUsuario;

select * from vw_ud;