CREATE VIEW [dbo].[V_actor]
AS
SELECT        pr.cod_prog, pr.nombre, pr.genero, pr.duracion, pr.edad, pr.descripcion, pr.año, pr.img, pt.nombre + ' ' + pt.apellido AS actor
FROM            dbo.Programa AS pr INNER JOIN
                         dbo.Prota_Program AS pp ON pp.cod_prog = pr.cod_prog INNER JOIN
                         dbo.Protagonista AS pt ON pt.cod_prota = pp.cod_prota