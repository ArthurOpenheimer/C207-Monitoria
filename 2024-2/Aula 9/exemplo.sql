CREATE DATABASE IF NOT EXISTS Exemplo;
USE Exemplo;

CREATE TABLE Pokemon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    habilidade VARCHAR(45) NOT NULL,
    tipoUm VARCHAR(45) NOT NULL,
    tipoDois VARCHAR(45),
    brilhante BOOLEAN NOT NULL
);

CREATE TABLE Treinador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    numPokebola INT,
    numInsignia INT,
    dinheiro VARCHAR(45)
);
