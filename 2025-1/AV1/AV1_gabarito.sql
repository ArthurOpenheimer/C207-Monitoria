DROP DATABASE AV1;
CREATE DATABASE AV1;
USE AV1;

CREATE TABLE Heroi(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    nome_heroi VARCHAR(50) NOT NULL,
    poder VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    nome_inimigo VARCHAR(50) NOT NULL
);

SELECT * FROM Heroi;

-- Responda a letra a) aqui
INSERT INTO Heroi() VALUES(default, 'Peter Parker', 'Homem Aranha', 'soltar teia', 16, 'Duende Verde');
INSERT INTO Heroi() VALUES(default, 'Tony Stark', 'Homem de Ferro', 'tecnologia', 53, 'Mandarim');
INSERT INTO Heroi() VALUES(default, 'Steve Rogers', 'Capitão América', 'super força', 105, 'Caveira Vermelha');
INSERT INTO Heroi() VALUES(default, 'Stephen Strange', 'Doutor Estranho', 'magia', 95, 'Dormammu');
INSERT INTO Heroi() VALUES(default, 'Natasha Romanoff', 'Viúva Negra', 'nenhum', 39, 'bullseye');
INSERT INTO Heroi() VALUES(default, 'Wanda Maximoff', 'Feiticeira Escarlate', 'magia', 30, 'Agatha Harkness');

-- Respoda a letra b) aqui
SELECT * FROM Heroi WHERE idade >= 18;

-- Responda a letra c) aqui
SELECT max(idade) FROM Heroi;

-- Responda a letra d) aqui
UPDATE Heroi SET idade = 18 WHERE nome_heroi = 'Homem Aranha';
SELECT nome, idade, poder FROM Heroi WHERE nome_heroi = 'Homem Aranha';

-- Responda a letra e) aqui
DELETE FROM Heroi WHERE poder = 'nenhum';

-- Responda a letra f) aqui
SELECT nome_heroi FROM Heroi WHERE nome_inimigo = 'Agatha Harkness';

-- Responda a letra g) aqui
SELECT * FROM Heroi WHERE poder = 'magia' AND idade > 50;

-- Responda a letra h) aqui
SELECT * FROM Heroi WHERE nome_heroi LIKE 'Ho___%';

-- Responda a letra i) aqui
SELECT DISTINCT poder FROM Heroi;