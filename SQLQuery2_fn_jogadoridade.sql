CREATE FUNCTION fn_jogadoridade(@codigo INT)
RETURNS @tabela TABLE (
codigo			INT,
nomeJogador		VARCHAR(60),
sexo			CHAR(1),
altura			DECIMAL(7,2),
dt_nasc			CHAR(10),
idade			INT,
id				INT,
nome			VARCHAR(50),
cidade			VARCHAR(80)
)
AS
BEGIN
	DECLARE @dt_nasc		DATE,
			@idade			INT
	INSERT INTO @tabela(codigo, nomeJogador, sexo, altura, dt_nasc,
				id, nome, cidade)
	SELECT j.codigo, j.nomeJogador, j.sexo, j.altura,
	CONVERT(CHAR(10), j.dt_nasc, 103) AS dt_nasc,
	t.id, t.nome, t.cidade
	FROM jogador j, times t
	WHERE j.id_time = t.id
		AND j.codigo = @codigo

		SET @dt_nasc = (SELECT @dt_nasc FROM jogador WHERE codigo = @codigo)

		SET @idade = (SELECT DATEDIFF(DD, @dt_nasc, GETDATE()) / 365)
		
		UPDATE @tabela
		SET idade = @idade
		RETURN

END

INSERT INTO jogador (nomeJogador, sexo, altura, dt_nasc, id_time)
VALUES
('Fulano', 'M', 1.80, '02/04/1993', 4001)


SELECT * FROM fn_jogadoridade(900101)