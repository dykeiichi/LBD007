use Ferreteria
go

-- 5 REPORTES

-- Cada uno es una vista
-- Usando todos los joins necesarios para las relaciones foraneas
-- al menos 1 view con funciones agregadas

-- Creacion del view y select al view

		-- REPORTE 1

Create view Estracto_Inventario as
(select Nombre, Existencia , Precio , (Existencia * Precio) as Total from 
	(Select Nombre, Precio, ID_Producto from Producto) as r2 
	join (Select COUNT(Cantidad) as 'Existencia', ID_Producto_FK from ID_Inventario group by ID_Producto_FK) as r1
	on ID_Producto_FK = ID_Producto);

select * from Estracto_Inventario;

		-- REPORTE 2

Create view Cantidad_de_Cajas as
(Select ID_Sucursal as ID, Nombre, [Cantidad de cajas] from
	(select Count(Numero) as 'Cantidad de cajas', ID_Sucursal_FK from Caja group by ID_Sucursal_FK) as r1
	join (select ID_Sucursal, Nombre from Sucursal) as r2 on ID_Sucursal = ID_Sucursal_FK);

Select * from Cantidad_de_Cajas;

		-- REPORTE 3

Create view Tickets as
select ID_Ticket as Ticket, Precio_Total_IVA as Monto, documento, Fecha from
(select ID_Ticket, Precio_Total_IVA, Convert(int, Doc , 1) as documento, Fecha from Ticket) as r1;

select * from Tickets;

		-- REPORTE 4

Create view Compras_Clientes as
(Select * from Ticket
	join (Select * from Factura) as r1 on ID_Ticket = ID_Ticket_FK
	join (Select * from Cliente) as r2 on ID_Cliente = ID_Cliente_FK);

Select ID_Ticket as Ticket, Precio_Total_IVA as Monto, Convert(int, Doc , 1) as documento, ID_Cliente as Cliente, Nombre from Compras_Clientes order by Ticket;

		-- REPORTE 5

Create view Inventario_Extendido as
(select Producto.Nombre , Proveedor.Nombre as Proveedor, Existencia, Producto.Precio from Proveedor
	join Producto on Proveedor.ID_Proveedor = Producto.ID_Proveedor_FK
	join (select * from Estracto_Inventario) as r2 on r2.Nombre = Producto.Nombre);

Select * from Inventario_Extendido;

-- 1 subconsulta (de parentesis)

select ID_Ticket as Ticket, Precio_Total_IVA as Monto, documento, Fecha from
(select ID_Ticket, Precio_Total_IVA, Convert(int, Doc , 1) as documento, Fecha from Ticket
	where Precio_Total_IVA = (select max(Precio_Total_IVA) as Ingreso from Ticket)) as r1;

-- 1 sub consulta con with

select Ticket.Cantidad_Productos, Ticket.Precio_Total_IVA as Monto, Factura.ID_Cliente_FK as Cliente from Ticket
		join Factura on Ticket.ID_Ticket = Factura.ID_Ticket_FK
		group by Factura.ID_Cliente_FK, Ticket.Cantidad_Productos, Ticket.Precio_Total_IVA having Ticket.Precio_Total_IVA > 1000;

-- 1 tabla temporal con select into y hacerle una consulta 

with tmpTable as (
	(select ID_Producto, Nombre, Existencia from 
		(Select Nombre, ID_Producto from Producto) as r2 
		join (Select COUNT(Cantidad) as 'Existencia', ID_Producto_FK from ID_Inventario group by ID_Producto_FK) as r1
		on ID_Producto_FK = ID_Producto)
	)
Select * into rebastecimiento from tmpTable;

Select * from 
	(Select * , 'Comprar mas' as Accion from rebastecimiento where Existencia < 5) as r1;
