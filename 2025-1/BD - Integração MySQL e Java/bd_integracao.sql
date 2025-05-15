drop database if exists integracao;
create database integracao;
use integracao;

create table usuario(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    cpf varchar(45) not null
);

create table materia(
id int not null auto_increment primary key,
nome varchar(45) not null
);

create table usuario_materia(
usuario_id int not null,
materia_id int not null,
primary key(usuario_id, materia_id),
constraint fk_usuario_materia_usuario foreign key(usuario_id) references usuario(id),
constraint fk_usuario_materia_materia foreign key(materia_id) references materia(id)
);

select * from usuario;

select * from materia;

SELECT U.id AS user_id, U.nome AS nome_usuario, U.cpf AS cpf_usuario,
                M.id AS materia_id, M.nome AS nome_materia
            FROM usuario U
            JOIN usuario_materia UM ON U.id = UM.usuario_id
            JOIN materia M ON M.id = UM.materia_id;