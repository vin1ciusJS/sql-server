CREATE DATABASE VinicusEduardo 

GO
USE VinicusEduardo



CREATE TABLE Usuarios
(
	IdUsuario INT NOT NULL,
	NickName VARCHAR(100) NOT NULL,
	Senha VARCHAR(100) NOT NULL,
	IdPessoaFisica INT NOT NULL,
	CONSTRAINT PK_IdUsuario PRIMARY KEY ([IdUsuario])
)

ALTER TABLE [Usuarios] ADD
	CONSTRAINT FK_Usuarios_e_PessoaFisica FOREIGN KEY ([IdPessoaFisica])
	REFERENCES [PessoasFisicas]([IdPessoaFisica])

CREATE TABLE PessoasFisicas
(
	IdPessoaFisica INT NOT NULL,
	CPF VARCHAR(100) NOT NULL,
	RG VARCHAR(100) NOT NULL,
	DataNascimento DATE NOT NULL,
	IdPessoa INT NOT NULL,
	CONSTRAINT PK_IdPessoaFisica PRIMARY KEY ([IdPessoaFisica]),
	CONSTRAINT UNQ_PessoaFisicaCPF UNIQUE ([CPF])
)

CREATE TABLE Pessoas
(
	IdPessoa INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	CONSTRAINT PK_IdPessoa PRIMARY KEY ([IdPessoa])
)

CREATE TABLE Enderecos
(
	IdEndereco INT NOT NULL,
	IdPessoa INT NOT NULL,
	Rua VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	Logradouro VARCHAR(100) NOT NULL,
	CEP VARCHAR(100) NOT NULL,
	CONSTRAINT PK_IdEndereco PRIMARY KEY ([IdEndereco])
)

ALTER TABLE [Enderecos] ADD
	CONSTRAINT FK_IdPessoa FOREIGN KEY ([IdPessoa])
	REFERENCES [Pessoas]([IdPessoa])

CREATE TABLE Emails
(
	IdEmail INT NOT NULL,
	IdPessoa INT NOT NULL,
	Email VARCHAR(100) NOT NULL,
	CONSTRAINT PK_IdEmail PRIMARY KEY ([IdEmail])
)

ALTER TABLE [Emails] ADD
	CONSTRAINT FK_IdPessoa FOREIGN KEY ([IdPessoa])
	REFERENCES [Pessoas]([IdPessoa])

CREATE TABLE Telefones
(
	IdTelefone INT NOT NULL,
	IdPessoa INT NOT NULL,
	Telefone VARCHAR(100) NOT NULL,
	CONSTRAINT PK_IdTelefone PRIMARY KEY ([IdTelefone])
)

ALTER TABLE [IdPessoa] ADD
	CONSTRAINT FK_IdPessoa FOREIGN KEY ([IdPessoa])
	REFERENCES [Pessoas]([IdPessoa])

CREATE TABLE Fornecedor
(
	IdFornecedor INT NOT NULL,
	CNPJ VARCHAR(100) NOT NULL,
	IE VARCHAR(100) NOT NULL,
	CNAE VARCHAR(100) NOT NULL,
	IdPessoa INT NOT NULL,
	CONSTRAINT PK_IdFornecedor PRIMARY KEY ([IdFornecedor]),
	CONSTRAINT UNQ_CNPJ UNIQUE ([CNPJ])
)

ALTER TABLE [Fornecedor] ADD
	CONSTRAINT FK_IdPessoa FOREIGN KEY ([IdPessoa])
	REFERENCES [Pessoas]([IdPessoa])

CREATE TABLE Produtos
(
	IdProduto INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Preco INT NOT NULL,
	QTD_Estoque INT NOT NULL,
	IdCategoria INT NOT NULL,
	CONSTRAINT FK_IdProduto PRIMARY KEY ([IdProduto])
)

ALTER TABLE [Produtos] ADD
	CONSTRAINT FK_IdCategoria FOREIGN KEY ([IdCategoria])
	REFERENCES [Categorias]([IdCategoria])

CREATE TABLE Categorias
(
	IdCategoria INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	CONSTRAINT PK_IdCategoria PRIMARY KEY ([IdCategoria])
)

CREATE TABLE VendasProdutos
(
	IdVendaProduto INT NOT NULL,
	IdProduto INT NOT NULL,
	IdVenda INT NOT NULL,
	QtdVendido INT NOT NULL,
	CONSTRAINT PK_IdVendaProduto PRIMARY KEY ([IdVendaProduto])
)

ALTER TABLE [VendasProdutos] ADD
	CONSTRAINT FK_IdProduto FOREIGN KEY ([IdProduto])
	REFERENCES [Produtos]([IdProduto])

ALTER TABLE [VendasProdutos] ADD
	CONSTRAINT FK_IdVenda FOREIGN KEY ([IdVenda])
	REFERENCES [Vendas]([IdVenda])

CREATE TABLE Vendas
(
	IdVenda INT NOT NULL,
	IdPessoa INT NOT NULL,
	DataVenda DATE NOT NULL,
	ValorTotal DECIMAL NOT NULL,
	CONSTRAINT PK_IdVenda PRIMARY KEY ([IdVenda])
)

ALTER TABLE [Vendas] ADD
	CONSTRAINT FK_IdPessoa FOREIGN KEY ([IdPessoa])
	REFERENCES [Pessoas]([IdPessoa])