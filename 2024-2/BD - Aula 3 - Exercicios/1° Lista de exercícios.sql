DROP DATABASE IF EXISTS aula3;
CREATE DATABASE aula3;
USE aula3;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

#QUESTAO 1
CREATE TABLE IF NOT EXISTS pessoa(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    cargo VARCHAR(45)
);

#RESPONDA A QUESTAO 1 AQUI

#QUESTAO 2
CREATE TABLE IF NOT EXISTS empresa(
	matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    nProjetos INT
);

#RESPONDA A QUESTAO 2 AQUI


#QUESTAO 3
CREATE TABLE IF NOT EXISTS aluno(
	matricula INT,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    ano_nasc INT,
    curso VARCHAR(45)
);

#RESPONDA AS QUESTOES 3 E 4 AQUI
#Atencao: para a resposta da letra A, preencha a linha da tabela da resposta no comando 'CREATE TABLE' com 'NOT NULL PRIMARY KEY'
#Exemplo: caso a sua resposta seja "ano_nasc" preencha no comando com 'ano_nasc INT NOT NULL PRIMARY KEY'
