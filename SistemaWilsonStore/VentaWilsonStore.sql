-- =============================================
-- CCREACION DE BASE DE DATOS
-- =============================================

DROP DATABASE IF EXISTS VENTASTORE;

CREATE DATABASE VENTASTORE;


-- =============================================
-- SELECIONAR LA BASE DE DATOS
-- =============================================

USE VENTASTORE;
SET NAMES 'utf8';


-- =============================================
-- CREACION DE TABLAS
-- =============================================

CREATE TABLE EMPLEADO
(
	idemp                INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(50) NOT NULL,
	apellido             VARCHAR(50) NOT NULL,
	email                VARCHAR(50) NOT NULL,
	telefono             VARCHAR(20) NULL,
	dni                  VARCHAR(15) NOT NULL,
	direccion            VARCHAR(100) NOT NULL,
	estado               NUMERIC(2,0) NOT NULL CHECK ( estado IN (1, 0) ),
 	CONSTRAINT PK_EMPLEADO PRIMARY KEY (idemp)
);



CREATE TABLE USUARIO
(
	idemp                INTEGER NOT NULL,
	usuario              VARCHAR(20) NOT NULL,
	clave                VARCHAR(40) NOT NULL,
	estado               NUMERIC(2,0) NOT NULL  CHECK ( estado IN (1, 0) ),
	CONSTRAINT PK_USUARIO PRIMARY KEY (idemp),
	CONSTRAINT FK_USUARIO_EMPLEADO FOREIGN KEY (idemp) REFERENCES EMPLEADO (idemp)
);



CREATE TABLE ROL
(
	idrol                INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(30) NOT NULL,
	descripcion          VARCHAR(150) NOT NULL,
	estado               NUMERIC(2,0) NOT NULL CHECK ( estado IN (1, 0) ),
	CONSTRAINT PK_ROL PRIMARY KEY (idrol)
);



CREATE TABLE PERMISO
(
	idrol                INTEGER NOT NULL,
	idemp                INTEGER NOT NULL,
	estado               NUMERIC(2,0) NOT NULL CHECK ( estado IN (1, 0) ),
	CONSTRAINT PK_PERMISO PRIMARY KEY (idrol,idemp),
	CONSTRAINT FK_PERMISO_USUARIO FOREIGN KEY FK_PERMISO_USUARIO (idemp) REFERENCES USUARIO (idemp),
	CONSTRAINT FK_PERMISO_ROL     FOREIGN KEY FK_PERMISO_ROL (idrol) REFERENCES ROL (idrol)
);

CREATE TABLE CATEGORIA
(
	idcat                INTEGER NOT NULL,
	nombre               VARCHAR(50) NOT NULL,
	descripcion          TEXT NOT NULL,
	CONSTRAINT PK_CATEGORIA PRIMARY KEY (idcat)
);



CREATE TABLE PRODUCTO
(
	idprod               INTEGER AUTO_INCREMENT,
	idcat                INTEGER NOT NULL,
	nombre               VARCHAR(100) NOT NULL,
	descripcion          TEXT NOT NULL,
	precio               NUMERIC(10,2) NOT NULL,
	stock                INTEGER NOT NULL,
	estado               INTEGER NOT NULL,
	CONSTRAINT PK_PRODUCTO PRIMARY KEY (idprod),
	FOREIGN KEY FK_PRODUCTO_CATEGORIA (idcat) REFERENCES CATEGORIA (idcat)
);



CREATE TABLE PROMOCION
(
	idprom               INTEGER NOT NULL,
	fecInicio            DATE NOT NULL,
	fecFin               DATE NOT NULL,
	precio               NUMERIC(10,2) NOT NULL,
	oferta               NUMERIC(10,2) NOT NULL,
	idprod               INTEGER NOT NULL,
	estado               INTEGER NOT NULL,
	anulado              INTEGER NOT NULL,
	CONSTRAINT PK_PROMOCION PRIMARY KEY (idprom),
	FOREIGN KEY FK_PROMOCION_PRODUCTO (idprod) REFERENCES PRODUCTO (idprod)
);



CREATE TABLE CAMPANIA
(
	idcamp               INTEGER AUTO_INCREMENT,
	nombre               VARCHAR(150) NOT NULL,
	descripcion          TEXT NOT NULL,
	fecInicio            DATE NOT NULL,
	fecFin               DATE NOT NULL,
	estado               INTEGER NOT NULL,
	anulado              INTEGER NOT NULL,
	CONSTRAINT PK_CAMPANIA PRIMARY KEY (idcamp)
);



CREATE TABLE DETCAMPANIA
(
	idcamp               INTEGER NOT NULL,
	idprod               INTEGER NOT NULL,
	precio               NUMERIC(10,2) NOT NULL,
	oferta               NUMERIC(10,2) NOT NULL,
	porcDcto             NUMERIC(10,2) NOT NULL,
	estado               INTEGER NOT NULL,
	anulado              INTEGER NOT NULL,
	CONSTRAINT PK_DETCAMPANIA PRIMARY KEY (idcamp,idprod),
	FOREIGN KEY FK_DETCAMPANIA_CAMPANIA (idcamp) REFERENCES CAMPANIA (idcamp),
	FOREIGN KEY FK_DETCAMPANIA_PRODUCTO (idprod) REFERENCES PRODUCTO (idprod)
);


-- =============================================
-- INGRESO DE DATOS
-- =============================================


-- Tabla EMPLEADO

--    idemp   nombre    apellido  email     telefono   dni       direccion  estado   

INSERT INTO EMPLEADO 
VALUES(1001,'CLAUDIA  ALEJANDRA','RAMOS CASTILLO','cramos@gmail.com','98456732','98435687','LIMA',1);

INSERT INTO EMPLEADO 
VALUES(1002,'ALICIA ANGELICA','TORRES VILCA','atorres@gmail.com','967345634','56423698','MIRAFLORES',1);

INSERT INTO EMPLEADO  
VALUES(1003,'KARLA LIZETH','GUTIERREZ FERNANDEZ','kgutierrez@gmail.com','995466783','56324587','LINCE',1);

INSERT INTO EMPLEADO  
VALUES(1004,'FERNANDA LEONOR','CORONEL CARRASCO','fcoronel@gmail.com','986754373','45963258','LIMA',0);

INSERT INTO EMPLEADO  
VALUES(1005,'JUAN CARLOS','ROMERO CARRASCO','jcarlos@gmail.com','986544521','45636545','LA MOLINA',1);

INSERT INTO EMPLEADO  
VALUES(1006,'ALICIA JANETH','ARBIETO MENDOZA','aarbieto@gmail.com','975698451','96584521','LA MOLINA',1);

INSERT INTO EMPLEADO  
VALUES(1007,'CRISTINA ELENA','ALFARO VELAZQUE','calfarov@gmail.com','965486267','10365845','LOS OLIVOS',1);


-- Tabla USUARIO

-- idemp   usuario   clave   estado 

INSERT INTO USUARIO VALUES(1001,'cramos',SHA('ramos'),1);
INSERT INTO USUARIO VALUES(1002,'atorres',SHA('suerte'),1);
INSERT INTO USUARIO VALUES(1003,'kgutierrez',SHA('princesa'),1);
INSERT INTO USUARIO VALUES(1004,'lcoronel',SHA('cerebro'),1);
INSERT INTO USUARIO VALUES(1005,'jromero',SHA('paz'),1);
INSERT INTO USUARIO VALUES(1006,'jarbieto',SHA('felicidad'),1);
INSERT INTO USUARIO VALUES(1007,'calfaro',SHA('encantadora'),1);


-- Tabla: ROLES

-- idrol       nombre       descripcion        estado      

INSERT INTO ROL VALUES(1,'Administrador','No tiene ningun tipo de restricción',1);
INSERT INTO ROL VALUES(2,'Vendeor','Tiene acceso a los módulos de Ventas y Consultas',1);
INSERT INTO ROL VALUES(3,'Operador','Tiene acceso a los módulos de Mantenimiento, Consultas y Reportes',1);
INSERT INTO ROL VALUES(4,'Usuario','Tiene acceso a los módulos de Consultas y Reportes',1);



-- Tabla: PERMISOS

-- idrol   idemp    estado

-- Usuario 1001

INSERT INTO PERMISO VALUES(1,1001,1);
INSERT INTO PERMISO VALUES(2,1001,0);
INSERT INTO PERMISO VALUES(3,1001,0);
INSERT INTO PERMISO VALUES(4,1001,0);


-- Usuario 1002

INSERT INTO PERMISO VALUES(1,1002,0);
INSERT INTO PERMISO VALUES(2,1002,1);
INSERT INTO PERMISO VALUES(3,1002,0);
INSERT INTO PERMISO VALUES(4,1002,0);


-- Usuario 1003

INSERT INTO PERMISO VALUES(1,1003,0);
INSERT INTO PERMISO VALUES(2,1003,0);
INSERT INTO PERMISO VALUES(3,1003,1);
INSERT INTO PERMISO VALUES(4,1003,0);


-- Usuario 1004

INSERT INTO PERMISO VALUES(1,1004,0);
INSERT INTO PERMISO VALUES(2,1004,0);
INSERT INTO PERMISO VALUES(3,1004,0);
INSERT INTO PERMISO VALUES(4,1004,1);


-- Usuario 1006

INSERT INTO PERMISO VALUES(1,1006,0);
INSERT INTO PERMISO VALUES(2,1006,0);
INSERT INTO PERMISO VALUES(3,1006,1);
INSERT INTO PERMISO VALUES(4,1006,0);

-- Usuario 1007

INSERT INTO PERMISO VALUES(1,1007,0);
INSERT INTO PERMISO VALUES(2,1007,1);
INSERT INTO PERMISO VALUES(3,1007,0);
INSERT INTO PERMISO VALUES(4,1007,0);


-- Tabla CATEGORIA

INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(1,'LINEA BLANCA','Productos para tu hogar, como cocina, refrigaradora, etc.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(2,'MENAJE','Lo mejor del menaje del mundo a tu alcance.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(3,'CAMA','Las mejores marcas para tu mejores sueños.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(4,'MUEBLES','Variados modelos para cada rincon de tu casa.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(5,'ROPA DE DAMAS','Las mejores marcas del mundo a los precios mas bajos.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(6,'ROPA DE CABALLEROS','Variados modelos para tus mejores ocaciones.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(7,'ROPA DE SEÑORITAS','Las prendas mas lindas para que puedas lucirte.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(8,'ROPA DE NIÑOS','Todo lo necesario para tu niño');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(9,'ROPA DE NIÑAS','Tu niña merece los mejor.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(10,'ELECTRODOMESTICOS','Todas las marcas y modelos.');
INSERT INTO CATEGORIA(IDCAT,NOMBRE,DESCRIPCION) VALUES(11,'COMPUTO','Los ultimos modelos a los mejores precios.');


-- Tabla PRODUCTO

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(1,1,'COCINA',900.0,456,'La mejor cocina para tu mejor receta',1);

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(2,7,'PANTALON',150.0,4567,'Diversos colores y modelos,',1);

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(3,1,'REFRIGERADORA',1300.0,690,'Garantia de 2 años.',1);

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(4,7,'POLO DE VERANO',95.00,150,'Colores frescos.',1);

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(5,6,'CAMISA COLOR VERDE',140.00,250,'Lucete con una buena marca.',1);

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(6,6,'CAMISA DE CUADROS PEQUEÑOS',140.00,350,'Modelo exclusivo.',0);

INSERT INTO PRODUCTO(IDPROD,IDCAT,NOMBRE,PRECIO,STOCK,DESCRIPCION,ESTADO)
VALUES(7,6,'PANTALON MODELO A1',1180.00,450,'Especial para lucirte con tu pareja.',1);


-- Tabla PROMOCION


-- idprom    fecInicio  fecFin     precio     oferta     idprod     estado     anulado   

INSERT INTO PROMOCION VALUES(1,'20160701','20160731',950.0,799.0,1,1,0);
INSERT INTO PROMOCION VALUES(2,'20161101','20161130',900.0,750.0,1,1,0);



-- =============================================
-- USUARIO PARA LAS APLICACIONES
-- =============================================

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'ventas'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO 'ventas'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;

USE SISTVENTAS;