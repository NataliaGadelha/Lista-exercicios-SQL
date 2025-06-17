/*Crie um banco de dados para um serviço de uma Pizzaria. O nome do 
Banco de dados deverá ter o seguinte nome db_pizzaria_legal.*/
CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

/*Crie a tabela tb_categorias e determine pelo menos 2 atributos, 
além da Chave Primária, relevantes para classificar as pizzas.*/
CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    descricao VARCHAR(255)
);
