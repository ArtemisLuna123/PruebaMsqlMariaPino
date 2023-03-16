#Creación del schema.
CREATE SCHEMA Venta1;

USE Venta1;
#Creación de tablas necesarias (mínimo 5 tablas).
CREATE TABLE fabricante(
 fabricante_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
 nombre VARCHAR (25),
 pais VARCHAR (30)
 );
 
 CREATE TABLE tipo(
  tipo_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  categoria VARCHAR (25),
  nombre_producto VARCHAR (25)
 );

CREATE TABLE proveedor(
  proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(25),
  rol VARCHAR(30),
  contacto VARCHAR(30),
  fechaVisita DATE 
 );
 
  
 CREATE TABLE producto( 
   producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nombre VARCHAR(30),
   descripcion TEXT,
   cantidad_stock INT,
   precio DOUBLE
 );
 
CREATE TABLE cliente(
    cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    direccion VARCHAR (50),
    correo VARCHAR(50),
    telefono VARCHAR (40),
    ciudad VARCHAR(50),
    region VARCHAR(60),
    codigopostal VARCHAR(45),
    medioPago VARCHAR(20),
    rutCliente VARCHAR (15)
);

 CREATE TABLE pedido(
  pedido_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
  fechapedido_id DATE,
  fecha_espera DATE,
  fecha_entrega DATE
);

#Generar relaciones entre tablas.
ALTER TABLE fabricante ADD producto_id INTEGER NOT NULL;
ALTER TABLE pedido ADD cliente_id INTEGER NOT NULL;
ALTER TABLE proveedor ADD producto_id INTEGER NOT NULL;
#Generar al menos una tabla relacional
#TABLE proveedor
#ADD FOREIGN KEY (producto) REFERENCES producto(producto_id);

 CREATE TABLE ProductoProveedor(
   productoProveedor_id INTEGER  PRIMARY KEY AUTO_INCREMENT NOT NULL,
   producto_id INTEGER  NOT NULL,
   proveedor_id INTEGER  NOT NULL
 );
 #Poblar la base con al menos 5 productos.
 INSERT INTO producto(nombre,descripcion,cantidad_stock,precio) VALUES ("Xiaomi","alta durabilidad",10,290.0),
("Samsumg","alta durabilidad",200,299.0),
("microondas","resistente",10,59.99),
("librero","durable en el tiempo",12,69.99),
 ("Samsung L12","resistente al agua ",10,70.99),
("computador portatil","autoplegable",12,129.99)
;
# Poblar la base con al menos 4 tipos de productos.
INSERT INTO tipo (categoria,nombre_producto) VALUES ("Libreria", "IT"),
("Cocina","microondas"),
("Baño", "papel higienico"),
("Entretencion ", "tele"),
("Escolares","cartulina")
;
#Generar dos consultas básicas obteniendo datos de tablas.
SELECT * FROM tipo;
SELECT * FROM producto;
# Generar una consulta que una a lo menos 2 tablas (JOIN).
SELECT producto.descripcion,producto.cantidad_stock,tipo.categoria  FROM producto JOIN tipo
ON producto.nombre = tipo.nombre;

SELECT producto.descripcion,producto.cantidad_stock,tipo.categoria  FROM producto LEFT JOIN tipo
ON producto.nombre = tipo.nombre;

SELECT producto.descripcion,producto.cantidad_stock,tipo.categoria  FROM producto RIGHT JOIN tipo
ON producto.nombre = tipo.nombre;



