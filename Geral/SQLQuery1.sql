Create database prog
go
use prog

create table pessoa (
id INT NOT NULL,
nome VARCHAR(100) NOT NULL,
PRIMARY KEY (id))

--Exemplo 01

DECLARE @contador INT
SET @contador = 1
WHILE (@contador <= 100)
BEGIN
	IF (@contador = 50)
	BEGIN
		BREAK
	END

	INSERT INTO pessoa VALUES
	(@contador, 'Pessoa '+CAST(@contador AS VARCHAR(3)))

	SET @contador = @contador + 1
	END

	SELECT COUNT (id) FROM pessoa
	SELECT * FROM pessoa

	DELETE pessoa

