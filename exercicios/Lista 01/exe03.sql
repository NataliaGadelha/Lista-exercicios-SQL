/*Crie um banco de dados para um registro de uma escola, onde o sistema 
trabalhará com as informações dos estudantes deste registro dessa escola. */

CREATE DATABASE db_escola;

USE db_escola;

/*Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 
5 atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola. */
CREATE TABLE tb_estudantes (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    turma VARCHAR(10) NOT NULL,
    materia VARCHAR(100) NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    data_nascimento DATE
);

#Insira nesta tabela no mínimo 8 dados (registros).
INSERT INTO tb_estudantes (nome, turma, materia, nota, data_nascimento) VALUES
('Ana Paula Souza', '1A', 'Matemática', 8.50, '2006-04-12'),
('Bruno Henrique Lima', '1A', 'Português', 7.20, '2006-07-30'),
('Carla Beatriz Mendes', '2B', 'História', 9.00, '2005-11-05'),
('Diego Santos Rocha', '2B', 'Geografia', 6.80, '2005-03-18'),
('Eduarda Nogueira Silva', '3C', 'Química', 8.90, '2004-09-23'),
('Felipe Augusto Prado', '3C', 'Biologia', 7.75, '2004-01-09'),
('Gabriela Martins Alves', '1A', 'Matemática', 9.50, '2006-02-27'),
('Henrique Lopes Dias', '2B', 'Português', 6.40, '2005-06-16'),
('Isabela Cristina Costa', '3C', 'História', 8.25, '2004-05-11'),
('João Victor Almeida', '1A', 'Geografia', 7.00, '2006-08-04');

#Mostra a tabela criada com os registros
SELECT * FROM tb_estudantes;

#Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
SELECT * FROM tb_estudantes WHERE nota > 7.0;

#Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
SELECT * FROM tb_estudantes WHERE nota < 7.0;

#Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE tb_estudantes SET nota = 7.10 WHERE id = 10;

#Mostra que o regristro foi alterado
SELECT * FROM tb_estudantes WHERE id = 10;

#Mostra quantos alunos existem por matéria em ordem alfabética da matéria
SELECT materia, COUNT(*) AS alunos_por_materia
FROM tb_estudantes
GROUP BY materia
ORDER BY materia ASC;

#Média das notas por matéria, da menor para a maior
SELECT materia, FORMAT(AVG(nota), 2) AS media_notas
FROM tb_estudantes
GROUP BY materia
ORDER BY media_notas ASC;

#Mostra o total de alunos por turma
SELECT turma, COUNT(*) AS total_alunos
FROM tb_estudantes
GROUP BY turma;

#Mostra os alunos por idade, da menor para a maior
SELECT nome, turma, materia, data_nascimento,
TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM tb_estudantes
ORDER BY idade ASC;
