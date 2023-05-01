create database GYM;
use GYM;

create table dados (
idDados int primary key auto_increment,
idade int,
peso decimal,
altura decimal,
caloriaIdeal decimal
);

desc dados;

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


create table refeicoes (
idRefeicoes int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
calorias decimal,
fkUsuario int,
constraint fkUsuario foreign key (fkUsuario)
	references usuario(idUsuario)
);

desc refeicoes;


insert into usuario values
	(null, "Ruan", "Cardozo", "ruan.montanari@sptech.school", "#Gf52610741855", null);
    
select * from usuario;
    
insert into dados values
	(null, 18, 80, 168, 2000);
    
select * from dados;
    
insert into refeicoes values
	(null, "Arroz e Feijao", "Almoco", "200", 1),
	(null, "Pizza", "Janta", "500", 1);
    
select * from refeicoes;

update usuario set fkDados = 1 where nome = "Ruan";

UPDATE usuario set nome = concat(nome, " ", sobrenome);

select usuario.nome,
	   usuario.email,
	   usuario.senha,
	   dados.idade,
	   dados.peso,
	   dados.altura,
	   dados.caloriaIdeal
from usuario join dados on fkDados = idDados;

select usuario.nome,
       dados.caloriaIdeal,
       refeicoes.nome,
       refeicoes.descricao,
       refeicoes.calorias
from usuario join dados on fkDados = idDados join refeicoes on fkUsuario = idUsuario;
	