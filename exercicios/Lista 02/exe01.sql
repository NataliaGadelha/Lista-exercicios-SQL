/*Crie um banco de dados para um serviço de um Games Online. O nome do 
Banco de dados deverá ter o seguinte nome db_generation_game_online.*/
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online; 

/*Crie a tabela tb_classes e determine pelo menos 2 atributos, além da 
Chave Primária, relevantes para classificar os personagens do Game Online*/
CREATE TABLE tb_classes (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

/*Crie a tabela tb_personagens e determine 4 atributos, além da 
Chave Primária, relevantes aos personagens do Game Online.*/
/*Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.*/
CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    ataque_base INT NOT NULL,
    defesa_base INT NOT NULL,
    hp_maximo INT NOT NULL,
    id_classe BIGINT NOT NULL,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

#Insira 5 registros na tabela tb_classes.
INSERT INTO tb_classes (nome, descricao) VALUES
('Paladino', 'Guerreiro sagrado que combina ataque e cura.'),
('Feiticeiro', 'Especialista em magias sombrias e invocações.'),
('Caçador', 'Mestre em rastreamento e combate à distância.'),
('Bárbaro', 'Combatente selvagem com força brutal.'),
('Monge', 'Lutador rápido e disciplinado, com técnicas corpo a corpo.');

/*Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira 
para criar a relação com a tabela tb_classes.*/
INSERT INTO tb_personagens (nome, nivel, ataque_base, defesa_base, hp_maximo, id_classe) VALUES
('Eldrin', 20, 2500, 1200, 2000, 1),    
('Morgana', 18, 2200, 950, 1800, 2),    
('Ragnar', 15, 1800, 1100, 1900, 4),    
('Kael', 14, 1300, 740, 1700, 3),        
('Luna', 12, 500, 860, 1600, 5),        
('Thorin', 17, 1900, 690, 1950, 1),   
('Selene', 16, 2100, 1500, 1750, 3),     
('Darian', 19, 1600, 700, 1850, 5),
('Cassandra', 18, 1400, 800, 1700, 2);

#Mostra os registros inseridos nas tabelas
SELECT * FROM tb_personagens;
SELECT * FROM tb_classes;

#Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE ataque_base > 2000;

#Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE defesa_base BETWEEN 1000 AND 2000;

#Retorna os personagens cujo poder de defesa esteja no intervalo 1000 e 2000 e o nome da classe
SELECT tb_personagens.*, tb_classes.nome AS classe
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id
WHERE tb_personagens.defesa_base BETWEEN 1000 AND 2000;

#Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados 
da tabela tb_personagens com os dados da tabela tb_classes.*/
SELECT * FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id
ORDER BY tb_personagens.id ASC;

/*Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados 
da tabela tb_personagens com os dados da tabela tb_classes, onde 
traga apenas os personagens que pertençam a uma classe específica 
(Exemplo: Todes os personagens da classe dos arqueiros).*/
SELECT * FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id
WHERE tb_classes.nome LIKE "%Paladino%";