create trigger t_paz_y_salvo
	on [dbo].[Visualizacion]
	instead of insert

	as

	declare 
	@contrato int,
	@programa int,
	@durac int,
	@dia_contrato int
		select  @contrato=inserted.cod_contrato, @programa=inserted.cod_programa, @durac=inserted.duracion
			from inserted
	
	set @dia_contrato= (select day([fecha_cont])
		from [dbo].[Contrarto]
		where [cod_contrato]=@contrato)

	if(day(getdate())>@dia_contrato)
	begin
		if exists (select [fecha] from [dbo].[Pago] where day([fecha])>=@dia_contrato and MONTH([fecha])=MONTH(getdate()) and year([fecha])=year(getdate()))
		begin
			insert into [dbo].[Visualizacion]
				values(@contrato,@programa,@durac)
		end
		else
		begin
			print('Su servicio está suspendido por morosidad')
		end
	end
	else
	begin
		if exists (select [fecha] from [dbo].[Pago] where day([fecha])>=@dia_contrato and MONTH([fecha])=MONTH(getdate()) and year([fecha])=year(getdate())) or 
			exists (select [fecha] from [dbo].[Pago] where day([fecha])>=@dia_contrato and MONTH([fecha])=MONTH(getdate())-1 and year([fecha])=year(getdate()))
			begin
				insert into [dbo].[Visualizacion]
				values(@contrato,@programa,@durac)
			end
			else
			begin
				print('Su servicio está suspendido por morosidad')
			end
		end




