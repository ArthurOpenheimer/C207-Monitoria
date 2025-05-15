DROP DATABASE IF EXISTS Muitos_Muitos;
CREATE DATABASE IF NOT EXISTS Muitos_Muitos;
USE Muitos_Muitos;


CREATE TABLE IF NOT EXISTS Empregado (
  idEmpregado INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(30) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEmpregado));


CREATE TABLE IF NOT EXISTS Projeto (
  idProjeto INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  setor VARCHAR(45) NOT NULL,
  PRIMARY KEY (idProjeto));


CREATE TABLE IF NOT EXISTS Empregado_has_Projeto (
  Empregado_idEmpregado INT NOT NULL,
  Projeto_idProjeto INT NOT NULL,
  Data_Conclusao DATE NULL,
  PRIMARY KEY (Empregado_idEmpregado, Projeto_idProjeto),
  CONSTRAINT fk_Empregado_has_Projeto_Empregado
    FOREIGN KEY (Empregado_idEmpregado)
    REFERENCES Empregado (idEmpregado),
  CONSTRAINT fk_Empregado_has_Projeto_Projeto1
    FOREIGN KEY (Projeto_idProjeto)
    REFERENCES Projeto (idProjeto)
);
    

INSERT INTO Empregado() values 
(default, 'Pedro', 'Rua dos Limas'),
(default, 'João', 'Rua dos Palmares'),
(default, 'Márcia', 'Rua das Luzes'),
(default, 'Joana', 'Rua Cinco'),
(default, 'Caio', 'Rua do Inatel');


INSERT INTO Projeto() values 
(default, 'Projeto 1', 1),
(default, 'Projeto 2', 1),
(default, 'Projeto 3', 2),
(default, 'Projeto 4', 2),
(default, 'Projeto 5', 2);

INSERT INTO Empregado_has_Projeto() values
(1, 2, "10-01-22"),
(2, 1, "22-12-19"),
(3, 1, "22-12-18"),
(4, 1, "12-06-22"),
(5, 2, "22-12-22");

SELECT E.Nome, P.Nome, EP.Data_Conclusao FROM Empregado AS E JOIN Empregado_has_Projeto AS EP ON E.idEmpregado = EP.Empregado_idEmpregado JOIN Projeto AS P ON P.idProjeto = EP.Projeto_idProjeto;
SELECT E.Nome, P.Nome, EP.Data_Conclusao FROM Empregado AS E JOIN Empregado_has_Projeto AS EP ON E.idEmpregado = EP.Empregado_idEmpregado JOIN Projeto AS P ON P.idProjeto = EP.Projeto_idProjeto ORDER BY EP.Data_Conclusao;

