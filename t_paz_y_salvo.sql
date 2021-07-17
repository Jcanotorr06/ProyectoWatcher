create trigger t_paz_t_salvo
	on [dbo].[Prog_Cliente]
	instead of insert

	as
	declare @cliente int,
	@programa int,
	@durac int,
	@dia_contrato int
	select @cliente=inserted.cod_cliente, @programa=inserted.cod_prog, @durac=inserted.duracion
		from inserted

	set @dia_contrato= (select min(day([fecha_cont]))
	from [dbo].[Contrarto]
	where [cod_cliente]=@cliente)

	if(day(getdate())>@dia_contrato)
	begin
		if exists (select [fecha] from [dbo].[Pago] where day([fecha])>=@dia_contrato and MONTH([fecha])=MONTH(getdate()) and year([fecha])=year(getdate()))
		begin
			insert into [dbo].[Prog_Cliente]
				values(@cliente,@programa,@durac)
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
				insert into [dbo].[Prog_Cliente]
				values(@cliente,@programa,@durac)
			end
			else
			begin
				print('Su servicio está suspendido por morosidad')
			end
		end


