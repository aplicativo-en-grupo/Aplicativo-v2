USE [ALQUILER]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idPersona] [int] NOT NULL,
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[valor] [varchar](100) NULL,
	[idUbigeo] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persona]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[tipoPersona] [char](1) NULL,
	[nombres] [varchar](100) NULL,
	[estado] [char](1) NULL,
	[fecreg] [datetime] NULL,
	[nrodocu] [varchar](11) NULL,
	[idtipodoide] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipoDocumentoIdentidad]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoDocumentoIdentidad](
	[idtipodoide] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
	[abreviatura] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[idtipodoide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_cliente]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_cliente] AS
select ti.idtipodoide,ti.nombre,p.nrodocu, p.nombres , d.valor
from Persona p , 
tipoDocumentoIdentidad ti ,
Direccion d
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[idContrato] [int] NOT NULL,
	[idTipocbte] [char](2) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[numero] [int] NOT NULL,
	[idComprobante] [int] IDENTITY(1,1) NOT NULL,
	[total] [decimal](10, 2) NULL,
	[fecEmision] [date] NULL,
	[fecVencimiento] [date] NULL,
	[Saldo] [decimal](10, 2) NULL,
	[pagado] [decimal](10, 2) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Mes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComprobanteConcepto]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobanteConcepto](
	[idConcepto] [int] NOT NULL,
	[importe] [decimal](10, 2) NOT NULL,
	[idComprobante] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC,
	[idComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idConcepto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
	[estado] [char](1) NULL,
	[fecreg] [datetime] NULL,
	[fijo] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContratoAlquiler]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContratoAlquiler](
	[idOficina] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idContrato] [int] IDENTITY(1,1) NOT NULL,
	[fecInicio] [date] NOT NULL,
	[fecFin] [date] NOT NULL,
	[estado] [char](1) NOT NULL,
	[fecreg] [datetime] NOT NULL,
	[idMoneda] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Edificio]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edificio](
	[idEdificio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[estado] [char](1) NULL,
	[nroPisos] [int] NULL,
	[fecreg] [datetime] NULL,
	[idUbigeo] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEdificio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Facturacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturacion](
	[Periodo] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[FechaCierre] [datetime] NULL,
	[FechaApertura] [datetime] NULL,
	[importeSoles] [decimal](12, 2) NULL,
	[estado] [char](1) NULL,
	[importeDolares] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC,
	[Mes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FacturacionDetalle]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturacionDetalle](
	[idConcepto] [int] NOT NULL,
	[idContrato] [int] NOT NULL,
	[Periodo] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[fecreg] [datetime] NULL,
	[importe] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC,
	[Mes] ASC,
	[idContrato] ASC,
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Incidencia]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidencia](
	[idIncidencia] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[importeTotal] [decimal](10, 2) NULL,
	[estado] [char](1) NULL,
	[fecreg] [datetime] NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idIncidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncidenciaOficina]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidenciaOficina](
	[idIncidencia] [int] NOT NULL,
	[importe] [char](18) NULL,
	[idContrato] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idIncidencia] ASC,
	[idContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedioComunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedioComunicacion](
	[idTmco] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[valor] [varchar](50) NULL,
	[fecreg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTmco] ASC,
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[idMoneda] [int] NOT NULL,
	[nombre] [varchar](25) NULL,
	[codSunat] [varchar](2) NULL,
	[codInternacional] [varchar](4) NULL,
	[estado] [char](1) NULL,
	[fecreg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oficina]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oficina](
	[idEdificio] [int] NOT NULL,
	[idOficina] [int] IDENTITY(1,1) NOT NULL,
	[piso] [int] NULL,
	[estado] [char](1) NULL,
	[nro] [int] NULL,
	[fecreg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OficinaServicio]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OficinaServicio](
	[idOficina] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[fecreg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOficina] ASC,
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pago]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[estado] [char](1) NULL,
	[fecreg] [datetime] NULL,
	[idTipoMopa] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idMoneda] [int] NOT NULL,
	[column_name] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PagoComprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoComprobante](
	[idPago] [int] NOT NULL,
	[idComprobante] [int] NOT NULL,
	[importe] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[idServicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[estado] [char](1) NULL,
	[fecreg] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tarifa]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa](
	[idConcepto] [int] NOT NULL,
	[idTarifa] [int] NOT NULL,
	[periodo] [int] NULL,
	[estado] [char](1) NULL,
	[importe] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoCambio]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCambio](
	[idTipocam] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[importe] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipocam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[idTipocbte] [char](2) NOT NULL,
	[nombre] [varchar](30) NULL,
	[abreviatura] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipocbte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoMedioComunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMedioComunicacion](
	[idTipomeco] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipomeco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoModoPago]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoModoPago](
	[idTipoMopa] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoMopa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ubigeo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubigeo](
	[idUbigeo] [char](6) NOT NULL,
	[departamento] [varchar](50) NULL,
	[provincia] [varchar](50) NULL,
	[distrito] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUbigeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ContratoAlquiler] ADD  DEFAULT (getdate()) FOR [fecreg]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD FOREIGN KEY([idContrato])
REFERENCES [dbo].[ContratoAlquiler] ([idContrato])
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD FOREIGN KEY([idTipocbte])
REFERENCES [dbo].[TipoComprobante] ([idTipocbte])
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD FOREIGN KEY([Periodo], [Mes])
REFERENCES [dbo].[Facturacion] ([Periodo], [Mes])
GO
ALTER TABLE [dbo].[ComprobanteConcepto]  WITH CHECK ADD FOREIGN KEY([idComprobante])
REFERENCES [dbo].[Comprobante] ([idComprobante])
GO
ALTER TABLE [dbo].[ComprobanteConcepto]  WITH CHECK ADD FOREIGN KEY([idConcepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[ContratoAlquiler]  WITH CHECK ADD FOREIGN KEY([idMoneda])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[ContratoAlquiler]  WITH CHECK ADD FOREIGN KEY([idOficina])
REFERENCES [dbo].[Oficina] ([idOficina])
GO
ALTER TABLE [dbo].[ContratoAlquiler]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD FOREIGN KEY([idUbigeo])
REFERENCES [dbo].[Ubigeo] ([idUbigeo])
GO
ALTER TABLE [dbo].[Edificio]  WITH CHECK ADD FOREIGN KEY([idUbigeo])
REFERENCES [dbo].[Ubigeo] ([idUbigeo])
GO
ALTER TABLE [dbo].[FacturacionDetalle]  WITH CHECK ADD FOREIGN KEY([idContrato])
REFERENCES [dbo].[ContratoAlquiler] ([idContrato])
GO
ALTER TABLE [dbo].[FacturacionDetalle]  WITH CHECK ADD FOREIGN KEY([idConcepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[FacturacionDetalle]  WITH CHECK ADD FOREIGN KEY([Periodo], [Mes])
REFERENCES [dbo].[Facturacion] ([Periodo], [Mes])
GO
ALTER TABLE [dbo].[IncidenciaOficina]  WITH CHECK ADD FOREIGN KEY([idContrato])
REFERENCES [dbo].[ContratoAlquiler] ([idContrato])
GO
ALTER TABLE [dbo].[IncidenciaOficina]  WITH CHECK ADD FOREIGN KEY([idIncidencia])
REFERENCES [dbo].[Incidencia] ([idIncidencia])
GO
ALTER TABLE [dbo].[MedioComunicacion]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[MedioComunicacion]  WITH CHECK ADD FOREIGN KEY([idTmco])
REFERENCES [dbo].[TipoMedioComunicacion] ([idTipomeco])
GO
ALTER TABLE [dbo].[Oficina]  WITH CHECK ADD FOREIGN KEY([idEdificio])
REFERENCES [dbo].[Edificio] ([idEdificio])
GO
ALTER TABLE [dbo].[OficinaServicio]  WITH CHECK ADD FOREIGN KEY([idOficina])
REFERENCES [dbo].[Oficina] ([idOficina])
GO
ALTER TABLE [dbo].[OficinaServicio]  WITH CHECK ADD FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([idServicio])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([column_name])
REFERENCES [dbo].[TipoCambio] ([idTipocam])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([idMoneda])
REFERENCES [dbo].[Moneda] ([idMoneda])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([idTipoMopa])
REFERENCES [dbo].[TipoModoPago] ([idTipoMopa])
GO
ALTER TABLE [dbo].[PagoComprobante]  WITH CHECK ADD FOREIGN KEY([idComprobante])
REFERENCES [dbo].[Comprobante] ([idComprobante])
GO
ALTER TABLE [dbo].[PagoComprobante]  WITH CHECK ADD FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD FOREIGN KEY([idtipodoide])
REFERENCES [dbo].[tipoDocumentoIdentidad] ([idtipodoide])
GO
ALTER TABLE [dbo].[Tarifa]  WITH CHECK ADD FOREIGN KEY([idConcepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
/****** Object:  StoredProcedure [dbo].[actualizar_contrato]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_contrato]
(
 @idOficina int,
 @idPersona int ,
 @idContrato int,
 @fecInicio date,
 @fecFin date,
 @estado char(1),
 @fecreg date,
 @idMoneda int
 
) 
as
update ContratoAlquiler set @idOficina=idOficina,@idPersona=idPersona,@idContrato = idContrato, @fecInicio = fecInicio, @fecFin = fecFin, @estado = estado,
 @fecreg = fecreg, @idMoneda = idMoneda
where @idContrato = idContrato


GO
/****** Object:  StoredProcedure [dbo].[actualizar_Oficina]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizar_Oficina]
(

 @idEdificio   int,
 @idOficina    int,
 @piso         int,
 @estado       char(1),
 @nro          int,
 @fecreg       datetime

) 
as
update Oficina set  @idEdificio=idEdificio,@piso=piso , 
 @estado=estado,@nro=nro, 
@fecreg=fecreg  
where @idOficina = idOficina



GO
/****** Object:  StoredProcedure [dbo].[actualizar_tipmedcom]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[actualizar_tipmedcom]

@idTipomeco int,
@nombre varchar(30)

as
begin
update TipoMedioComunicacion
set nombre=@nombre
where TipoMedioComunicacion.idTipomeco=@idTipomeco
end

GO
/****** Object:  StoredProcedure [dbo].[buscar_ta_x_nomconc]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[buscar_ta_x_nomconc]
(
@nombre varchar(40)
)
as
begin 

SELECT        c.idConcepto, c.nombre, c.estado, c.fijo, t.periodo, t.importe
FROM            Concepto as c  INNER JOIN
                         Tarifa as t ON c.idConcepto = t.idConcepto where nombre=@nombre

						 end
GO
/****** Object:  StoredProcedure [dbo].[crear_Tar]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[crear_Tar]

( @id_Concepto int,
@id_Tarifa int,
 @periodo int,
 @estado char(1),
 @importe decimal(10,2)
 

 )
AS
begin
 insert into Tarifa(idConcepto,idTarifa,periodo,estado,importe)
  values (@id_Concepto,@id_Tarifa,@periodo,@estado,@importe)
end


GO
/****** Object:  StoredProcedure [dbo].[DeleteTar]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteTar]
    @id_Tarifa int
AS 
BEGIN 
 DELETE
    FROM   Tarifa  
    WHERE  (idTarifa = @id_Tarifa) 
END

GO
/****** Object:  StoredProcedure [dbo].[insertar_contrato]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_contrato]


( 
 @idOficina int,
 @idPersona int ,
 @idContrato int,
 @fecInicio date,
 @fecFin date,
 @estado char(1),
 @fecreg date,
 @idMoneda int
 

 )
AS
begin
 insert into ContratoAlquiler(idOficina, idPersona,idContrato, [fecInicio], [fecFin], [estado], [fecreg], [idMoneda])
  values (@idOficina,@idPersona, @idContrato, @fecInicio, @fecFin, @estado, @fecreg,@idMoneda)
end

GO
/****** Object:  StoredProcedure [dbo].[insertar_Moneda]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[insertar_Moneda]

( 
@idMoneda  int,
@nombre   varchar(25),
@codSunat   varchar(2),
@codInternacional varchar(4),
@estado  char(1),
@fecreg   datetime
 )
AS
begin
insert into Moneda ([idMoneda], [nombre] , [codSunat] , [codInternacional] ,[estado] , [fecreg] ) 

 values (@idMoneda, @nombre , @codSunat, @codInternacional , @estado  , @fecreg  )
 END



GO
/****** Object:  StoredProcedure [dbo].[insertar_Tip_med_com]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[insertar_Tip_med_com]

( 
 @nombre varchar(30)
 )
AS
begin
 insert into TipoMedioComunicacion( [nombre])
  values ( @nombre)
End



GO
/****** Object:  StoredProcedure [dbo].[Insertar_Ubigeo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insertar_Ubigeo]


( 
 @idUbigeo char(6),
 @departamento varchar(50),
 @provincia varchar(50),
 @distrito varchar(50)
 

 )
AS
begin
 insert into Ubigeo(idUbigeo,departamento, provincia,distrito)
  values (@idUbigeo, @departamento, @provincia, @distrito)
end

GO
/****** Object:  StoredProcedure [dbo].[Modificar_Ubigeo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Modificar_Ubigeo]
(
  @idUbigeo char(6),
 @departamento varchar(50),
 @provincia varchar(50),
 @distrito varchar(50)
) 
as
update Ubigeo set @idUbigeo = idUbigeo, @departamento = departamento, @provincia = provincia, @distrito = distrito
where @idUbigeo = @idUbigeo

GO
/****** Object:  StoredProcedure [dbo].[mostrarCliente]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrarCliente]
as
begin
select tdi.nombre as TipoDocumento,p.nrodocu as NumDocumento,p.nombres as Nombre,d.idUbigeo as Direccion_Ubigeo
from Persona p
inner join tipoDocumentoIdentidad tdi
on
p.idtipodoide=tdi.idtipodoide
inner join Direccion d
on
d.idPersona=p.idPersona
end
GO
/****** Object:  StoredProcedure [dbo].[pa_comprobante_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_comprobante_getByID](
	@idComprobante int
)
AS
BEGIN
SELECT idComprobante, cbte.Periodo, cbte.Mes, cbte.idTipocbte, nombre AS tcbte_nombre, serie, numero, alquiler.idContrato, total,
		   fecEmision, fecVencimiento, pagado, Saldo
	FROM Comprobante cbte
		INNER JOIN ContratoAlquiler alquiler ON cbte.idContrato = alquiler.idContrato
		INNER JOIN Facturacion fact ON cbte.Periodo = fact.Periodo AND cbte.Mes = fact.Mes
		INNER JOIN TipoComprobante tcbte ON cbte.idTipocbte = tcbte.idTipocbte
	WHERE cbte.idComprobante = @idComprobante;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_comprobante_getRow]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_comprobante_getRow](
	@idComprobante int
)
AS
BEGIN
	SELECT idComprobante, cbte.Periodo, cbte.Mes, cbte.idTipocbte, nombre AS tcbte_nombre, serie, numero, alquiler.idContrato, total,
		   fecEmision, fecVencimiento, pagado, Saldo
	FROM Comprobante cbte
		INNER JOIN ContratoAlquiler alquiler ON cbte.idContrato = alquiler.idContrato
		INNER JOIN Facturacion fact ON cbte.Periodo = fact.Periodo AND cbte.Mes = fact.Mes
		INNER JOIN TipoComprobante tcbte ON cbte.idTipocbte = tcbte.idTipocbte
	WHERE cbte.idComprobante = @idComprobante;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_comprobante_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_comprobante_list](
	@buscar varchar(50) 
)
AS
BEGIN
	SET @buscar = '%' + REPLACE(@buscar, ' ', '%') + '%';

	SELECT idComprobante, cbte.Periodo, cbte.Mes, cbte.idTipocbte, nombre AS tcbte_nombre, serie, numero, alquiler.idContrato, total,
		   fecEmision, fecVencimiento, pagado, Saldo
	FROM Comprobante cbte
		INNER JOIN ContratoAlquiler alquiler ON cbte.idContrato = alquiler.idContrato
		INNER JOIN Facturacion fact ON cbte.Periodo = fact.Periodo AND cbte.Mes = fact.Mes
		INNER JOIN TipoComprobante tcbte ON cbte.idTipocbte = tcbte.idTipocbte;
END
GO
/****** Object:  StoredProcedure [dbo].[pa_comprobante_listCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_comprobante_listCbo](
	@idComprobante int
)
AS
BEGIN
	SELECT idComprobante, cbte.Periodo, cbte.Mes, cbte.idTipocbte, nombre AS tcbte_nombre, serie, numero, alquiler.idContrato, total,
		   fecEmision, fecVencimiento, pagado, Saldo
	FROM Comprobante cbte
		INNER JOIN ContratoAlquiler alquiler ON cbte.idContrato = alquiler.idContrato
		INNER JOIN Facturacion fact ON cbte.Periodo = fact.Periodo AND cbte.Mes = fact.Mes
		INNER JOIN TipoComprobante tcbte ON cbte.idTipocbte = tcbte.idTipocbte;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_activate]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: concepto
-- IF (OBJECT_ID(pa_concepto_activate) IS NOT NULL) DROP PROCEDURE pa_concepto_activate;

CREATE PROCEDURE [dbo].[pa_concepto_activate](
	@idConcepto int
)
AS
BEGIN
	UPDATE Concepto
	SET estado = 1
	WHERE idConcepto = @idConcepto;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_delete]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: concepto
-- IF (OBJECT_ID(pa_concepto_delete) IS NOT NULL) DROP PROCEDURE pa_concepto_delete;

CREATE PROCEDURE [dbo].[pa_concepto_delete](
	@idConcepto int
)
AS
BEGIN
	UPDATE Concepto
	SET estado = 0
	WHERE idConcepto = @idConcepto;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_concepto_getByID](
	@idConcepto int
)
AS
BEGIN
	SELECT idConcepto, nombre, fijo, estado, fecreg
	FROM Concepto cpto
	WHERE cpto.idConcepto = @idConcepto;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: concepto
-- IF (OBJECT_ID(pa_concepto_insert) IS NOT NULL) DROP PROCEDURE pa_concepto_insert;

CREATE PROCEDURE [dbo].[pa_concepto_insert](
	@nombre varchar(40),
	@fijo char(1),
	@fecreg datetime,
	@idConcepto int OUTPUT
)
AS
BEGIN
	INSERT INTO Concepto (
		nombre,
		fijo,
		estado,
		fecreg
	)
	VALUES (
		@nombre,
		@fijo,
		1,
		@fecreg
	);
	SET @idConcepto = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: concepto
-- IF (OBJECT_ID(pa_concepto_list) IS NOT NULL) DROP PROCEDURE pa_concepto_list;

CREATE PROCEDURE [dbo].[pa_concepto_list](
	@buscar varchar(50),
	@estado tinyint 
)
AS
BEGIN
	SET @buscar = '%' + REPLACE(@buscar, ' ', '%') + '%';

	SELECT idConcepto, nombre, fijo, estado, fecreg
	FROM Concepto cpto
	WHERE (cpto.nombre LIKE @buscar)
		AND cpto.estado = @estado;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_listCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: concepto
-- IF (OBJECT_ID(pa_concepto_listCbo) IS NOT NULL) DROP PROCEDURE pa_concepto_listCbo;

CREATE PROCEDURE [dbo].[pa_concepto_listCbo](
	@idConcepto int
)
AS
BEGIN
	SELECT idConcepto, nombre, fijo, estado, fecreg
	FROM Concepto cpto
	WHERE cpto.estado = 1 OR (cpto.idConcepto = @idConcepto);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_concepto_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: concepto
-- IF (OBJECT_ID(pa_concepto_update) IS NOT NULL) DROP PROCEDURE pa_concepto_update;

CREATE PROCEDURE [dbo].[pa_concepto_update](
	@idConcepto int,
	@nombre varchar(40),
	@fijo char(1),
	@fecreg datetime
)
AS
BEGIN
	UPDATE Concepto
	SET nombre = @nombre,
		fijo = @fijo,
		fecreg = @fecreg
	WHERE idConcepto = @idConcepto;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_activate]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_edificio_activate](
	@idEdificio int
)
AS
BEGIN
	UPDATE Edificio
	SET estado = 1
	WHERE idEdificio = @idEdificio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_delete]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_edificio_delete](
	@idEdificio int
)
AS
BEGIN
	UPDATE Edificio
	SET estado = 0
	WHERE idEdificio = @idEdificio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_edificio_getByID](
	@idEdificio int
)
AS
BEGIN
	SELECT idEdificio, nombre, nroPisos, estado, fecreg, ubig.idUbigeo
	FROM Edificio edificio
		INNER JOIN Ubigeo ubig ON edificio.idUbigeo = ubig.idUbigeo
	WHERE edificio.idEdificio = @idEdificio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_edificio_insert](
	@nombre varchar(50),
	@nroPisos int,	 
	@idUbigeo char(6),
	@idEdificio int OUTPUT
)
AS
BEGIN
	INSERT INTO Edificio (
		nombre,
		nroPisos,
		estado,
		fecreg,
		idUbigeo
	)
	VALUES (
		@nombre,
		@nroPisos,
		1,
		GETDATE(),
		@idUbigeo
	);
	SET @idEdificio = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_edificio_list](
	@idUbigeo char(6),
	@buscar varchar(50),
	@estado tinyint 
)
AS
BEGIN
	SET @buscar = '%' + REPLACE(@buscar, ' ', '%') + '%';

	SELECT idEdificio, nombre, nroPisos, estado, fecreg, ubig.idUbigeo
	FROM Edificio edificio
		INNER JOIN Ubigeo ubig ON edificio.idUbigeo = ubig.idUbigeo
	WHERE (edificio.nombre LIKE @buscar)
		AND (@idUbigeo <> '' OR ubig.idUbigeo = @idUbigeo)
		AND edificio.estado = @estado;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_listCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_edificio_listCbo](
	@idEdificio int
)
AS
BEGIN
	SELECT idEdificio, nombre, nroPisos, estado, fecreg, ubig.idUbigeo,
		ubig.departamento, ubig.distrito, ubig.provincia
	FROM Edificio edificio
		INNER JOIN Ubigeo ubig ON edificio.idUbigeo = ubig.idUbigeo
	WHERE edificio.estado = 1 OR (edificio.idEdificio = @idEdificio);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_edificio_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_edificio_update](
	@idEdificio int,
	@nombre varchar(50),
	@nroPisos int,	
	@idUbigeo char(6)
)
AS
BEGIN
	UPDATE Edificio
	SET nombre = @nombre,
		nroPisos = @nroPisos,		
		idUbigeo = @idUbigeo
	WHERE idEdificio = @idEdificio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_activate]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_facturacion_activate](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	UPDATE Facturacion
	SET estado = 1
	WHERE Periodo = @Periodo
	  AND Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_deactivate]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pa_facturacion_deactivate](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	UPDATE Facturacion
	SET estado = 2
	WHERE Periodo = @Periodo
	  AND Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_delete]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturacion_delete](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	UPDATE Facturacion
	SET estado = 0
	WHERE Periodo = @Periodo
	  AND Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_facturacion_getByID](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	SELECT Periodo, Mes, FechaApertura, FechaCierre, importeSoles, importeDolares, estado
	FROM Facturacion fact
	WHERE fact.Periodo = @Periodo
		AND fact.Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_getDetalle]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturacion_getDetalle](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	SELECT fact.Periodo, fact.Mes, factdet.idContrato, factdet.idConcepto, 
        cpto.nombre AS cpto_nombre, factdet.fecreg, factdet.importe
	FROM FacturacionDetalle factdet
		INNER JOIN Concepto cpto ON factdet.idConcepto = cpto.idConcepto
		INNER JOIN ContratoAlquiler alquiler ON factdet.idContrato = alquiler.idContrato
		INNER JOIN Facturacion fact ON factdet.Periodo = fact.Periodo AND factdet.Mes = fact.Mes
    WHERE fact.Periodo = @Periodo
    	AND fact.Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_getRow]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_facturacion_getRow](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	SELECT Periodo, Mes, FechaApertura, FechaCierre, importeSoles, importeDolares, estado
	FROM Facturacion fact
	WHERE fact.Periodo = @Periodo
		AND fact.Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturacion_insert](
	@Periodo int,
	@Mes int,
	@FechaApertura datetime,
	@FechaCierre datetime,
	@importeSoles decimal(12, 2),
	@importeDolares decimal(12, 2)
)
AS
BEGIN
	INSERT INTO Facturacion (
		Periodo,
		Mes,
		FechaApertura,
		FechaCierre,
		importeSoles,
		importeDolares,
		estado
	)
	VALUES (
		@Periodo,
		@Mes,
		@FechaApertura,
		@FechaCierre,
		@importeSoles,
		@importeDolares,
		1
	);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturacion_list](
	@periodo int,
	@estado tinyint 
)
AS
BEGIN
	SELECT Periodo, Mes, FechaApertura, FechaCierre, importeSoles, importeDolares, estado
	FROM Facturacion fact
	WHERE fact.estado = @estado AND Periodo = @periodo;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_listCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_facturacion_listCbo](
	@Periodo int,
	@Mes int
)
AS
BEGIN
	SELECT Periodo, Mes, FechaApertura, FechaCierre, importeSoles, importeDolares, estado
	FROM Facturacion fact
	WHERE fact.estado = 1 OR (fact.Periodo = @Periodo
		AND fact.Mes = @Mes);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_listPeriodosCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_facturacion_listPeriodosCbo]
AS
BEGIN
	SELECT DISTINCT Periodo
	FROM Facturacion fact;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturacion_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturacion_update](
	@Periodo int,
	@Mes int,
	@FechaApertura datetime,
	@FechaCierre datetime,
	@importeSoles decimal(12, 2),
	@importeDolares decimal(12, 2)
)
AS
BEGIN
	UPDATE Facturacion
	SET Periodo = @Periodo,
		Mes = @Mes,
		FechaApertura = @FechaApertura,
		FechaCierre = @FechaCierre,
		importeSoles = @importeSoles,
		importeDolares = @importeDolares
	WHERE Periodo = @Periodo
	  AND Mes = @Mes;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturaciondetalle_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Table FactuDetalle
CREATE PROCEDURE [dbo].[pa_facturaciondetalle_getByID](
	@Periodo int,
	@Mes int,
	@idContrato int,
	@idConcepto int
)
AS
BEGIN
	SELECT factdet.Periodo, factdet.Mes, factdet.idContrato, factdet.idConcepto, 
        cpto.nombre AS cpto_nombre, factdet.fecreg, factdet.importe
	FROM FacturacionDetalle factdet
		INNER JOIN Concepto cpto ON factdet.idConcepto = cpto.idConcepto
		INNER JOIN ContratoAlquiler alquiler ON factdet.idContrato = alquiler.idContrato
		INNER JOIN Facturacion fact ON factdet.Periodo = fact.Periodo AND factdet.Mes = fact.Mes
	WHERE factdet.Periodo = @Periodo
		AND factdet.Mes = @Mes
		AND factdet.idContrato = @idContrato
		AND factdet.idConcepto = @idConcepto;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturaciondetalle_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturaciondetalle_insert](
	@Periodo int,
	@Mes int,
	@idContrato int,
	@idConcepto int,
	@importe decimal(10, 2)
)
AS
BEGIN
	INSERT INTO FacturacionDetalle (
		Periodo,
		Mes,
		idContrato,
		idConcepto,
		fecreg,
		importe
	)
	VALUES (
		@Periodo,
		@Mes,
		@idContrato,
		@idConcepto,
		GETDATE(),
		@importe
	);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_facturaciondetalle_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_facturaciondetalle_update](
	@Periodo int,
	@Mes int,
	@idContrato int,
	@idConcepto int,
	@importe decimal(10, 2)
)
AS
BEGIN
	UPDATE FacturacionDetalle
	SET Periodo = @Periodo,
		Mes = @Mes,
		idContrato = @idContrato,
		idConcepto = @idConcepto,	
		importe = @importe
	WHERE Periodo = @Periodo
	  AND Mes = @Mes
	  AND idContrato = @idContrato
	  AND idConcepto = @idConcepto;
END

GO
/****** Object:  StoredProcedure [dbo].[PA_ListaDepartamento]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_ListaDepartamento]
as
select departamento from Ubigeo

GO
/****** Object:  StoredProcedure [dbo].[PA_ListaDistrito]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_ListaDistrito]
as
select distrito from Ubigeo

GO
/****** Object:  StoredProcedure [dbo].[PA_ListaProvincia]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_ListaProvincia]
as
select provincia from Ubigeo

GO
/****** Object:  StoredProcedure [dbo].[PA_Moroso]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PA_Moroso]
@Fecha_Vencimiento date
as
select Per.nombres as Nombres,Com.numero as Numero_Comprobante,Edi.nombre as Nombre_Edificio,Ofi.piso as Numero_Piso,Ofi.nro as Numero_Oficina,
Com.fecEmision as Fecha_Emision,Com.fecVencimiento as Fecha_Vencimiento,Com.total as Total
from Comprobante as Com inner join  ContratoAlquiler as Con on Com.idContrato = Con.idContrato 
inner join Persona as Per on Con.idPersona = Per.idPersona inner join Oficina as Ofi on
Con.idOficina =Ofi.idOficina inner join Edificio as Edi on Ofi.idEdificio = Edi.idEdificio 
where Com.fecVencimiento=@Fecha_Vencimiento

GO
/****** Object:  StoredProcedure [dbo].[pa_pago_delete]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: pago
-- IF (OBJECT_ID(pa_pago_delete) IS NOT NULL) DROP PROCEDURE pa_pago_delete;

CREATE PROCEDURE [dbo].[pa_pago_delete](
	@idPago int
)
AS
BEGIN
	UPDATE Pago
	SET estado = 0
	WHERE idPago = @idPago;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_pagocomprobante_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PA detalle pago
-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_getByID) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_getByID;

CREATE PROCEDURE [dbo].[pa_pagocomprobante_getByID](
	@idPago int,
	@idComprobante int
)
AS
BEGIN
	SELECT pagcbte.idPago, pagcbte.idComprobante, importe
	FROM PagoComprobante pagcbte
		INNER JOIN Comprobante cbte ON pagcbte.idComprobante = cbte.idComprobante
		INNER JOIN Pago pag ON pagcbte.idPago = pag.idPago
	WHERE pagcbte.idPago = @idPago
		AND pagcbte.idComprobante = @idComprobante;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_pagocomprobante_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_insert) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_insert;

CREATE PROCEDURE [dbo].[pa_pagocomprobante_insert](
	@idPago int,
	@idComprobante int,
	@importe decimal(10, 2)
)
AS
BEGIN
	INSERT INTO PagoComprobante (
		idPago,
		idComprobante,
		importe
	)
	VALUES (
		@idPago,
		@idComprobante,
		@importe
	);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_pagocomprobante_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_list) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_list;

CREATE PROCEDURE [dbo].[pa_pagocomprobante_list](
	@buscar varchar(50) 
)
AS
BEGIN
	SELECT pagcbte.idPago, pagcbte.idComprobante, importe
	FROM PagoComprobante pagcbte
		INNER JOIN Comprobante cbte ON pagcbte.idComprobante = cbte.idComprobante
		INNER JOIN Pago pag ON pagcbte.idPago = pag.idPago;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_pagocomprobante_listCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_listCbo) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_listCbo;

CREATE PROCEDURE [dbo].[pa_pagocomprobante_listCbo](
	@idPago int,
	@idComprobante int
)
AS
BEGIN
	SELECT pagcbte.idPago, pagcbte.idComprobante, importe
	FROM PagoComprobante pagcbte
		INNER JOIN Comprobante cbte ON pagcbte.idComprobante = cbte.idComprobante
		INNER JOIN Pago pag ON pagcbte.idPago = pag.idPago;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_pagocomprobante_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_update) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_update;

CREATE PROCEDURE [dbo].[pa_pagocomprobante_update](
	@idPago int,
	@idComprobante int,
	@importe decimal(10, 2)
)
AS
BEGIN
	UPDATE PagoComprobante
	SET idPago = @idPago,
		idComprobante = @idComprobante,
		importe = @importe
	WHERE idPago = @idPago
	  AND idComprobante = @idComprobante;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_activate]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_servicio_activate](
	@idServicio int
)
AS
BEGIN
	UPDATE Servicio
	SET estado = 1
	WHERE idServicio = @idServicio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_delete]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_servicio_delete](
	@idServicio int
)
AS
BEGIN
	UPDATE Servicio
	SET estado = 0
	WHERE idServicio = @idServicio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_getByID]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_servicio_getByID](
	@idServicio int
)
AS
BEGIN
	SELECT idServicio, nombre, estado, fecreg
	FROM Servicio serv
	WHERE serv.idServicio = @idServicio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pa_servicio_insert](
	@nombre varchar(30),	
	@idServicio int OUTPUT
)
AS
BEGIN
	INSERT INTO Servicio (
		nombre,
		estado,
		fecreg
	)
	VALUES (
		@nombre,
		1,
		GETDATE()
	);
	SET @idServicio = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_servicio_list](
	@buscar varchar(50),
	@estado tinyint 
)
AS
BEGIN
	SET @buscar = '%' + REPLACE(@buscar, ' ', '%') + '%';

	SELECT idServicio, nombre, estado, fecreg
	FROM Servicio serv
	WHERE (serv.nombre LIKE @buscar)
		AND serv.estado = @estado;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_listCbo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_servicio_listCbo](
	@idServicio int
)
AS
BEGIN
	SELECT idServicio, nombre, estado, fecreg
	FROM Servicio serv
	WHERE serv.estado = 1 OR (serv.idServicio = @idServicio);
END

GO
/****** Object:  StoredProcedure [dbo].[pa_servicio_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_servicio_update](
	@idServicio int,
	@nombre varchar(30)
)
AS
BEGIN
	UPDATE Servicio
	SET nombre = @nombre
	WHERE idServicio = @idServicio;
END

GO
/****** Object:  StoredProcedure [dbo].[pa_tipocambio_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_tipocambio_insert](
	@idTipoCam int,
	@fecha datetime,
	@importe decimal(4, 2)
)
AS
BEGIN
	INSERT INTO TipoCambio (
		idTipoCam,
		fecha,
		importe
	)
	VALUES (
		@idTipoCam,
		@fecha,
		@importe
	);
END


GO
/****** Object:  StoredProcedure [dbo].[pa_tipocambio_list]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pa_tipocambio_list]
	@fecha1 datetime,
	@fecha2 datetime
AS
BEGIN
	SELECT idTipoCam, fecha, importe
	FROM TipoCambio tc
	WHERE fecha between @fecha1 and @fecha2
	ORDER BY fecha DESC;
END


GO
/****** Object:  StoredProcedure [dbo].[pa_tipocambio_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pa_tipocambio_update](
	@idTipoCam int,
	@fecha datetime,
	@importe decimal(4, 2)
)
AS
BEGIN
	UPDATE TipoCambio
	SET idTipoCam = @idTipoCam,
		fecha = @fecha,
		importe = @importe
	WHERE idTipoCam = @idTipoCam;
END


GO
/****** Object:  StoredProcedure [dbo].[pa_tipocamlistarn]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_tipocamlistarn]
	
AS
BEGIN
	SELECT *
	FROM TipoCambio 
	
END




GO
/****** Object:  StoredProcedure [dbo].[pa_tipocomprobante_insert]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_tipocomprobante_insert](
	@idTipocbte char(2),
	@nombre varchar(30),
	@abreviatura varchar(10)
)
AS
BEGIN
	INSERT INTO TipoComprobante (
		idTipocbte,
		nombre,
		abreviatura
	)
	VALUES (
		@idTipocbte,
		@nombre,
		@abreviatura
	);
END


GO
/****** Object:  StoredProcedure [dbo].[pa_tipocomprobante_listByAbrev]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- -----Tabla: PROCEDIMIENTO DE TIPO DE COMPROBANTE------

CREATE PROCEDURE [dbo].[pa_tipocomprobante_listByAbrev](
	@abreviatura varchar(20)
)
AS
BEGIN
	SELECT idTipocbte, nombre, abreviatura
	FROM TipoComprobante tcbte
	WHERE abreviatura LIKE @abreviatura + '%';
END


GO
/****** Object:  StoredProcedure [dbo].[pa_tipocomprobante_listByCodigo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_tipocomprobante_listByCodigo](
	@idTipocbte varchar(20)
)
AS
BEGIN
	SELECT idTipocbte, nombre, abreviatura
	FROM TipoComprobante tcbte
	WHERE idTipocbte LIKE @idTipocbte + '%';
END

GO
/****** Object:  StoredProcedure [dbo].[pa_tipocomprobante_update]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[pa_tipocomprobante_update](
	@idTipocbte char(2),
	@nombre varchar(30),
	@abreviatura varchar(10)
)
AS
BEGIN
	UPDATE TipoComprobante
	SET idTipocbte = @idTipocbte,
		nombre = @nombre,
		abreviatura = @abreviatura
	WHERE idTipocbte = @idTipocbte;
END


GO
/****** Object:  StoredProcedure [dbo].[pa_tipocomprobantlistar]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[pa_tipocomprobantlistar]
	
AS
BEGIN
	SELECT *
	FROM TipoComprobante
	
END





GO
/****** Object:  StoredProcedure [dbo].[paxbuscarcomprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[paxbuscarcomprobante]
@cod_comp int
as
select * from Comprobante
where idComprobante=@cod_comp

GO
/****** Object:  StoredProcedure [dbo].[paxeliminarcomprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[paxeliminarcomprobante]
@num_comp int
as
delete from Comprobante
where idComprobante=@num_comp

GO
/****** Object:  StoredProcedure [dbo].[paxlistarcomprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[paxlistarcomprobante]
as
select * from Comprobante

GO
/****** Object:  StoredProcedure [dbo].[paxmodificarcomprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[paxmodificarcomprobante]
@idcomprobante int,
@mes int,
@periodo int,
@idtipocbte char(2),
@serie varchar(4),
@numero int,
@idcontrato int,
@total decimal(10,2),
@fecemision date,
@fecvencimiento date,
@pagado decimal(10,2),
@saldo decimal(10,2)
AS
UPDATE Comprobante SET Mes=@mes,Periodo=@periodo,idTipocbte=@idtipocbte,serie=@serie,
				       numero=@numero,@idcontrato=@idcontrato,total=@total,
					   fecEmision=@fecemision,fecVencimiento=@fecvencimiento,
					   pagado=@pagado,Saldo=@saldo
WHERE idComprobante=@idcomprobante

GO
/****** Object:  StoredProcedure [dbo].[paxregistrarcomprobante]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[paxregistrarcomprobante]
@idcomprobante int,
@mes int,
@periodo int,
@idtipocbte char(2),
@serie varchar(4),
@numero int,
@idcontrato int,
@total decimal(10,2),
@fecemision date,
@fecvencimiento date,
@pagado decimal(10,2),
@saldo decimal(10,2)
as
insert into Comprobante(Mes,Periodo,idTipocbte,serie,numero,
					    idContrato,total,fecEmision,fecVencimiento,pagado,Saldo)
values(@mes,@periodo,@idtipocbte,@serie,@numero,@idcontrato,@total,@fecemision,
	   @fecvencimiento,@pagado,@saldo)

GO
/****** Object:  StoredProcedure [dbo].[ReadTar]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReadTar]
    @id_Tarifa int
AS 
BEGIN 
 
    SELECT idConcepto,periodo,estado,importe
    FROM   Tarifa  
    WHERE  (idTarifa = @id_Tarifa) 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_busc_ofixcantifecreg]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_busc_ofixcantifecreg]
as
SELECT CAST( fecreg AS DATE ) as Dia, COUNT( idOficina ) as Total_Registros
FROM Oficina
GROUP BY CAST( fecreg AS DATE )



GO
/****** Object:  StoredProcedure [dbo].[sp_busc_ofixedificio]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_busc_ofixedificio]
(
@piso  int ,
@nombre varchar(50)
)

as begin
select o.idOficina as Id_Oficina, o.piso , o.estado , o.nro , o.fecreg 
,e.nombre as nom_edificio, e.estado as estado_edificio
,e.fecreg as Fecreg_Edificio
from Oficina o , Edificio e
where o.idEdificio=e.idEdificio AND  o.piso = @piso AND e.nombre=@nombre
end

GO
/****** Object:  StoredProcedure [dbo].[sp_busc_ofixestado]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_busc_ofixestado]

(
@estado  char(1)
)
as begin
select o.idOficina as Id_Oficina, o.piso , o.estado , o.nro , o.fecreg 
from Oficina o
where  o.estado = @estado 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_busc_ofixfecreg]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_busc_ofixfecreg]

(
@fecreg datetime
)
as begin
select o.idOficina as Id_Oficina, o.piso , o.estado , o.nro , o.fecreg 
from Oficina o
where  o.fecreg = @fecreg
end

GO
/****** Object:  StoredProcedure [dbo].[sp_busc_ofixnro]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_busc_ofixnro]

(
@nro int
)
as begin
select o.idOficina as Id_Oficina, o.piso , o.estado , o.nro , o.fecreg 
from Oficina o
where  o.nro = @nro
end



GO
/****** Object:  StoredProcedure [dbo].[sp_busc_ofixpiso]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_busc_ofixpiso]

(
@piso  int 
)
as begin
select o.idOficina as Id_Oficina, o.piso , o.estado , o.nro , o.fecreg 
from Oficina o
where  o.piso = @piso
end



GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARCONTRATOCAMBIOOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCARCONTRATOCAMBIOOFICINA]
@DATOBUSCAR VARCHAR(30)
AS
select c.idContrato,p.nombres,c.fecInicio,c.fecFin from ContratoAlquiler c inner join Persona p on c.idPersona=p.idPersona
where p.nombres LIKE @DATOBUSCAR+'%'




GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAREDIFICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCAREDIFICIO]
@BUSCAR VARCHAR(50)
AS
select idEdificio,nombre,fecreg,estado from Edificio
where nombre LIKE @BUSCAR+'%'

GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARMODOPAGO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCARMODOPAGO]
@NOMBRE VARCHAR(30)
AS
SELECT * FROM TipoModoPago
WHERE nombre LIKE @NOMBRE  +'%'


GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAROFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCAROFICINA]
@BUSCAR VARCHAR(50)
AS
SELECT o.idOficina,o.nro AS NROOFICINA,o.piso as PISO,e.nombre as EDIFICIO,o.idEdificio,CASE when o.estado = '0' THEN 'INACTIVO' ELSE 'ACTIVO' END AS ESTADO FROM Oficina o inner join  Edificio e ON o.idEdificio=e.idEdificio
where o.nro like @BUSCAR+'%'


GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAROFICINACAMBIOCONTRATO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCAROFICINACAMBIOCONTRATO]
@DATOBUSCAR VARCHAR(30)
AS
SELECT o.idOficina,o.nro AS NROOFICINA,o.piso as PISO,e.nombre as EDIFICIO,o.idEdificio,CASE when o.estado = '0' THEN 'INACTIVO' ELSE 'ACTIVO' END AS ESTADO FROM Oficina o inner join  Edificio e ON o.idEdificio=e.idEdificio
where o.nro LIKE @DATOBUSCAR+'%'

GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAROFICINASERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCAROFICINASERVICIO]
@BUSCAR VARCHAR(50)
AS
select O.idOficina,O.nro as NR_OFICINA,O.piso AS PISO  from OficinaServicio os INNER JOIN  Servicio S ON os.idServicio=S.idServicio
INNER JOIN Oficina O ON os.idOficina=O.idOficina
where  O.nro like @BUSCAR +'%' OR O.piso like @BUSCAR +'%'
group by  O.idOficina,O.nro,O.piso


GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARSERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCARSERVICIO]
@BUSCAR VARCHAR(50)
AS
SELECT idServicio AS ID,nombre as NOMBRE,CASE WHEN estado='0' then 'INACTIVO' ELSE 'ACTIVO' END AS ESTADO FROM Servicio
WHERE nombre LIKE @BUSCAR +'%'

GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARTIPODOCUMENTOIDENTIDAD]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCARTIPODOCUMENTOIDENTIDAD]
@CADENA VARCHAR(30)
AS
SELECT * FROM tipoDocumentoIdentidad
where nombre LIKE @CADENA+'%' OR abreviatura LIKE @CADENA+'%'


GO
/****** Object:  StoredProcedure [dbo].[SP_CAMBIOOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CAMBIOOFICINA]
@IDCONTRATO INT,
@IDOFICINA INT
AS
UPDATE ContratoAlquiler set 
idOficina=@IDOFICINA
where idContrato=@IDCONTRATO


GO
/****** Object:  StoredProcedure [dbo].[sp_cons_registros_Moneda]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_cons_registros_Moneda]
as
SELECT CAST( fecreg AS DATE ) as Dia, COUNT( idMoneda ) as Total_Registros
FROM Moneda
GROUP BY CAST( fecreg AS DATE )



GO
/****** Object:  StoredProcedure [dbo].[sp_cons_TipmedCom]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_cons_TipmedCom]
as
select * from TipoMedioComunicacion



GO
/****** Object:  StoredProcedure [dbo].[SP_CONTRATOESTADO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CONTRATOESTADO]
@OPCION INT
AS

IF	(@OPCION = 1)/****** LA OPCION UNO ES PARA LOS CONTRATOS VIEGENTES ******/
BEGIN
		select c.idContrato as ID,p.nombres,convert(date,c.fecInicio) as FECHAINICIO,convert(date,c.fecFin) as FECHAFIN  from ContratoAlquiler c inner join Persona p on c.idPersona=p.idPersona
		where convert(date,c.fecFin)>convert(date,GETDATE())
END 
IF(@OPCION = 2) /****** LA OPCION DOS ES PARA LOS CONTRATOS QUE LE QUEDAN 5 DIAS PARA VENCERCE ******/
BEGIN
		select c.idContrato as ID,p.nombres,convert(date,c.fecInicio) as FECHAINICIO,convert(date,c.fecFin) as FECHAFIN
		from ContratoAlquiler c inner join Persona p on c.idPersona=p.idPersona
		where  DATEDIFF(DD,GETDATE(), c.fecFin) <= 10 and DATEDIFF(DD,GETDATE(), c.fecFin) >=0
END

IF(@OPCION = 3) /****** LA OPCION TRES ES PARA LOS CONTRATOS QUE TIENEN EL ESTADO DE RESINDIDO ******/
BEGIN
		select c.idContrato as ID,p.nombres,convert(date,c.fecInicio) as FECHAINICIO,convert(date,c.fecFin) as FECHAFIN
		from ContratoAlquiler c inner join Persona p on c.idPersona=p.idPersona
		where  c.estado='2'
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_INCIDENCIA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DEL_INCIDENCIA]
	@idIncidencia INT
AS
IF EXISTS (SELECT * FROM Incidencia WHERE idIncidencia = @idIncidencia)
BEGIN
       DELETE FROM Incidencia WHERE idIncidencia = @idIncidencia
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_INCIDENCIAOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DEL_INCIDENCIAOFICINA]
	@idIncidencia INT
AS
IF EXISTS (SELECT * FROM IncidenciaOficina WHERE idIncidencia = @idIncidencia)
BEGIN
       DELETE FROM IncidenciaOficina WHERE idIncidencia = @idIncidencia
END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_direccion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_direccion]
@idDireccion int
AS
DELETE FROM Direccion WHERE idDireccion = @idDireccion


GO
/****** Object:  StoredProcedure [dbo].[sp_delete_MedioComunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_MedioComunicacion]
@idTmco int,
@idPersona int
AS
DELETE FROM MedioComunicacion  WHERE idPersona = @idPersona OR idTmco = @idTmco


GO
/****** Object:  StoredProcedure [dbo].[sp_delete_persona]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_persona]
@idPersona int
AS
DELETE FROM Persona WHERE idPersona = @idPersona


GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAROFICINASERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAROFICINASERVICIO]
@IDOFICINA INT,
@IDSERVICIO INT
AS
DELETE FROM OficinaServicio where idOficina=@IDOFICINA AND idServicio=@IDSERVICIO


GO
/****** Object:  StoredProcedure [dbo].[SP_INS_INCIDENCIA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INS_INCIDENCIA]
	@fecha DATETIME,
	@descripcion VARCHAR(100),
	@importeTotal DECIMAL(10,2),
	@estado CHAR(1)	
AS
BEGIN
    INSERT INTO Incidencia ([fecha],[descripcion],[importeTotal],[estado],[fecreg])
    VALUES (@fecha,@descripcion,@importeTotal,@estado,CURRENT_TIMESTAMP)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INS_INCIDENCIAOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INS_INCIDENCIAOFICINA]
	@idIncidencia INT,
	@importe CHAR(18),
	@idContrato INT
AS
BEGIN
    INSERT INTO IncidenciaOficina
    VALUES (@idIncidencia,@importe,@idContrato)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insert_direccion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_direccion]
@idPersona INT,
@valor VARCHAR(100),
@idUbigeo CHAR(6)
AS
INSERT INTO Direccion ([idPersona],[valor],[idUbigeo])
VALUES (@idPersona,  @valor, @idUbigeo)


GO
/****** Object:  StoredProcedure [dbo].[sp_insert_MedioComunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_MedioComunicacion]
@idPersona INT,
@valor VARCHAR(50),
@fecreg DATETIME
AS
insert into MedioComunicacion ([idPersona],[valor],[fecreg])
VALUES (@idPersona,@valor,@fecreg)



GO
/****** Object:  StoredProcedure [dbo].[sp_insert_persona]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_persona]
@tipoPersona CHAR(1),
@nombres VARCHAR(100),
@estado CHAR(1),
@fecreg DATETIME,
@nrodocu VARCHAR(11),
@idtipoide INT
AS
INSERT INTO Persona([tipoPersona],[nombres],[estado],[fecreg],[nrodocu],[idtipodoide])
VALUES (@tipoPersona,@nombres,@estado,@fecreg,@nrodocu,@idtipoide)

GO
/****** Object:  StoredProcedure [dbo].[sp_leer_oficina]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_leer_oficina]
as
select * from Oficina

GO
/****** Object:  StoredProcedure [dbo].[sp_leer_ofixedi]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_leer_ofixedi]
as
select o.idOficina , o.piso , o.estado , o.nro , o.fecreg 
,e.nombre , e.estado , e.nroPisos , e.fecreg
from Oficina o , Edificio e
where o.idEdificio=e.idEdificio

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARCONTRATOCAMBIOOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARCONTRATOCAMBIOOFICINA]
AS
SELECT c.idContrato,c.idPersona,p.nombres,o.idOficina,o.nro,c.idMoneda,c.fecInicio,c.fecFin FROM ContratoAlquiler c inner join  Persona p on p.idPersona=c.idPersona
inner join Oficina o on c.idOficina= c.idOficina

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARDETALLEOFICINASERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARDETALLEOFICINASERVICIO]
@BUSCAR INT
AS
select O.idOficina,O.nro as NR_OFICINA,s.idServicio,s.nombre AS SERVICIO  from OficinaServicio os INNER JOIN  Servicio S ON os.idServicio=S.idServicio
INNER JOIN Oficina O ON os.idOficina=O.idOficina
where o.idOficina=@BUSCAR

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARDOCUMENTOIDENTIDAD]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARDOCUMENTOIDENTIDAD]
AS
SELECT * FROM tipoDocumentoIdentidad



GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAREDIFICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAREDIFICIO]
AS
select idEdificio,nombre,nroPisos,fecreg,estado from Edificio

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARMODOPAGO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARMODOPAGO]
AS
SELECT * FROM TipoModoPago


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAROFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAROFICINA]
AS
SELECT o.idOficina,o.nro AS NROOFICINA,o.piso as PISO,e.nombre as EDIFICIO,o.idEdificio,CASE when o.estado = '0' THEN 'INACTIVO' ELSE 'ACTIVO' END AS ESTADO FROM Oficina o inner join  Edificio e ON o.idEdificio=e.idEdificio

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAROFICINACAMBIOCONTRATO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAROFICINACAMBIOCONTRATO]
AS
select c.idContrato,p.nombres,c.fecInicio,c.fecFin from ContratoAlquiler c inner join Persona p on c.idPersona=p.idPersona

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAROFICINASERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAROFICINASERVICIO]
AS
select O.idOficina,O.nro as NR_OFICINA,O.piso AS PISO  from OficinaServicio os INNER JOIN  Servicio S ON os.idServicio=S.idServicio
INNER JOIN Oficina O ON os.idOficina=O.idOficina
group by  O.idOficina,O.nro,O.piso

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARSERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARSERVICIO]
AS
SELECT idServicio AS ID,nombre as NOMBRE,CASE WHEN estado='0' then 'INACTIVO' ELSE 'ACTIVO' END AS ESTADO FROM Servicio

GO
/****** Object:  StoredProcedure [dbo].[SP_LST_DATOS]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LST_DATOS]
	@fecha1 DATETIME,
	@fecha2 DATETIME
AS
BEGIN
SELECT 
	TipoComprobante.nombre,
	CONCAT(Comprobante.serie, '-' , Comprobante.numero) AS	nrorecibo,
	Comprobante.fecVencimiento,
	(moneda.codInternacional) as moneda,
	(Comprobante.total/1.18) AS IGV,
	(Comprobante.total - (Comprobante.total/1.18)) AS Subtotal,
	Comprobante.total,
	tipoDocumentoIdentidad.abreviatura,
	Persona.nrodocu,
	Persona.nombres,
	Direccion.valor,
	Concepto.idConcepto,
	Concepto.nombre,
	(1) AS Cantidad,
	ComprobanteConcepto.importe,
	(ComprobanteConcepto.importe*0.18+ComprobanteConcepto.importe) AS SUBTOTAL
FROM TipoComprobante
INNER JOIN Comprobante
ON Comprobante.idTipocbte = TipoComprobante.idTipocbte
INNER JOIN ContratoAlquiler
ON ContratoAlquiler.idContrato = Comprobante.idContrato
INNER JOIN Moneda
ON Moneda.idMoneda = ContratoAlquiler.idMoneda
INNER JOIN Persona
ON Persona.idPersona = ContratoAlquiler.idPersona
INNER JOIN Direccion
ON Direccion.idPersona = Persona.idPersona
INNER JOIN ComprobanteConcepto
ON ComprobanteConcepto.idComprobante = Comprobante.idComprobante
INNER JOIN Concepto
ON Concepto.idConcepto = ComprobanteConcepto.idConcepto
INNER JOIN tipoDocumentoIdentidad
ON tipoDocumentoIdentidad.idtipodoide = Persona.idtipodoide
WHERE @fecha1>=Comprobante.fecVencimiento AND @fecha2<=Comprobante.fecVencimiento
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LST_DESCRIPCION]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LST_DESCRIPCION]
	@descripcion VARCHAR(100)
AS
BEGIN
	SELECT descripcion, importeTotal FROM Incidencia
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LST_INCIDENCIA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LST_INCIDENCIA]
AS
BEGIN
    SELECT * FROM Incidencia
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LST_INCIDENCIAOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LST_INCIDENCIAOFICINA]
AS
BEGIN
       SELECT * FROM IncidenciaOficina
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LST_PERSONAOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LST_PERSONAOFICINA]
	@nombres VARCHAR(100)
AS
BEGIN
	SELECT Oficina.nro, Oficina.nro, Edificio.nombre, Direccion.valor
	FROM ContratoAlquiler
	INNER JOIN IncidenciaOficina
	ON IncidenciaOficina.idContrato = ContratoAlquiler.idContrato
	INNER JOIN Oficina
	ON Oficina.idOficina = ContratoAlquiler.idOficina
	INNER JOIN Edificio
	ON Edificio.idEdificio = Oficina.idEdificio
	INNER JOIN Ubigeo
	ON Ubigeo.idUbigeo = Edificio.idUbigeo
	INNER JOIN Direccion
	ON Direccion.idUbigeo = Ubigeo.idUbigeo
	INNER JOIN Persona
	ON Persona.idPersona = Direccion.idPersona
END

GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARMODOPAGO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICARMODOPAGO]
@ID INT,
@NOMBRE VARCHAR(30)
AS
UPDATE TipoModoPago SET nombre=@NOMBRE
WHERE idTipoMopa=@ID


GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAROFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICAROFICINA]
@IDOFICINA INT,
@IDEDIFICIO INT,
@PISO INT,
@ESTADO CHAR(1),
@NRO INT
AS
UPDATE Oficina SET 
idEdificio=@IDEDIFICIO,piso=@PISO,estado=@ESTADO,nro=@NRO
where idOficina=@IDOFICINA


GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARTIPODOCUMENTOIDENTIDAD]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICARTIPODOCUMENTOIDENTIDAD]
@IDTIPODOIDE INT,
@NOMBRE VARCHAR(30),
@ABREVIATURA VARCHAR(6)
AS
UPDATE tipoDocumentoIdentidad SET nombre=@NOMBRE,
abreviatura=@ABREVIATURA
where idtipodoide=@IDTIPODOIDE


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARMODOPAGO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRARMODOPAGO]
@ID INT,
@NOMBRE VARCHAR(30)
AS
INSERT INTO TipoModoPago(idTipoMopa,nombre) values (@ID,@NOMBRE)


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAROFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAROFICINA]
@IDEDIFICIO INT,
@PISO INT,
@ESTADO CHAR(1),
@NRO INT
AS
INSERT INTO Oficina(idEdificio,piso,estado,nro,fecreg)
values(@IDEDIFICIO,@PISO,@ESTADO,@NRO,GETDATE())


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAROFICINASERVICIO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAROFICINASERVICIO]
@IDOFICINA INT,
@IDSERVICIO INT
AS
if exists (select * from OficinaServicio   where   idOficina   = @IDOFICINA  AND idServicio=@IDSERVICIO)
raiserror('EL SERVICIO YA ESTA REGISTRADO EN LA OFICINA',16,1)
else
insert into OficinaServicio(idOficina,idServicio,fecreg)values(@IDOFICINA,@IDSERVICIO,GETDATE())


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARTIPODOCUMENTOIDENTIDAD]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRARTIPODOCUMENTOIDENTIDAD]
@ID INT,
@NOMBRE VARCHAR(30),
@ABREVIATURA VARCHAR(6)
AS
INSERT INTO tipoDocumentoIdentidad(idtipodoide,nombre,abreviatura) values (@ID,@NOMBRE,@ABREVIATURA)


GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTEOFICINAESTADO]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REPORTEOFICINAESTADO]
@ESTADO CHAR(1)
AS
SELECT o.nro as NROOFICINA,o.piso as PISOOFICINA,e.nombre as EDIFICIO,e.nroPisos AS NROPISOEDIFICIO  
FROM Oficina o inner join Edificio e on o.idEdificio=e.idEdificio
where o.estado=@ESTADO

GO
/****** Object:  StoredProcedure [dbo].[sp_select_direccion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_direccion]
@idDireccion int
AS
SELECT * FROM Direccion WHERE idDireccion = @idDireccion


GO
/****** Object:  StoredProcedure [dbo].[SP_select_Mediocomunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_select_Mediocomunicacion]
@idTmco int,
@idPersona int
AS
select mc.idTmco, mc.idPersona, mc.valor, mc.fecreg from MedioComunicacion mc inner join TipoMedioComunicacion tmc on mc.idTmco = tmc.idTipomeco inner join Persona per on mc.idPersona = per.idPersona
where mc.idTmco = @idTmco and mc.idPersona = @idPersona


GO
/****** Object:  StoredProcedure [dbo].[sp_select_persona]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_persona]
@idPersona int
AS
SELECT * FROM Persona WHERE idPersona = @idPersona


GO
/****** Object:  StoredProcedure [dbo].[SP_UPD_INCIDENCIA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UPD_INCIDENCIA]
	@idIncidencia int,
	@fecha DATETIME,
	@importeTotal DECIMAL(10,2),
	@estado CHAR(1),
	@fecreg DATETIME,
	@descripcion VARCHAR(100)
AS
BEGIN
    UPDATE Incidencia SET
		fecha=@fecha,
	    importeTotal=@importeTotal,
	    estado=@estado,
	    fecreg=@fecreg,
	    descripcion=@descripcion
	WHERE idIncidencia=@idIncidencia
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UPD_INCIDENCIAOFICINA]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_UPD_INCIDENCIAOFICINA]
	@idIncidencia INT,
	@importe CHAR(18),
	@idContrato INT
AS
BEGIN
    UPDATE IncidenciaOficina SET
		idIncidencia=@idIncidencia,
	    importe=@importe,
	    idContrato=@idContrato
	WHERE idIncidencia=@idIncidencia
END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_direccion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_direccion]
@idPersona int,
@idDireccion int,
@valor VARCHAR(100),
@idUbigeo CHAR(6)
AS
UPDATE Direccion SET
	[idPersona] = @idPersona,
	[valor] = @valor,
	[idUbigeo] = @idUbigeo
	WHERE idDireccion = @idDireccion


GO
/****** Object:  StoredProcedure [dbo].[sp_update_MedioComunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_MedioComunicacion]
@idTmco int,
@idPersona int,
@valor VARCHAR(50),
@fecreg DATETIME

--Actualizar
AS
UPDATE MedioComunicacion SET
	[idPersona]= @idPersona,
	[valor] = @valor,
	[fecreg] = @fecreg
	WHERE idPersona = @idPersona OR idTmco = @idTmco


GO
/****** Object:  StoredProcedure [dbo].[sp_update_persona]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_persona]
@idPersona int,
@tipoPersona CHAR(1),
@nombres VARCHAR(100),
@estado CHAR(1),
@fecreg DATETIME,
@nrodocu VARCHAR(11),
@idtipoide INT
AS
UPDATE Persona SET
	[tipoPersona] = @idPersona,
	[nombres] = @nombres,
	[estado] = @estado,
	[fecreg] = @fecreg,
	[nrodocu] = @nrodocu,
	[idtipodoide] = @idtipoide
	WHERE idPersona = @idPersona


GO
/****** Object:  StoredProcedure [dbo].[spbuscar_reporte_fechas_moneda]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spbuscar_reporte_fechas_moneda]
	@FechaInicio datetime,
	@FechaFin datetime
AS
BEGIN
	SELECT
		m.idMoneda, 
		m.nombre ,
		m.codSunat, 
		m.codInternacional, 
		m.estado, 
		m.fecreg 
		
	FROM  
		Moneda m
	WHERE
		m.fecreg BETWEEN @FechaInicio AND @FechaFin
END



GO
/****** Object:  StoredProcedure [dbo].[spbuscar_search_fechas_oficina]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spbuscar_search_fechas_oficina]
	@FechaInicio datetime,
	@FechaFin datetime
AS
BEGIN
	SELECT
		m.idOficina, 
		m.idEdificio ,
		m.piso, 
		m.estado, 
		m.nro, 
		m.fecreg 
		
		
	FROM  
		Oficina m
	WHERE
		m.fecreg BETWEEN @FechaInicio AND @FechaFin
END

GO
/****** Object:  StoredProcedure [dbo].[Update_Moneda]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Update_Moneda]

( 
@idMoneda  int,
@nombre   varchar(25),
@codSunat   varchar(2),
@codInternacional  varchar(4),
@estado  char(1),
@fecreg   datetime
 )
AS
Update Moneda set  @nombre=nombre, @codSunat=codSunat , @codInternacional=codInternacional,
@estado=estado,@fecreg=fecreg
where @idMoneda= idMoneda



GO
/****** Object:  StoredProcedure [dbo].[update_tar]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[update_tar]
(
 @id_Concepto int,
@id_Tarifa int,
 @periodo int,
 @estado char(1),
 @importe decimal(10,2)
 
) 
as
update Tarifa set idConcepto = @id_Concepto,periodo=@periodo, estado = @estado, importe = @importe
where idTarifa = @id_Tarifa






IF OBJECT_ID('ReadTar') IS NOT NULL
BEGIN 
    DROP PROC ReadTarifa
END 

GO
/****** Object:  StoredProcedure [dbo].[ver_TipoMedioComunicacion]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ver_TipoMedioComunicacion]
as
select * From TipoMedioComunicacion



GO
/****** Object:  DdlTrigger [Ubigeo]    Script Date: 14/06/2019 22:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [Ubigeo]
on database for drop_table, alter_table 
as 
begin
raiserror ('No ESTA PERMITIDO BORRAR NI MODIFICAR LAS TABLAS !' , 16, 1)
rollback transaction
end


GO
ENABLE TRIGGER [Ubigeo] ON DATABASE
GO