CREATE PROCEDURE sp_InserirPessoa
(
    @IdPessoa INT,
    @Nome     VARCHAR(100)
)
AS
    BEGIN



        INSERT INTO Pessoas (IdPessoa, Nome) VALUES (@IdPessoa, @Nome);
    END;

GO

CREATE PROCEDURE sp_InserirPessoaFisica
(
    @IdPessoaFisica INT,
	@CPF VARCHAR(100),
	@RG VARCHAR(100),
	@DataNascimento DATE,
	@IdPessoa INT
)
AS
    BEGIN



        INSERT INTO PessoasFisicas (IdPessoaFisica, CPF, RG, DataNascimento, IdPessoa) VALUES (@IdPessoaFisica, @CPF, @RG, @DataNascimento, @IdPessoa);
    END;

GO

CREATE PROCEDURE sp_InserirUsuario
(
	@IdUsuario INT,
	@NickName VARCHAR(100),
	@Senha VARCHAR(100),
	@IdPessoaFisica INT
)
AS
	BEGIN


		INSERT INTO Usuarios (IdUsuario, NickName, Senha, IdPessoaFisica) VALUES(@IdUsuario, @NickName, @Senha, @IdPessoaFisica)
	END;

GO
CREATE PROCEDURE sp_InserirEnderecos
(
	@IdEndereco INT,
	@IdPessoa INT,
	@Rua VARCHAR(100),
	@Bairro VARCHAR(100),
	@Logradouro VARCHAR(100),
	@CEP VARCHAR(100)
)
AS
	BEGIN
		

		INSERT INTO Enderecos (IdEndereco, IdPessoa, Rua, Bairro, Logradouro, CEP) VALUES (@IdEndereco, @IdPessoa, @Rua, @Bairro, @Logradouro, @CEP)
		END;

GO
CREATE PROCEDURE sp_InserirEmails
(
	@IdEmail INT,
	@IdPessoa INT,
	@Email VARCHAR(100)
)
AS
	BEGIN


		INSERT INTO Emails(IdEmail, IdPessoa, Email) VALUES (@IdEmail, @IdPessoa, @Email)
		END;

GO
CREATE PROCEDURE sp_InserirTelefones
(
	@IdTelefone INT,
	@IdPessoa INT,
	@Telefone VARCHAR(100)
)
AS
	BEGIN

		INSERT INTO Telefones(IdTelefone, IdPessoa, Telefone) VALUES (@IdTelefone, @IdPessoa, @Telefone)
		END;

GO
CREATE PROCEDURE sp_InserirFornecedor
(
	@IdFornecedor INT,
	@CNPJ VARCHAR(100),
	@IE VARCHAR(100),
	@CNAE VARCHAR(100),
	@IdPessoa INT
)
AS
	BEGIN

		INSERT INTO Fornecedor(IdFornecedor, CNPJ, IE, CNAE, IdPessoa) VALUES (@IdFornecedor, @CNPJ, @IE, @CNAE, @IdPessoa)
		END;

GO
CREATE PROCEDURE sp_InserirCategoria
(
	@IdCategoria INT,
	@Nome VARCHAR(100)
)
AS
	BEGIN
		INSERT INTO Categorias(IdCategoria, Nome) VALUES(@IdCategoria, @Nome)
		END;

GO
CREATE PROCEDURE sp_InserirProdutos
(
	@IdProduto INT,
	@Nome VARCHAR(100),
	@Preco INT,
	@QTD_Estoque INT,
	@IdCategoria INT
)
AS
	BEGIN

		INSERT INTO Produtos (IdProduto, Nome, Preco, QTD_Estoque, IdCategoria) VALUES (@IdProduto, @Nome, @Preco, @QTD_Estoque, @IdCategoria)
		END;

GO
CREATE PROCEDURE sp_InserirVendas
(
	@IdVenda INT,
	@IdPessoa INT,
	@DataVenda DATE,
	@ValorTotal INT
)
AS
	BEGIN
		INSERT INTO Vendas (IdVenda, IdPessoa, DataVenda, ValorTotal) VALUES (@IdVenda, @IdPessoa, @DataVenda, @ValorTotal)
		END;

GO
CREATE PROCEDURE sp_InserirVendasProdutos
(
	@IdVendaProduto INT,
	@IdProduto INT,
	@IdVenda INT,
	@QtdVendido INT
)
AS
	BEGIN
		INSERT INTO VendasProdutos(IdVendaProduto, IdProduto, IdVenda, QtdVendido) VALUES (@IdVendaProduto, @IdProduto, @IdVenda, @QtdVendido)
		END;