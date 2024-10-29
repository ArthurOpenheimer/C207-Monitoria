
CREATE DATABASE Gabarito;
USE Gabarito;

CREATE TABLE Heroi(
    idHeroi INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(45),
    nascimento DATE,
    habilidade VARCHAR(45),
    sexo VARCHAR(45),
    email VARCHAR(45)
);

CREATE TABLE Vilao(
    idVilao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    num_crimes INT NOT NULL
);

CREATE TABLE Missao(
    idMissao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    data DATE NOT NULL,
    local VARCHAR(45),
    duracao INT,
    idVilao INT,
    CONSTRAINT fk_vilao FOREIGN KEY (idVilao) REFERENCES Vilao(idVilao)

);

CREATE TABLE heroi_has_Missao(
    idHeroi INT,
    idMissao INT,
    CONSTRAINT fk_heroi FOREIGN KEY (idheroi) REFERENCES heroi(idheroi),
    CONSTRAINT fk_missao FOREIGN KEY (idMissao) REFERENCES Missao(idMissao)
);

-- 2- Insira 5 Heróis, Vilões e Missões
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ('Homem Aranha', 'Rua dos Bobos', '2000-01-01', 'soltar teia', 'M', 'homem@aranha.com');
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ('Homem de Ferro', 'Rua dos Fracos', '1980-02-02', 'armadura de ferro', 'M', 'homem@deferro.com');
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ('Feiticeira Escarlate', 'Rua dos Magos', '1990-03-03', 'magia', 'F', 'feiticeira@escarlate.com');
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ('Capitão América', 'Rua dos Patriotas', '1930-04-04', 'escudo', 'M', 'capitao@america.com');
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ('Thor', 'Rua dos Deuses', '1980-05-05', 'martelo', 'M', 'deus@thor.com');

INSERT INTO Vilao (nome, num_crimes) VALUES ('Duende Verde', 10);
INSERT INTO Vilao (nome, num_crimes) VALUES ('Loki', 20);
INSERT INTO Vilao (nome, num_crimes) VALUES ('Thanos', 30);
INSERT INTO Vilao (nome, num_crimes) VALUES ('Doutor Destino', 40);
INSERT INTO Vilao (nome, num_crimes) VALUES ('Kang', 50);

INSERT INTO Missao (nome, data, local, duracao, idVilao) VALUES ('Salvar Nova York', '2020-01-01', 'Nova York', 5, 1);
INSERT INTO Missao (nome, data, local, duracao, idVilao) VALUES ('Salvar Asgard', '2020-02-02', 'Asgard', 10, 2);
INSERT INTO Missao (nome, data, local, duracao, idVilao) VALUES ('Salvar a Terra', '2020-03-03', 'Terra', 15, 3);
INSERT INTO Missao (nome, data, local, duracao, idVilao) VALUES ('Salvar o Universo', '2020-04-04', 'Universo', 20, 4);
INSERT INTO Missao (nome, data, local, duracao, idVilao) VALUES ('Salvar o Multiverso', '2020-05-05', 'Multiverso', 25, 5);

-- 3- Insira 3 Missões para cada Herói

INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (1, 1);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (1, 2);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (1, 3);

INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (2, 2);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (2, 3);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (2, 4);

INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (3, 3);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (3, 4);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (3, 5);

INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (4, 4);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (4, 5);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (4, 1);

INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (5, 5);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (5, 1);
INSERT INTO Heroi_has_Missao (idHeroi, idMissao) VALUES (5, 2);

-- 4- Faça uma busca que mostre apenas o nome do Herói, o nome das suas Missões e o nome do Vilão de cada missão mostrada, ordene a busca pelo nome dos heróis
SELECT h.nome AS 'Nome do Herói', m.nome AS 'Nome da Missão', v.nome AS 'Nome do Vilão'
FROM Heroi h
JOIN Heroi_has_Missao hm ON h.idHeroi = hm.idHeroi
JOIN Missao m ON hm.idMissao = m.idMissao
JOIN Vilao v ON m.idVilao = v.idVilao
GROUP BY h.nome;

-- 5- Faça uma busca que mostre o nome do herói, a duração total de suas missões e a quantidade de missões em que ele participou, ordene a busca pelo nome dos heróis
SELECT h.nome AS Heroi, SUM(m.duracao) AS Duracao_Total, COUNT(m.idMissao) AS Qtd_Missoes
FROM Heroi h
JOIN heroi_has_Missao hm ON h.idHeroi = hm.idHeroi
JOIN Missao m ON hm.idMissao = m.idMissao
GROUP BY h.nome;

-- 6- Faça uma busca que mostre o nome de Missões com o nome do Herói correspondente e o número de crimes do Vilão envolvido, ordene a busca pelo nome da missão
SELECT m.nome AS Missao, h.nome AS Heroi, v.num_crimes AS Crimes_Vilao
FROM Missao m
JOIN heroi_has_Missao hm ON m.idMissao = hm.idMissao
JOIN Heroi h ON hm.idHeroi = h.idHeroi
JOIN Vilao v ON m.idVilao = v.idVilao
GROUP BY m.nome;
