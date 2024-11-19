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



-- Questão 2
-- Crie uma procedure "inserePersonagem" que recebe o nome, a classe e o nível de um personagem e insere um novo personagem na tabela Personagem, com a descrição gerada pela função "criaDescricaoPersonagem".



-- Questão 3
-- Faça a inserção de 3 personagens na tabela Personagem, utilizando a procedure "inserePersonagem".



-- Questão 4
-- Faça a inserção de 3 habilidades na tabela Habilidade.



-- Questão 5
-- Atribua 2 habilidades para cada personagem, utilizando a tabela Personagem_Habilidade.



-- Questão 6
-- Crie uma consulta que retorne todas as informações dos personagens e suas habilidades.


