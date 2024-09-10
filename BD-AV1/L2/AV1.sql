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

# Responda aqui a letra B

# Responda aqui a letra C

# Responda aqui a letra D

# Responda aqui a letra E

# Responda aqui a letra F

# Responda aqui a letra G

# Responda aqui a letra H

# Responda aqui a letra I