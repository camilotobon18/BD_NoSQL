

-- Cliente
INSERT INTO cliente(nombre_cliente, apellido_cliente, telefono, direccion, correo, estado_civil, fecha_nacimiento,ciudad) 
VALUES( 'Tatiana', 'Uribe', '46546546', 'CL  021  095  045', 'tatiana@gmail.com', 'soltera', '1995-01-01', 'Medellin');
INSERT INTO cliente(nombre_cliente, apellido_cliente, telefono, direccion, correo, estado_civil, fecha_nacimiento,ciudad) 
VALUES( 'Juan', 'Ortiz', '312156465', 'CL  095  015  045', 'juan@gmail.com', 'divorciado', '1991-01-01', 'Medellin');
INSERT INTO cliente(nombre_cliente, apellido_cliente, telefono, direccion, correo, estado_civil, fecha_nacimiento,ciudad) 
VALUES ( 'Carlos', 'Madrid', ' 469654786', 'CQ  010  095  045', 'carlos@gmail.com', 'casado', '1984-07-08', 'Bello');

-- Sedes
INSERT INTO sedes(nombre_sede, direccion, horario_apertura, horario_cierre, capacidad_aforo, telefono, ciudad) 
VALUES( 'Nuevo Occidente', 'Cl  045  011  021', '7:00:00', '19:00:00',25, '3112525', 'Medellin');
INSERT INTO sedes(nombre_sede, direccion, horario_apertura, horario_cierre, capacidad_aforo, telefono, ciudad) 
VALUES( 'Centro', 'CR  065  011  021', '8:00:00', '20:00:00',34, '4012521', 'Envigado');
INSERT INTO sedes(nombre_sede, direccion, horario_apertura, horario_cierre, capacidad_aforo, telefono, ciudad) 
VALUES( 'Norte', 'TV  071  011  021', '9:00:00', '21:00:00',31, '4251125', 'Bello');

-- Recurso_humano
INSERT INTO recurso_humano(nombre_empleado, telefono, direccion, fecha_nacimiento, id_sede, salario, cargo,ciudad) 
VALUES( 'Fabian Patiño', '5645642', 'CQ  02  012  016', '1985-01-02',1,1500000, 'Auxiliar de cocina', 'Medellin');
INSERT INTO recurso_humano(nombre_empleado, telefono, direccion, fecha_nacimiento, id_sede, salario, cargo,ciudad) 
VALUES( 'Anderson Jimenez', '15565545', 'CR  012  065  025', '1984-03-02',2,2500000, 'Cajero', 'Envigado');
INSERT INTO recurso_humano(nombre_empleado, telefono, direccion, fecha_nacimiento, id_sede, salario, cargo,ciudad) 
VALUES( 'Camilo Tobón', '895645455', 'CQ  095  065  025', '1993-03-02',3,1300000, 'Mesero', 'Bello');


-- Menu
INSERT INTO menu(nombre_producto, precio, especialidad, medida, unidad_medida, impuesto) 
VALUES( 'Hamburguesa BBQ',20000, 'Comida rapida',150, 'grs',0.08);
INSERT INTO menu(nombre_producto, precio, especialidad, medida, unidad_medida, impuesto) 
VALUES( 'Pastas Napolitana' ,22000, 'Comida italiana',200, 'grs',0.08);
INSERT INTO menu(nombre_producto, precio, especialidad, medida, unidad_medida, impuesto) 
VALUES( 'Soda Michelada',7000, 'Bebidas',400, 'ml',0.08);
INSERT INTO menu(nombre_producto, precio, especialidad, medida, unidad_medida, impuesto) 
VALUES( 'Limonada',6000, 'Bebidas',400, 'ml',0.08);

-- Facturacion
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total) 
VALUES(1,3,1,31280,2720,34000);
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total) 
VALUES(2,2,1,51520,4480,56000);
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total) 
VALUES(3,2,2,42320,3680,46000);
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total) 
VALUES(2,1,3,53360,4640,58000);

-- Productos_por_factura
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(1,1,1,20000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(3,1,2,7000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(2,2,2,22000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(4,2,2,6000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(1,3,2,20000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(4,3,1,6000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(2,4,2,22000);
INSERT INTO productos_por_factura(id_producto, id_factura, cantidad, precio) 
VALUES(3,4,2,7000);