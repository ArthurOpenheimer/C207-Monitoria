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
#LETRA A
INSERT INTO pessoa() VALUES(default, 'Pedro','Rua Sabiá','Desenvolvedor');
INSERT INTO pessoa(nome,endereco,cargo) VALUES('Marcelo','Rua Marciana','Tester');
INSERT INTO pessoa(nome,endereco,cargo) VALUES('Juliana','Rua das Maçãs','Desenvolvedor');

#LETRA B
SELECT nome FROM pessoa;

#LETRA C
UPDATE pessoa SET endereco = 'Rua das Uvas' WHERE id = 1;

#LETRA D
DELETE FROM pessoa WHERE id = 3;

#QUESTAO 2
CREATE TABLE IF NOT EXISTS empresa(
	matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    nProjetos INT
);

#RESPONDA A QUESTAO 2 AQUI
#LETRA A
INSERT INTO empresa() VALUES(default,'Junior','000.000.000-00','GP',2);
INSERT INTO empresa(nome,cpf,cargo,nProjetos) VALUES('Maria','111.111.111-11','Desenvolvedor',3);
INSERT INTO empresa() VALUES(default,'Carlos','222.222.222-22','Tester',4);
INSERT INTO empresa(nome,cpf,cargo,nProjetos) VALUES('Julia','333.333.333-33','Desenvolvedor',5);

#LETRA B
SELECT count(nome) FROM empresa WHERE nProjetos >= 4;

#LETRA C
SELECT AVG(nProjetos) FROM empresa WHERE NOT cargo = 'GP';

#LETRA D
SELECT DISTINCT cargo FROM empresa;

#LETRA E
SELECT nome, cpf, nProjetos FROM empresa WHERE cargo = 'Desenvolvedor';

#QUESTAO 3
CREATE TABLE IF NOT EXISTS aluno(
	nome VARCHAR(45),
	matricula INT NOT NULL PRIMARY KEY,
    endereco VARCHAR(45),
    ano_nasc INT,
    curso VARCHAR(45)
);

#RESPONDA AS QUESTOES 3 E 4 AQUI
#Atencao: para a resposta da letra A, preencha a linha da tabela da resposta no comando 'CREATE TABLE' com 'NOT NULL PRIMARY KEY'
#Exemplo: caso a sua resposta seja "ano_nasc" preencha no comando com 'ano_nasc INT NOT NULL PRIMARY KEY'
#LETRA A
#A coluna que deve ser considerada como chave primária deve ser a coluna matrícula, pois é o único campo que é único para cada aluno

#LETRA B
Insert into aluno(nome, matricula, endereco, ano_nasc, curso) values('Janaina', '123', 'Rua 1', '1998', 'GEB');
Insert into aluno() values('Luca', '444', 'Rua 2', '2004', 'GES');
Insert into aluno(nome, matricula, endereco, ano_nasc, curso) values('Paula', '334', 'Rua 3', '2000', 'GEC');

#QUESTAO 4
#LETRA A
Insert into aluno() values('Pedro', '225', 'Rua 25', '1999', 'GEA');
Insert into aluno() values('Jander', '109', 'Rua 10', '2000', 'GES');
Insert into aluno() values('Laura', '342', 'Rua 3', '2002', 'GEC');

#LETRA B
SELECT nome, matricula, curso FROM aluno WHERE nome LIKE 'Jan____%';

#LETRA C
SELECT nome, curso FROM aluno WHERE nome LIKE 'L%a';

#LETRA D
SELECT nome, ano_nasc, curso FROM aluno WHERE ano_nasc <= 2000;

#LETRA E
SELECT * FROM aluno limit 4;

#LETRA F
UPDATE aluno SET endereco = 'Rua 13' WHERE curso = 'GES';

#LETRA G
DELETE FROM aluno WHERE curso = 'GES';
