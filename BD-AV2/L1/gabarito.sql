DROP DATABASE IF EXISTS AV2;
CREATE DATABASE IF NOT EXISTS AV2;
USE AV2;

CREATE TABLE Personagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    classe VARCHAR(50),
    descricao TEXT,
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
-- Crie uma function "criaDescricaoPersonagem" que recebe o nome, a classe e o nível de um personagem e retorna uma string com a descrição do personagem, contendo todas as informações.
-- Exemplo: "O personagem Gandalf é um Mago de nível 20."

DELIMITER $$
CREATE FUNCTION criaDescricaoPersonagem(nome VARCHAR(100), classe VARCHAR(50), nivel INT) RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE descricao TEXT;
    SET descricao = CONCAT('O personagem ', nome, ' é um(a) ', classe, ' de nível ', nivel, '.');
    RETURN descricao;
END$$
DELIMITER ;

-- Questão 2
-- Crie uma procedure "inserePersonagem" que recebe o nome, a classe e o nível de um personagem e insere um novo personagem na tabela Personagem, com a descrição gerada pela função "criaDescricaoPersonagem".

DELIMITER $$
CREATE PROCEDURE inserePersonagem(nome VARCHAR(100), classe VARCHAR(50), nivel INT)
BEGIN
    DECLARE descricao TEXT;
    SET descricao = criaDescricaoPersonagem(nome, classe, nivel);
    INSERT INTO Personagem (nome, classe, descricao, nivel) VALUES (nome, classe, descricao, nivel);
END$$
DELIMITER ;

-- Questão 3
-- Faça a inserção de 3 personagens na tabela Personagem, utilizando a procedure "inserePersonagem".

CALL inserePersonagem('Vax', 'Ladino', 15);
CALL inserePersonagem('Pike', 'Clériga', 12);
CALL inserePersonagem('Scanlan', 'Bardo', 14);

-- Questão 4
-- Faça a inserção de 3 habilidades na tabela Habilidade.

INSERT INTO Habilidade (descricao, tipo) VALUES ('Furtividade', 'Passiva');
INSERT INTO Habilidade (descricao, tipo) VALUES ('Cura', 'Ativa');
INSERT INTO Habilidade (descricao, tipo) VALUES ('Canto da Inspiração', 'Ativa');

-- Questão 5
-- Atribua 2 habilidades para cada personagem, utilizando a tabela Personagem_Habilidade.

INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (1, 1);
INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (1, 2);

INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (2, 2);
INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (2, 3);

INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (3, 1);
INSERT INTO Personagem_Habilidade (personagem_id, habilidade_id) VALUES (3, 3);

-- Questão 6
-- Crie uma consulta que retorne todas as informações dos personagens e suas habilidades.
SELECT p.id, p.nome, p.classe, p.nivel, p.descricao, h.descricao, h.tipo
FROM Personagem p
JOIN Personagem_Habilidade ph ON p.id = ph.personagem_id
JOIN Habilidade h ON ph.habilidade_id = h.id;
