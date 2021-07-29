DECLARE @cantidad int, @genero varchar(20)

DECLARE c_cuenta_genero CURSOR FOR
	SELECT ge.nombre, COUNT(pr.genero) AS cantidad
	FROM Programa AS pr 
	JOIN Visualizacion AS vis ON vis.cod_programa = pr.cod_prog
	JOIN Genero AS ge ON ge.cod_gen = pr.genero
	GROUP BY ge.nombre
	ORDER BY cantidad DESC

OPEN c_cuenta_genero

FETCH NEXT FROM c_cuenta_genero 
	INTO @genero, @cantidad

WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'GENERO: ' + @genero
		PRINT 'VISUALIZACIONES: ' + CAST(@cantidad AS VARCHAR(MAX))
		PRINT CHAR(13)+CHAR(10)

		FETCH NEXT FROM c_cuenta_genero 
			INTO @genero, @cantidad
	END
CLOSE c_cuenta_genero
DEALLOCATE c_cuenta_genero