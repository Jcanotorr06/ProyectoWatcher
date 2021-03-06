USE [Watcher]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[cod_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[tarjeta] [char](2) NULL,
	[no_tarj] [varchar](15) NULL,
	[cedula] [varchar](11) NULL,
 CONSTRAINT [Cliente_cod_cliente_pk] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contrarto]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrarto](
	[cod_contrato] [int] NOT NULL,
	[fecha_cont] [date] NULL,
	[cod_plan] [int] NULL,
	[cod_cliente] [int] NULL,
 CONSTRAINT [Contrato_cod_contrato_pk] PRIMARY KEY CLUSTERED 
(
	[cod_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[cod_gen]  AS (upper(left([nombre],(2)))) PERSISTED NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [Genero_cod_gen_pk] PRIMARY KEY CLUSTERED 
(
	[cod_gen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[cod_cliente] [int] NOT NULL,
	[cod_contrato] [int] NOT NULL,
	[monto] [money] NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [Pago_cod_contrato_cod_cliente_fecha_pk] PRIMARY KEY CLUSTERED 
(
	[cod_contrato] ASC,
	[cod_cliente] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[cod_plan] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](8) NULL,
	[monto] [money] NULL,
 CONSTRAINT [Plan_cod_plan_pk] PRIMARY KEY CLUSTERED 
(
	[cod_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa](
	[cod_prog] [int] IDENTITY(1000,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[genero] [varchar](2) NULL,
	[duracion] [int] NULL,
	[edad] [varchar](15) NULL,
	[descripcion] [varchar](50) NULL,
	[año] [int] NULL,
	[img] [image] NULL,
 CONSTRAINT [Programa_cod_prog_pk] PRIMARY KEY CLUSTERED 
(
	[cod_prog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prota_Program]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prota_Program](
	[cod_prota] [int] NOT NULL,
	[cod_prog] [int] NOT NULL,
 CONSTRAINT [Prota_Program_cod_prota_cod_prog_pk] PRIMARY KEY CLUSTERED 
(
	[cod_prota] ASC,
	[cod_prog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protagonista]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protagonista](
	[cod_prota] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
 CONSTRAINT [Protagonista_cod_prota_pk] PRIMARY KEY CLUSTERED 
(
	[cod_prota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serie]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serie](
	[cod_prog] [int] NOT NULL,
	[cap] [int] NOT NULL,
	[duracion] [int] NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [Serie_cap_cod_prog_pk] PRIMARY KEY CLUSTERED 
(
	[cap] ASC,
	[cod_prog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visualizacion]    Script Date: 7/26/2021 3:19:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visualizacion](
	[cod_vis] [int] IDENTITY(1,1) NOT NULL,
	[cod_contrato] [int] NOT NULL,
	[cod_programa] [int] NOT NULL,
	[duracion] [int] NULL,
 CONSTRAINT [Visualizacion_cod_vis_pk] PRIMARY KEY CLUSTERED 
(
	[cod_vis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (1, N'Nancy ', N'Davolio', N'CR', N'5001-6254-9874', N'8-888-8888')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (2, N'Andrew ', N'Fuller', N'CR', N'5001-6667-9875', N'7-777-7777')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (3, N'Janet', N'Leverling', N'DR', N'5000-6254-9876', N'5-555-5555')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (4, N'Margaret', N'Peacock', N'CR', N'5011-6333-9877', N'3-333-3333')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (5, N'Steven ', N'Buchanan', N'CR', N'5002-6254-9878', N'2-222-2222')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (6, N'Michael ', N'Suyama', N'DR', N'5001-6254-9879', N'PE-111-1111')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (7, N'Robert ', N'King', N'CR', N'5033-6254-9880', N'N-11-111')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (8, N'Laura ', N'Callahan', N'CR', N'5091-6254-9999', N'EE-777-777')
INSERT [dbo].[Cliente] ([cod_cliente], [nombre], [apellido], [tarjeta], [no_tarj], [cedula]) VALUES (9, N'Anne ', N'Dodsworth', N'CR', N'5001-6254-8888', N'8-555-55')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (63216547, CAST(N'2015-01-21' AS Date), 2, 4)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (65552525, CAST(N'2010-11-24' AS Date), 3, 1)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (65858745, CAST(N'2010-11-24' AS Date), 2, 2)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (66772395, CAST(N'2018-02-05' AS Date), 1, 3)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (66982232, CAST(N'2017-12-25' AS Date), 3, 9)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (67275689, CAST(N'2018-12-31' AS Date), 2, 6)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (67777777, CAST(N'2011-12-12' AS Date), 1, 7)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (68281245, CAST(N'2017-05-12' AS Date), 2, 8)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (69141111, CAST(N'1998-05-15' AS Date), 3, 5)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (69321111, CAST(N'2016-08-30' AS Date), 1, 5)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (69584714, CAST(N'1997-11-23' AS Date), 1, 1)
INSERT [dbo].[Contrarto] ([cod_contrato], [fecha_cont], [cod_plan], [cod_cliente]) VALUES (69873625, CAST(N'2019-03-30' AS Date), 3, 1)
GO
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Accion')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Comedia')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Drama')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Ficcion')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Guerra')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Musical')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Romance')
INSERT [dbo].[Genero] ([nombre]) VALUES (N'Terror')
GO
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (4, 63216547, 14.0000, CAST(N'2019-11-21' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (1, 65552525, 16.0000, CAST(N'2019-11-24' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (2, 65858745, 14.0000, CAST(N'2019-11-24' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (3, 66772395, 9.0000, CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (9, 66982232, 16.0000, CAST(N'2019-11-25' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (6, 67275689, 14.0000, CAST(N'2019-11-30' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (7, 67777777, 9.0000, CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (8, 68281245, 14.0000, CAST(N'2019-09-12' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (5, 69141111, 16.0000, CAST(N'2019-10-15' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (5, 69321111, 9.0000, CAST(N'2019-11-30' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (1, 69584714, 9.0000, CAST(N'2019-11-23' AS Date))
INSERT [dbo].[Pago] ([cod_cliente], [cod_contrato], [monto], [fecha]) VALUES (1, 69873625, 16.0000, CAST(N'2019-03-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([cod_plan], [tipo], [monto]) VALUES (1, N'Básico', 9.0000)
INSERT [dbo].[Plan] ([cod_plan], [tipo], [monto]) VALUES (2, N'Estándar', 14.0000)
INSERT [dbo].[Plan] ([cod_plan], [tipo], [monto]) VALUES (3, N'Ultra', 16.0000)
SET IDENTITY_INSERT [dbo].[Plan] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa] ON 

INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1000, N'Titanic', N'RO', 230, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1001, N'Guasón', N'AC', 120, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1002, N'Minion', N'FI', 100, N'Menores de 10', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1003, N'El rey León', N'DR', 90, N'Menores de 10', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1004, N'Harry Potter', N'DR', 120, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1005, N'Avengers', N'GU', 135, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1006, N'Home Alone', N'CO', 150, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1007, N'Avatar', N'AC', 175, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1008, N'Rápido y Furioso', N'AC', 120, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1009, N'Los picapiedras', N'DR', 90, N'Menores de 10', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1010, N'Bety la Fea', N'RO', 160, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1011, N'Los simpson', N'DR', 75, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1012, N'Friends', N'RO', 175, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1013, N'Breaking Bad', N'AC', 120, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1014, N'The good Doctor', N'DR', 120, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1015, N'Annabelle', N'TE', 125, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1016, N'Son como Niños', N'CO', 200, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1017, N'El caballero de la navidad', N'RO', 100, N'Menores de 10', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1018, N'La chica alergica al WIFI', N'CO', 90, N'Entre 11 a 17', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1019, N'zombies Party', N'TE', 65, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1020, N'Actividad Paranormal', N'TE', 125, N'Mayores de 18', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1021, N'El principe de Egipto', N'MU', 87, N'Menores de 10', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1022, N'Annie', N'MU', 95, N'Menores de 10', NULL, NULL, NULL)
INSERT [dbo].[Programa] ([cod_prog], [nombre], [genero], [duracion], [edad], [descripcion], [año], [img]) VALUES (1023, N'Coco', N'MU', 90, N'Menores de 10', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Programa] OFF
GO
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (1, 1000)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (2, 1000)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (3, 1001)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (4, 1002)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (5, 1003)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (6, 1003)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (7, 1004)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (8, 1005)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (9, 1005)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (10, 1005)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (11, 1005)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (12, 1005)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (13, 1005)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (14, 1006)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (15, 1007)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (16, 1007)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (17, 1008)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (18, 1008)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (19, 1008)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (20, 1009)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (21, 1010)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (22, 1011)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (23, 1011)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (24, 1011)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (25, 1011)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (26, 1012)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (27, 1012)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (28, 1012)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (29, 1012)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (30, 1012)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (31, 1013)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (32, 1013)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (33, 1014)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (34, 1015)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (35, 1015)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (36, 1016)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (37, 1016)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (38, 1016)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (39, 1017)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (40, 1017)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (41, 1018)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (42, 1018)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (43, 1019)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (44, 1019)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (45, 1019)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (46, 1020)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (47, 1021)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (48, 1021)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (49, 1022)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (50, 1022)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (51, 1023)
INSERT [dbo].[Prota_Program] ([cod_prota], [cod_prog]) VALUES (52, 1023)
GO
SET IDENTITY_INSERT [dbo].[Protagonista] ON 

INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (1, N'Leonardo', N'DiCaprio')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (2, N'Kate', N'Winslet')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (3, N'Joaquin', N'Phoenix')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (4, N'Pierre', N'Coffin')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (5, N'James E', N'Jones')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (6, N'Matthew', N'Broderick')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (7, N'Daniel', N'Radcliffe')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (8, N'Robert', N'Downey Jr')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (9, N'Chris', N'Evans')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (10, N'Chris', N'Hemsworth')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (11, N'Mark', N'Ruffalo')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (12, N'Scarlett', N'Johannson')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (13, N'Samuel L', N'Jackson')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (14, N'Macaulay ', N'Culkin')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (15, N'Zoe', N'Saldana')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (16, N'Sam', N'Worthington')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (17, N'Paul', N'Walker')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (18, N'Vinn', N'Diesel')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (19, N'Tyrese', N'Gibson')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (20, N' John', N'Goodman')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (21, N'America', N'Ferrera')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (22, N'Dan', N'Castellaneta')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (23, N'Nancy', N'Cartwright')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (24, N'Julie', N'Kavner')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (25, N'Yeardley', N'Smith')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (26, N'Jennifer', N'Aniston')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (27, N'Courtney', N'Cox')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (28, N'Mathew', N'Perry')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (29, N'David', N'Schwrimmer')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (30, N'Matt', N'LeBlanc')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (31, N'Bryan', N'Cranston')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (32, N'Aaron', N'Paul')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (33, N'Freddie', N'Highmore')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (34, N'Patrick', N'Wilson')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (35, N'Annabelle', N'Walls')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (36, N'Adam', N'Sandler')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (37, N'Kevin', N'James')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (38, N'David', N'Spade')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (39, N'Vanessa', N'Hudgens')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (40, N'Josh', N'Whitehouse')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (41, N'James', N'Blake')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (42, N'Sue', N'Ramirez')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (43, N'Simon', N'Pegg')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (44, N'Nick', N'Frost')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (45, N'Kate', N'Ashfield')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (46, N'Katie', N'Featherston')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (47, N'Val', N'Kilmer')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (48, N'Ralph', N'Fiennes')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (49, N'Quvenzhane', N'Wallis')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (50, N'Cameron', N'Diaz')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (51, N'Anthony', N'Gonzalez')
INSERT [dbo].[Protagonista] ([cod_prota], [nombre], [apellido]) VALUES (52, N'Gael', N'Garcia')
SET IDENTITY_INSERT [dbo].[Protagonista] OFF
GO
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 1, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1011, 1, 15, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 1, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1013, 1, 30, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1014, 1, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 2, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1011, 2, 15, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 2, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1013, 2, 30, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1014, 2, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 3, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1011, 3, 15, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 3, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1013, 3, 30, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1014, 3, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 4, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1011, 4, 15, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 4, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1013, 4, 30, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1014, 4, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 5, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1011, 5, 15, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 5, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1014, 5, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 6, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 6, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1014, 6, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 7, 20, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1012, 7, 25, NULL)
INSERT [dbo].[Serie] ([cod_prog], [cap], [duracion], [descripcion]) VALUES (1010, 8, 20, NULL)
GO
SET IDENTITY_INSERT [dbo].[Visualizacion] ON 

INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (1, 69873625, 1000, 200)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (2, 65858745, 1003, 90)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (3, 69873625, 1010, 120)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (4, 67777777, 1009, 90)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (5, 63216547, 1000, 230)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (6, 69141111, 1011, 30)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (7, 69141111, 1009, 90)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (8, 68281245, 1013, 120)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (9, 66982232, 1014, 100)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (10, 66772395, 1015, 125)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (11, 67275689, 1016, 150)
INSERT [dbo].[Visualizacion] ([cod_vis], [cod_contrato], [cod_programa], [duracion]) VALUES (12, 69873625, 1017, 100)
SET IDENTITY_INSERT [dbo].[Visualizacion] OFF
GO
ALTER TABLE [dbo].[Contrarto]  WITH CHECK ADD  CONSTRAINT [Contrato_cod_cliente_fk] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[Cliente] ([cod_cliente])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Contrarto] CHECK CONSTRAINT [Contrato_cod_cliente_fk]
GO
ALTER TABLE [dbo].[Contrarto]  WITH CHECK ADD  CONSTRAINT [Contrato_cod_plan_fk] FOREIGN KEY([cod_plan])
REFERENCES [dbo].[Plan] ([cod_plan])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Contrarto] CHECK CONSTRAINT [Contrato_cod_plan_fk]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [Pago_cod_cliente_fk] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[Cliente] ([cod_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [Pago_cod_cliente_fk]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [Pago_cod_contrato_fk] FOREIGN KEY([cod_contrato])
REFERENCES [dbo].[Contrarto] ([cod_contrato])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [Pago_cod_contrato_fk]
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD  CONSTRAINT [Programa_genero_fk] FOREIGN KEY([genero])
REFERENCES [dbo].[Genero] ([cod_gen])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Programa] CHECK CONSTRAINT [Programa_genero_fk]
GO
ALTER TABLE [dbo].[Prota_Program]  WITH CHECK ADD  CONSTRAINT [Prota_Program_cod_prog_fk] FOREIGN KEY([cod_prog])
REFERENCES [dbo].[Programa] ([cod_prog])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prota_Program] CHECK CONSTRAINT [Prota_Program_cod_prog_fk]
GO
ALTER TABLE [dbo].[Prota_Program]  WITH CHECK ADD  CONSTRAINT [Prota_Program_cod_prota_fk] FOREIGN KEY([cod_prota])
REFERENCES [dbo].[Protagonista] ([cod_prota])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prota_Program] CHECK CONSTRAINT [Prota_Program_cod_prota_fk]
GO
ALTER TABLE [dbo].[Serie]  WITH CHECK ADD  CONSTRAINT [Serie_cod_pro_fk] FOREIGN KEY([cod_prog])
REFERENCES [dbo].[Programa] ([cod_prog])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Serie] CHECK CONSTRAINT [Serie_cod_pro_fk]
GO
ALTER TABLE [dbo].[Visualizacion]  WITH CHECK ADD  CONSTRAINT [Visualizacion_cod_contrato_fk] FOREIGN KEY([cod_contrato])
REFERENCES [dbo].[Contrarto] ([cod_contrato])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Visualizacion] CHECK CONSTRAINT [Visualizacion_cod_contrato_fk]
GO
ALTER TABLE [dbo].[Visualizacion]  WITH CHECK ADD  CONSTRAINT [Visualizacion_cod_programa_fk] FOREIGN KEY([cod_programa])
REFERENCES [dbo].[Programa] ([cod_prog])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Visualizacion] CHECK CONSTRAINT [Visualizacion_cod_programa_fk]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Cliente_tarjeta_check] CHECK  (([tarjeta]='CR' OR [tarjeta]='DR'))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [Cliente_tarjeta_check]
GO
ALTER TABLE [dbo].[Contrarto]  WITH CHECK ADD  CONSTRAINT [Contrato_fecha_cont_ch] CHECK  (([fecha_cont]>='1997/8/29' AND [fecha_cont]<=getdate()))
GO
ALTER TABLE [dbo].[Contrarto] CHECK CONSTRAINT [Contrato_fecha_cont_ch]
GO
ALTER TABLE [dbo].[Programa]  WITH CHECK ADD  CONSTRAINT [Programa_edad_ch] CHECK  (([edad]='Mayores de 18' OR [edad]='Entre 11 a 17' OR [edad]='Menores de 10'))
GO
ALTER TABLE [dbo].[Programa] CHECK CONSTRAINT [Programa_edad_ch]
GO
ALTER TABLE [dbo].[Serie]  WITH CHECK ADD  CONSTRAINT [Serie_cap_ch] CHECK  (([cap]>=(1) AND [cap]<=(350)))
GO
ALTER TABLE [dbo].[Serie] CHECK CONSTRAINT [Serie_cap_ch]
GO
