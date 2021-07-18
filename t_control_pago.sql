create trigger t_control_pago
	on [dbo].[Pago]
	instead of insert

	as
	declare @cliente int,
	@plan int,
	@monto money,
	@fecha date
	select @cliente=inserted.cod_cliente, @plan=inserted.cod_plan, @monto=inserted.monto,@fecha=inserted.fecha
		from inserted

	if exists(select [cod_contrato] from [dbo].[Contrarto] where [cod_cliente]=@cliente and [cod_plan]=@plan)
	begin 
		if exists(select [monto] from [dbo].[Plan] where [monto]=@monto and [cod_plan]=@plan)
		begin
			insert into [dbo].[Pago]	
			values(@cliente,@plan,@monto,@fecha)
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

