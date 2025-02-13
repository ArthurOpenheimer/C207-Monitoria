DROP DATABASE IF EXISTS exercicio_procedure_function;
CREATE DATABASE exercicio_procedure_function;
USE exercicio_procedure_function;

CREATE TABLE Aluno(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    curso VARCHAR(3),
    email VARCHAR(100)
);


DELIMITER $$
DROP FUNCTION IF EXISTS criaEmailAluno $$
CREATE FUNCTION criaEmailAluno(nome VARCHAR(50), curso VARCHAR(3)) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE email VARCHAR(100);
    SET email = CONCAT(nome, '@', curso, '.inatel.br');
    RETURN email;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS insereAluno $$
CREATE PROCEDURE insereAluno(nome VARCHAR(50), idade INT, curso VARCHAR(3))
BEGIN
    DECLARE email VARCHAR(100);
    SET email = criaEmailAluno(nome, curso);
    INSERT INTO Aluno (nome, idade, curso, email) VALUES (nome, idade, curso, email);
END$$
DELIMITER ;

CALL insereAluno('Joao', 20, 'ges');
CALL insereAluno('Maria', 21, 'gec');
CALL insereAluno('Jose', 18, 'geb');
CALL insereAluno('Ana', 19, 'get');
SELECT * FROM Aluno;