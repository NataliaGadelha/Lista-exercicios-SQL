/*Crie um banco de dados para um serviço de RH de uma empresa, onde o 
sistema trabalhará com as informações dos colaboradores desta empresa. */
CREATE DATABASE db_rh;

USE db_rh;

/*Crie uma tabela de colaboradores e determine 5 atributos relevantes 
dos colaboradores para se trabalhar com o serviço deste RH.*/
CREATE TABLE tb_colaboradores (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL (7,2) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    contratacao DATE
);

#Insira nesta tabela no mínimo 5 dados (registros).
INSERT INTO tb_colaboradores (nome, salario, cargo, data_nascimento, contratacao)
VALUES ("Thiago Seyboth Wild", 1900.00, "Estagiário","2000-03-10","2025-03-20");
INSERT INTO tb_colaboradores (nome, salario, cargo, data_nascimento, contratacao)
VALUES ("Thiago Moura Monteiro", 5000.00, "Gerente","1994-05-31","2019-08-03");
INSERT INTO tb_colaboradores (nome, salario, cargo, data_nascimento, contratacao)
VALUES ("João Franca Guimarães Fonseca", 4000.00, "Júnior","2006-08-21","2024-05-04");
INSERT INTO tb_colaboradores (nome, salario, cargo, data_nascimento, contratacao)
VALUES ("Carlos Alcaraz Garfia", 9000.00, "Pleno","2003-05-05","2020-06-02");
INSERT INTO tb_colaboradores (nome, salario, cargo, data_nascimento, contratacao)
VALUES ("Beatriz Haddad Maia", 14000.00, "Sênior", "1996-05-30","2018-10-01");

#Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

#Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

#Ao término atualize um registro desta tabela através de uma query de atualização.
UPDATE tb_colaboradores SET salario = 2100.00 WHERE id = 1;

#Mostra o registro que foi alterado.
SELECT * FROM tb_colaboradores WHERE id = 1;

#Mostra a idade dos colaboradores da menor para a maior
SELECT nome, cargo,
TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM tb_colaboradores
ORDER BY idade ASC;

#Mostra quantos anos o funcionário tem de empresa
SELECT nome, cargo,
CONCAT(TIMESTAMPDIFF(YEAR, contratacao, CURDATE()), ' anos e ',
TIMESTAMPDIFF(MONTH, contratacao, CURDATE()) % 12, ' meses') AS tempo_empresa
FROM tb_colaboradores;