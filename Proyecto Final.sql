/*
		PRACTTICA 1/2/3
*/
USE [master]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Ferreteria')
BEGIN
CREATE DATABASE [Ferreteria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ferreteria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ferreteria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ferreteria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Ferreteria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [Ferreteria] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ferreteria].[dbo].[sp_fulltext_database] @action = 'enable'
end

USE [Ferreteria]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Caja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Caja](
	[ID_Caja] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[ID_Sucursal_FK] [int] NOT NULL,
 CONSTRAINT [PK_Caja] PRIMARY KEY CLUSTERED 
(
	[ID_Caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Numero_Exterior] [int] NOT NULL,
	[Numero_Interior] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Factura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Factura](
	[ID_Factura] [int] NOT NULL,
	[ID_Ticket_FK] [int] NOT NULL,
	[ID_Cliente_FK] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ID_Inventario]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ID_Inventario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ID_Inventario](
	[ID_Inventario] [int] NOT NULL,
	[ID_Sucursal_FK] [int] NOT NULL,
	[ID_Producto_FK] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_ID_Inventario] PRIMARY KEY CLUSTERED 
(
	[ID_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[ID_Producto] [int] NOT NULL,
	[ID_Proveedor_FK] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[ID_Proveedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Año_Registro] [date] NOT NULL,
	[Descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[ID_Sucursal] [int] NOT NULL,
	[Nombre] [nchar](30) NOT NULL,
	[Calle] [nchar](25) NOT NULL,
	[Numero_Exterior] [numeric](18, 0) NOT NULL,
	[Numero_Interior] [numeric](18, 0) NULL,
	[Telefono] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[ID_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 07/10/2017 11:57:50 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ticket](
	[ID_Ticket] [int] NOT NULL,
	[ID_Sucursal_FK] [int] NOT NULL,
	[Cantidad_Productos] [int] NOT NULL,
	[Precio_Total] [money] NOT NULL,
	[Precio_Total_IVA] [money] NOT NULL,
	[Doc] [binary](50) NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Caja_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Caja]'))
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [FK_Caja_Sucursal] FOREIGN KEY([ID_Sucursal_FK])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Caja_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Caja]'))
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [FK_Caja_Sucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([ID_Cliente_FK])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Ticket1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Ticket1] FOREIGN KEY([ID_Ticket_FK])
REFERENCES [dbo].[Ticket] ([ID_Ticket])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Factura_Ticket1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Factura]'))
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Ticket1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_Inventario_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_Inventario]'))
ALTER TABLE [dbo].[ID_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_ID_Inventario_Producto] FOREIGN KEY([ID_Producto_FK])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_Inventario_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_Inventario]'))
ALTER TABLE [dbo].[ID_Inventario] CHECK CONSTRAINT [FK_ID_Inventario_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_Inventario_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_Inventario]'))
ALTER TABLE [dbo].[ID_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_ID_Inventario_Sucursal] FOREIGN KEY([ID_Sucursal_FK])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_Inventario_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_Inventario]'))
ALTER TABLE [dbo].[ID_Inventario] CHECK CONSTRAINT [FK_ID_Inventario_Sucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Proveedor] FOREIGN KEY([ID_Proveedor_FK])
REFERENCES [dbo].[Proveedor] ([ID_Proveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Producto_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Producto]'))
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ticket_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Sucursal] FOREIGN KEY([ID_Sucursal_FK])
REFERENCES [dbo].[Sucursal] ([ID_Sucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ticket_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ticket]'))
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [Ferreteria] SET  READ_WRITE 
GO


/*
		PRACTICA 4
*/

USE Ferreteria
GO

insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Telefono)  values (1, 'Pro One', 'Av. Fresnos', 500, 83120967)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Telefono)  values (2, 'El pueblo', 'Caartagena', 342, 83746398)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Numero_Interior, Telefono)  values (3, 'Horizonte', 'Barragan', 9023, 3, 98364758)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Numero_Interior, Telefono) values (4, 'Camara', 'Almazan', 304, 1, 93847639)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Numero_Interior, Telefono) values (5, 'Mariano', 'Sendero', 506, 2, 85764958)

insert into Caja (ID_Caja, Numero, ID_Sucursal_FK) values (1, 1, 1)
insert into Caja (ID_Caja, Numero, ID_Sucursal_FK) values (2, 1, 2)
insert into Caja (ID_Caja, Numero, ID_Sucursal_FK) values (3, 2, 2)

insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (1, 'Mario', 'Martinez', 'Alvarado', 'Las Petunias', 506, 1)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (2, 'Ana Luisa', 'Gonzales', 'Sierra', 'Uranio', 239, 3)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (3, 'Roman', 'Garza', 'Mata', 'Revolucion', 234, 2)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (4, 'Rocio', 'Martinez', 'Morales', 'Jacarandas', 256, 5)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (5, 'Roman', 'Garza', 'Mata', 'Revolucion', 234, 2)


insert into Ticket values (1, 1, 5, 450, 522, Convert(binary(50), 0293849 , 1) , '2016-02-22')
insert into Ticket values (2, 3, 7, 150, 174, Convert(binary(50), 09876 , 1) , '2016-02-23')
insert into Ticket values (3, 1, 2, 400, 464, Convert(binary(50), 3776282 , 1) , '2016-02-24')

insert into Factura values (1, 3, 2)
insert into Factura values (3, 2, 1)
insert into Factura values (2, 1, 3)

insert into Proveedor values (1, 'Grupo Sigma', '2017-10-12', 'Descripcion')
insert into Proveedor values (2, 'AC', '2013-12-4', 'Descripcion 2')
insert into Proveedor values (3, 'Sitgma patito', '2002-1-12', 'Descripcion 3')
insert into Proveedor values (4, 'Mario y Asociados', '2000-1-13', 'Descripcion 4')

insert into Producto values (1, 1, 'Yoplait', 5)
insert into Producto values (2, 2, 'Coca-cola 2.5L', 25)
insert into Producto values (3, 2, 'Barrilito Durazno 600ml', 12)

insert into ID_Inventario values (1, 1, 1, 1)
insert into ID_Inventario values (2, 3, 3, 1)
insert into ID_Inventario values (3, 2, 2, 1)

delete from Sucursal where Nombre = 'Mariano'
delete from Sucursal where ID_Sucursal = 4
delete from Cliente where Nombre = 'Rocio' AND ApellidoPaterno = 'Martinez' AND ApellidoMaterno = 'Morales'
delete from Cliente where ID_Cliente = 5
delete from Proveedor where ID_Proveedor = 4

update Caja set ID_Caja = 3 from Caja where ID_Caja = 4
update Producto set Precio = 6 from Producto where Nombre = 'Yoplait'
update Proveedor set Nombre = 'Sigma 2' from Proveedor where Nombre = 'Sitgma patito'
update ID_Inventario set ID_Sucursal_FK = 3 from ID_Inventario where ID_Inventario = 3
update Proveedor set Nombre = 'Arca Continental' from Proveedor where Nombre = 'AC'

/*
		PRACTICA 5
*/

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

/*
		PRACTICA 6
*/

use Ferreteria
go

-- 5 REPORTES

-- Cada uno es una vista
-- Usando todos los joins necesarios para las relaciones foraneas
-- al menos 1 view con funciones agregadas

-- Creacion del view y select al view


		-- REPORTE 1

EXEC dbo.sp_executesql @statement = N'Create view Estracto_Inventario as
(select Nombre, Existencia , Precio , (Existencia * Precio) as Total from 
	(Select Nombre, Precio, ID_Producto from Producto) as r2 
	join (Select COUNT(Cantidad) as ''Existencia'', ID_Producto_FK from ID_Inventario group by ID_Producto_FK) as r1
	on ID_Producto_FK = ID_Producto);
'
GO

select * from Estracto_Inventario;

		-- REPORTE 2

EXEC dbo.sp_executesql @statement = N'Create view Cantidad_de_Cajas as
(Select ID_Sucursal as ID, Nombre, [Cantidad de cajas] from
	(select Count(Numero) as ''Cantidad de cajas'', ID_Sucursal_FK from Caja group by ID_Sucursal_FK) as r1
	join (select ID_Sucursal, Nombre from Sucursal) as r2 on ID_Sucursal = ID_Sucursal_FK);
'
GO

Select * from Cantidad_de_Cajas;

		-- REPORTE 3

EXEC dbo.sp_executesql @statement = N'Create view Tickets as
select ID_Ticket as Ticket, Precio_Total_IVA as Monto, documento, Fecha from
(select ID_Ticket, Precio_Total_IVA, Convert(int, Doc , 1) as documento, Fecha from Ticket) as r1;
'
GO

select * from Tickets;

		-- REPORTE 4

EXEC dbo.sp_executesql @statement = N'Create view Compras_Clientes as
(Select * from Ticket
	join (Select * from Factura) as r1 on ID_Ticket = ID_Ticket_FK
	join (Select * from Cliente) as r2 on ID_Cliente = ID_Cliente_FK);
'
GO

Select ID_Ticket as Ticket, Precio_Total_IVA as Monto, Convert(int, Doc , 1) as documento, ID_Cliente as Cliente, Nombre from Compras_Clientes order by Ticket;

		-- REPORTE 5

EXEC dbo.sp_executesql @statement = N'Create view Inventario_Extendido as
(select Producto.Nombre , Proveedor.Nombre as Proveedor, Existencia, Producto.Precio from Proveedor
	join Producto on Proveedor.ID_Proveedor = Producto.ID_Proveedor_FK
	join (select * from Estracto_Inventario) as r2 on r2.Nombre = Producto.Nombre);
'
GO

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

/*
		PRACTICA 7
*/

-- SP 1



EXEC dbo.sp_executesql @statement = N'Create procedure SP_EI
	@ID varchar(50)
as
	select Existencia from Estracto_Inventario where Nombre = @ID
return
'
GO

declare @input varchar(50)
set @input = 'Yoplait'

EXEC	@input = [dbo].[SP_EI]
	@ID = @input

PRINT	convert(varchar(50),@input)

GO

-- SP2

EXEC dbo.sp_executesql @statement = N'Create procedure SP_Cajas
	@ID int
as
	select [Cantidad de cajas] from Cantidad_de_Cajas where ID = @ID
return
'
GO


declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_Cajas]
	@ID = @input

PRINT	convert(int,@input)

GO

-- SP3
EXEC dbo.sp_executesql @statement = N'Create procedure SP_Tickets
	@ID int
as
	select [Monto] from Tickets where Ticket = @ID
return
'
GO


declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_Tickets]
	@ID = @input

PRINT	convert(int,@input)

GO

-- SP4
EXEC dbo.sp_executesql @statement = N'Create procedure SP_FTicket
	@ID int
as
	select Fecha from Compras_Clientes where ID_Ticket = @ID
return
'
GO

declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_FTicket]
	@ID = @input

PRINT	convert(int,@input)

GO

-- SP5
EXEC dbo.sp_executesql @statement = N'Create procedure SP_IE
	@ID varchar(50)
as
	select Proveedor from Inventario_Extendido where Nombre = @ID
return
'
GO

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

/*
	Extras
*/

EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER RevisarTicket
    ON [dbo].[Ticket]
    FOR INSERT
    AS
    BEGIN
    SET NOCOUNT ON
	Select * from inserted
    END
'
GO

EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER Productos_DisponiblesI
    ON [dbo].[ID_Inventario]
    FOR INSERT
    AS
    BEGIN
    SET NOCOUNT ON
	Select count (Cantidad) as ''Disponibles'' from ID_Inventario where ID_Producto_FK = (select ID_Producto_FK from inserted)
    END
'
GO

EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER Productos_DisponiblesD
    ON [dbo].[ID_Inventario]
    FOR DELETE
    AS
    BEGIN
    SET NOCOUNT ON
	Select count (Cantidad) as ''Disponibles'' from ID_Inventario where ID_Producto_FK = (select ID_Producto_FK from deleted)
    END
'
GO

EXEC dbo.sp_executesql @statement = N'Create view Documentos_Tickets as
	select ID_Ticket, dbo.ConvertBINtoINT(Doc) as ''Documento'', Fecha, ID_Cliente, Nombre as ''Cliente'' from Compras_Clientes
'
GO

select * from Documentos_Tickets

EXEC dbo.sp_executesql @statement = N'Create procedure SP_CTicket
	@ID int
as
	select ID_Cliente as ID, Nombre + '' '' + ApellidoPaterno + '' '' + ApellidoMaterno as Cliente from Compras_Clientes where ID_Ticket = @ID
return
'
GO

declare @input int
set @input = 1

EXEC	@input = [dbo].[SP_CTicket]
	@ID = @input

PRINT	convert(int,@input)

GO

