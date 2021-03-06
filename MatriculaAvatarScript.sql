USE [master]
GO
/****** Object:  Database [MatriculaAvatar]    Script Date: 31/08/2020 15:36:14 ******/
CREATE DATABASE [MatriculaAvatar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MatriculaAvatar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MatriculaAvatar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MatriculaAvatar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MatriculaAvatar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MatriculaAvatar] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MatriculaAvatar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MatriculaAvatar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET ARITHABORT OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MatriculaAvatar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MatriculaAvatar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MatriculaAvatar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MatriculaAvatar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MatriculaAvatar] SET  MULTI_USER 
GO
ALTER DATABASE [MatriculaAvatar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MatriculaAvatar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MatriculaAvatar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MatriculaAvatar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MatriculaAvatar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MatriculaAvatar', N'ON'
GO
ALTER DATABASE [MatriculaAvatar] SET QUERY_STORE = OFF
GO
USE [MatriculaAvatar]
GO
/****** Object:  Table [dbo].[Aulas]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aulas](
	[Id_Aula] [int] IDENTITY(1,1) NOT NULL,
	[Ubicacion] [varchar](max) NOT NULL,
	[NumeroCupo] [int] NOT NULL,
 CONSTRAINT [PK__Aulas__B4BE41D190919790] PRIMARY KEY CLUSTERED 
(
	[Id_Aula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[Id_Carrera] [int] IDENTITY(1,1) NOT NULL,
	[NombreCarrera] [varchar](max) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[Id_Curso] [int] IDENTITY(1,1) NOT NULL,
	[NombreCurso] [varchar](max) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Costo] [money] NOT NULL,
	[Creditos] [int] NOT NULL,
	[Requisitos] [varchar](10) NULL,
	[Id_Carrera] [int] NOT NULL,
 CONSTRAINT [PK__Cursos__A40D2A888112F3E6] PRIMARY KEY CLUSTERED 
(
	[Id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distribucion]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distribucion](
	[Codigo_Distribucion] [int] IDENTITY(1,1) NOT NULL,
	[Id_Curso] [int] NOT NULL,
	[Id_Aula] [int] NOT NULL,
	[Id_Profesor] [int] NOT NULL,
	[Dia] [int] NOT NULL,
	[Periodo] [int] NOT NULL,
 CONSTRAINT [PK__Distribu__628EF772757AA11A] PRIMARY KEY CLUSTERED 
(
	[Codigo_Distribucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[Id_Estudiante] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[Correo] [varchar](max) NOT NULL,
	[Id_Carrera] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturacion]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturacion](
	[IDFactura] [int] IDENTITY(1,1) NOT NULL,
	[IDEstudiante] [int] NOT NULL,
	[Costo] [money] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Estado] [varchar](max) NOT NULL,
 CONSTRAINT [PK__Facturac__492FE93927687439] PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoDistribucion]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoDistribucion](
	[IDGrupoDis] [int] IDENTITY(1,1) NOT NULL,
	[IDGrupo] [int] NOT NULL,
	[Codigo_Distribucion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDGrupoDis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupos](
	[IDGrupo] [int] NOT NULL,
	[IDEstudiante] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[codHora] [int] IDENTITY(1,1) NOT NULL,
	[Horario] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[codHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[IDMatricula] [int] IDENTITY(1,1) NOT NULL,
	[IDEstudiante] [int] NOT NULL,
	[IDdistribucion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo](
	[IDPerido] [int] IDENTITY(1,1) NOT NULL,
	[Cuatrimestre] [int] NOT NULL,
	[Anno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPerido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDeEstudio]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDeEstudio](
	[IDPlan] [int] IDENTITY(1,1) NOT NULL,
	[IDCurso] [int] NOT NULL,
	[IDCarrera] [int] NOT NULL,
	[Periodo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[Id_Profesor] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Correo] [varchar](max) NOT NULL,
	[Id_Carrera] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[IDPuesto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rango]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rango](
	[IDRango] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRango] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Historico]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Historico](
	[Id_Estudiante] [int] NOT NULL,
	[Id_Curso] [int] NOT NULL,
	[Nota_Obtenida] [int] NOT NULL,
	[Periodo] [int] NOT NULL,
	[Profesor] [int] NOT NULL,
 CONSTRAINT [PK_Registro_Historico] PRIMARY KEY CLUSTERED 
(
	[Id_Estudiante] ASC,
	[Id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IDRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUser] [int] NOT NULL,
	[Contraseña] [varchar](max) NOT NULL,
	[Rango] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosAdminis]    Script Date: 31/08/2020 15:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosAdminis](
	[IdUsuarioAdmin] [int] NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[Correo] [varchar](max) NOT NULL,
	[Puesto] [int] NOT NULL,
	[Rol] [int] NOT NULL,
 CONSTRAINT [PK__Usuarios__7C46C6B700A7765C] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aulas] ON 

INSERT [dbo].[Aulas] ([Id_Aula], [Ubicacion], [NumeroCupo]) VALUES (1, N'Aula #01 Primer Piso', 30)
INSERT [dbo].[Aulas] ([Id_Aula], [Ubicacion], [NumeroCupo]) VALUES (2, N'Aula #02 Primer Piso', 30)
INSERT [dbo].[Aulas] ([Id_Aula], [Ubicacion], [NumeroCupo]) VALUES (3, N'Aula #03 Primer Piso', 30)
INSERT [dbo].[Aulas] ([Id_Aula], [Ubicacion], [NumeroCupo]) VALUES (5, N'Aula #11 Segundo Piso', 20)
SET IDENTITY_INSERT [dbo].[Aulas] OFF
GO
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([Id_Carrera], [NombreCarrera], [Descripcion]) VALUES (1, N'Tecnologías de la Información', N'Carrera Tecnico para TI')
INSERT [dbo].[Carreras] ([Id_Carrera], [NombreCarrera], [Descripcion]) VALUES (2, N'Turismo', N'Carrera para la gestión de empresas turísticas')
SET IDENTITY_INSERT [dbo].[Carreras] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (3, N'Teoria y tecnica del turismo', N'Se enseña la teoría para el turismo', 25000.0000, 3, N'Bachillera', 2)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (4, N'Soporte Técnico', N'Se enseña lo basico para soporte técnico', 25000.0000, 3, N'Bachillera', 1)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (5, N'Fundamentos de Programación', N'Se enseña algoritmos, diagramas y ejercicios introductorios', 25000.0000, 3, N'Bachillera', 1)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (6, N'Comunicación I', N'Se enseña gramática y otras cosas', 25000.0000, 3, N'Bachillera', 1)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (7, N'Comunicación II', N'Se enseña a dar presentaciónes en publico', 25000.0000, 3, N'6', 1)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (8, N'Programación I', N'Se enseña a programar en consola', 25000.0000, 3, N'5', 1)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (9, N'Computación I', N'Se enseña computación básica', 25000.0000, 3, N'Bachillera', 2)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (10, N'Biogeografía de Costa Rica', N'Se enseña Biogeografía', 25000.0000, 3, N'9', 2)
INSERT [dbo].[Cursos] ([Id_Curso], [NombreCurso], [Descripcion], [Costo], [Creditos], [Requisitos], [Id_Carrera]) VALUES (1005, N'Programacion II', N'Se enseña lo basico de programar', 25000.0000, 3, N'8', 1)
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Distribucion] ON 

INSERT [dbo].[Distribucion] ([Codigo_Distribucion], [Id_Curso], [Id_Aula], [Id_Profesor], [Dia], [Periodo]) VALUES (2, 4, 1, 123456, 1, 1)
INSERT [dbo].[Distribucion] ([Codigo_Distribucion], [Id_Curso], [Id_Aula], [Id_Profesor], [Dia], [Periodo]) VALUES (1002, 7, 1, 123456, 2, 2)
INSERT [dbo].[Distribucion] ([Codigo_Distribucion], [Id_Curso], [Id_Aula], [Id_Profesor], [Dia], [Periodo]) VALUES (1003, 8, 1, 123456, 2, 2)
INSERT [dbo].[Distribucion] ([Codigo_Distribucion], [Id_Curso], [Id_Aula], [Id_Profesor], [Dia], [Periodo]) VALUES (1004, 1005, 1, 123456, 4, 3)
SET IDENTITY_INSERT [dbo].[Distribucion] OFF
GO
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Telefono], [Direccion], [Correo], [Id_Carrera]) VALUES (654321, N'Mario Carlos Perez', 8751587, N'Desamparados', N'carloper@hotmail.com', 2)
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Telefono], [Direccion], [Correo], [Id_Carrera]) VALUES (118210940, N'Alberto Solano Villalta', 87918944, N'Frente Bruma Azul', N'albertosolanov@hotmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Facturacion] ON 

INSERT [dbo].[Facturacion] ([IDFactura], [IDEstudiante], [Costo], [Fecha], [Estado]) VALUES (2002, 118210940, 25000.0000, CAST(N'2020-08-31T13:09:47.520' AS DateTime), N'En espera')
SET IDENTITY_INSERT [dbo].[Facturacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Horarios] ON 

INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (1, N'L-8:00 AM - 11:40 AM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (2, N'L-13.00 PM - 16:40 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (3, N'L-18:00 PM - 21:30 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (4, N'K-8:00 AM - 11:40 AM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (5, N'K-13.00 PM - 16:40 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (6, N'K-18:00 PM - 21:30 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (7, N'M-8:00 AM - 11:40 AM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (8, N'M-13.00 PM - 16:40 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (9, N'M-18:00 PM - 21:30 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (10, N'J-8:00 AM - 11:40 AM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (11, N'J-13.00 PM - 16:40 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (12, N'J-18:00 PM - 21:30 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (13, N'V-8:00 AM - 11:40 AM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (14, N'V-13.00 PM - 16:40 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (15, N'V-18:00 PM - 21:30 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (16, N'S-8:00 AM - 11:40 AM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (17, N'S-13.00 PM - 16:40 PM')
INSERT [dbo].[Horarios] ([codHora], [Horario]) VALUES (18, N'S-18:00 PM - 21:30 PM')
SET IDENTITY_INSERT [dbo].[Horarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([IDMatricula], [IDEstudiante], [IDdistribucion]) VALUES (2004, 118210940, 1003)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
SET IDENTITY_INSERT [dbo].[Periodo] ON 

INSERT [dbo].[Periodo] ([IDPerido], [Cuatrimestre], [Anno]) VALUES (1, 1, 2020)
INSERT [dbo].[Periodo] ([IDPerido], [Cuatrimestre], [Anno]) VALUES (2, 2, 2020)
INSERT [dbo].[Periodo] ([IDPerido], [Cuatrimestre], [Anno]) VALUES (3, 3, 2020)
INSERT [dbo].[Periodo] ([IDPerido], [Cuatrimestre], [Anno]) VALUES (4, 4, 2020)
SET IDENTITY_INSERT [dbo].[Periodo] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanDeEstudio] ON 

INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (1, 3, 2, 1)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (2, 4, 1, 1)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (3, 5, 1, 1)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (4, 6, 1, 1)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (5, 7, 1, 2)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (6, 8, 1, 2)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (7, 9, 2, 1)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (8, 10, 2, 2)
INSERT [dbo].[PlanDeEstudio] ([IDPlan], [IDCurso], [IDCarrera], [Periodo]) VALUES (1003, 1005, 1, 3)
SET IDENTITY_INSERT [dbo].[PlanDeEstudio] OFF
GO
INSERT [dbo].[Profesores] ([Id_Profesor], [Nombre], [Telefono], [Correo], [Id_Carrera]) VALUES (123456, N'Pedro Picado Rojas', 87917851, N'pedrojas@gmail.com', 1)
INSERT [dbo].[Profesores] ([Id_Profesor], [Nombre], [Telefono], [Correo], [Id_Carrera]) VALUES (987654, N'Juan Marcos Rojas', 8713211, N'jumaro@gmail.com', 2)
GO
SET IDENTITY_INSERT [dbo].[Puestos] ON 

INSERT [dbo].[Puestos] ([IDPuesto], [Nombre], [Descripcion]) VALUES (1, N'Secretaría', N'Hace cosas de Secretariado')
SET IDENTITY_INSERT [dbo].[Puestos] OFF
GO
SET IDENTITY_INSERT [dbo].[Rango] ON 

INSERT [dbo].[Rango] ([IDRango], [Descripcion]) VALUES (1, N'Estudiante de Carrera')
INSERT [dbo].[Rango] ([IDRango], [Descripcion]) VALUES (2, N'Profesor de Carrera')
INSERT [dbo].[Rango] ([IDRango], [Descripcion]) VALUES (3, N'Soporte Técnico Página')
INSERT [dbo].[Rango] ([IDRango], [Descripcion]) VALUES (4, N'Admin')
SET IDENTITY_INSERT [dbo].[Rango] OFF
GO
INSERT [dbo].[Registro_Historico] ([Id_Estudiante], [Id_Curso], [Nota_Obtenida], [Periodo], [Profesor]) VALUES (654321, 9, 75, 1, 987654)
INSERT [dbo].[Registro_Historico] ([Id_Estudiante], [Id_Curso], [Nota_Obtenida], [Periodo], [Profesor]) VALUES (118210940, 5, 89, 1, 123456)
INSERT [dbo].[Registro_Historico] ([Id_Estudiante], [Id_Curso], [Nota_Obtenida], [Periodo], [Profesor]) VALUES (118210940, 6, 89, 1, 123456)
INSERT [dbo].[Registro_Historico] ([Id_Estudiante], [Id_Curso], [Nota_Obtenida], [Periodo], [Profesor]) VALUES (118210940, 8, 0, 2, 123456)
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IDRol], [Descripcion]) VALUES (1, N'Editar Profesores')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
INSERT [dbo].[Usuario] ([IDUser], [Contraseña], [Rango]) VALUES (1, N'contra', 4)
INSERT [dbo].[Usuario] ([IDUser], [Contraseña], [Rango]) VALUES (123456, N'contra', 2)
INSERT [dbo].[Usuario] ([IDUser], [Contraseña], [Rango]) VALUES (654321, N'contra', 1)
INSERT [dbo].[Usuario] ([IDUser], [Contraseña], [Rango]) VALUES (987654, N'   Q+p( B$Y±dë©µ+»Z¶É©_g}Ðv$ã', 2)
INSERT [dbo].[Usuario] ([IDUser], [Contraseña], [Rango]) VALUES (118210940, N'contra', 1)
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [FK__Cursos__Id_Carre__3A81B327] FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [FK__Cursos__Id_Carre__3A81B327]
GO
ALTER TABLE [dbo].[Distribucion]  WITH CHECK ADD  CONSTRAINT [FK__Distribuc__Id_Au__656C112C] FOREIGN KEY([Id_Aula])
REFERENCES [dbo].[Aulas] ([Id_Aula])
GO
ALTER TABLE [dbo].[Distribucion] CHECK CONSTRAINT [FK__Distribuc__Id_Au__656C112C]
GO
ALTER TABLE [dbo].[Distribucion]  WITH CHECK ADD  CONSTRAINT [FK__Distribuc__Id_Cu__6477ECF3] FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Cursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[Distribucion] CHECK CONSTRAINT [FK__Distribuc__Id_Cu__6477ECF3]
GO
ALTER TABLE [dbo].[Distribucion]  WITH CHECK ADD  CONSTRAINT [FK__Distribuc__Id_Pr__66603565] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesores] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Distribucion] CHECK CONSTRAINT [FK__Distribuc__Id_Pr__66603565]
GO
ALTER TABLE [dbo].[Distribucion]  WITH CHECK ADD  CONSTRAINT [FK__Distribuc__Perio__6754599E] FOREIGN KEY([Periodo])
REFERENCES [dbo].[Periodo] ([IDPerido])
GO
ALTER TABLE [dbo].[Distribucion] CHECK CONSTRAINT [FK__Distribuc__Perio__6754599E]
GO
ALTER TABLE [dbo].[Distribucion]  WITH CHECK ADD  CONSTRAINT [FK_Distribucion_Horarios] FOREIGN KEY([Dia])
REFERENCES [dbo].[Horarios] ([codHora])
GO
ALTER TABLE [dbo].[Distribucion] CHECK CONSTRAINT [FK_Distribucion_Horarios]
GO
ALTER TABLE [dbo].[Estudiantes]  WITH CHECK ADD FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_Facturacion_Estudiantes] FOREIGN KEY([IDEstudiante])
REFERENCES [dbo].[Estudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[Facturacion] CHECK CONSTRAINT [FK_Facturacion_Estudiantes]
GO
ALTER TABLE [dbo].[GrupoDistribucion]  WITH CHECK ADD  CONSTRAINT [FK__GrupoDist__Codig__6B24EA82] FOREIGN KEY([Codigo_Distribucion])
REFERENCES [dbo].[Distribucion] ([Codigo_Distribucion])
GO
ALTER TABLE [dbo].[GrupoDistribucion] CHECK CONSTRAINT [FK__GrupoDist__Codig__6B24EA82]
GO
ALTER TABLE [dbo].[GrupoDistribucion]  WITH CHECK ADD FOREIGN KEY([IDGrupo])
REFERENCES [dbo].[Grupos] ([IDGrupo])
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK__Matricula__IDdis__797309D9] FOREIGN KEY([IDdistribucion])
REFERENCES [dbo].[Distribucion] ([Codigo_Distribucion])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK__Matricula__IDdis__797309D9]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD FOREIGN KEY([IDEstudiante])
REFERENCES [dbo].[Estudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[PlanDeEstudio]  WITH CHECK ADD FOREIGN KEY([IDCarrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[PlanDeEstudio]  WITH CHECK ADD  CONSTRAINT [FK__PlanDeEst__IDCur__5AEE82B9] FOREIGN KEY([IDCurso])
REFERENCES [dbo].[Cursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[PlanDeEstudio] CHECK CONSTRAINT [FK__PlanDeEst__IDCur__5AEE82B9]
GO
ALTER TABLE [dbo].[PlanDeEstudio]  WITH CHECK ADD FOREIGN KEY([Periodo])
REFERENCES [dbo].[Periodo] ([IDPerido])
GO
ALTER TABLE [dbo].[Profesores]  WITH CHECK ADD FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[Carreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[Registro_Historico]  WITH CHECK ADD  CONSTRAINT [FK__Registro___Id_Cu__71D1E811] FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Cursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[Registro_Historico] CHECK CONSTRAINT [FK__Registro___Id_Cu__71D1E811]
GO
ALTER TABLE [dbo].[Registro_Historico]  WITH CHECK ADD FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[Estudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[Registro_Historico]  WITH CHECK ADD FOREIGN KEY([Periodo])
REFERENCES [dbo].[Periodo] ([IDPerido])
GO
ALTER TABLE [dbo].[Registro_Historico]  WITH CHECK ADD FOREIGN KEY([Profesor])
REFERENCES [dbo].[Profesores] ([Id_Profesor])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([Rango])
REFERENCES [dbo].[Rango] ([IDRango])
GO
ALTER TABLE [dbo].[UsuariosAdminis]  WITH CHECK ADD  CONSTRAINT [FK__UsuariosA__Puest__4AB81AF0] FOREIGN KEY([Puesto])
REFERENCES [dbo].[Puestos] ([IDPuesto])
GO
ALTER TABLE [dbo].[UsuariosAdminis] CHECK CONSTRAINT [FK__UsuariosA__Puest__4AB81AF0]
GO
ALTER TABLE [dbo].[UsuariosAdminis]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosAdminis_Rol] FOREIGN KEY([Rol])
REFERENCES [dbo].[Rol] ([IDRol])
GO
ALTER TABLE [dbo].[UsuariosAdminis] CHECK CONSTRAINT [FK_UsuariosAdminis_Rol]
GO
/****** Object:  StoredProcedure [dbo].[AgregarAulas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AgregarAulas] @ubi varchar(max), @cup int
as
insert into dbo.Aulas values(@ubi, @cup)
GO
/****** Object:  StoredProcedure [dbo].[AgregarDistribucion]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AgregarDistribucion] @IdCurso int, @idAula int, @idProfesor int, @dia int, @periodo int
as

insert into Distribucion values(@IdCurso, @idAula, @idProfesor, @dia,@periodo )

GO
/****** Object:  StoredProcedure [dbo].[AgregarMatricula]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AgregarMatricula] @idestu int, @codDistri int
as
declare @idcurso as int
declare @periodo as int
declare @Profe as int
declare @idMatricula as int

insert into dbo.Matricula values(@idestu, @codDistri)
select @idMatricula=SCOPE_IDENTITY()

select @idcurso= Distribucion.Id_Curso from Distribucion inner join Matricula on 
Matricula.IDdistribucion=Distribucion.Codigo_Distribucion where Matricula.IDMatricula=@idMatricula 

select @periodo=Distribucion.Periodo from Distribucion inner join Matricula on 
Matricula.IDdistribucion=Distribucion.Codigo_Distribucion where Matricula.IDMatricula=@idMatricula 

select @Profe=Distribucion.Id_Profesor from Distribucion inner join Matricula on 
Matricula.IDdistribucion=Distribucion.Codigo_Distribucion where Matricula.IDMatricula=@idMatricula 

insert into dbo.Registro_Historico values(@idestu,@idcurso, 0,@periodo,@Profe)

GO
/****** Object:  StoredProcedure [dbo].[agregarPuestos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[agregarPuestos] @nombre varchar(max),@descri varchar(max)
as
insert into Puestos values(@nombre,@descri)
GO
/****** Object:  StoredProcedure [dbo].[AgregarRango]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AgregarRango] @Desc varchar(max)
as
  insert into dbo.Rango values(@Desc)
GO
/****** Object:  StoredProcedure [dbo].[agregarRoles]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[agregarRoles] @descri varchar(max)
as
insert into Rol values(@descri)
GO
/****** Object:  StoredProcedure [dbo].[CarrerasEstudiante]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CarrerasEstudiante] @id int
as
  Select Carreras.NombreCarrera from dbo.Carreras inner join dbo.Estudiantes on Carreras.Id_Carrera=Estudiantes.Id_Carrera 
  and Estudiantes.Id_Estudiante = @id

GO
/****** Object:  StoredProcedure [dbo].[CrearFactura]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CrearFactura] @id int
as

declare @costoTotal as money

  Select @costoTotal = SUM(Cursos.Costo) From Cursos inner join Distribucion on Distribucion.Id_Curso=Cursos.Id_Curso
  inner join Matricula on Matricula.IDdistribucion=Distribucion.Codigo_Distribucion

insert into Facturacion values(@id, @costoTotal, GETDATE(), 'En espera')

GO
/****** Object:  StoredProcedure [dbo].[CursosMatriculaEstudiante]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CursosMatriculaEstudiante] @id int
as
select dbo.Distribucion.Codigo_Distribucion,dbo.Cursos.NombreCurso,dbo.Horarios.Horario, dbo.Aulas.NumeroCupo 
from Cursos inner join dbo.Carreras on Carreras.Id_Carrera=Cursos.Id_Carrera 
inner join dbo.Estudiantes on Carreras.Id_Carrera=Estudiantes.Id_Carrera and Estudiantes.Id_Estudiante=@id 
inner join dbo.Distribucion on Distribucion.Id_Curso=dbo.Cursos.Id_Curso
inner join Horarios on Distribucion.Dia=Horarios.codHora
inner join dbo.Aulas on Aulas.Id_Aula=Distribucion.Id_Aula
where not Exists(select dbo.Registro_Historico.Id_Curso from Registro_Historico 
where Registro_Historico.Id_Estudiante=@id and Registro_Historico.Id_Curso=dbo.Cursos.Id_Curso and Registro_Historico.Nota_Obtenida >70)
and not exists (select Distribucion.Codigo_Distribucion from Distribucion inner join
dbo.Matricula on  Distribucion.Codigo_Distribucion= Matricula.IDdistribucion and Distribucion.Id_Curso=Cursos.Id_Curso)

GO
/****** Object:  StoredProcedure [dbo].[EliminarAulas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarAulas] @id int
as
delete from dbo.Aulas where Id_Aula=@id
GO
/****** Object:  StoredProcedure [dbo].[EliminarCarreras]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarCarreras] @ID int
as
   delete from dbo.Carreras where Id_Carrera=@ID
GO
/****** Object:  StoredProcedure [dbo].[EliminarCursos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EliminarCursos] @IdCurso int
as
       delete from dbo.Cursos where Id_Curso=@IdCurso
	   delete from dbo.PlanDeEstudio where PlanDeEstudio.IDCurso= @IdCurso
GO
/****** Object:  StoredProcedure [dbo].[eliminarFacturas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarFacturas] @id int
as
delete Facturacion where Facturacion.IDEstudiante=@id
GO
/****** Object:  StoredProcedure [dbo].[EliminarMatricula]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EliminarMatricula] @Cod int
as
delete dbo.Matricula where Matricula.IDMatricula=@Cod
GO
/****** Object:  StoredProcedure [dbo].[idnombre]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[idnombre] @id int
as
/*Por si es estudiante*/
if(select count(*) from dbo.Estudiantes where Id_Estudiante = @Id) = 1
	begin
select dbo.Estudiantes.Nombre from dbo.Estudiantes where Id_Estudiante=@id
end
/*Por si es profesor*/
if(select count(*) from dbo.Profesores where Id_Profesor = @Id) = 1
	begin
select dbo.Profesores.Nombre from dbo.Profesores where Id_Profesor=@id
end
/*Por si es admin*/
if(select count(*) from dbo.UsuariosAdminis where IdUsuarioAdmin = @Id) = 1
	begin
select dbo.UsuariosAdminis.Nombre from dbo.UsuariosAdminis where dbo.UsuariosAdminis.IdUsuarioAdmin=@id
end
GO
/****** Object:  StoredProcedure [dbo].[ingresarNota]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ingresarNota] @idestu int, @idcurso int, @nota int
as
update Registro_Historico set Nota_Obtenida=@nota where Registro_Historico.Id_Estudiante=@idestu  and Registro_Historico.Id_Curso=@idcurso
GO
/****** Object:  StoredProcedure [dbo].[IngresoEstudiantes]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IngresoEstudiantes] @id int, @nomb varchar(max), @telefono int, @dire varchar(max), 
@correo varchar(max), @IDCarrera int
as

insert into dbo.Estudiantes values(@id, @nomb,@telefono,@dire,@correo,@IDCarrera)
insert into dbo.Usuario values(@id,ENCRYPTBYPASSPHRASE('password', 'contra') , 1)

GO
/****** Object:  StoredProcedure [dbo].[IngresoProfesor]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IngresoProfesor] @id int, @nomb varchar(max), @telefono int, 
@correo varchar(max), @IDCarrera int
as

insert into dbo.Profesores values(@id, @nomb,@telefono,@correo,@IDCarrera)
insert into dbo.Usuario values(@id,ENCRYPTBYPASSPHRASE('password', 'contra') , 2)

GO
/****** Object:  StoredProcedure [dbo].[IngresoUsuarioAdmi]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[IngresoUsuarioAdmi] @id int, @nomb varchar(max), @telefono int, @dire varchar(max), 
@correo varchar(max), @puesto int, @rol int
as
insert into dbo.UsuariosAdminis values(@id, @nomb,@telefono,@dire,@correo,@puesto,@rol)
insert into dbo.Usuario values(@id,ENCRYPTBYPASSPHRASE('password', 'contra'), 4)

GO
/****** Object:  StoredProcedure [dbo].[InsetarContraseña]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsetarContraseña] @id int, @contra varchar(max)
as
update Usuario set Contraseña=ENCRYPTBYPASSPHRASE('password', @contra) where Usuario.IDUser=@id
GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LoginUsuario]
    @ID int, 
    @Pass varchar(50),
    @Result int Out
	
As
    Declare @PassEncode As varchar(300)
    Declare @PassDecode As varchar(50)

Begin
    Select @PassEncode = Contraseña From Usuario Where Usuario.IDUser = @ID
    Set @PassDecode = DECRYPTBYPASSPHRASE('password', @PassEncode)

End
 
Begin
    If @PassDecode = @Pass
        Set @Result = 1
    Else
        Set @Result = 0
End

GO
/****** Object:  StoredProcedure [dbo].[ModificarAulas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ModificarAulas] @id int, @dire varchar(max), @cup int
as
update dbo.Aulas set Ubicacion=@dire, NumeroCupo=@cup where Id_Aula=@id
GO
/****** Object:  StoredProcedure [dbo].[ModificarCursos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ModificarCursos] @idCurso int, @NombreCurso varchar(max), @Descripcion varchar(max), @Costo money,
@Creditos int, @Requisitos varchar(10), @Periodo int
as
update dbo.Cursos set NombreCurso=@NombreCurso, Descripcion=@Descripcion,
Requisitos=@Requisitos, Creditos=@Creditos, Costo=@Costo where Id_Curso=@idCurso
update dbo.PlanDeEstudio set Periodo=@Periodo where IDCurso=@idCurso
GO
/****** Object:  StoredProcedure [dbo].[ModificarEstudiante]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ModificarEstudiante] @id int, @Correo varchar(max), @telefo int, @dire varchar(max)
as

update dbo.Estudiantes set Correo=@Correo, Telefono=@telefo, Direccion=@dire where Id_Estudiante=@id

GO
/****** Object:  StoredProcedure [dbo].[pagoFactura]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pagoFactura] @idfacturas int
as
UPDATE Facturacion set Estado='Pagado' WHERE Facturacion.IDFactura=@idfacturas 
GO
/****** Object:  StoredProcedure [dbo].[RegistroCarreras]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RegistroCarreras] @NombreCarrera varchar(max), @Descripcion varchar(max)
as
    insert into dbo.Carreras values (@NombreCarrera,@Descripcion)
GO
/****** Object:  StoredProcedure [dbo].[RegistroCursos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RegistroCursos] @NombreCurso varchar(max), @Descripcion varchar(max), @Costo money,
@Creditos int, @Requisitos varchar(10), @Id_Carrera int, @Periodo int
as
declare @idcurso int
    insert into dbo.Cursos values (@NombreCurso,@Descripcion,@Costo,@Creditos,@Requisitos,@Id_Carrera)
	select @idcurso= SCOPE_IDENTITY()
	insert into dbo.PlanDeEstudio values(@idcurso, @Id_Carrera, @Periodo)
GO
/****** Object:  StoredProcedure [dbo].[RegistroPeriodo]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RegistroPeriodo] @Cuatri int, @Anno int
as
    insert into dbo.Periodo values (@Cuatri,@Anno)
GO
/****** Object:  StoredProcedure [dbo].[RegitroHistorico]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RegitroHistorico] @id int, @idcurso int, @nota int
as
update Registro_Historico set Nota_Obtenida=@nota where Id_Estudiante=@id and Id_Curso=@idcurso

GO
/****** Object:  StoredProcedure [dbo].[usuariosContraseñas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usuariosContraseñas] @id int
as
select Contraseña from Usuario where Usuario.IDUser=@id
GO
/****** Object:  StoredProcedure [dbo].[verAulas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[verAulas]
as
select * from Aulas
GO
/****** Object:  StoredProcedure [dbo].[verCarreras]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verCarreras] 
as
select * from Carreras
GO
/****** Object:  StoredProcedure [dbo].[VerCarrerasCursos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[VerCarrerasCursos] @IDCa int
as
    Select DISTINCT  Cursos.Id_Curso,Cursos.NombreCurso,Cursos.Descripcion,Cursos.Requisitos,Cursos.Creditos,Cursos.Costo,
	PlanDeEstudio.Periodo
	from dbo.Cursos inner join dbo.Carreras on Carreras.Id_Carrera=Cursos.Id_Carrera
	and Carreras.Id_Carrera=@IDCa inner join dbo.PlanDeEstudio on dbo.PlanDeEstudio.IDCarrera=Carreras.Id_Carrera
	
GO
/****** Object:  StoredProcedure [dbo].[verCursos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verCursos]
as
select Cursos.Id_Curso, Cursos.NombreCurso, Carreras.NombreCarrera from Cursos inner join Carreras on Carreras.Id_Carrera=Cursos.Id_Carrera
GO
/****** Object:  StoredProcedure [dbo].[VerCursosEstudiante]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[VerCursosEstudiante] @id int, @Periodo int, @anno int
as

select DISTINCT Periodo.Cuatrimestre ,Cursos.Id_Curso, Cursos.NombreCurso, Registro_Historico.Nota_Obtenida, Periodo.Anno from Cursos 
inner join Registro_Historico on Registro_Historico.Id_Curso=Cursos.Id_Curso and
Registro_Historico.Id_Estudiante=@id and Registro_Historico.Periodo=@Periodo
inner join Periodo on Periodo.Cuatrimestre=@Periodo and Periodo.Anno=@anno

GO
/****** Object:  StoredProcedure [dbo].[VerEstudianteDatos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VerEstudianteDatos] @id int
as

select Estudiantes.Correo, Estudiantes.Telefono, Estudiantes.Direccion from Estudiantes where Id_Estudiante=@id

GO
/****** Object:  StoredProcedure [dbo].[verEstudiantesProfe]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verEstudiantesProfe] @idProfe int
as
select Cursos.Id_Curso, Cursos.NombreCurso, Estudiantes.Id_Estudiante, Estudiantes.Nombre, Registro_Historico.Nota_Obtenida from Cursos 
inner join Distribucion on Distribucion.Id_Curso=Cursos.Id_Curso  and Distribucion.Id_Profesor=@idProfe
inner join Matricula on Matricula.IDdistribucion=Distribucion.Codigo_Distribucion
inner join Estudiantes on Estudiantes.Id_Estudiante=Matricula.IDEstudiante
inner join Registro_Historico on Registro_Historico.Id_Curso=Cursos.Id_Curso and Registro_Historico.Id_Estudiante= Estudiantes.Id_Estudiante
GO
/****** Object:  StoredProcedure [dbo].[verFacturas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURe [dbo].[verFacturas] @id int
as

select * from Facturacion where IDEstudiante=@id

GO
/****** Object:  StoredProcedure [dbo].[verFacturaUna]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verFacturaUna] @idFactura int
as
select Facturacion.Costo, Facturacion.Estado from Facturacion where Facturacion.IDFactura=@idFactura
GO
/****** Object:  StoredProcedure [dbo].[verHorario]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verHorario]
as
select * from Horarios
GO
/****** Object:  StoredProcedure [dbo].[VerMatriculas]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VerMatriculas] @id int
as
select DISTINCT Matricula.IDMatricula, Cursos.NombreCurso, Horarios.Horario from Matricula 
inner join Distribucion on Codigo_Distribucion=Matricula.IDdistribucion
inner join Cursos on Distribucion.Id_Curso=Cursos.Id_Curso
inner join Horarios on Distribucion.Dia=Horarios.codHora
GO
/****** Object:  StoredProcedure [dbo].[VerPeriodo]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[VerPeriodo] 
as
    select  Periodo.IDPerido,Periodo.Cuatrimestre, Periodo.Anno from Periodo
GO
/****** Object:  StoredProcedure [dbo].[VerPlanEstudioCarrera]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[VerPlanEstudioCarrera] @IDEstudiante int
as
select Carreras.NombreCarrera,Cursos.NombreCurso,Cursos.Creditos , PlanDeEstudio.Periodo from Cursos
inner join dbo.PlanDeEstudio on Cursos.Id_Curso=PlanDeEstudio.IDCurso
inner join Carreras on PlanDeEstudio.IDCarrera=Carreras.Id_Carrera
inner join Estudiantes ON Estudiantes.Id_Carrera=Carreras.Id_Carrera and Estudiantes.Id_Estudiante=@IDEstudiante

GO
/****** Object:  StoredProcedure [dbo].[verProfesores]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verProfesores]
as
select Profesores.Id_Profesor, Profesores.Nombre, Carreras.NombreCarrera from Profesores
inner join Carreras on Carreras.Id_Carrera= Profesores.Id_Carrera
GO
/****** Object:  StoredProcedure [dbo].[verPuestos]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verPuestos]
as
select * from Puestos
GO
/****** Object:  StoredProcedure [dbo].[VerRangoUser]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VerRangoUser] @id int
as
select Usuario.Rango from Usuario where Usuario.IDUser=@id
GO
/****** Object:  StoredProcedure [dbo].[verRoles]    Script Date: 31/08/2020 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verRoles]
as
select * from Rol
GO
USE [master]
GO
ALTER DATABASE [MatriculaAvatar] SET  READ_WRITE 
GO
use MatriculaAvatar
