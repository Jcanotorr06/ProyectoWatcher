CREATE VIEW [dbo].[V_genero]
AS
	SELECT 
		pro.cod_prog, pro.nombre, pro.duracion, pro.edad, pro.descripcion, pro.año, pro.img, gen.nombre as genero
	FROM Programa AS pro
	JOIN Genero AS gen ON pro.genero = gen.cod_gen