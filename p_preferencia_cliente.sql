CREATE PROCEDURE p_preferencias_cliente
	(
		@cod_cliente int
	)
AS
	DECLARE @cantidad int, @genero char(2)

	SELECT 
		TOP(1) @genero= pr.genero, 
		@cantidad = COUNT(pr.genero)
	FROM Programa AS pr 
	JOIN Prog_Cliente AS pc ON pc.cod_prog = pr.cod_prog
	WHERE pc.cod_cliente = @cod_cliente
	GROUP BY pr.genero
	HAVING COUNT(pr.genero) >= 3
	ORDER BY COUNT(pr.genero) DESC

	IF (@cantidad IS NULL)
		BEGIN
			SELECT 'AUN NO TIENE PREFERENCIAS' AS Mensaje
		END
	ELSE
		BEGIN
			SELECT
				nombre AS Preferencia
			FROM Genero
			WHERE cod_gen = @genero

			SELECT 
				nombre, descripcion, img, duracion
			FROM Programa
			WHERE genero = @genero
		END
RETURN

exec p_preferencias_cliente 1