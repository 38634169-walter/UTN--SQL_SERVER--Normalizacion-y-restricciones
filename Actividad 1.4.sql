
GO
USE laraBoxMio 

GO 
CREATE TABLE Tipos_cuenta(
tipoCuenta_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
maximoMb INT NOT NULL CHECK(maximoMb>0),
costo MONEY NOT NULL CHECK(costo>=0)
)


GO 
CREATE TABLE Suscripciones(
	suscripcion_ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	usuario_ID BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(usuario_ID),
	tipo_cuenta_ID INT NOT NULL FOREIGN KEY REFERENCES Tipos_cuenta(tipoCuenta_ID),
	fechaInicio DATE NOT NULL CHECK(fechaInicio<=getdate()),
	fechaFin DATE NULL,
	CHECK (fechaFin >= fechaInicio)
)

GO
CREATE TABLE Formas_pago(
formaPago_ID SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
)

GO 
CREATE TABLE Pagos(
pago_ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
formaPago_ID SMALLINT NOT NULL FOREIGN KEY REFERENCES Formas_pago(formaPago_ID),
suscripcion_ID BIGINT NOT NULL FOREIGN KEY REFERENCES Suscripciones(suscripcion_ID),
fecha DATE NOT NULL,
mes TINYINT NOT NULL CHECK(mes BETWEEN 1 AND 12),
año SMALLINT NOT NULL CHECK(año > 0),
importe MONEY NOT NULL CHECK(importe>=0)
)

