Use Ferreteria
go

-- SP 1

Create procedure SP_EI
	@ID varchar(50)
as
	select Existencia from Estracto_Inventario where Nombre = @ID
return
go

declare @input varchar(50)
set @input = 'Yoplait'

EXEC	@input = [dbo].[SP_EI]
	@ID = @input

PRINT	convert(varchar(50),@input)

GO

-- SP2

Create procedure SP_Cajas
	@ID int
as
	select [Cantidad de cajas] from Cantidad_de_Cajas where ID = @ID
return
go

declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_Cajas]
	@ID = @input

PRINT	convert(int,@input)

GO

-- SP3

Create procedure SP_Tickets
	@ID int
as
	select [Monto] from Tickets where Ticket = @ID
return
go

declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_Tickets]
	@ID = @input

PRINT	convert(int,@input)

GO

-- SP4

Create procedure SP_FTicket
	@ID int
as
	select Fecha from Compras_Clientes where ID_Ticket = @ID
return
go

declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_FTicket]
	@ID = @input

PRINT	convert(int,@input)

GO

-- SP5

Create procedure SP_IE
	@ID varchar(50)
as
	select Proveedor from Inventario_Extendido where Nombre = @ID
return
go

declare @input varchar(50)
set @input = 'Yoplait'

EXEC	@input = [dbo].[SP_IE]
	@ID = @input

PRINT	convert(varchar(50),@input)

GO

-- Funcion

CREATE FUNCTION ConvertBINtoINT (@Input binary(50))  
RETURNS int
AS  
BEGIN  
    DECLARE @Output int;  
    SET @Output= Convert(int, @Input , 1);  
    RETURN(@Output);
END;  
GO  

begin
declare @tmp binary(50)
set @tmp = (select Doc from Ticket where ID_Ticket = 1)
SELECT dbo.ConvertBINtoINT(@tmp) AS 'Informacion del Documento';  
end
go

