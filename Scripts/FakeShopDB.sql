CREATE DATABASE FakeShopDb
GO
USE FakeShopDb
GO

-- ************************************** [Producto]
CREATE TABLE [Producto]
(
 [IdProducto]             int NOT NULL,
 [Nombre]                 varchar(100) NOT NULL,
 [Modelo]                 varchar(50) NOT NULL,
 [NivelSeguroExistencias] int NOT NULL,
 [PuntoDeReorden]         int NOT NULL,
 [Precio]                 decimal(8,2) NOT NULL,


 CONSTRAINT [PK_Producto_IdProducto] PRIMARY KEY CLUSTERED ([IdProducto] ASC)
);
GO

CREATE TABLE Garantia
(
  [IdProducto] int NOT NULL,
  [Descripcion] varchar(100) NOT NULL,
  [DuracionEnDias] INT NOT NULL,
  CONSTRAINT [PK_Garantia_IdProducto] PRIMARY KEY CLUSTERED ([IdProducto] ASC),
  CONSTRAINT [FK_Garantia_Producto_IdProducto] FOREIGN KEY(IdProducto)
  REFERENCES [Producto]([IdProducto])
)
GO

-- ************************************** [Cliente]
CREATE TABLE [Cliente]
(
 [IdCliente] int NOT NULL,
 [Nombre]    varchar(150) NOT NULL,


 CONSTRAINT [PK_Cliente_IdCliente] PRIMARY KEY CLUSTERED ([IdCliente] ASC)
);
GO
-- ************************************** [Factura]
CREATE TABLE [Factura]
(
 [IdFactura]      int NOT NULL,
 [Numero]         varchar(50) NOT NULL,
 [IdCliente]      int NOT NULL,
 [FechaEmision]   datetime NOT NULL,
 [TotalFacturado] decimal(18,2) NOT NULL,
 CONSTRAINT [PK_Factura_IdFactura] PRIMARY KEY CLUSTERED ([IdFactura] ASC),
 CONSTRAINT [FK_Factura_Cliente_IdCliente] FOREIGN KEY ([IdCliente])  REFERENCES [Cliente]([IdCliente])
);
GO


CREATE NONCLUSTERED INDEX [FK_Factura_Cliente] ON [Factura] 
 (
  [IdCliente] ASC
 )

GO
-- ************************************** [DetalleFactura]
CREATE TABLE [DetalleFactura]
(
 [IdDetalleFactura] int NOT NULL ,
 [IdFactura]        int NOT NULL ,
 [IdProducto]       int NOT NULL ,
 [Cantidad]         int NOT NULL ,
 [Precio]           decimal(8,2) NOT NULL ,
 [Impuesto]         decimal(8,2) NOT NULL ,
 [Descuento]        decimal(8,2) NOT NULL ,
 [TotalLinea]       decimal(8,2) NOT NULL ,


 CONSTRAINT [PK_DetalleFactura_IdFactura] PRIMARY KEY CLUSTERED ([IdDetalleFactura] ASC),
 CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY ([IdFactura])  REFERENCES [Factura]([IdFactura]),
 CONSTRAINT [FK_DetalleFactura_Producto] FOREIGN KEY ([IdProducto])  REFERENCES [Producto]([IdProducto])
);
GO


CREATE NONCLUSTERED INDEX [FK_DetalleFactura_Factura] ON [DetalleFactura] 
 (
  [IdFactura] ASC
 )

GO

CREATE NONCLUSTERED INDEX [FK_DetalleFactura_Producto] ON [DetalleFactura] 
 (
  [IdProducto] ASC
 )

GO