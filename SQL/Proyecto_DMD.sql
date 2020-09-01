use master

--CREACION DE BDD

CREATE DATABASE Proyecto_DMD;
go

USE Proyecto_DMD

CREATE TABLE Fecha(
	id_fecha int IDENTITY(1,1) PRIMARY KEY,
	annio int UNIQUE
)

CREATE TABLE Pais(
	id_pais int IDENTITY(1,1) PRIMARY KEY,
	pais varchar(200) UNIQUE
)

CREATE TABLE Producto(
	id_producto int IDENTITY(1,1) PRIMARY KEY,
	codigo_arancelario int UNIQUE
)

CREATE TABLE Alimentos(
	id_alimento int IDENTITY(1,1) PRIMARY KEY,
	descrpicion varchar(300),
	valor_cif decimal,
	id_fecha int,
	id_pais int,
	id_producto int
)

ALTER TABLE Alimentos
	ADD CONSTRAINT FK_alimento_fecha
	FOREIGN KEY (id_fecha) 
	REFERENCES Fecha (id_fecha);

ALTER TABLE Alimentos
	ADD CONSTRAINT FK_alimento_pais
	FOREIGN KEY (id_pais) 
	REFERENCES Pais (id_pais);

ALTER TABLE Alimentos
	ADD CONSTRAINT FK_alimento_producto
	FOREIGN KEY (id_producto) 
	REFERENCES Producto (id_producto);

--FIN DE CREACION DE BDD

----REINICIAR CONTADORES IDENTITY
DBCC CHECKIDENT (Pais, RESEED, 0)
DBCC CHECKIDENT (Fecha, RESEED, 0)
DBCC CHECKIDENT (Producto, RESEED, 0)
DBCC CHECKIDENT (Alimentos, RESEED, 0)
-----------------------------------

DELETE FROM Fecha
DELETE FROM Pais

SELECT * FROM Pais
ORDER BY id_pais ASC

SELECT * FROM Fecha
ORDER BY annio ASC

SELECT * FROM Producto
ORDER BY id_producto ASC