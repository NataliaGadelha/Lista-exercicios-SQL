/*Crie um banco de dados para um serviço de uma loja de Material de Construção. 
O nome do Banco de dados deverá ter o seguinte nome db_construindo_vidas.*/
CREATE DATABASE db_construindo_vidas;

/*Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, 
relevantes para classificar os produtos.*/
USE db_construindo_vidas;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
); 

#Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos .
#Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
CREATE TABLE tb_produtos(
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
('Cimento e Argamassa', 'Produtos para alvenaria e acabamento'),
('Tintas e Revestimentos', 'Tintas, massas e texturas'),
('Ferramentas', 'Ferramentas manuais e elétricas'),
('Elétrica', 'Materiais para instalações elétricas'),
('Hidráulica', 'Materiais para encanamento e água');

/*Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.*/
INSERT INTO tb_produtos (nome, preco, quantidade, descricao, id_categoria, fornecedor, data_validade) VALUES
('Saco de Cimento 50kg', 35.00, 100, 'Cimento Portland CP II', 1, 'Votoran', '2026-12-31'),
('Argamassa AC-II', 28.50, 80, 'Argamassa para assentamento de cerâmica', 1, 'Quartzolit', '2026-11-30'),
('Tinta Látex Branco 18L', 120.00, 50, 'Tinta à base de água para paredes internas', 2, 'Suvinil', '2026-10-20'),
('Furadeira Elétrica 500W', 250.00, 15, 'Furadeira de impacto para uso geral', 3, 'Bosch', '2030-01-01'),
('Chave de Fenda Média', 15.00, 60, 'Chave de fenda tamanho médio', 3, 'Tramontina', '2030-01-01'),
('Fio Elétrico 2,5mm 100m', 230.00, 25, 'Rolo de fio para instalações elétricas', 4, 'Sil', '2027-01-15'),
('Torneira de PVC', 35.90, 40, 'Torneira para jardim em PVC', 5, 'Tigre', '2030-01-01'),
('Joelho 90º 50mm', 8.00, 100, 'Conector de PVC para tubulação hidráulica', 5, 'Amanco', '2030-01-01');

#Mostra os registros inseridos nas tabelas
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

#Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
SELECT * FROM tb_produtos WHERE preco > 100;

#Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.
SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150;

#Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias.*/
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
ORDER BY tb_produtos.id ASC;

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: 
Todes os produtos que pertencem a categoria hidráulica).*/
SELECT * FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome LIKE "%Hidráulica%";
