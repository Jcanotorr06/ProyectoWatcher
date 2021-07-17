CREATE PROCEDURE p_nuevo
	(
		@nombre VARCHAR(20),
		@apellido VARCHAR(20),
		@identificador VARCHAR(11)
	)
AS
	IF EXISTS (SELECT * FROM Cliente WHERE nombre LIKE @nombre AND apellido LIKE @apellido AND cedula like @identificador)
		BEGIN
			SELECT 'EL CLIENTE YA EXISTE EN LA BASE DE DATOS' as Mensaje
		END
	ELSE
		BEGIN
			SELECT 'EL CLIENTE NO EXISTE EN LA BASE DE DATOS' as Mensaje
			INSERT INTO Cliente (cedula, nombre, apellido)
			VALUES(@identificador, @nombre, @apellido)
		END
	SELECT
		cod_cliente
	FROM Cliente
	WHERE cedula = @identificador
	AND nombre LIKE @nombre
	AND apellido LIKE @apellido
RETURN

DECLARE @nom varchar(20), @ap varchar(20), @idn varchar(11)

SET @nom = 'Andrew'
SET @ap = 'Fuller'
SET @idn = '7-777-7777'

exec p_nuevo @nom, @ap, @idn
