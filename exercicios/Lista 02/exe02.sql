/*Crie um banco de dados para um serviço de uma Pizzaria. O nome do 
Banco de dados deverá ter o seguinte nome db_pizzaria_legal.*/
CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

/*Crie a tabela tb_categorias e determine pelo menos 2 atributos, 
além da Chave Primária, relevantes para classificar as pizzas.*/
CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

/*Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.*/
/*Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.*/
CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    descricao VARCHAR(255),
    tamanho VARCHAR(10),
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

#Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Pizzas com sabores tradicionais'),
('Especiais', 'Pizzas com ingredientes diferenciados'),
('Veganas', 'Pizzas sem ingredientes de origem animal'),
('Doces', 'Pizzas com sabores doces'),
('Especial da Casa', 'Sabores exclusivos e criados pela nossa pizzaria');

/*Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação 
com a tabela tb_categorias.*/
INSERT INTO tb_pizzas (nome, preco, descricao, tamanho, id_categoria) VALUES
('Margherita', 35.90, 'Queijo, tomate e manjericão', 'Média', 1),
('Calabresa', 42.50, 'Calabresa fatiada com cebola', 'Grande', 1),
('Quatro Queijos', 45.00, 'Mussarela, provolone, parmesão e gorgonzola', 'Média', 1),
('Frango com Catupiry', 48.90, 'Frango desfiado com catupiry', 'Grande', 2),
('Rúcula com Tomate Seco', 49.90, 'Rúcula fresca e tomate seco', 'Média', 2),
('Vegetariana', 44.00, 'Mix de vegetais grelhados', 'Média', 3),
('Chocolate com Morango', 39.90, 'Chocolate derretido com morangos frescos', 'Pequena', 4),
('Pizza Trufada', 59.90, 'Cobertura de trufas negras e queijo brie', 'Grande', 5);

#Mostra os registros inseridos nas tabelas
SELECT * FROM tb_categorias;
SELECT * FROM tb_pizzas;

#Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE preco > 45.00;

#Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100;

#Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE nome LIKE "%M%"; 

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados 
da tabela tb_categorias.*/
SELECT * FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id
ORDER BY tb_pizzas.id ASC;

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela 
tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas 
que são doce).*/
SELECT * FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id
WHERE tb_categorias.nome LIKE "%Tradicional%";

