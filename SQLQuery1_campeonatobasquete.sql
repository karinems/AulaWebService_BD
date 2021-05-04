CREATE DATABASE campeonatobasquete
GO
USE campeonatobasquete

CREATE TABLE times(
id INT NOT NULL IDENTITY(4001,1),
nome VARCHAR(50) NOT NULL UNIQUE,
cidade VARCHAR(80) NOT NULL
PRIMARY KEY (id)
)


CREATE TABLE jogador(
codigo INT NOT NULL IDENTITY(900101,1),
nomeJogador VARCHAR(60) NOT NULL UNIQUE,
sexo CHAR(1) NULL DEFAULT('M') CHECK(sexo='M' OR sexo='F'),
altura DECIMAL (7,2) NOT NULL,
dt_nasc DATETIME NOT NULL CHECK(dt_nasc < '01/01/2000'),
id_time INT NOT NULL
PRIMARY KEY (codigo)
FOREIGN KEY (id_time) REFERENCES times(id),
CONSTRAINT chk_sx_alt
	CHECK ((sexo = 'M' AND altura >= 1.70) OR
			(sexo='F' AND altura >= 1.60))
)

CREATE PROCEDURE sp_crudtimes(@cod CHAR(1), @id INT, @nome VARCHAR(50),
				@cidade VARCHAR(80), @saida VARCHAR(max) OUTPUT)
AS
	IF (UPPER(@cod) = 'I' OR UPPER(@cod) = 'D' OR UPPER(@cod) = 'U')
	BEGIN
		IF (UPPER(@cod) = 'I' )
		BEGIN
			INSERT INTO times(nome, cidade)
			VALUES (@nome, @cidade)

			SET @saida = 'Inserido com Sucesso'
		END
		IF (UPPER(@cod) = 'U')
		BEGIN
			UPDATE times
			SET nome = @nome, cidade = @cidade
			WHERE id = @id
			
			SET @saida = 'Atualizado com Sucesso'
		END
		IF (UPPER(@cod) = 'D')
		BEGIN
			DELETE times
			WHERE id = @id
			
			SET @saida = 'Excluido com Sucesso'
		END
	END
	ELSE
	BEGIN
		RAISERROR('Operação Inválida', 16, 1)
	END


DECLARE @out VARCHAR(MAX)
EXEC sp_crudtimes 'I', NULL, 'Bulls', 'Anápolis', @out OUTPUT
PRINT @out

DECLARE @out VARCHAR(MAX)
EXEC sp_crudtimes 'I', NULL, 'Bills', 'LOGOALI', @out OUTPUT
PRINT @out

DECLARE @out VARCHAR(MAX)
EXEC sp_crudtimes 'U', 4002, 'Bills', 'MAISLONGE', @out OUTPUT
PRINT @out

DECLARE @out VARCHAR(MAX)
EXEC sp_crudtimes 'I', NULL, 'Thunders', 'Avaré', @out OUTPUT
PRINT @out

DECLARE @out VARCHAR(MAX)
EXEC sp_crudtimes 'D', 4003, NULL, NULL, @out OUTPUT
PRINT @out

SELECT *FROM times



