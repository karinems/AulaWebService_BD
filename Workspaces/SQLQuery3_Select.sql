SELECT j.codigo, j.nomeJogador, j.sexo, j.altura,
	CONVERT(CHAR(10), j.dt_nasc, 103) AS dt_nasc, j.id_time,
	t.id, t.nome, t.cidade
FROM jogador j, times t
WHERE j.id_time = t.id

SELECT j.codigo, j.nomeJogador, j.sexo, j.altura,
	CONVERT(CHAR(10), j.dt_nasc, 103) AS dt_nasc, j.id_time,
	t.id, t.nome, t.cidade
FROM jogador j, times t
WHERE j.id_time = t.id
	AND j.codigo = 900101