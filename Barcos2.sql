CREATE TABLE [Contenedor] (
  [idcontenedor] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [nroContenedor] nvarchar(255) NOT NULL,
  [descripcion] nvarchar(255) NOT NULL,
  [estadoContenedor] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [VesselVisit] (
  [idvessel] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [vesselVisit] nvarchar(255) NOT NULL,
  [lineaoperadora] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Transporte] (
  [idtransporte] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [tipotransporte] nvarchar(255) NOT NULL,
  [matriculatransporte] nvarchar(255) NOT NULL,
  [indicadorTransporte] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Conductor] (
  [idconductor] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [nombreConductor] nvarchar(255) NOT NULL,
  [identidadConductor] nvarchar(255) NOT NULL,
  [nacionalidadConductor] nvarchar(255) NOT NULL,
  [Observaciones] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Naviera] (
  [idNaviera] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [codigo] nvarchar(255) NOT NULL,
  [nombre] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Puerto] (
  [idpuerto] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [codigo] nvarchar(255) NOT NULL,
  [ciudad] nvarchar(255) NOT NULL,
  [pais] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Unit] (
  [idunit] int IDENTITY(1,1) NOT NULL,
  [idvessel] int NOT NULL,
  [idtitulo] int,
  [categoria] nvarchar(255) NOT NULL,
  [tipocarga] int,
  [nroPrecinto] nvarchar(255) ,
  [nroPrecinto2] nvarchar(255) ,
  [nroPrecinto_N4] nvarchar(255) ,
  [nroPrecinto2_N4] nvarchar(255) ,
  [dimension] int,
  [idpuertoO] int,
  [idpuertoD] int,
  [idcontenedor] int,
  [idNaviera] int,
  [idtransporte] int,
  [idconductor] int,
  PRIMARY KEY ([idunit], [idvessel])
)
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idvessel]) REFERENCES [VesselVisit] ([idvessel])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idpuertoO]) REFERENCES [Puerto] ([idpuerto])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idpuertoD]) REFERENCES [Puerto] ([idpuerto])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idcontenedor]) REFERENCES [Contenedor] ([idcontenedor])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idNaviera]) REFERENCES [Naviera] ([idNaviera])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idtransporte]) REFERENCES [Transporte] ([idtransporte])
GO

ALTER TABLE [Unit] ADD FOREIGN KEY ([idconductor]) REFERENCES [Conductor] ([idconductor])
GO
