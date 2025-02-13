DROP DATABASE IF EXISTS AV2;
CREATE DATABASE IF NOT EXISTS AV2;
USE AV2;

CREATE TABLE Personagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    classe VARCHAR(50),
    tipo VARCHAR(50),
    nivel INT
);

CREATE TABLE Habilidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    tipo VARCHAR(50)
);

CREATE TABLE Personagem_Habilidade (
    personagem_id INT,
    habilidade_id INT,
    FOREIGN KEY (personagem_id) REFERENCES Personagem(id),
    FOREIGN KEY (habilidade_id) REFERENCES Habilidade(id),
    PRIMARY KEY (personagem_id, habilidade_id)
);

-- Questão 1
-- Crie um trigger "verifica_nivel" que antes de um insert, verifica o nível do personagem que está sendo inserido. Se o nível for menor que 10, seta o tipo do personagem como "Iniciante". Se for maior que 10, seta o tipo como "Veterano".

DELIMITER $$
CREATE TRIGGER verifica_nivel BEFORE INSERT ON Personagem
FOR EACH ROW
BEGIN
    IF NEW.nivel < 10 THEN
        SET NEW.tipo = 'Iniciante';
    ELSE
        SET NEW.tipo = 'Veterano';
    END IF;
END$$
DELIMITER ;

-- Questão 2
-- Faça a inserção de 3 personagens na tabela Personagem.

INSERT INTO Personagem (nome, classe, nivel) VALUES ('Vax', 'Ladino', 15);
INSERT INTO Personagem (nome, classe, nivel) VALUES ('Pike', 'Clériga', 8);
INSERT INTO Personagem (nome, classe, nivel) VALUES ('Scanlan', 'Bardo', 14);

-- Questão 3
-- Faça a inserção de 3 habilidades na tabela Habilidade.

INSERT INTO Habilidade (descricao, tipo) VALUES ('Furtividade', 'Passiva');
INSERT INTO Habilidade (descricao, tipo) VALUES ('Cura', 'Ativa');
INSERT INTO Habilidade (descricao, tipo) VALUES ('Inspiração', 'Ativa');

-- Questão 4
-- Atribua 2 habilidades para cada personagem, utilizando a tabela Personagem_Habilidade.

INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (1, 1);
INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (1, 3);

INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (2, 2);
INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (2, 3);

INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (3, 1);
INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (3, 2);

-- Questão 5
-- Crie uma consulta que retorne todas as informações dos personagens e suas habilidades.

SELECT p.id, p.nome, p.classe, p.tipo, p.nivel, h.descricao, h.tipo
FROM Personagem p
JOIN Personagem_Habilidade ph ON p.id = ph.personagem_id
JOIN Habilidade h ON ph.habilidade_id = h.id;

-- Questão 6
-- Crie e chame uma view "personagem_habilidade_view" que retorne o nome do personagem e a descrição das habilidades que ele possui.

CREATE VIEW personagem_habilidade_view AS (
    SELECT p.nome, h.descricao
    FROM Personagem p
    JOIN Personagem_Habilidade ph ON p.id = ph.personagem_id
    JOIN Habilidade h ON ph.habilidade_id = h.id
);

SELECT * FROM personagem_habilidade_view;
