--cada fragmento de datos, quedara almacenado en x maquinas. replication_factor
create keyspace bdrestaurante with replication =
{'class':'SimpleStrategy','replication_factor':5};

use bdrestaurante;

CREATE TABLE sedes (
  id_sede int,
  nombre_sede text,
  direccion text,
  horario_apertura time,
  horario_cierre time,
  capacidad_aforo int,
  telefono text,
  ciudad text,
  PRIMARY KEY(id_sede)  
);

CREATE TABLE cliente (
  id_cliente int,
  nombre_cliente text,
  apellido_cliente text,
  telefono text,
  direccion text,
  correo text,
  estado_civil text,
  fecha_nacimiento date,
  ciudad text,
  PRIMARY KEY(id_cliente)
);

CREATE TABLE recurso_humano (
  id_empleado int,
  nombre_empleado text,
  telefono text,
  direccion text,
  fecha_nacimiento date,
  id_sede int,
  salario int,
  cargo text,
  ciudad text,
  PRIMARY KEY(id_empleado)  
);

CREATE TABLE menu (
  id_producto int,
  nombre_producto text,
  precio int,
  especialidad text,
  medida int,
  unidad_medida text,
  impuesto float,
  PRIMARY KEY(id_producto)
);

CREATE TABLE facturacion (
  id_factura int,
  id_cliente int,
  id_empleado int,
  id_sede int,
  fecha_hora timeuuid,
  subtotal int,
  impuesto int,
  total int,
  productos Set<text>
  PRIMARY KEY(id_factura)
);

CREATE TABLE productos_por_factura (
  id_item int,
  id_producto int,
  id_factura int,
  cantidad int,
  precio int,
  PRIMARY KEY(id_item)
);

CREATE TABLE inventario (
  id_item int,
  nombre_item text,
  fecha_caducidad date,
  cantidades_disponibles int,
  medida int,
  unidad_medida text,
  especialidad text,
  id_sede int,
  PRIMARY KEY(id_item)
);

