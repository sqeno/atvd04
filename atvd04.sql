create database detran;

use detran;

CREATE TABLE proprietario (
    id_proprietario integer PRIMARY KEY auto_increment,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    endereco VARCHAR(150)
);

CREATE TABLE cnh (
    id_cnh integer PRIMARY KEY auto_increment,
    numero VARCHAR(20),
    categoria VARCHAR(5),
    validade DATE,
    fk_proprietario_id_proprietario_cnh integer
);

CREATE TABLE veiculo (
    id_veiculo integer PRIMARY KEY auto_increment,
    placa VARCHAR(10),
    modelo VARCHAR(50),
    cor VARCHAR(30),
    fk_proprietario_id_proprietario_veiculo integer
);

alter table veiculo add foreign key(fk_proprietario_id_proprietario_veiculo) references proprietario(id_proprietario);

alter table cnh add foreign key(fk_proprietario_id_proprietario_cnh) references proprietario(id_proprietario);

INSERT INTO proprietario (nome, cpf, endereco) VALUES
('João Silva', '111.111.111-11', 'Rua A, 100'),
('Maria Souza', '222.222.222-22', 'Rua B, 200'),
('Carlos Lima', '333.333.333-33', 'Rua C, 300'),
('Ana Paula', '444.444.444-44', 'Rua D, 400'),
('Pedro Santos', '555.555.555-55', 'Rua E, 500'),
('Lucas Rocha', '666.666.666-66', 'Rua F, 600'),
('Fernanda Alves', '777.777.777-77', 'Rua G, 700'),
('Juliana Ramos', '888.888.888-88', 'Rua H, 800'),
('Ricardo Mendes', '999.999.999-99', 'Rua I, 900'),
('Patrícia Costa', '000.000.000-00', 'Rua J, 1000');


INSERT INTO cnh (numero, categoria, validade) VALUES
('CNH123456', 'B', '2026-05-01'),
('CNH234567', 'A', '2025-12-15'),
('CNH345678', 'AB', '2027-07-30'),
('CNH456789', 'C', '2026-03-20'),
('CNH567890', 'D', '2025-11-11'),
('CNH678901', 'B', '2028-01-01'),
('CNH789012', 'A', '2026-06-06'),
('CNH890123', 'AB', '2025-08-08'),
('CNH901234', 'C', '2027-09-09'),
('CNH012345', 'D', '2026-10-10');

INSERT INTO veiculo (placa, modelo, cor) VALUES
('ABC1234', 'Civic', 'Prata'),
('DEF5678', 'Corolla', 'Preto'),
('GHI9012', 'Onix', 'Branco'),
('JKL3456', 'HB20', 'Azul'),
('MNO7890', 'Gol', 'Vermelho'),
('PQR1234', 'Fiesta', 'Cinza'),
('STU5678', 'Palio', 'Verde'),
('VWX9012', 'Uno', 'Amarelo'),
('YZA3456', 'Ka', 'Rosa'),
('BCD7890', 'Tiggo', 'Preto');

drop table veiculo;
drop table cnh;
drop table proprietario;

select numero from cnh inner join proprietario on cnh.numero = proprietario.id_proprietario where cnh.numero like '%1%';
select categoria from cnh inner join proprietario on cnh.categoria = proprietario.id_proprietario where cnh.numero like '%2%';
select validade from cnh inner join proprietario on cnh.validade = proprietario.id_proprietario where cnh.validade like '%3%';
select placa from veiculo inner join proprietario on veiculo.placa = proprietario.nome where veiculo.placa like '%A%';
select modelo from veiculo inner join proprietario on veiculo.modelo = proprietario.nome where veiculo.modelo like '%G%';


select * from veiculo;
select * from proprietario;
select * from cnh;