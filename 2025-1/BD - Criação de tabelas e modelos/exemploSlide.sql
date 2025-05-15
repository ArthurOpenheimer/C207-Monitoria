DROP DATABASE aula4;
CREATE DATABASE aula4;
USE aula4;

CREATE TABLE Casa (
    idCasa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Varinha (
    idVarinha INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    material VARCHAR(255) NOT NULL
);

CREATE TABLE Materia (
    idMateria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Bruxo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    Casa_idCasa INT NOT NULL,
    Varinha_idVarinha INT NOT NULL,
    CONSTRAINT fk_Casa 
    FOREIGN KEY (Casa_idCasa) 
    REFERENCES Casa(idCasa),
    CONSTRAINT fk_Varinha 
    FOREIGN KEY (Varinha_idVarinha) 
    REFERENCES Varinha(idVarinha)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Bruxo_has_Materia (
    Bruxo_id INT NOT NULL,
    Materia_id INT NOT NULL,
    CONSTRAINT fk_Bruxo 
    FOREIGN KEY (Bruxo_id) 
    REFERENCES Bruxo(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT fk_Materia 
    FOREIGN KEY (Materia_id) 
    REFERENCES Materia(idMateria)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO Casa (nome) VALUES ('Grifinória');
INSERT INTO Casa (nome) VALUES ('Sonserina');
INSERT INTO Casa (nome) VALUES ('Corvinal');
INSERT INTO Casa (nome) VALUES ('Lufa-Lufa');

INSERT INTO Varinha (material) VALUES ('Madeira de Teixo');
INSERT INTO Varinha (material) VALUES ('Madeira de Sabugueiro');
INSERT INTO Varinha (material) VALUES ('Madeira de Faia');

INSERT INTO Materia (nome) VALUES ('Poções');
INSERT INTO Materia (nome) VALUES ('Defesa Contra as Artes das Trevas');
INSERT INTO Materia (nome) VALUES ('Feitiços');
INSERT INTO Materia (nome) VALUES ('Astronomia');

INSERT INTO Bruxo (nome, Casa_idCasa, Varinha_idVarinha) VALUES ('Harry Potter', 1, 1);
INSERT INTO Bruxo (nome, Casa_idCasa, Varinha_idVarinha) VALUES ('Draco Malfoy', 2, 2);
INSERT INTO Bruxo (nome, Casa_idCasa, Varinha_idVarinha) VALUES ('Luna Lovegood', 3, 3);
INSERT INTO Bruxo (nome, Casa_idCasa, Varinha_idVarinha) VALUES ('Cedrico Diggory', 4, 1);

INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (1, 1);
INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (1, 2);

INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (2, 2);
INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (2, 3);

INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (3, 3);
INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (3, 4);

INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (4, 4);
INSERT INTO Bruxo_has_Materia (Bruxo_id, Materia_id) VALUES (4, 1);


SELECT * FROM Casa;
SELECT * FROM Varinha;
SELECT * FROM Materia;
SELECT * FROM Bruxo;
SELECT * FROM Bruxo_has_Materia;