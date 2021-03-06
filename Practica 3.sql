/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Ferreteria]    Script Date: 07/10/2017 11:57:50 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Ferreteria')
BEGIN
CREATE DATABASE [Ferreteria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ferreteria', FILENAME = N'C:\Users\Admin\Ferreteria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ferreteria_log', FILENAME = N'C:\Users\Admin\Ferreteria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [Ferreteria] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ferreteria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ferreteria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ferreteria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ferreteria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ferreteria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ferreteria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ferreteria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ferreteria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ferreteria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ferreteria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ferreteria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ferreteria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ferreteria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ferreteria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ferreteria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ferreteria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ferreteria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ferreteria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ferreteria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ferreteria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ferreteria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ferreteria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ferreteria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ferreteria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ferreteria] SET  MULTI_USER 
GO
ALTER DATABASE [Ferreteria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ferreteria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ferreteria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ferreteria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ferreteria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ferreteria] SET QUERY_STORE = OFF
GO
USE [Ferreteria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
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
