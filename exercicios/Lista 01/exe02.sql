/*Crie um banco de dados para um e-commerce, onde o sistema 
trabalhará com as informações dos produtos deste e-commerce. 
*/
CREATE DATABASE db_ecommerce;

USE db_ecommerce;

/*Crie uma tabela de produtos e determine 5 atributos relevantes 
dos produtos para se trabalhar com o serviço deste e-commerce.*/
CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL (8,2) NOT NULL,
    quantidade INT,
    descricao TEXT,
    categoria VARCHAR(100),                  
    fornecedor VARCHAR(255),
    data_validade DATE
);

#Insira nesta tabela no mínimo 8 dados (registros).
INSERT INTO tb_produtos (nome, preco, quantidade, descricao, categoria, fornecedor, data_validade) VALUES
('Raquete Wilson Pro Staff', 899.90, 10, 'Raquete profissional de tênis, leve e resistente', 'Raquetes', 'Wilson Sports', NULL),
('Bolas de Tênis Head (tubo c/ 3)', 49.90, 50, 'Conjunto de 3 bolas pressurizadas', 'Bolas', 'Head Brasil', '2026-03-01'),
('Corda Luxilon ALU Power', 139.90, 20, 'Corda de alta performance para encordoamento', 'Acessórios', 'Luxilon', NULL),
('Overgrip Babolat Pro', 29.90, 100, 'Overgrip para absorção de suor e conforto', 'Acessórios', 'Babolat', NULL),
('Bolsa Wilson Tour 6 Pack', 349.00, 5, 'Bolsa para transporte de até 6 raquetes', 'Bolsas', 'Wilson Sports', NULL),
('Viseira Nike Court Advantage', 79.90, 30, 'Viseira leve e ventilada para jogos ao ar livre', 'Vestuário', 'Nike', NULL),
('Tênis Asics Gel Resolution 9', 599.00, 15, 'Tênis para quadra com alta estabilidade', 'Calçados', 'Asics', NULL),
('Meias Adidas Performance (3 pares)', 39.90, 40, 'Pacote com 3 pares de meias esportivas', 'Vestuário', 'Adidas', NULL),
('Protetor de Cabo Yonex', 19.90, 60, 'Protetor de cabo para prolongar a vida útil da raquete', 'Acessórios', 'Yonex', NULL),
('Toalha Esportiva Babolat', 59.90, 25, 'Toalha absorvente ideal para treinos e partidas', 'Acessórios', 'Babolat', NULL);

#Mostra a tabela com os registros
SELECT * FROM tb_produtos;

#Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
SELECT * FROM tb_produtos WHERE preco > 500;

#Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
SELECT * FROM tb_produtos WHERE preco < 500;

#Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE tb_produtos SET quantidade = 15 WHERE id = 1;

#Mostra o registro que foi alterado.
SELECT * FROM tb_produtos WHERE id = 1;

#Mostra os produtos na tabela a partir do nome do fornecedor
SELECT * FROM tb_produtos WHERE fornecedor LIKE "%wilson%";

#Mostra os produtos ordenados por preço
SELECT * FROM tb_produtos ORDER BY preco ASC;

#Mostra todos os produtos de determinada categoria
SELECT * FROM tb_produtos WHERE categoria = 'Acessórios';

#Mostra todos os produtos que tem validade
SELECT * FROM tb_produtos WHERE data_validade IS NOT NULL;

#Calcula o valor total de estoque
SELECT nome, preco, quantidade, (preco * quantidade) AS valor_total_estoque
FROM tb_produtos;

#Conta quantos produtos existem por categoria
SELECT categoria, COUNT(*) AS quantidade_de_produtos
FROM tb_produtos
GROUP BY categoria;
