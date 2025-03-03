USE [master]
GO
/****** Object:  Database [db_planilla]    Script Date: 2/03/2025 12:29:13 ******/
CREATE DATABASE [db_planilla]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_planilla', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_planilla.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_planilla_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_planilla_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_planilla] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_planilla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_planilla] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_planilla] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_planilla] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_planilla] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_planilla] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_planilla] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_planilla] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_planilla] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_planilla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_planilla] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_planilla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_planilla] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_planilla] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_planilla] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_planilla] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_planilla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_planilla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_planilla] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_planilla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_planilla] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_planilla] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_planilla] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_planilla] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_planilla] SET  MULTI_USER 
GO
ALTER DATABASE [db_planilla] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_planilla] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_planilla] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_planilla] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_planilla] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_planilla] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_planilla] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_planilla] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_planilla]
GO
/****** Object:  Table [dbo].[tblDepartamentos]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartamentos](
	[DepartamentoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpleados]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleados](
	[EmpleadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[FechaContratacion] [date] NOT NULL,
	[DepartamentoID] [int] NULL,
	[PuestoTrabajo] [nvarchar](100) NOT NULL,
	[Salario] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaInciso1]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[VistaInciso1] 
as
select emp.Nombre, emp.Apellido,dep.Nombre as Departamento, emp.Estado
from tblEmpleados emp
inner join 
tblDepartamentos dep
on dep.DepartamentoID = emp.DepartamentoID
where emp.Estado like 'Activo';
GO
/****** Object:  Table [dbo].[tblPagos]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPagos](
	[PagoID] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoID] [int] NULL,
	[FechaPago] [date] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[CantidadHorasExtras] [int] NOT NULL,
	[MontoHorasExtras] [decimal](18, 2) NOT NULL,
	[DescuentoImpuesto] [decimal](18, 2) NOT NULL,
	[DescuentoIGSS] [decimal](18, 2) NOT NULL,
	[SalarioNeto] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaInciso2]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaInciso2]
as
select emp.Nombre, emp.Apellido, pag.SalarioNeto, pag.CantidadHorasExtras, emp.Estado
from tblPagos pag
inner join 
tblEmpleados emp
on emp.EmpleadoID = pag.EmpleadoID
where emp.Estado like 'Activo' and pag.CantidadHorasExtras > 0;
GO
/****** Object:  View [dbo].[VistaInciso3]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaInciso3]
as
select dep.Nombre as Departamento, SUM(pag.CantidadHorasExtras) as CantidadTotalHorasExtras
from tblPagos pag
inner join
tblEmpleados emp
on emp.EmpleadoID = pag.EmpleadoID
inner join 
tblDepartamentos dep
on dep.DepartamentoID = emp.DepartamentoID
where emp.Estado like 'Activo'
group by dep.Nombre
GO
/****** Object:  View [dbo].[VistaInciso4]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaInciso4]
as
select emp.Nombre, dep.Nombre as Departamento, emp.Salario
from tblEmpleados emp
inner join 
tblDepartamentos dep
on dep.DepartamentoID = emp.DepartamentoID
where dep.Nombre like 'Tecnología' and emp.Salario > 3000;
GO
/****** Object:  View [dbo].[VistaInciso5]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaInciso5]
as
select pag.PagoID, emp.Nombre, pag.FechaPago, pag.Estado
from tblPagos pag
inner join 
tblEmpleados emp
on emp.EmpleadoID = pag.EmpleadoID
where pag.Estado like 'Activo';
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0)) FOR [CantidadHorasExtras]
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0.00)) FOR [MontoHorasExtras]
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0.00)) FOR [DescuentoImpuesto]
GO
ALTER TABLE [dbo].[tblPagos] ADD  DEFAULT ((0.00)) FOR [DescuentoIGSS]
GO
ALTER TABLE [dbo].[tblEmpleados]  WITH CHECK ADD FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[tblDepartamentos] ([DepartamentoID])
GO
ALTER TABLE [dbo].[tblPagos]  WITH CHECK ADD FOREIGN KEY([EmpleadoID])
REFERENCES [dbo].[tblEmpleados] ([EmpleadoID])
GO
/****** Object:  StoredProcedure [dbo].[usp_empleados_delete]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kevin Alexander García Alonzo>
-- Create date: <2-3-25>
-- Description:	<parcial 1 BD 2>
-- =============================================
CREATE PROCEDURE [dbo].[usp_empleados_delete]
	(
	@EmpleadoID int
	)
AS
BEGIN
	
	SET NOCOUNT ON;

	delete from tblEmpleados
	where EmpleadoID = @EmpleadoID
   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_empleados_insert]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kevin Alexander García Alonzo>
-- Create date: <2-3-25>
-- Description:	<parcial 1 BD 2>
-- =============================================
CREATE PROCEDURE [dbo].[usp_empleados_insert]
	(
	@Nombre varchar (100),
	@Apellido varchar (100),
	@FechaNacimiento date,
	@FechaContratacion date,
	@DepartamentoID int,
	@PuestoTrabajo varchar (100),
	@Salario decimal(18,2),
	@Estado varchar
	)
AS
BEGIN
	
	SET NOCOUNT ON;

	insert into tblEmpleados
	(
	Nombre,
	Apellido,
	FechaNacimiento,
	FechaContratacion,
	DepartamentoID,
	PuestoTrabajo,
	Salario,
	Estado
	)
	values
	(
	@Nombre,
	@Apellido,
	@FechaNacimiento,
	@FechaContratacion,
	@DepartamentoID,
	@PuestoTrabajo,
	@Salario,
	@Estado
	)
   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_empleados_select]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kevin Alexander García Alonzo>
-- Create date: <2-3-25>
-- Description:	<parcial 1 BD 2>
-- =============================================
CREATE PROCEDURE [dbo].[usp_empleados_select]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select *
	from tblEmpleados
   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_empleados_update]    Script Date: 2/03/2025 12:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kevin Alexander García Alonzo>
-- Create date: <2-3-25>
-- Description:	<parcial 1 BD 2>
-- =============================================
CREATE PROCEDURE [dbo].[usp_empleados_update]
	(
	@EmpleadoID int,
	@Nombre varchar (100),
	@Apellido varchar (100),
	@FechaNacimiento date,
	@FechaContratacion date,
	@DepartamentoID int,
	@PuestoTrabajo varchar (100),
	@Salario decimal(18,2),
	@Estado varchar
	)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tblEmpleados set
	Nombre = @Nombre,
	Apellido = @Apellido,
	FechaNacimiento = @FechaNacimiento,
	FechaContratacion = @FechaContratacion,
	DepartamentoID = @DepartamentoID,
	PuestoTrabajo = @PuestoTrabajo,
	Salario = @Salario,
	Estado = @Estado
	where EmpleadoID = @EmpleadoID
   
END
GO
USE [master]
GO
ALTER DATABASE [db_planilla] SET  READ_WRITE 
GO
