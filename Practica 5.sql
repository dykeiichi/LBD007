use Ferreteria
go

-- Nuevos Registros para las consultas de la practica 5

delete from ID_Inventario
delete from Producto
delete from Proveedor
delete from Factura
delete from Ticket
delete from Cliente
delete from Caja
delete from Sucursal

INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (1, N'Pro One                       ', N'Av. Fresnos              ', CAST(500 AS Numeric(18, 0)), NULL, CAST(83120967 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (2, N'El pueblo                     ', N'Caartagena               ', CAST(342 AS Numeric(18, 0)), NULL, CAST(83746398 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (3, N'Horizonte                     ', N'Barragan                 ', CAST(9023 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(98364758 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (4, N'Camara                        ', N'Almazan                  ', CAST(304 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(93847639 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (5, N'Mariano                       ', N'Sendero                  ', CAST(506 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(85764958 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (6, N'Pro One                       ', N'Los Conquistadores       ', CAST(342 AS Numeric(18, 0)), NULL, CAST(83120847 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (7, N'Pro One                       ', N'Uranio                   ', CAST(567 AS Numeric(18, 0)), NULL, CAST(83398274 AS Numeric(18, 0)))
INSERT [dbo].[Sucursal] ([ID_Sucursal], [Nombre], [Calle], [Numero_Exterior], [Numero_Interior], [Telefono]) VALUES (8, N'El pueblo                     ', N'Miguel Aleman            ', CAST(2027 AS Numeric(18, 0)), NULL, CAST(83980293 AS Numeric(18, 0)))
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (1, 1, 1)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (2, 1, 2)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (3, 2, 2)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (4, 2, 1)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (5, 1, 3)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (6, 1, 4)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (7, 1, 5)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (8, 1, 6)
INSERT [dbo].[Caja] ([ID_Caja], [Numero], [ID_Sucursal_FK]) VALUES (9, 1, 7)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (1, N'Mario', N'Martinez', N'Alvarado', N'Las Petunias', 506, 1)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (2, N'Ana Luisa', N'Gonzales', N'Sierra', N'Uranio', 239, 3)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (3, N'Roman', N'Garza', N'Mata', N'Revolucion', 234, 2)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (4, N'Rocio', N'Martinez', N'Morales', N'Jacarandas', 256, 5)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (5, N'Roman', N'Garza', N'Mata', N'Revolucion', 234, 2)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (6, N'Romero', N'Mrquez', N'Alvarado', N'San Miguel', 56, 1)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (7, N'Manuel', N'Gonzales', N'Garza', N'Plutonio', 425, 4)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (8, N'Marco', N'Gonzales', N'Mata', N'Cartagena', 529, 1)
INSERT [dbo].[Cliente] ([ID_Cliente], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Calle], [Numero_Exterior], [Numero_Interior]) VALUES (9, N'Ramon', N'Morales', N'Morales', N'Abedul', 333, 2)
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (1, 1, 5, 450.0000, 522.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001, CAST(N'2016-02-22' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (2, 3, 7, 150.0000, 174.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002, CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (3, 1, 2, 400.0000, 464.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003, CAST(N'2016-02-24' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (4, 4, 3, 752.0000, 872.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004, CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (5, 3, 4, 832.0000, 965.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005, CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (6, 2, 5, 983.0000, 1140.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006, CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (7, 6, 6, 827.0000, 959.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007, CAST(N'2016-02-26' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (8, 7, 7, 1000.0000, 1160.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008, CAST(N'2016-02-26' AS Date))
INSERT [dbo].[Ticket] ([ID_Ticket], [ID_Sucursal_FK], [Cantidad_Productos], [Precio_Total], [Precio_Total_IVA], [Doc], [Fecha]) VALUES (9, 1, 8, 1029.0000, 1193.0000, 0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009, CAST(N'2016-02-27' AS Date))
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (1, 3, 2)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (2, 1, 3)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (3, 2, 1)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (4, 4, 5)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (5, 7, 6)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (6, 5, 8)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (7, 6, 7)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (8, 9, 9)
INSERT [dbo].[Factura] ([ID_Factura], [ID_Ticket_FK], [ID_Cliente_FK]) VALUES (9, 8, 9)
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Año_Registro], [Descripcion]) VALUES (1, N'Grupo Sigma', CAST(N'2017-10-12' AS Date), N'Descripcion')
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Año_Registro], [Descripcion]) VALUES (2, N'Arca Continental', CAST(N'2013-12-04' AS Date), N'Descripcion 2')
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Año_Registro], [Descripcion]) VALUES (3, N'Sigma 2', CAST(N'2002-01-12' AS Date), N'Descripcion 3')
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Año_Registro], [Descripcion]) VALUES (4, N'Mario y Asociados', CAST(N'2000-01-13' AS Date), N'Descripcion 4')
INSERT [dbo].[Producto] ([ID_Producto], [ID_Proveedor_FK], [Nombre], [Precio]) VALUES (1, 1, N'Yoplait', 6.0000)
INSERT [dbo].[Producto] ([ID_Producto], [ID_Proveedor_FK], [Nombre], [Precio]) VALUES (2, 2, N'Coca-cola 2.5L', 25.0000)
INSERT [dbo].[Producto] ([ID_Producto], [ID_Proveedor_FK], [Nombre], [Precio]) VALUES (3, 2, N'Barrilito Durazno 600ml', 12.0000)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (2, 3, 3, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (3, 3, 2, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (4, 4, 1, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (5, 5, 3, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (6, 8, 2, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (7, 7, 1, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (8, 8, 3, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (9, 6, 2, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (10, 4, 1, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (11, 1, 3, 1)
INSERT [dbo].[ID_Inventario] ([ID_Inventario], [ID_Sucursal_FK], [ID_Producto_FK], [Cantidad]) VALUES (12, 4, 2, 1)

-- Select con group by

Select top 3 ID_Caja from Caja where ID_Sucursal_FK > 0
group by ID_Caja

--2 Select con almenos 1 columna y 3 Funciones Agregadas

select Producto.Nombre , Proveedor.Nombre as Proveedor, Producto.Precio from Proveedor
	join Producto on Proveedor.ID_Proveedor = Producto.ID_Proveedor_FK;

select ID_Ticket as Ticket, Precio_Total_IVA as Monto, documento, Fecha from
(select ID_Ticket, Precio_Total_IVA, Convert(int, Doc , 1) as documento, Fecha from Ticket) as r1;

-- 2 Select con almenos 1 columna y 3 funciones agregadas con where

select Nombre, Existencia , Precio , (Existencia * Precio) as Total from 
(Select COUNT(Cantidad) as 'Existencia' from ID_Inventario where ID_Producto_FK = 3) as r1,
(Select Nombre, Precio, ID_Producto from Producto where ID_Producto = 3) as r2;

select ID_Ticket as Ticket, Precio_Total_IVA as Monto, documento, Fecha from
(select ID_Ticket, Precio_Total_IVA, Convert(int, Doc , 1) as documento, Fecha from Ticket
	where Precio_Total_IVA = (select max(Precio_Total_IVA) as Ingreso from Ticket)) as r1;

-- 2 Select con almenos 1 columna y 3 funciones agregadas con having

Select Sum (Monto) as Monto from 
	(select Ticket.Cantidad_Productos, Ticket.Precio_Total_IVA as Monto, Factura.ID_Cliente_FK from Ticket
		join Factura on Ticket.ID_Ticket = Factura.ID_Ticket_FK
		group by Factura.ID_Cliente_FK, Ticket.Cantidad_Productos, Ticket.Precio_Total_IVA having Ticket.Precio_Total_IVA > 1000) as r1;

select ID_Producto_FK, Nombre, Existencia , Precio , (Existencia * Precio) as Total from 
	(Select ID_Producto_FK, COUNT(Cantidad) as 'Existencia' from ID_Inventario group by ID_Producto_FK having ID_Producto_FK = 3) as r1,
	(Select Nombre, Precio, ID_Producto from Producto where ID_Producto = 3) as r2;

-- Select con top

Select top 2 Nombre, Calle, Numero_Exterior, Telefono from Sucursal where Numero_Exterior > 200 and Numero_Exterior < 1000 order by Numero_Exterior;