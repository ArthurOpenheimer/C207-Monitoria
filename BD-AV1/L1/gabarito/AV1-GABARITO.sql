DROP DATABASE IF EXISTS AV1;
CREATE DATABASE AV1;
USE AV1;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS Ninja (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    dinheiro INT NOT NULL,
    tipoChakra VARCHAR(50) NOT NULL,
    qtdChakra INT NOT NULL
);

# Responda aqui a letra A
INSERT INTO Ninja (nome, idade, titulo, dinheiro, tipoChakra, qtdChakra) VALUES ("Naruto", 13, "Genin", 0, "Vento", 600);
INSERT INTO Ninja (nome, idade, titulo, dinheiro, tipoChakra, qtdChakra) VALUES ("Sasuke", 14, "Chunin", 500, "Raio", 400);
INSERT INTO Ninja (nome, idade, titulo, dinheiro, tipoChakra, qtdChakra) VALUES ("Sakura", 12, "Genin", 150, "Terra", 500);
INSERT INTO Ninja (nome, idade, titulo, dinheiro, tipoChakra, qtdChakra) VALUES ("Gaara", 15, "Chunin", 400, "Areia", 550);
INSERT INTO Ninja (nome, idade, titulo, dinheiro, tipoChakra, qtdChakra) VALUES ("Kakashi", 28, "Jonin", 1000, "Raio", 200);
INSERT INTO Ninja (nome, idade, titulo, dinheiro, tipoChakra, qtdChakra) VALUES ("Minato", 35, "Hokage", 2000, "Vento", 300);

SELECT * FROM NINJA;
# Responda aqui a letra B
UPDATE Ninja SET idade = 14 WHERE nome = "Naruto";

# Responda aqui a letra C
SELECT * FROM Ninja WHERE titulo = "Genin";

# Responda aqui a letra D
DELETE FROM Ninja WHERE qtdChakra = 550;

# Responda aqui a letra E
SELECT titulo FROM Ninja WHERE tipoChakra = "Vento";

# Responda aqui a letra F
SELECT MAX(idade) FROM Ninja;

# Responda aqui a letra G
UPDATE Ninja SET titulo = "Chunin" WHERE nome = "Naruto" OR nome = "Sakura";

# Responda aqui a letra H
SELECT nome FROM Ninja WHERE nome LIKE "Sa____%";

# Responda aqui a letra I
SELECT COUNT(*) FROM Ninja WHERE dinheiro <= 1000;