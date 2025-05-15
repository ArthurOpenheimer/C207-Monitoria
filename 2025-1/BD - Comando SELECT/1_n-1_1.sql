DROP DATABASE IF EXISTS Um_Muitos;
CREATE DATABASE IF NOT EXISTS Um_Muitos;
USE Um_Muitos ;


CREATE TABLE IF NOT EXISTS Empregado (
  idEmpregado INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEmpregado));


CREATE TABLE IF NOT EXISTS Dependentes (
  idDependentes INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  Empregado_idEmpregado INT NOT NULL,
  PRIMARY KEY (idDependentes),
  CONSTRAINT fk_Dependentes_Empregado
    FOREIGN KEY (Empregado_idEmpregado)
    REFERENCES Um_Muitos.Empregado (idEmpregado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO Empregado() values 
(default, 'Pedro', 'Rua dos Limas'),
(default, 'João', 'Rua dos Palmares'),
(default, 'Márcia', 'Rua das Luzes'),
(default, 'Joana', 'Rua Cinco'),
(default, 'Caio', 'Rua do Inatel');

INSERT INTO Dependentes() values 
(default, 'Dependente 1', 'Rua dos Limas', 1),
(default, 'Dependente 2', 'Rua dos Palmares', 2),
(default, 'Dependente 3', 'Rua das Luzes', 2),
(default, 'Dependente 4', 'Rua Cinco', 3),
(default, 'Dependente 5', 'Rua do Inatel', 4),
(default, 'Dependente 6', 'Rua das Aguas', 5);

SELECT Empregado.Nome, Dependentes.Nome FROM Empregado JOIN Dependentes;

SELECT E.Nome, D.Nome FROM Empregado AS E INNER JOIN Dependentes AS D;

SELECT E.Nome , D.Nome FROM Empregado AS E JOIN Dependentes AS D ON D.empregado_idEmpregado = E.idEmpregado;

SELECT E.Nome , D.Nome FROM Empregado AS E JOIN Dependentes AS D ON D.empregado_idEmpregado = E.idEmpregado  ORDER BY E.Nome;