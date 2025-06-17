/*Crie um banco de dados para uma plataforma de Cursos Online (EAD). O nome do Banco de dados 
deverá ter o seguinte nome db_curso_da_minha_vida.*/
CREATE DATABASE db_curso_da_minha_vida;

/*Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, 
relevantes para classificar os produtos.*/
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

#Crie a tabela tb_cursos e determine 4 atributos, além da Chave Primáriada farmácia.
CREATE TABLE tb_cursos(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    preco DECIMAL (8,2) NOT NULL,
    descricao VARCHAR(255),
    id_categoria BIGINT,                  
    instrutor VARCHAR(255),
    data_inicio DATE,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

#Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_cursos.

#Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (nome, descricao) VALUES
('Tecnologia', 'Cursos da área de informática, programação e TI'),
('Marketing Digital', 'Cursos sobre vendas online, redes sociais e tráfego pago'),
('Desenvolvimento Pessoal', 'Cursos para melhorar habilidades pessoais e profissionais'),
('Idiomas', 'Cursos de línguas estrangeiras'),
('Negócios e Empreendedorismo', 'Cursos sobre gestão, finanças e criação de empresas');

/*Insira 8 registros na tabela tb_cursos, preenchendo a Chave Estrangeira para criar a relação 
com a tabela tb_categorias.*/
INSERT INTO tb_cursos (nome, preco, descricao, id_categoria, instrutor, data_inicio) VALUES
('Curso de Programação em Python', 800.00, 'Aprenda lógica de programação e Python do zero', 1, 'Lucas Almeida', '2025-07-05'),
('Gestão de Tráfego Pago', 1200.00, 'Aprenda a criar campanhas de anúncios no Google e Meta Ads', 2, 'Mariana Ribeiro', '2025-07-15'),
('Oratória e Comunicação', 650.00, 'Desenvolva sua comunicação em público e no trabalho', 3, 'Carlos Moreira', '2025-07-20'),
('Inglês para Iniciantes', 500.00, 'Curso básico de inglês focado em conversação', 4, 'Sarah Costa', '2025-08-01'),
('Criação de Startups', 1500.00, 'Aprenda a transformar uma ideia em um negócio real', 5, 'Renato Silva', '2025-08-10'),
('Marketing de Conteúdo', 700.00, 'Como atrair clientes usando redes sociais e blogs', 2, 'Bruna Martins', '2025-07-25'),
('Finanças para Pequenos Negócios', 950.00, 'Organize as finanças da sua empresa', 5, 'Fernanda Lopes', '2025-08-05'),
('Inteligência Emocional', 600.00, 'Aprenda a lidar com emoções no trabalho e na vida pessoal', 3, 'Ricardo Santos', '2025-07-30'),
('Java para Iniciantes', 850.00, 'Aprenda os conceitos básicos de programação em Java', 1, 'João Pereira', '2025-08-20');

#Mostra os registros inseridos nas tabelas
SELECT * FROM tb_cursos;
SELECT * FROM tb_categorias;

#Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.
SELECT * FROM tb_cursos WHERE preco > 500.00;

#Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.
SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

#Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.
SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da 
tabela tb_categorias.*/
SELECT * FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id
ORDER BY tb_cursos.id ASC;

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: 
Todes os cursos que pertencem a categoria Java).*/
SELECT * FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id
WHERE tb_categorias.nome LIKE "%Tecnologia%";
