USE [master]
GO
/****** Object:  Database [BDS_Escuela]    Script Date: 14/12/2021 12:27:57 a. m. ******/
CREATE DATABASE [BDS_Escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDS_Escuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDS_Escuela.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDS_Escuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDS_Escuela_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDS_Escuela] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDS_Escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDS_Escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDS_Escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDS_Escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDS_Escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDS_Escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDS_Escuela] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDS_Escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDS_Escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDS_Escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDS_Escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDS_Escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDS_Escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDS_Escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDS_Escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDS_Escuela] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDS_Escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDS_Escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDS_Escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDS_Escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDS_Escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDS_Escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDS_Escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDS_Escuela] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDS_Escuela] SET  MULTI_USER 
GO
ALTER DATABASE [BDS_Escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDS_Escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDS_Escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDS_Escuela] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDS_Escuela] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDS_Escuela] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDS_Escuela] SET QUERY_STORE = OFF
GO
USE [BDS_Escuela]
GO
/****** Object:  Table [dbo].[TBL_Alumno]    Script Date: 14/12/2021 12:27:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Alumno](
	[ALM_Nombre] [nvarchar](50) NULL,
	[ALM_Apellido] [nvarchar](50) NULL,
	[ALM_Creditos] [bigint] NULL,
	[PK_ALM_IdAlumno] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_ALM_IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Materia]    Script Date: 14/12/2021 12:27:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Materia](
	[MTR_Nombre] [nvarchar](50) NULL,
	[MTR_Modulo] [nvarchar](50) NULL,
	[MTR_Curso] [nvarchar](50) NOT NULL,
	[PK_MTR_IdMateria] [int] IDENTITY(1,1) NOT NULL,
	[FK_PGM_IdPrograma] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_MTR_IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Materia_Has_Alumno]    Script Date: 14/12/2021 12:27:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Materia_Has_Alumno](
	[FK_MTR_IdMateria] [int] NULL,
	[FK_ALM_IdAlumno] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Profesor]    Script Date: 14/12/2021 12:27:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Profesor](
	[PFS_Nombre] [nvarchar](50) NULL,
	[PFS_Apellidos] [nvarchar](50) NULL,
	[PFS_Especialidad] [nvarchar](50) NULL,
	[PFS_Cargo] [nvarchar](50) NULL,
	[PK_PSF_IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[FK_PGM_IdPrograma] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_PSF_IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Programa]    Script Date: 14/12/2021 12:27:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Programa](
	[PGM_Nombre] [nvarchar](50) NULL,
	[PGM_Duracion] [nvarchar](50) NULL,
	[PGM_Costo] [bigint] NULL,
	[PGM_Aula] [int] NULL,
	[PK_PGM_IdPrograma] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_PGM_IdPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_Alumno] ON 
GO
INSERT [dbo].[TBL_Alumno] ([ALM_Nombre], [ALM_Apellido], [ALM_Creditos], [PK_ALM_IdAlumno]) VALUES (N'Julian', N'Rodgriguez', 20, 1)
GO
INSERT [dbo].[TBL_Alumno] ([ALM_Nombre], [ALM_Apellido], [ALM_Creditos], [PK_ALM_IdAlumno]) VALUES (N'Michael ', N'diaz', 15, 2)
GO
INSERT [dbo].[TBL_Alumno] ([ALM_Nombre], [ALM_Apellido], [ALM_Creditos], [PK_ALM_IdAlumno]) VALUES (N'Daniel', N'Camacho', 25, 3)
GO
INSERT [dbo].[TBL_Alumno] ([ALM_Nombre], [ALM_Apellido], [ALM_Creditos], [PK_ALM_IdAlumno]) VALUES (N'Hugo', N'Moreno', 40, 4)
GO
INSERT [dbo].[TBL_Alumno] ([ALM_Nombre], [ALM_Apellido], [ALM_Creditos], [PK_ALM_IdAlumno]) VALUES (N'Diana ', N'Santos', 15, 5)
GO
SET IDENTITY_INSERT [dbo].[TBL_Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_Materia] ON 
GO
INSERT [dbo].[TBL_Materia] ([MTR_Nombre], [MTR_Modulo], [MTR_Curso], [PK_MTR_IdMateria], [FK_PGM_IdPrograma]) VALUES (N'Matematicas', N'1', N'bectores', 1, 1)
GO
INSERT [dbo].[TBL_Materia] ([MTR_Nombre], [MTR_Modulo], [MTR_Curso], [PK_MTR_IdMateria], [FK_PGM_IdPrograma]) VALUES (N'Lenguajes de programacion', N'2', N'php', 3, 2)
GO
INSERT [dbo].[TBL_Materia] ([MTR_Nombre], [MTR_Modulo], [MTR_Curso], [PK_MTR_IdMateria], [FK_PGM_IdPrograma]) VALUES (N'Reposteria', N'3', N'Pan', 4, 3)
GO
INSERT [dbo].[TBL_Materia] ([MTR_Nombre], [MTR_Modulo], [MTR_Curso], [PK_MTR_IdMateria], [FK_PGM_IdPrograma]) VALUES (N'Español', N'4', N'Dictados', 5, 4)
GO
SET IDENTITY_INSERT [dbo].[TBL_Materia] OFF
GO
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MTR_IdMateria], [FK_ALM_IdAlumno]) VALUES (1, 1)
GO
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MTR_IdMateria], [FK_ALM_IdAlumno]) VALUES (3, 2)
GO
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MTR_IdMateria], [FK_ALM_IdAlumno]) VALUES (4, 3)
GO
SET IDENTITY_INSERT [dbo].[TBL_Profesor] ON 
GO
INSERT [dbo].[TBL_Profesor] ([PFS_Nombre], [PFS_Apellidos], [PFS_Especialidad], [PFS_Cargo], [PK_PSF_IdProfesor], [FK_PGM_IdPrograma]) VALUES (N'Jhon', N'Parra', N'Matematicas', N'Profesor', 1, 1)
GO
INSERT [dbo].[TBL_Profesor] ([PFS_Nombre], [PFS_Apellidos], [PFS_Especialidad], [PFS_Cargo], [PK_PSF_IdProfesor], [FK_PGM_IdPrograma]) VALUES (N'Camilo', N'Moreno', N'Lenguajes', N'Profesor', 2, 2)
GO
INSERT [dbo].[TBL_Profesor] ([PFS_Nombre], [PFS_Apellidos], [PFS_Especialidad], [PFS_Cargo], [PK_PSF_IdProfesor], [FK_PGM_IdPrograma]) VALUES (N'leidy', N'Noguera', N'Reposteria', N'Profesor', 3, 3)
GO
INSERT [dbo].[TBL_Profesor] ([PFS_Nombre], [PFS_Apellidos], [PFS_Especialidad], [PFS_Cargo], [PK_PSF_IdProfesor], [FK_PGM_IdPrograma]) VALUES (N'Maricela', N'Arias', N'Español', N'Profesor', 4, 4)
GO
SET IDENTITY_INSERT [dbo].[TBL_Profesor] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_Programa] ON 
GO
INSERT [dbo].[TBL_Programa] ([PGM_Nombre], [PGM_Duracion], [PGM_Costo], [PGM_Aula], [PK_PGM_IdPrograma]) VALUES (N'bectores', N'24', 2800000, 101, 1)
GO
INSERT [dbo].[TBL_Programa] ([PGM_Nombre], [PGM_Duracion], [PGM_Costo], [PGM_Aula], [PK_PGM_IdPrograma]) VALUES (N'lenguajes', N'12', 1800000, 102, 2)
GO
INSERT [dbo].[TBL_Programa] ([PGM_Nombre], [PGM_Duracion], [PGM_Costo], [PGM_Aula], [PK_PGM_IdPrograma]) VALUES (N'Reposteria', N'15', 1000000, 103, 3)
GO
INSERT [dbo].[TBL_Programa] ([PGM_Nombre], [PGM_Duracion], [PGM_Costo], [PGM_Aula], [PK_PGM_IdPrograma]) VALUES (N'Español', N'4', 400000, 104, 4)
GO
SET IDENTITY_INSERT [dbo].[TBL_Programa] OFF
GO
ALTER TABLE [dbo].[TBL_Materia]  WITH CHECK ADD FOREIGN KEY([FK_PGM_IdPrograma])
REFERENCES [dbo].[TBL_Programa] ([PK_PGM_IdPrograma])
GO
ALTER TABLE [dbo].[TBL_Materia_Has_Alumno]  WITH CHECK ADD FOREIGN KEY([FK_ALM_IdAlumno])
REFERENCES [dbo].[TBL_Alumno] ([PK_ALM_IdAlumno])
GO
ALTER TABLE [dbo].[TBL_Materia_Has_Alumno]  WITH CHECK ADD FOREIGN KEY([FK_MTR_IdMateria])
REFERENCES [dbo].[TBL_Materia] ([PK_MTR_IdMateria])
GO
ALTER TABLE [dbo].[TBL_Profesor]  WITH CHECK ADD FOREIGN KEY([FK_PGM_IdPrograma])
REFERENCES [dbo].[TBL_Programa] ([PK_PGM_IdPrograma])
GO
USE [master]
GO
ALTER DATABASE [BDS_Escuela] SET  READ_WRITE 
GO
