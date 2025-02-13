drop database if exists integracao;
create database integracao;
use integracao;

create table usuario(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(45) not null
);

