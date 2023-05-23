drop database GYM;	
create database GYM;
use GYM;

create table usuario (
cpf char(11) primary key,
nome varchar(45),
sobrenome varchar(45),
email varchar(45),
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
fkUsuario char(11),
foreign key (fkUsuario) references usuario(cpf),
primary key (idDados, fkUsuario)
);

select * from usuario;

select * from dados;

update usuario set nome = concat(nome, " ", sobrenome);
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec

-- NOME / EMAIL / SENHA / IDADE / PESO / ALTURA / CALORIA IDEAL
select usuario.nome,
	   usuario.email,
	   usuario.senha,
	   dados.idade,
	   dados.peso,
	   dados.altura,
	   dados.caloriaIdeal
from usuario join dados on cpf = fkUsuario;