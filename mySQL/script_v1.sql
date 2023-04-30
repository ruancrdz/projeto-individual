create database GYM;
use GYM;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
email varchar(45),
senha varchar(45),
fkDados int,
constraint fkDados foreign key (fkDados)
	references dados(idDados)
);

desc usuario;

create table dados (
idDados int primary key auto_increment,
idade varchar(2),
peso varchar(3),
altura varchar(3),
caloriaIdeal varchar(4)
);

desc dados;

insert into usuario values
	(null, "Ruan", "Cardozo", "ruan.montanari@sptech.school", "#Gf52610741855", null);
    
insert into dados values
	(null, 18, 80, 168, 2000);
    
update usuario set fkDados = 1 where nome = "Ruan";

select usuario.nome,
	   usuario.sobrenome,
	   usuario.email,
	   usuario.senha,
	   dados.idade,
	   dados.peso,
	   dados.altura,
	   dados.caloriaIdeal
from usuario join dados on fkDados = idDados;