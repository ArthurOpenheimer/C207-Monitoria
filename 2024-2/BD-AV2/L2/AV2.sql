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



-- Questão 2
-- Faça a inserção de 3 personagens na tabela Personagem.



-- Questão 3
-- Faça a inserção de 3 habilidades na tabela Habilidade.



-- Questão 4
-- Atribua 2 habilidades para cada personagem, utilizando a tabela Personagem_Habilidade.



-- Questão 5
-- Crie uma consulta que retorne todas as informações dos personagens e suas habilidades.



-- Questão 6
-- Crie e chame uma view "personagem_habilidade_view" que retorne o nome do personagem e a descrição das habilidades que ele possui.


