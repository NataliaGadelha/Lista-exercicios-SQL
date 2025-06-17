/*Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados 
deverá ter o seguinte nome db_farmacia_bem_estar. */
CREATE DATABASE db_farmacia_bem_estar;

/*Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, 
relevantes para classificar os produtos.*/
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

/*Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.*/
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

/*Insira 5 registros na tabela tb_categorias.*/
INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Remédios e tratamentos para diversas doenças'),
('Suplementos', 'Vitaminas e suplementos alimentares'),
('Higiene Pessoal', 'Produtos para cuidados pessoais e beleza'),
('Equipamentos Médicos', 'Aparelhos e materiais para saúde'),
('Produtos Naturais', 'Produtos fitoterápicos e naturais');

/*Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.*/
INSERT INTO tb_produtos (nome, preco, quantidade, descricao, id_categoria, fornecedor, data_validade) VALUES
('Paracetamol 500mg', 12.50, 100, 'Analgésico e antitérmico', 1, 'Farmacorp', '2026-05-30'),
('Vitamina C 1000mg', 45.00, 50, 'Suplemento vitamínico para reforço imunológico', 2, 'NutriPlus', '2025-12-31'),
('Shampoo Antiqueda', 28.90, 40, 'Shampoo para prevenção da queda de cabelo', 3, 'Beleza Natural', '2025-11-20'),
('Máscara Cirúrgica', 1.50, 500, 'Máscara descartável para proteção', 4, 'SaúdeSegura', '2025-09-15'),
('Óleo de Melaleuca', 30.00, 60, 'Óleo essencial para cuidados naturais', 5, 'Naturale', '2026-03-10'),
('Ibuprofeno 400mg', 18.00, 80, 'Anti-inflamatório e analgésico', 1, 'Farmacorp', '2026-06-30'),
('Colágeno Hidrolisado', 60.00, 30, 'Suplemento para saúde da pele e articulações', 2, 'NutriPlus', '2025-12-10'),
('Termômetro Digital', 75.00, 15, 'Termômetro eletrônico para medição de temperatura', 4, 'EquipMed', '2030-01-01');

#Mostra os registros inseridos nas tabelas
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

#Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE preco > 50.00;

#Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

#Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%"; 

#Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
ORDER BY tb_produtos.id ASC;

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias,
 onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria 
 cosméticos).*/
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome LIKE "%Equipamentos Médicos%";