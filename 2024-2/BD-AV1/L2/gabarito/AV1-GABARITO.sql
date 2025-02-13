DROP DATABASE IF EXISTS AV1;
CREATE DATABASE AV1;
USE AV1;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS Personagem (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    linhagem VARCHAR(50) NOT NULL,
    classe VARCHAR(50) NOT NULL,
    arma VARCHAR(50) NOT NULL,
    proficiencia VARCHAR(50) NOT NULL,
    idade INT NOT NULL
);

# Responda aqui a letra A
INSERT INTO Personagem(nome, linhagem, classe, arma, proficiencia, idade) VALUES("Grog", "golias", "barbaro", "espada", "atletismo", 40);
INSERT INTO Personagem(nome, linhagem, classe, arma, proficiencia, idade) VALUES("Keyleth", "meio-elfo", "druida", "cajado", "natureza", 23);
INSERT INTO Personagem(nome, linhagem, classe, arma, proficiencia, idade) VALUES("Pike", "gnomo", "clérigo", "cajado", "religiao", 30);
INSERT INTO Personagem(nome, linhagem, classe, arma, proficiencia, idade) VALUES("Taryon", "humano", "artifice", "pistola", "tecnologia", 29);
INSERT INTO Personagem(nome, linhagem, classe, arma, proficiencia, idade) VALUES("Scanlan", "gnomo", "bardo", "flauta", "atuacao", 66);
INSERT INTO Personagem(nome, linhagem, classe, arma, proficiencia, idade) VALUES("Tiberius", "draconato", "feiticeiro", "cajado", "arcanismo", 28);

# Responda aqui a letra B
UPDATE Personagem SET idade = 24 WHERE nome = "Keyleth";

# Responda aqui a letra C
SELECT * FROM Personagem WHERE arma = "cajado";

# Responda aqui a letra D
DELETE FROM Personagem WHERE classe = "artifice";

# Responda aqui a letra E
SELECT * FROM Personagem WHERE linhagem = "gnomo";

# Responda aqui a letra F
SELECT MAX(idade) FROM Personagem;

# Responda aqui a letra G
UPDATE Personagem SET proficiencia = "natacao" WHERE nome = "Grog" OR nome = "Pike";

# Responda aqui a letra H
SELECT nome FROM Personagem WHERE nome LIKE "Ti____%";

# Responda aqui a letra I
SELECT COUNT(*) FROM Personagem WHERE idade >= 30;