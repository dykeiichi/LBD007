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
/****** Object:  Database [Escuela]    Script Date: 09/09/2017 07:58:26 p.m. ******/
CREATE DATABASE [Escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Escuela', FILENAME = N'C:\Users\Admin\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\SQLEXPRESS\Escuela.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Escuela_log', FILENAME = N'C:\Users\Admin\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\SQLEXPRESS\Escuela_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Escuela] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Escuela] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Escuela] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Escuela] SET  MULTI_USER 
GO
ALTER DATABASE [Escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Escuela] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Escuela] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Escuela] SET QUERY_STORE = OFF
GO
USE [Escuela]
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
USE [Escuela]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[ID] [uniqueidentifier] NOT NULL,
	[Matricula] [numeric](18, 0) NOT NULL,
	[Nombre_Completo]  AS (concat([Nombre],' ',[Primer_Apellido],' ',[Segundo_Apellido])),
	[Nombre] [nchar](10) NOT NULL,
	[Primer_Apellido] [nchar](10) NOT NULL,
	[Segundo_Apellido] [nchar](10) NOT NULL,
	[Edad]  AS (datediff(year,[Fecha_de_nacimiento],getdate())),
	[Fecha_de_nacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aula](
	[Numero_de_Aula] [numeric](18, 0) NOT NULL,
	[Edificio] [numeric](18, 0) NOT NULL,
	[Piso] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[ID] [nchar](10) NOT NULL,
	[Matricula] [nchar](10) NOT NULL,
	[Calificacion1] [numeric](18, 0) NOT NULL,
	[Calificacion2] [numeric](18, 0) NOT NULL,
	[Calificacion3] [numeric](18, 0) NOT NULL,
	[Calificacion4] [numeric](18, 0) NOT NULL,
	[Promedio]  AS (((([Calificacion1]+[Calificacion2])+[Calificacion3])+[Calificacion4])/(4))
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cedulas]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cedulas](
	[Matricula] [numeric](18, 0) NOT NULL,
	[Cedula] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Cedulas] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dummy_Table]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dummy_Table](
	[Dummy_Identifier] [int] NOT NULL,
	[Dummy_Text] [nchar](10) NOT NULL,
	[Dummy_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Dummy_Table] PRIMARY KEY CLUSTERED 
(
	[Dummy_Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maestros]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestros](
	[Matricula] [nchar](10) NOT NULL,
	[Nombre_Completo]  AS (concat([Nombre],' ',[Primer_Apellido],' ',[Segundo_Apellido])),
	[Nombre] [nchar](10) NOT NULL,
	[Primer_Apellido] [nchar](10) NOT NULL,
	[Segundo_Apellido] [nchar](10) NOT NULL,
	[Edad]  AS (datediff(year,[Fecha_de_nacimiento],getdate())),
	[Fecha_de_nacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Maestros] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 09/09/2017 07:58:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[ID] [numeric](18, 0) NOT NULL,
	[Nombre] [nchar](20) NOT NULL,
	[Acronimo] [nchar](5) NOT NULL,
	[Semestre] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Materias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Alumnos]    Script Date: 09/09/2017 07:58:26 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Alumnos] ON [dbo].[Alumnos]
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Matricula] FOREIGN KEY([ID])
REFERENCES [dbo].[Alumnos] ([ID])
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Matricula]
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO
