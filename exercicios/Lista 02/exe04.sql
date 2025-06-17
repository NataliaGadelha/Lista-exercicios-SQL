/*Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. O nome do Banco 
de dados deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais.*/
CREATE DATABASE db_cidade_das_carnes;

/*Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, 
relevantes para classificar os produtos.*/
USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
); 	

#Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos .
#Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    preco DECIMAL (8,2) NOT NULL,
    quantidade INT,
    descricao VARCHAR(255),
    id_categoria BIGINT,                  
    fornecedor VARCHAR(255),
    data_validade DATE,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

#Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
('Bovinos', 'Carnes de boi e derivados'),
('Suínos', 'Carnes de porco e derivados'),
('Aves', 'Carnes de frango e outras aves'),
('Defumados', 'Produtos defumados e embutidos'),
('Temperados', 'Carnes já temperadas para preparo rápido');

/*Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a 
relação com a tabela tb_categorias.*/
INSERT INTO tb_produtos (nome, preco, quantidade, descricao, id_categoria, fornecedor, data_validade) VALUES
('Picanha Bovina', 79.90, 20, 'Picanha fresca cortada', 1, 'Frigorífico Boi Brasil', '2025-07-30'),
('Costela Suína', 29.90, 30, 'Costela suína para churrasco', 2, 'Suínos do Vale', '2025-08-15'),
('Filé de Peito de Frango', 24.50, 50, 'Filé de peito sem osso', 3, 'Granjas Unidas', '2025-07-10'),
('Linguiça Calabresa Defumada', 22.00, 40, 'Linguiça defumada tipo calabresa', 4, 'Sabor Defumados', '2025-10-01'),
('Fraldinha Bovina', 45.90, 15, 'Fraldinha para grelha', 1, 'Frigorífico Boi Brasil', '2025-07-25'),
('Lombo Temperado', 34.90, 25, 'Lombo suíno já temperado', 5, 'Suínos do Vale', '2025-07-18'),
('Asa de Frango Temperada', 18.50, 35, 'Asinha de frango com tempero especial', 5, 'Granjas Unidas', '2025-07-12'),
('Bacon Defumado', 28.00, 20, 'Bacon em pedaços', 4, 'Sabor Defumados', '2025-09-20');

#Mostra os registros inseridos nas tabelas
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

#Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE preco > 50.00;

#Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

#Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.*/
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
ORDER BY tb_produtos.id ASC;

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela 
tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que 
pertencem a categoria aves ou frutas).*/
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome LIKE "%Aves%";