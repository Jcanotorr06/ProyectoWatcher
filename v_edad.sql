CREATE VIEW [dbo].[V_edad]
AS
	SELECT 
		pro.cod_prog, pro.nombre, pro.duracion, pro.edad, pro.descripcion, pro.año, pro.img, pro.genero 
	FROM Programa AS pro
GO