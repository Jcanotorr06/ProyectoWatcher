CREATE PROCEDURE p_busqueda
	(
		@tipo int,
		@busqueda varchar(100)
	)
AS
	IF(@tipo = 1)
		BEGIN
			SELECT * FROM V_genero
				WHERE genero like @busqueda
		END
	ELSE IF(@tipo = 2)
		BEGIN
			SELECT * FROM V_edad
				WHERE edad like @busqueda
		END
	ELSE IF(@tipo = 3)
		BEGIN
			SELECT * FROM V_actor
				WHERE actor like '%'+@busqueda+'%'
		END
	ELSE
		SELECT 'Opcion de busqueda invalida' as Mensaje
RETURN

declare @mitipo int, @mibusqueda varchar(100)

set @mitipo = 5
set @mibusqueda = 'Comedia'

exec p_busqueda @mitipo, @mibusqueda