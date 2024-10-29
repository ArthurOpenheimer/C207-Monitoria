CREATE DATABASE C207;
USE C207;

CREATE TABLE alunos(
    matricula INT,
    curso VARCHAR(20),
    nome VARCHAR(50),
    periodo INT
    PRIMARY KEY (matricula, curso)
);

CREATE USER 'Monitor' IDENTIFIED BY '1111#GES';
-- Define um usuário chamado Monitor com senha 1111#GES

CREATE USER 'Professor' IDENTIFIED BY '2222#GES';
-- Define um usuário chamado Professor com senha 2222#GES



GRANT SELECT, INSERT, UPDATE, DELETE ON C207.alunos TO 'Monitor';
-- Concede apenas as permissões descrias para o usuário Monitor na tabela alunos

GRANT ALL PRIVILEGES ON C207.* TO 'Professor';
-- Concede todas as permissões para o usuário Professor no banco de dados C207


REVOKE INSERT ON C207.alunos FROM 'Monitor';
-- Revoga a permissão de inserção na tabela alunos do usuário Monitor

REVOKE CREATE, ALTER, DROP ON C207.* FROM 'Professor';
-- Revoga as permissões de criação, alteração e exclusão de 
-- objetos do banco de dados C207 do usuário Professor


