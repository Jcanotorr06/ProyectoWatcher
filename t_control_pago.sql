create trigger t_control_pago
	on [dbo].[Pago]
	instead of insert

	as
	declare @cliente int,
	@contrato int,
	@monto money,
	@fecha date
	select @cliente=inserted.cod_cliente, @contrato=inserted.cod_contrato, @monto=inserted.monto,@fecha=inserted.fecha
		from inserted

	if exists(select [cod_contrato] from [dbo].[Contrarto] where [cod_cliente]=@cliente and [cod_contrato]=@contrato)
	begin 
		if exists(select [monto] from [dbo].[Plan] as p join [dbo].[Contrarto] as c on p.[cod_plan]=c.[cod_plan] where [monto]=@monto and [cod_contrato]=@contrato)
		begin
			insert into [dbo].[Pago]	
			values(@cliente,@contrato,@monto,@fecha)
		end
		else
		begin
			print('El monto no corresponde a su plan')
		end
	end
	else
	begin
		print('Usted no cuenta con ese plan')
	end
