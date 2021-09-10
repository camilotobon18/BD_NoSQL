

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
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total, fecha_hora) 
VALUES(1,3,1,31280,2720,34000, '2021-07-01 09:05:00');
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total, fecha_hora) 
VALUES(2,2,1,51520,4480,56000, '2021-06-01 16:25:00');
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total, fecha_hora) 
VALUES(3,2,2,42320,3680,46000, '2021-08-01 16:05:00');
INSERT INTO facturacion(id_cliente, id_empleado, id_sede, subtotal,impuesto, total, fecha_hora) 
VALUES(2,1,3,53360,4640,58000, '2021-08-01 19:05:00');

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

-- Inventario
INSERT INTO inventario(fecha_caducidad, cantidades_disponibles, medida, unidad_medida, especialidad, id_sede, nombre_prod) VALUES ( '2020-01-01',20,1, 'libra', 'grano',1, 'pasta larga');
INSERT INTO inventario(fecha_caducidad, cantidades_disponibles, medida, unidad_medida, especialidad, id_sede, nombre_prod) VALUES ( '2021-03-07',30,500, 'ml', 'bebida',1, 'vino');
INSERT INTO inventario(fecha_caducidad, cantidades_disponibles, medida, unidad_medida, especialidad, id_sede, nombre_prod) VALUES ( '2021-04-09',10,100, 'grs', 'condimento',2, 'pimienta');
INSERT INTO inventario(fecha_caducidad, cantidades_disponibles, medida, unidad_medida, especialidad, id_sede, nombre_prod) VALUES ( '2020-12-11',5,1, 'libra', 'carne',3, 'lomo de cerdo');
INSERT INTO inventario(fecha_caducidad, cantidades_disponibles, medida, unidad_medida, especialidad, id_sede, nombre_prod) VALUES ( '2021-12-11',15,1, 'libra', 'carne',2, 'pierna de cerdo');



-- productos vencidos
select * from inventario where fecha_caducidad < CURDATE() order by fecha_caducidad ASC;
-- productos proximos a vencer
select * from inventario where fecha_caducidad > CURDATE() order by fecha_caducidad ASC;
-- menus mas vendidos
select m.nombre_producto, sum(pf.cantidad) as 'cantidad', (sum(pf.cantidad) * sum(pf.precio)) as valor_total 
from productos_por_factura pf inner join menu m
on m.id_producto = pf.id_producto group by m.id_producto order by valor_total DESC;
-- los trabajadores que menos venden
select rh.nombre_empleado, sum(f.total) as venta 
from recurso_humano rh inner join facturacion f on rh.id_empleado = f.id_empleado
group by rh.id_empleado order by venta ASC;
-- los clientes mas frecuentes
select c.nombre_cliente, c.apellido_cliente, count(f.id_factura) as numero_de_visitas 
from cliente c inner join facturacion f on c.id_cliente = f.id_cliente
group by c.id_cliente order by numero_de_visitas DESC;
-- horarios y dias con mas ventas y con mas visitas
-- por dias
select dayofweek(fecha_hora) as dia, sum(total) as numero_de_visitas
from facturacion group by dia order by numero_de_visitas DESC;
-- por horas
select HOUR(fecha_hora) as hora, sum(total) as numero_de_visitas
from facturacion group by hora order by numero_de_visitas DESC;
-- trabajadores por sede
select s.nombre_sede, count(rh.id_empleado) as num_empleados 
from sedes s inner join recurso_humano rh on s.id_sede = rh.id_sede
group by s.id_sede order by num_empleados DESC;
-- total de salarios por sede
select s.nombre_sede, SUM(rh.salario) as salario_sede 
from sedes s inner join recurso_humano rh on s.id_sede = rh.id_sede
group by s.id_sede order by salario_sede DESC;
-- ventas por sede y ciudad
-- por sede
select s.nombre_sede, SUM(f.total) as ventas 
from sedes s inner join facturacion f on s.id_sede = f.id_sede
group by s.id_sede order by ventas DESC;
-- por ciudad
select s.ciudad, SUM(f.total) as ventas 
from sedes s inner join facturacion f on s.id_sede = f.id_sede
group by s.ciudad order by ventas DESC;










