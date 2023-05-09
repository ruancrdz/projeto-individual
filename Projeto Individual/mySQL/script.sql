create database GYM;
use GYM;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
email varchar(45),
senha varchar(45)
);

desc usuario;

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

desc dados;

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

desc refeicoes;

insert into usuario values
	(null, "Ruan", "Cardozo", "ruan.montanari@sptech.school", "#Gf52610741855");
    
select * from usuario;
    
insert into dados values
	(null, 18, 80, 168, 2000, 1);
    
select * from dados;

insert into refeicoes values
	(null, "Arroz e Feijão", "Almoço", "200", "2023-10-02", 1),
	(null, "Macarrão Alho e Óleo", "Janta", "400", "2023-10-02", 1),
	(null, "Arroz e Feijão", "Almoço", "400", "2023-10-03", 1),
	(null, "Macarrão Alho e Óleo", "Janta", "400", "2023-10-03", 1),
	(null, "Arroz e Feijão", "Almoço", "500", "2023-10-04", 1),
	(null, "Arroz e Feijão", "Janta", "200", "2023-10-04", 1),
	(null, "Arroz e Feijão", "Almoço", "200", "2023-10-05", 1),
	(null, "Arroz e Feijão", "Janta", "200", "2023-10-05", 1),
	(null, "Arroz e Feijão", "Almoço", "500", "2023-10-06", 1),
	(null, "Pizza", "Janta", "500", "2023-10-06", 1);
    
select * from refeicoes;

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec

update usuario set nome = concat(nome, " ", sobrenome);

-- NOME / EMAIL / SENHA / IDADE / PESO / ALTURA / CALORIA IDEAL
select usuario.nome,
	   usuario.email,
	   usuario.senha,
	   dados.idade,
	   dados.peso,
	   dados.altura,
	   dados.caloriaIdeal
from usuario join dados on idUsuario = fkUsuario;

-- NOME / CALORIA IDEAL / REFEIÇÃO / DESCRIÇÃO DA REFEIÇÃO / CALORIAS DA REFEIÇÃO

select dt as data,
	   usuarioDados.nome,
       refeicoes.nome as refeicao,
       refeicoes.descricao,
       refeicoes.calorias
from usuario as usuarioDados join dados on usuarioDados.idUsuario = dados.fkUsuario join refeicoes on refeicoes.fkUsuario = idUsuario where idUsuario = 1;


-- DATA /  CALORIA IDEAL / CALORIA TOTAL DO DIA / CALORIA MÁXIMA DO DIA / CALORIA MÍNIMA DO DIA/ CALORIA MÉDIA DO DIA
select dt as data,
	   usuario.nome,
	   dados.caloriaIdeal,
	   sum(calorias) as caloriaTotal, 
	   max(calorias) as caloriaMax, 
	   min(calorias) as caloriaMin, 
	   round(avg(calorias)) as caloriaMedia 
from refeicoes join usuario on refeicoes.fkUsuario = idUsuario join dados on dados.fkUsuario = idUsuario where idUsuario = 1 group by dt;


-- REFEIÇÃO // CALORIAS
select refeicoes.nome,
	   refeicoes.calorias
from refeicoes group by nome;