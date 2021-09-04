CREATE DATABASE laraBoxMio

GO
USE laraBoxMio


GO 
CREATE TABLE Paises(
codigoAlfanumerico VARCHAR(100) NOT NULL PRIMARY KEY CHECK(codigoAlfanumerico LIKE '%[ISO alfa]%'),
nombre VARCHAR(100) NOT NULL 
)

GO 
CREATE TABLE Localidades(
localidad_ID INT PRIMARY KEY IDENTITY(1,1),
nombre NVARCHAR(85) NOT NULL UNIQUE,
pais_ID  VARCHAR(100) NOT NULL FOREIGN KEY REFERENCES Paises(codigoAlfanumerico), 
)


GO 
CREATE TABLE Datos_Personales(
datoPersonal_ID BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
localidad_ID INT NOT NULL FOREIGN KEY REFERENCES Localidades(localidad_ID),
apellido VARCHAR(100) NOT NULL,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NULL CHECK(email LIKE '%@%'),
telefono VARCHAR(15) NULL,
celular VARCHAR(15) NULL,
fechaNacimiento DATE NULL CHECK(fechaNacimiento < getdate()),
domicilio VARCHAR(250) NULL
)


GO
CREATE TABLE Usuarios(
usuario_ID BIGINT NOT NULL FOREIGN KEY REFERENCES Datos_Personales(datoPersonal_ID),
nombreUsu VARCHAR(25) NOT NULL,
clave VARCHAR(100) NOT NULL,
PRIMARY KEY (usuario_ID)
)

GO 
CREATE TABLE Archivos(
archivo_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
usuario_ID BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(usuario_ID),
nombre NVARCHAR(100) NOT NULL,
tamaño DECIMAL(10,2),
fechaCreacion DATE NOT NULL CHECK(fechaCreacion < getdate()),
fechaModificacion DATE NOT NULL,
estado BIT DEFAULT(1),
check (fechaCreacion <= fechaModificacion)
)
