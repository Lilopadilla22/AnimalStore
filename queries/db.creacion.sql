-- creacion base de datos */

CREATE SCHEMA `dbanimalstore` ;

/* Creación de tablas */

USE dbanimalstore;

CREATE TABLE tipodeusuarios (
    id_tipodeusuarios BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    roll VARCHAR(20)
);

CREATE TABLE Usuario (
  idUsuarios int(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20),
  email varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  contraseña varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  ciudad varchar(50),
  direccion varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  imagen varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  idTipoDeUsuario  varchar(150),
  PRIMARY KEY (idUsuarios),
  FOREIGN KEY (IdTipoDeUsuario) REFERENCES TipoDeUsuarios(IdTipoUsuario)
);

CREATE TABLE Productos (
  IdProducto int(11) NOT NULL,
  IdCategoria int(11) NOT NULL,
  Nombre varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  Precio varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  Descripcion varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  Imagen varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  Stock varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (IdProducto),
  FOREIGN KEY (IdProducto) REFERENCES Categoria(IdCategoria)
);


CREATE TABLE Proveedores (
  IdProveedores int(11) NOT NULL,
  Nombre varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  IdCategoria int(11) NOT NULL,
  IdProducto int(11) NOT NULL,
  PRIMARY KEY (IdProveedores),
  FOREIGN KEY (IdProducto) REFERENCES Productos(IdCategoria)
);

CREATE TABLE Pedidos (
  IdPedidos int(11) NOT NULL,
  IdUsuario int(11) NOT NULL,
  IdProducto int(11) NOT NULL,
  Fecha date NOT NULL,
  EstadoDelPedido varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (IdPedidos),
  FOREIGN KEY (IdPedidos) REFERENCES Usuario(IdUsuarios),
  FOREIGN KEY (EstadoDelPedido) REFERENCES EstadoDelPedido (EstadoDelPedido)
);


CREATE TABLE EstadoDelPedido (
  IdEstadoDelPedido INT NOT NULL,
  EstadoDelPedido varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (IdEstadoDelPedido)
);

CREATE TABLE Categoria (
  IdCategoria INT NOT NULL,
  Categoria varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (IdCategoria)
);
