create table cliente(
    Id int NOT NULL UNIQUE,
    CPF varchar (11) NOT NULL UNIQUE,
    Nome varchar (50),
    Sexo char,
    Endereço varchar(60),
    DataCriação date,
    DataAtualização date, 
    CONSTRAINT pk_cod_cliente PRIMARY KEY (Id, CPF)
    );

create table loja(
    Id int NOT NULL UNIQUE,
    Nome varchar (50),
    CNPJ varchar (14) NOT NULL UNIQUE,
    Endereço varchar(60),
    DataCriação date,
    DataAtualização date,
    CONSTRAINT pk_cod_loja PRIMARY KEY (Id, CNPJ)
    );

create table lojista(
    CPF varchar (11) NOT NULL UNIQUE,
    Loja int,
    Nome varchar (40),
    DataCriação date,
    DataAtualização date,
    CONSTRAINT fk_loja FOREIGN KEY (Loja) REFERENCES loja(Id),
    CONSTRAINT pk_cpf PRIMARY KEY (CPF, Loja)
    );

create table produto(
    Id int NOT NULL UNIQUE,
    Loja int,
    Nome varchar (50),
    Descrição varchar (80),
    Preço float NOT NULL,
    Marca varchar (20),
    Modelo varchar (40),
    DataCriação date,
    DataAtualização date,
    CONSTRAINT fk_cod_loja FOREIGN KEY (Loja) REFERENCES loja(Id),
    CONSTRAINT pk_cod_produto PRIMARY KEY (Id)
    );
    
create table compra(
    Id int NOT NULL UNIQUE,
    Cliente int,
    Produto int,
    Loja int,
    DataCriação date,
    DataAtualização date,
    CONSTRAINT fk_cod_cliente FOREIGN KEY (Cliente) REFERENCES cliente(Id),
    CONSTRAINT fk_cod_produto FOREIGN KEY (Produto) REFERENCES produto(Id),
    CONSTRAINT fk_cod_loja FOREIGN KEY (Loja) REFERENCES loja(Id),
    CONSTRAINT pk_cod_compra PRIMARY KEY (Id)
    );

INSERT INTO cliente (Id, CPF, Nome, Sexo, Endereço, DataCriação, DataAtualização) VALUES
(1, '11111111111', 'Paulo', 'M', 'Rua Aquela la, 19', '2022-07-09', '2022-07-09'),
(2, '22222222222', 'Jefferson', 'M', 'Rua Aquela mesmo, 20', '2022-07-09', '2022-07-09'),
(3, '33333333333', 'Marcia', 'F', 'Rua Essa ai, 30', '2022-07-09', '2022-07-09');

INSERT INTO loja (Id, Nome, CNPJ, Endereço, DataCriação, DataAtualização) VALUES
(1, 'Amazon', '11111111111111', 'Rua algum lugar, 19', '2022-07-09', '2022-07-09'),
(2, 'Magalu', '22222222222222', 'Rua algum outro lugar, 30', '2022-07-09', '2022-07-09');

INSERT INTO lojista (CPF, Loja, Nome, DataCriação, DataAtualização) VALUES
('11111111111', 1, 'Paulo', '2022-07-09', '2022-07-09'),
('22222222222', 2, 'Jefferson', '2022-07-09', '2022-07-09');

INSERT INTO produto (Id, Loja, Nome, Descrição, Preço, Marca, Modelo, DataCriação, DataAtualização) VALUES
(1, 1, 'Mouse Pad Gamer', 'Kingston, Preto/Vermelho', 88.0, 'Hyperx', 'Fury S Speed Edition HX-MPFS-S-SM', '2022-07-09' ,'2022-07-09'),
(2, 1, 'Faca Chef 8"', 'Preto', 183.60, 'Tramontina', 'Century 24011108', '2022-07-09' ,'2022-07-09'),
(3, 2, 'Notebook', 'Intel Celeron 4GB 120GB SSD - 14,1” HD Windows 11', 1439.10, 'Ultra', 'UB230', '2022-07-09' ,'2022-07-09'),
(4, 2, 'Jogo de Panelas Antiaderente', 'Alumínio Vermelho 10 Peças', 359.90, 'Tramontina', 'Turim 20298/722', '2022-07-09' ,'2022-07-09');


INSERT INTO compra (Id, Cliente, Produto, Loja, DataCriação, DataAtualização) VALUES
(1, 3, 2, 1, '2022-07-09', '2022-07-09');