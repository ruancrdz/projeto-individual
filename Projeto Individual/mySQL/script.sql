create database if not exists GYM;
use GYM;

create table if not exists usuario (
nome varchar(45),
sobrenome varchar(45),
email varchar(45) primary key,
senha varchar(256)
);

create table if not exists dados (
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

create table if not exists historico (
idHistorico int auto_increment,
dtHora datetime default current_timestamp,
fkUsuarioHistorico varchar(45),
foreign key (fkUsuarioHistorico) references usuario(email),
primary key (idHistorico, fkUsuarioHistorico)
);

select * from usuario;	
    
select * from dados;

select * from historico;

-- NOME / EMAIL / SENHA / IDADE / PESO / ALTURA / CALORIA IDEAL / AGUA IDEAL / DATA E HORA -- ULTIMO REGISTRO
-- create view vw_udh as
select concat(usuario.nome, " ",usuario.sobrenome) as nome,
	   dados.idade,
	   dados.peso,	
	   dados.altura,
	   dados.caloriaIdeal,
       dados.aguaIdeal,
       historico.dtHora
from usuario join dados on email = fkUsuarioDados join historico on email = fkUsuarioHistorico where email = "teste@gmail.com" order by dados.idDados desc limit 1;